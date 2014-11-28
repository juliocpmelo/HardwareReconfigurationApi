
#include <xparameters.h>
#include <xil_io.h>
#include <xstatus.h>
#include <stdlib.h>
#include "xhwicap_i.h"
#include "xhwicap.h"
#include "HWIcapImpl.h"
#include "xsysace_l.h"
#include "xsysace.h"
#include "sysace_stdio.h"

static XHwIcap  HwIcap;	/* The instance of the HWICAP device */

/* Parse Bitfile header */
XHwIcap_Bit_Header XHwIcap_ReadHeader(Xuint8 *Data, Xuint32 Size)
{
    Xuint32 I;
    Xuint32 Len;
    Xuint32 Tmp;
    XHwIcap_Bit_Header Header;
    Xuint32 Index;

    /* Start Index at start of bitstream */
    Index=0;

    /* Initialize HeaderLength.  If header returned early inidicates
     * failure.
     */
    Header.HeaderLength = XHI_BIT_HEADER_FAILURE;

    /* Get "Magic" length */
    Header.MagicLength = Data[Index++];
    Header.MagicLength = (Header.MagicLength << 8) | Data[Index++];

    /* Read in "magic" */
    for (I=0; I<Header.MagicLength-1; I++) {
        Tmp = Data[Index++];
        if (I%2==0 && Tmp != XHI_EVEN_MAGIC_BYTE)
        {
          return Header;   /* INVALID_FILE_HEADER_ERROR */
        }
        if (I%2==1 && Tmp != XHI_ODD_MAGIC_BYTE)
        {
            return Header;   /* INVALID_FILE_HEADER_ERROR */
        }
    }

    /* Read null end of magic data. */
    Tmp = Data[Index++];

    /* Read 0x01 (short) */
    Tmp = Data[Index++];
    Tmp = (Tmp << 8) | Data[Index++];

    /* Check the "0x01" half word */
    if (Tmp != 0x01)
    {
       return Header;   /* INVALID_FILE_HEADER_ERROR */
    }


    /* Read 'a' */
    Tmp = Data[Index++];
    if (Tmp != 'a')
    {
        return Header;    /* INVALID_FILE_HEADER_ERROR  */
    }

    /* Get Design Name length */
    Len = Data[Index++];
    Len = (Len << 8) | Data[Index++];

    /* allocate space for design name and final null character. */
    Header.DesignName = (Xuint8 *)malloc(Len);

    /* Read in Design Name */
    for (I=0; I<Len; I++)
    {
        Header.DesignName[I] = Data[Index++];
    }

    /* Read 'b' */
    Tmp = Data[Index++];
    if (Tmp != 'b')
    {
        return Header;  /* INVALID_FILE_HEADER_ERROR */
    }

    /* Get Part Name length */
    Len = Data[Index++];
    Len = (Len << 8) | Data[Index++];

    /* allocate space for part name and final null character. */
    Header.PartName = (Xuint8 *)malloc(Len);

    /* Read in part name */
    for (I=0; I<Len; I++)
    {
        Header.PartName[I] = Data[Index++];
    }

    /* Read 'c' */
    Tmp = Data[Index++];
    if (Tmp != 'c')
    {
        return Header;  /* INVALID_FILE_HEADER_ERROR */
    }

    /* Get date length */
    Len = Data[Index++];
    Len = (Len << 8) | Data[Index++];

    /* allocate space for date and final null character. */
    Header.Date = (Xuint8 *)malloc(Len);

    /* Read in date name */
    for (I=0; I<Len; I++)
    {
        Header.Date[I] = Data[Index++];
    }

    /* Read 'd' */
    Tmp = Data[Index++];
    if (Tmp != 'd')
    {
        return Header;  /* INVALID_FILE_HEADER_ERROR  */
    }

    /* Get time length */
    Len = Data[Index++];
    Len = (Len << 8) | Data[Index++];

    /* allocate space for time and final null character. */
    Header.Time = (Xuint8 *)malloc(Len);

    /* Read in time name */
    for (I=0; I<Len; I++)
    {
        Header.Time[I] = Data[Index++];
    }

    /* Read 'e' */
    Tmp = Data[Index++];
    if (Tmp != 'e')
    {
        return Header;  /* INVALID_FILE_HEADER_ERROR */
    }

    /* Get byte length of bitstream */
    Header.BitstreamLength = Data[Index++];
    Header.BitstreamLength = (Header.BitstreamLength << 8) | Data[Index++];
    Header.BitstreamLength = (Header.BitstreamLength << 8) | Data[Index++];
    Header.BitstreamLength = (Header.BitstreamLength << 8) | Data[Index++];

    Header.HeaderLength = Index;

    return Header;

}

/** Loads a partial bitstream from CF into ICAP */
int XHwIcap_CF2Icap(XHwIcap *hwicap, char* filename)
{
	 int i, numCharsRead, ace_buf_count, rc, SectorNumber;
	 SYSACE_FILE *stream;
    XHwIcap_Bit_Header bit_header;
    Xuint8 data3,data2,data1,data0;
    Xuint8 systemACE_Buffer[XSA_CF_SECTOR_SIZE];
    Xuint32 word[2];
    XStatus Status;

#if DEBUG
	 print("In CF2ICAP\r\n");
	 xil_printf("filename = %s\r\n",filename);
#endif

    /* Opening file */
    if ((stream = sysace_fopen(filename, "r")) == NULL) {
        xil_printf("Can't open file (%s)\r\n", filename);
        return -1;
    }

#if DEBUG
	 print("In CF2ICAP ..File Opened..\r\n");
#endif

    /* Read from systemAce */
	 numCharsRead = sysace_fread(systemACE_Buffer, 1, XSA_CF_SECTOR_SIZE,
                                stream);
    if (numCharsRead <= 0) {
        xil_printf("Error reading from system ace (%d)\r\n", numCharsRead);
        return -1;
    }

#if DEBUG
	 print("In CF2ICAP ..Header Sector Read..\r\n");
#endif

    /* Read the bitstream header */
    bit_header = XHwIcap_ReadHeader(systemACE_Buffer,0);

	/* close systemAce file handle */
	rc = sysace_fclose (stream);
	if (rc < 0) {
		/* Can't close */
		xil_printf("can't close file\r\n");
		return -1;
    }

#if DEBUG
	 print("In CF2ICAP ..File Closed..\r\n");
#endif

	/* Now that we have info about the bitstream,
	 * re-open and skip the header.
	 */

    if ((stream = sysace_fopen(filename, "r")) == NULL) {
        /* Can't open file */
        xil_printf("can't open file\r\n");
        return -1;
    }

#if DEBUG
	 print("In CF2ICAP ..File Opened..\r\n");
#endif

	 /* Read the header (effectively skipping it) */
	 numCharsRead = sysace_fread(systemACE_Buffer, 1, bit_header.HeaderLength,
                                stream);
#if DEBUG
	 xil_printf("Number of chars read = %d, Sector Number = %d\r\n",numCharsRead,SectorNumber);
	 print("In CF2ICAP ..Skip Header..\r\n");
#endif

	 numCharsRead = sysace_fread(systemACE_Buffer, 1, XSA_CF_SECTOR_SIZE,
                                stream);

	 SectorNumber = 1;

    /* Loop through all bitstream data and write to ICAP */
    ace_buf_count = 0;
    for (i=0; i<bit_header.BitstreamLength; i+=4)
	 {

		  /* Convert 4 chars into an integer */
        data3 = systemACE_Buffer[ace_buf_count++];
        data2 = systemACE_Buffer[ace_buf_count++];
        data1 = systemACE_Buffer[ace_buf_count++];
        data0 = systemACE_Buffer[ace_buf_count++];
        word[0] = ((data3 << 24) | (data2 << 16) | (data1 << 8) | (data0));
        i+=4;
		if(i<bit_header.BitstreamLength) // store another word if even number of words
		{
			  /* Convert 4 chars into an integer */
	        data3 = systemACE_Buffer[ace_buf_count++];
	        data2 = systemACE_Buffer[ace_buf_count++];
	        data1 = systemACE_Buffer[ace_buf_count++];
	        data0 = systemACE_Buffer[ace_buf_count++];
	        word[1] = ((data3 << 24) | (data2 << 16) | (data1 << 8) | (data0));
		}
		else
		{
			word[1] = 0x0; // store 0- this is work around for hwicap bug in 11.4
		}
	    Status = XHwIcap_DeviceWrite(&HwIcap, word, 2);
        if (Status != XST_SUCCESS)
        {
				/* Error writing to ICAP */
			  xil_printf("error writing to ICAP (%d)\r\n", Status);
           return -1;
        }
#if DEBUG
		xil_printf("In CF2ICAP ..Writing Word Number %d from current sector to ICAP..\r\n",ace_buf_count);
#endif

		  /* Check to see if we need to read from CF again */
        if (ace_buf_count == XSA_CF_SECTOR_SIZE)
        {
#if DEBUG
				print("In CF2ICAP ..Reading Next Sector..\r\n");
#endif
            /* read next sector from CF */
            numCharsRead = sysace_fread(systemACE_Buffer, 1, XSA_CF_SECTOR_SIZE,
                                        stream);
            ace_buf_count = 0;
#if DEBUG
				xil_printf("Number of chars read = %d, sector number = %d\r\n",numCharsRead, SectorNumber);
#endif
				SectorNumber++;
        }
		}

#if DEBUG
	print("In CF2ICAP ..All Words Written to ICAP..\r\n");
#endif
	/* close systemAce file handle */
	rc = sysace_fclose (stream);
	if (rc < 0) {
		/* Can't close */
		xil_printf("can't close file\r\n");
		return -1;
    }
	return 0;
}


void get_operands(void)
{
	int first, second, result;

	//print("First operand: ");
	//first = getNumber();
	//print("\r\n");
	//print("Second operand: ");
	//second = getNumber();
	//print("\r\n");
	//Xil_Out32(XPAR_MATH_0_BASEADDR,first);
	//Xil_Out32(XPAR_MATH_0_BASEADDR+4,second);
	///result=Xil_In32(XPAR_MATH_0_BASEADDR);
	xil_printf("Result: %d\n\r",result);
	//print("\r\n");
}
void menu(void)
{
	 xil_printf("-------------- Reconfigurable Peripheral --------------\r\n");
	 xil_printf("      Press m or M for multiplication configuration\n\r");
	 xil_printf("      Press a or A for addition configuration\n\r");
	 xil_printf("      Press b or B for blanking configuration\n\r");
	 xil_printf("      Press o or O to enter operands and display result\n\r");
	 xil_printf("      Press q or Q to quit the demo\n\r");
}

`timescale 1 ns / 100 ps
module plbv46_dvi_cntlr_logic(
  // -- ADD USER PORTS BELOW THIS LINE ---------------
  // --USER ports added here 
  //IIC init state machine for Chrontel CH7301C
  tft_iic_scl_I,    						  // I
  tft_iic_scl_O,    						  // O
  tft_iic_scl_T,    						  // O
  tft_iic_sda_I,    						  // I
  tft_iic_sda_O,    						  // O
  tft_iic_sda_T,    						  // O
                    						
  // DCR BUS        						
  SYS_dcrClk,       						  // I
  DCR_ABus,         						  // I [0:9]
  DCR_DBusIn,       						  // I [0:31]
  DCR_Read,         						  // I
  DCR_Write,        						  // I
  DCR_Ack,          						  // O
  DCR_DBusOut,      						  // O [0:31]
  
  // TFT SIGNALS OUT TO HW
  SYS_tftClk,        							// I
  TFT_LCD_CLK_P,     							// O
  TFT_LCD_CLK_N,     							// O
  TFT_LCD_DE,        							// O
  TFT_LCD_DATA,      							// O [11:0]
  TFT_LCD_HSYNC,     							// O    
  TFT_LCD_VSYNC,     							// O
  TFT_LCD_DPS,       							// O
  
  // -- ADD USER PORTS ABOVE THIS LINE ---------------

  // -- DO NOT EDIT BELOW THIS LINE ------------------
  // -- Bus protocol ports, do not add to or delete 
  Bus2IP_Clk,                     // Bus to IP clock
  Bus2IP_Reset,                   // Bus to IP reset
  Bus2IP_Data,                    // Bus to IP data bus
  Bus2IP_BE,                      // Bus to IP byte enables
  Bus2IP_RdCE,                    // Bus to IP read chip enable
  Bus2IP_WrCE,                    // Bus to IP write chip enable
  
  IP2Bus_Data,                    // IP to Bus data bus
  IP2Bus_RdAck,                   // IP to Bus read transfer acknowledgement
  IP2Bus_WrAck,                   // IP to Bus write transfer acknowledgement
  IP2Bus_Error,                   // IP to Bus error response
  IP2Bus_MstRd_Req,               // IP to Bus master read request
  IP2Bus_MstWr_Req,               // IP to Bus master write request
  IP2Bus_Mst_Addr,                // IP to Bus master address bus
  IP2Bus_Mst_BE,                  // IP to Bus master byte enables
  IP2Bus_Mst_Length,              // IP to Bus master transfer length
  IP2Bus_Mst_Type,                // IP to Bus master transfer type
  IP2Bus_Mst_Lock,                // IP to Bus master lock
  IP2Bus_Mst_Reset,               // IP to Bus master reset
  
  Bus2IP_Mst_CmdAck,              // Bus to IP master command acknowledgement
  Bus2IP_Mst_Cmplt,               // Bus to IP master transfer completion
  Bus2IP_Mst_Error,               // Bus to IP master error response
  Bus2IP_Mst_Rearbitrate,         // Bus to IP master re-arbitrate
  Bus2IP_Mst_Cmd_Timeout,         // Bus to IP master command timeout
  Bus2IP_MstRd_d,                 // Bus to IP master read data bus
  Bus2IP_MstRd_rem,               // Bus to IP master read remainder
  Bus2IP_MstRd_sof_n,             // Bus to IP master read start of frame
  Bus2IP_MstRd_eof_n,             // Bus to IP master read end of frame
  Bus2IP_MstRd_src_rdy_n,         // Bus to IP master read source ready
  Bus2IP_MstRd_src_dsc_n,         // Bus to IP master read source discontinue
  
  IP2Bus_MstRd_dst_rdy_n,         // IP to Bus master read destination ready
  IP2Bus_MstRd_dst_dsc_n,         // IP to Bus master read destination discontinue
  IP2Bus_MstWr_d,                 // IP to Bus master write data bus
  IP2Bus_MstWr_rem,               // IP to Bus master write remainder
  IP2Bus_MstWr_sof_n,             // IP to Bus master write start of frame
  IP2Bus_MstWr_eof_n,             // IP to Bus master write end of frame
  IP2Bus_MstWr_src_rdy_n,         // IP to Bus master write source ready
  IP2Bus_MstWr_src_dsc_n,         // IP to Bus master write source discontinue
  
  Bus2IP_MstWr_dst_rdy_n,         // Bus to IP master write destination ready
  Bus2IP_MstWr_dst_dsc_n          // Bus to IP master write destination discontinue
  // -- DO NOT EDIT ABOVE THIS LINE ------------------
); // user_logic

// -- ADD USER PARAMETERS BELOW THIS LINE ------------
// --USER parameters added here

parameter C_DCR_BASEADDR			  = "0010000000"; 
parameter C_DCR_HIGHADDR           = "0010000001"; 
parameter C_DEFAULT_TFT_BASE_ADDR  = "11110000000";
parameter C_DPS_INIT               = 1;          
parameter C_ON_INIT                = 1;          
parameter C_SLV_DWIDTH             = 32;
parameter C_MST_AWIDTH             = 32;
parameter C_MST_DWIDTH             = 32;
parameter C_NUM_REG                = 6;
parameter C_TRANS_INIT				  = 19;
parameter C_LINE_INIT				  = 479;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

// -- ADD USER PORTS BELOW THIS LINE -----------------
// --USER ports added here

// DCR BUS SIGNALS 
input             							SYS_dcrClk;
input     [0:9]   							DCR_ABus;
input     [0:31]  							DCR_DBusIn;
input            								DCR_Read;
input            								DCR_Write;
output           								DCR_Ack;
output    [0:31]  							DCR_DBusOut;      

// TFT SIGNALS
input                                   SYS_tftClk;
output                                  TFT_LCD_HSYNC;
output                                  TFT_LCD_VSYNC;
output                                  TFT_LCD_CLK_P; 
output                                  TFT_LCD_CLK_N; 
output                                  TFT_LCD_DE; 
output    [11:0]                        TFT_LCD_DATA; 
output                                  TFT_LCD_DPS; 

// IIC init signals
input                                   tft_iic_scl_I;
output                                  tft_iic_scl_O;
output                                  tft_iic_scl_T;
input                                   tft_iic_sda_I;
output                                  tft_iic_sda_O;
output                                  tft_iic_sda_T;
 
// -- ADD USER PORTS ABOVE THIS LINE -----------------

// -- DO NOT EDIT BELOW THIS LINE --------------------                                
// -- Bus protocol ports, do not add to or delete
input                                   Bus2IP_Clk;
input                                   Bus2IP_Reset;
input     [0 : C_SLV_DWIDTH-1]          Bus2IP_Data;
input     [0 : C_SLV_DWIDTH/8-1]        Bus2IP_BE;
input     [0 : C_NUM_REG-1]             Bus2IP_RdCE;
input     [0 : C_NUM_REG-1]             Bus2IP_WrCE;
output    [0 : C_SLV_DWIDTH-1]          IP2Bus_Data;
output                                  IP2Bus_RdAck;
output                                  IP2Bus_WrAck;
output                                  IP2Bus_Error;
output                                  IP2Bus_MstRd_Req;
output                                  IP2Bus_MstWr_Req;
output    [0 : C_MST_AWIDTH-1]          IP2Bus_Mst_Addr;
output    [0 : C_MST_DWIDTH/8-1]        IP2Bus_Mst_BE;
output    [0 : 11]                      IP2Bus_Mst_Length;
output                                  IP2Bus_Mst_Type;
output                                  IP2Bus_Mst_Lock;
output                                  IP2Bus_Mst_Reset;
input                                   Bus2IP_Mst_CmdAck;
input                                   Bus2IP_Mst_Cmplt;
input                                   Bus2IP_Mst_Error;
input                                   Bus2IP_Mst_Rearbitrate;
input                                   Bus2IP_Mst_Cmd_Timeout;
input     [0 : C_MST_DWIDTH-1]          Bus2IP_MstRd_d;
input     [0 : C_MST_DWIDTH/8-1]        Bus2IP_MstRd_rem;
input                                   Bus2IP_MstRd_sof_n;
input                                   Bus2IP_MstRd_eof_n;
input                                   Bus2IP_MstRd_src_rdy_n;
input                                   Bus2IP_MstRd_src_dsc_n;
output                                  IP2Bus_MstRd_dst_rdy_n;
output                                  IP2Bus_MstRd_dst_dsc_n;
output    [0 : C_MST_DWIDTH-1]          IP2Bus_MstWr_d;
output    [0 : C_MST_DWIDTH/8-1]        IP2Bus_MstWr_rem;
output                                  IP2Bus_MstWr_sof_n;
output                                  IP2Bus_MstWr_eof_n;
output                                  IP2Bus_MstWr_src_rdy_n;
output                                  IP2Bus_MstWr_src_dsc_n;
input                                   Bus2IP_MstWr_dst_rdy_n;
input                                   Bus2IP_MstWr_dst_dsc_n;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  // --USER nets declarations added here, as needed for user logic
	// PLB_IF to RGB_BRAM  
  reg    [0:63]                        PLB_BRAM_data_i;
  reg                                  PLB_BRAM_we_i;

  // HSYNC and VSYNC to TFT_IF
  wire                                  HSYNC_i;
  wire                                  VSYNC_i;

  // DE GENERATION
  wire                                  H_DE_i;
  wire                                  V_DE_i;
  wire                                  DE_i;

  // RGB_BRAM to TFT_IF
  wire                                  R0_i;
  wire                                  R1_i;
  wire                                  R2_i;
  wire                                  R3_i;
  wire                                  R4_i;
  wire                                  R5_i;
  wire                                  G0_i;
  wire                                  G1_i;
  wire                                  G2_i;
  wire                                  G3_i;
  wire                                  G4_i;
  wire                                  G5_i;
  wire                                  B0_i;
  wire                                  B1_i;
  wire                                  B2_i;
  wire                                  B3_i;
  wire                                  B4_i;
  wire                                  B5_i;

  // VSYNC RESET
  wire                                  vsync_rst;

  // TFT READ FROM BRAM
  wire                                  BRAM_TFT_rd;
  wire                                  BRAM_TFT_oe;
                                        
  wire                                  h_bp_cnt_tc;
  wire                                  h_bp_cnt_tc2;  
  wire                                  h_pix_cnt_tc;
  wire                                  h_pix_cnt_tc2;

  // get line pulse
  reg                                   get_line;

  // DCR Regs
  reg    [0:10]       			          tft_base_addr_i;
  wire    [0:10]       			          tft_base_addr;
  
  wire                  			       tft_on_reg;
                        			           
  wire                  			       v_bp_cnt_tc;
  wire                  			       get_line_start;
  reg                   			       get_line_start_d1;
  reg                   			       get_line_start_d2;
  reg                   			       get_line_start_d3;
  wire                  			       v_l_cnt_tc;
                                        
   // Clock wires
  wire											plb_clk;                       
  wire         								tft_clk;
  wire         								dcr_clk;
                                        
  // Reset wires                        
  wire         								tft_rst;   				//synthesis syn_keep = 1
  wire         								tft_rst1;  				//synthesis syn_keep = 1
  wire         								tft_rst2;  				//synthesis syn_keep = 1
  wire         								tft_rst3;  				//synthesis syn_keep = 1
               												
  wire         													dcr_iic_sda_t;
  wire         													dcr_iic_scl_t;  
  
  reg  		[0:4]  												trans_cnt;
  reg  		[0:4]  												trans_cnt_i;
  wire        										trans_cnt_ce;
  wire        													trans_cnt_tc;

  reg  		[0:8]  												line_cnt;
  reg  		[0:8]  												line_cnt_i;
  wire																	line_cnt_tc;
  wire																	line_cnt_ce;
  wire 																	mn_request_set;
  wire 																	IP2Bus_MstRd_dst_rdy;
  wire    																Bus2IP_MstRd_eof;
  wire 																	trans_cnt_tc_pulse;
  wire 																	trans_cnt_tc_pulse_i; 	  
  wire 																	eof_n;
  wire 																	eof_pulse;
  
  // Nets for user logic slave model s/w accessible register example
  reg     [0 : C_SLV_DWIDTH-1]          slv_reg0;
  reg     [0 : C_SLV_DWIDTH-1]          slv_reg1;
  reg     [0 : C_SLV_DWIDTH-1]          slv_reg2;
  reg     [0 : C_SLV_DWIDTH-1]          slv_reg3;
  wire    [0 : 3]                       slv_reg_write_sel;
  wire    [0 : 3]                       slv_reg_read_sel;
  reg     [0 : C_SLV_DWIDTH-1]          slv_ip2bus_data;
  wire                                  slv_read_ack;
  wire                                  slv_write_ack;
  integer                               byte_index, bit_index;
 
  // --USER logic implementation added here
  
  assign mn_request_set = tft_on_reg & ((get_line & (trans_cnt == 0)) | (Bus2IP_Mst_Cmplt & trans_cnt != 0)); 
                                        //| (end_xfer & (trans_cnt != 0))
													 
	// REQUEST LOGIC
  FDRSE FDRS_IP2Bus_MstRd_Req (.Q(IP2Bus_MstRd_Req),.CE(1'b0),.C(Bus2IP_Clk),.D(1'b0),
                             .R(Bus2IP_Mst_CmdAck | Bus2IP_Reset | trans_cnt_tc_pulse), .S(mn_request_set));
									  
  FDRSE FDRS_IP2Bus_Mst_Type (.Q(IP2Bus_Mst_Type),.CE(1'b0),.C(Bus2IP_Clk),.D(1'b0),
                             .R(Bus2IP_Mst_CmdAck | Bus2IP_Reset), .S(mn_request_set));
                             	
  FDRSE FDRS_IP2Bus_MstRd_dst_rdy_n(.Q(IP2Bus_MstRd_dst_rdy),.CE(1'b0),.C(Bus2IP_Clk),.D(1'b1),
                             .R(eof_pulse | Bus2IP_Reset), .S(mn_request_set)); 
 

  FD FD_x(.Q(eof_n),.C(Bus2IP_Clk),.D(Bus2IP_MstRd_eof_n));
  assign eof_pulse = ~eof_n & Bus2IP_MstRd_eof_n;
  
  FD FD_u(.Q(trans_cnt_tc_pulse_i),.C(Bus2IP_Clk),.D(trans_cnt_tc));
  assign trans_cnt_tc_pulse = trans_cnt_tc_pulse_i & ~trans_cnt_tc;  
                          
  always @(posedge Bus2IP_Clk)
  	if (mn_request_set) begin
    	tft_base_addr_i <= tft_base_addr;
      line_cnt_i      <= line_cnt;
      trans_cnt_i     <= trans_cnt;
  end                              
                             
  // DATA Bus
  always @(posedge Bus2IP_Clk)
  begin
     PLB_BRAM_data_i     <= Bus2IP_MstRd_d;
	  PLB_BRAM_we_i       <= ~Bus2IP_MstRd_src_rdy_n;
  end                             
  
///////////////////////////////////////////////////////////////////////////////
// Transaction Counter - Counts 0-19 (d)
///////////////////////////////////////////////////////////////////////////////      
  assign trans_cnt_tc = (trans_cnt == 7'd19);

  always @(posedge Bus2IP_Clk)
    if(Bus2IP_Reset)
     trans_cnt = 5'b0;
    else if (eof_pulse) begin
      if (trans_cnt_tc)
        trans_cnt = 5'b0;
      else 
        trans_cnt = trans_cnt + 1;
      end

///////////////////////////////////////////////////////////////////////////////
// Line Counter - Counts 0-479 (d)
///////////////////////////////////////////////////////////////////////////////      
  assign line_cnt_ce = trans_cnt_tc_pulse;
  always @(posedge Bus2IP_Clk)
    if (Bus2IP_Reset)
     line_cnt = 9'b0; 
    else if (line_cnt_ce) begin
      if (line_cnt == 9'd479)
        line_cnt = 9'b0;
      else
        line_cnt = line_cnt + 1;
    end
  
                       
  // BRAM_TFT_rd and BRAM_TFT_oe start the read process. These are constant
  // signals through out a line read.  
  assign BRAM_TFT_rd = ((DE_i ^ h_bp_cnt_tc ^ h_bp_cnt_tc2 ) & V_DE_i);
  assign BRAM_TFT_oe = ((DE_i ^ h_bp_cnt_tc) & V_DE_i);  
  
  // Generate DE for HW
  assign DE_i = (H_DE_i & V_DE_i);
  
  // get line start logic
  assign get_line_start = ((h_pix_cnt_tc && v_bp_cnt_tc) || // 1st get line
                           (h_pix_cnt_tc && DE_i) &&        // 2nd,3rd,...get line
                           (~v_l_cnt_tc));                  // No get_line on last line      
      
  assign IP2Bus_MstRd_dst_rdy_n = ~IP2Bus_MstRd_dst_rdy;
  assign Bus2IP_MstRd_eof = ~Bus2IP_MstRd_eof_n;
                               
  assign IP2Bus_MstRd_dst_dsc_n 		= 1'b1;                             
  assign IP2Bus_Mst_Length 			    = 12'b000010000000;
  assign IP2Bus_Mst_BE 		 			    = 4'b0;   
  assign IP2Bus_Mst_Lock 	 			    = 1'b0;   
  assign IP2Bus_Mst_Reset  			    = 1'b0;  
  assign IP2Bus_Mst_Addr[0:10] 		  = tft_base_addr_i; 
  assign IP2Bus_Mst_Addr[11:19] 		= line_cnt_i;
  assign IP2Bus_Mst_Addr[20:24] 		= trans_cnt_i;
  assign IP2Bus_Mst_Addr[25:31] 		= 7'b0000000; 

  FD  FD_TFT_RST1 (.Q(tft_rst1), .C(SYS_tftClk), .D(Bus2IP_Reset));
  FDS FD_TFT_RST2 (.Q(tft_rst2), .C(SYS_tftClk), .S(tft_rst1), .D(1'b0));
  FDS FD_TFT_RST3 (.Q(tft_rst3), .C(SYS_tftClk), .S(tft_rst1), .D(tft_rst2));
  FDS FD_TFT_RST4 (.Q(tft_rst4), .C(SYS_tftClk), .S(tft_rst1), .D(tft_rst3));
  FDS FD_TFT_RST (.Q(tft_rst),  .C(SYS_tftClk), .S(tft_rst1), .D(tft_rst4));
                
  ////////////////////////////////////////////////////////////////////////////
  // IIC INIT COMPONENT INSTANTIATION
  ////////////////////////////////////////////////////////////////////////////
                
  iic_init iic_init (.Clk     (Bus2IP_Clk),
                     .Reset_n (~Bus2IP_Reset),
                     .Pixel_clk_greater_than_65Mhz (1'b0),
                     .SDA     (tft_iic_sda_t_i),
                     .SCL     (tft_iic_scl_t_i),
                     .Done    ()
                     );
                   
  assign tft_iic_scl_O = 1'b0;
  assign tft_iic_sda_O = 1'b0;
  assign tft_iic_sda_T = tft_iic_sda_t_i & dcr_iic_sda_t;
  assign tft_iic_scl_T = tft_iic_scl_t_i & dcr_iic_scl_t;
                
  ////////////////////////////////////////////////////////////////////////////
  // DCR_IF COMPONENT INSTANTIATION
  ////////////////////////////////////////////////////////////////////////////
  dcr_if #(C_DCR_BASEADDR, C_DEFAULT_TFT_BASE_ADDR,
           C_DPS_INIT, C_ON_INIT) DCR_IF_U6 (
    .clk(SYS_dcrClk),
    .rst(Bus2IP_Reset),
    .DCR_ABus(DCR_ABus),         
    .DCR_DBusIn(DCR_DBusIn),     
    .DCR_Read(DCR_Read),         
    .DCR_Write(DCR_Write),       
    .DCR_Ack(DCR_Ack),    
    .DCR_DBusOut(DCR_DBusOut), 
    .tft_base_addr(tft_base_addr),
    .tft_dps_reg(TFT_LCD_DPS),
    .tft_on_reg(tft_on_reg),
    .dcr_iic_sda_i(tft_iic_sda_I),
    .dcr_iic_sda_o(),
    .dcr_iic_sda_t(dcr_iic_sda_t),
    .dcr_iic_scl_i(tft_iic_scl_I),
    .dcr_iic_scl_o(),
    .dcr_iic_scl_t(dcr_iic_scl_t)
  );              
                  
  ///////////////////////////////////////////////////////////////////////////////
  // RGB_BRAM COMPONENT INSTANTIATION
  ///////////////////////////////////////////////////////////////////////////////              
  rgb_bram RGB_BRAM_U4(
    .tft_on_reg(tft_on_reg),
    .tft_clk(SYS_tftClk),
    .tft_rst(Bus2IP_Reset),
    .plb_clk(Bus2IP_Clk),
    .plb_rst(Bus2IP_Reset),
    .BRAM_TFT_rd(BRAM_TFT_rd), 
    .BRAM_TFT_oe(BRAM_TFT_oe), 
    .PLB_BRAM_data(PLB_BRAM_data_i),
    .PLB_BRAM_we(PLB_BRAM_we_i),
    .R0(R0_i),.R1(R1_i),.R2(R2_i),.R3(R3_i),.R4(R4_i),.R5(R5_i), 
    .G0(G0_i),.G1(G1_i),.G2(G2_i),.G3(G3_i),.G4(G4_i),.G5(G5_i),
    .B0(B0_i),.B1(B1_i),.B2(B2_i),.B3(B3_i),.B4(B4_i),.B5(B5_i)
  );              
                  
  ///////////////////////////////////////////////////////////////////////////////
  //HSYNC COMPONENT INSTANTIATION
  ///////////////////////////////////////////////////////////////////////////////  
  h_sync HSYNC_U2 (
    .clk(SYS_tftClk), 
    .rst(tft_rst), 
    .vsync_rst(vsync_rst), 
    .HSYNC(HSYNC_i), 
    .H_DE(H_DE_i), 
    .h_bp_cnt_tc(h_bp_cnt_tc),    
    .h_bp_cnt_tc2(h_bp_cnt_tc2), 
    .h_pix_cnt_tc(h_pix_cnt_tc),  
    .h_pix_cnt_tc2(h_pix_cnt_tc2) 
  );              
                 
  ///////////////////////////////////////////////////////////////////////////////
  // VSYNC COMPONENT INSTANTIATION
  /////////////////////////////////////////////////////////////////////////////// 
  v_sync VSYNC_U3 (
    .clk(SYS_tftClk),
    .clk_stb(~HSYNC_i), 
    .rst(vsync_rst), 
    .VSYNC(VSYNC_i), 
    .V_DE(V_DE_i),
    .v_bp_cnt_tc(v_bp_cnt_tc),
    .v_l_cnt_tc(v_l_cnt_tc)
  );            
               
  ///////////////////////////////////////////////////////////////////////////////
  // TFT_IF COMPONENT INSTANTIATION
  ///////////////////////////////////////////////////////////////////////////////
  tft_if TFT_IF_U5 (
    .clk(SYS_tftClk),
    .rst(Bus2IP_Reset),
    .HSYNC(HSYNC_i),
    .VSYNC(VSYNC_i),
    .DE(DE_i),   
    .R0(R0_i),    
    .R1(R1_i),    
    .R2(R2_i),    
    .R3(R3_i),    
    .R4(R4_i),    
    .R5(R5_i), 
    .G0(G0_i),
    .G1(G1_i),
    .G2(G2_i),
    .G3(G3_i),
    .G4(G4_i),
    .G5(G5_i),
    .B0(B0_i),  
    .B1(B1_i),
    .B2(B2_i),
    .B3(B3_i),
    .B4(B4_i),  
    .B5(B5_i),
    .TFT_LCD_HSYNC  (TFT_LCD_HSYNC),
    .TFT_LCD_VSYNC  (TFT_LCD_VSYNC),
    .TFT_LCD_DE     (TFT_LCD_DE),
    .TFT_LCD_CLK_P  (TFT_LCD_CLK_P),
    .TFT_LCD_CLK_N  (TFT_LCD_CLK_N),
    .TFT_LCD_DATA0  (TFT_LCD_DATA[0]),
    .TFT_LCD_DATA1  (TFT_LCD_DATA[1]), 
    .TFT_LCD_DATA2  (TFT_LCD_DATA[2]), 
    .TFT_LCD_DATA3  (TFT_LCD_DATA[3]), 
    .TFT_LCD_DATA4  (TFT_LCD_DATA[4]), 
    .TFT_LCD_DATA5  (TFT_LCD_DATA[5]), 
    .TFT_LCD_DATA6  (TFT_LCD_DATA[6]), 
    .TFT_LCD_DATA7  (TFT_LCD_DATA[7]), 
    .TFT_LCD_DATA8  (TFT_LCD_DATA[8]), 
    .TFT_LCD_DATA9  (TFT_LCD_DATA[9]), 
    .TFT_LCD_DATA10 (TFT_LCD_DATA[10]), 
    .TFT_LCD_DATA11 (TFT_LCD_DATA[11])
  );
  
  ///////////////////////////////////////////////////////////////////////////////
  // TOP LEVEL GLUE LOGIC
  ///////////////////////////////////////////////////////////////////////////////
  // GET LINE State Machine to generate on get_line for the PLB clock domain 
  // from TFT clock domain.
  always @(posedge SYS_tftClk)
    if (Bus2IP_Reset)
      get_line_start_d1 <= 1'b0;
    else
      get_line_start_d1 <= get_line_start;
  
  always @(posedge Bus2IP_Clk)
  begin
    get_line_start_d2 <= get_line_start_d1;
    get_line_start_d3 <= get_line_start_d2;
    get_line <= get_line_start_d2 & ~get_line_start_d3;
  end  
  
    
  // ------------------------------------------------------
  // Example code to read/write user logic slave model s/w accessible registers
  // 
  // Note:
  // The example code presented here is to show you one way of reading/writing
  // software accessible registers implemented in the user logic slave model.
  // Each bit of the Bus2IP_WrCE/Bus2IP_RdCE signals is configured to correspond
  // to one software accessible register by the top level template. For example,
  // if you have four 32 bit software accessible registers in the user logic,
  // you are basically operating on the following memory mapped registers:
  // 
  //    Bus2IP_WrCE/Bus2IP_RdCE   Memory Mapped Register
  //                     "1000"   C_BASEADDR + 0x0
  //                     "0100"   C_BASEADDR + 0x4
  //                     "0010"   C_BASEADDR + 0x8
  //                     "0001"   C_BASEADDR + 0xC
  // 
  // ------------------------------------------------------

  assign
    slv_reg_write_sel = Bus2IP_WrCE[0:3],
    slv_reg_read_sel  = Bus2IP_RdCE[0:3],
    slv_write_ack     = Bus2IP_WrCE[0] || Bus2IP_WrCE[1] || Bus2IP_WrCE[2] || Bus2IP_WrCE[3],
    slv_read_ack      = Bus2IP_RdCE[0] || Bus2IP_RdCE[1] || Bus2IP_RdCE[2] || Bus2IP_RdCE[3];

  // implement slave model register(s)
  always @( posedge Bus2IP_Clk )
    begin: SLAVE_REG_WRITE_PROC

      if ( Bus2IP_Reset == 1 )
        begin
          slv_reg0 <= 0;
          slv_reg1 <= 0;
          slv_reg2 <= 0;
          slv_reg3 <= 0;
        end
      else
        case ( slv_reg_write_sel )
          4'b1000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg0[bit_index] <= Bus2IP_Data[bit_index];
          4'b0100 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg1[bit_index] <= Bus2IP_Data[bit_index];
          4'b0010 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg2[bit_index] <= Bus2IP_Data[bit_index];
          4'b0001 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                for ( bit_index = byte_index*8; bit_index <= byte_index*8+7; bit_index = bit_index+1 )
                  slv_reg3[bit_index] <= Bus2IP_Data[bit_index];
          default : ;
        endcase

    end // SLAVE_REG_WRITE_PROC

  // implement slave model register read mux
  always @( slv_reg_read_sel or slv_reg0 or slv_reg1 or slv_reg2 or slv_reg3 )
    begin: SLAVE_REG_READ_PROC

      case ( slv_reg_read_sel )
        4'b1000 : slv_ip2bus_data <= slv_reg0;
        4'b0100 : slv_ip2bus_data <= slv_reg1;
        4'b0010 : slv_ip2bus_data <= slv_reg2;
        4'b0001 : slv_ip2bus_data <= slv_reg3;
        default : slv_ip2bus_data <= 0;
      endcase

    end // SLAVE_REG_READ_PROC

  // ------------------------------------------------------------
  // Example code to drive IP to Bus signals
  // ------------------------------------------------------------

  assign IP2Bus_Data    = slv_ip2bus_data;
  assign IP2Bus_WrAck   = slv_write_ack;
  assign IP2Bus_RdAck   = slv_read_ack;
  assign IP2Bus_Error   = 0;
  
  
  
  

endmodule

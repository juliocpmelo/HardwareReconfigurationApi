--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.49d
--  \   \         Application: netgen
--  /   /         Filename: CommunicationHardware_synthesis.vhd
-- /___/   /\     Timestamp: Fri May 31 17:03:33 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm CommunicationHardware -w -dir netgen/synthesis -ofmt vhdl -sim CommunicationHardware.ngc CommunicationHardware_synthesis.vhd 
-- Device	: xc5vlx50t-1-ff1136
-- Input file	: CommunicationHardware.ngc
-- Output file	: D:\DynamicFilter\VideoFilterDynamic\CommunicationHardware\netgen\synthesis\CommunicationHardware_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: CommunicationHardware
-- Xilinx	: C:\Xilinx\14.4\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity CommunicationHardware is
  port (
    clk : in STD_LOGIC := 'X'; 
    mode : in STD_LOGIC := 'X'; 
    registerOutValue : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    registerAddress : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    registerInValue : in STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end CommunicationHardware;

architecture Structure of CommunicationHardware is
  signal N0 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N101 : STD_LOGIC; 
  signal N103 : STD_LOGIC; 
  signal N105 : STD_LOGIC; 
  signal N107 : STD_LOGIC; 
  signal N109 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal N113 : STD_LOGIC; 
  signal N115 : STD_LOGIC; 
  signal N117 : STD_LOGIC; 
  signal N119 : STD_LOGIC; 
  signal N121 : STD_LOGIC; 
  signal N123 : STD_LOGIC; 
  signal N125 : STD_LOGIC; 
  signal N127 : STD_LOGIC; 
  signal N129 : STD_LOGIC; 
  signal N131 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal N133 : STD_LOGIC; 
  signal N134 : STD_LOGIC; 
  signal N135 : STD_LOGIC; 
  signal N136 : STD_LOGIC; 
  signal N137 : STD_LOGIC; 
  signal N138 : STD_LOGIC; 
  signal N139 : STD_LOGIC; 
  signal N140 : STD_LOGIC; 
  signal N141 : STD_LOGIC; 
  signal N142 : STD_LOGIC; 
  signal N143 : STD_LOGIC; 
  signal N144 : STD_LOGIC; 
  signal N145 : STD_LOGIC; 
  signal N146 : STD_LOGIC; 
  signal N147 : STD_LOGIC; 
  signal N148 : STD_LOGIC; 
  signal N149 : STD_LOGIC; 
  signal N150 : STD_LOGIC; 
  signal N151 : STD_LOGIC; 
  signal N152 : STD_LOGIC; 
  signal N153 : STD_LOGIC; 
  signal N154 : STD_LOGIC; 
  signal N155 : STD_LOGIC; 
  signal N156 : STD_LOGIC; 
  signal N157 : STD_LOGIC; 
  signal N158 : STD_LOGIC; 
  signal N159 : STD_LOGIC; 
  signal N160 : STD_LOGIC; 
  signal N161 : STD_LOGIC; 
  signal N162 : STD_LOGIC; 
  signal N163 : STD_LOGIC; 
  signal N164 : STD_LOGIC; 
  signal N165 : STD_LOGIC; 
  signal N166 : STD_LOGIC; 
  signal N167 : STD_LOGIC; 
  signal N168 : STD_LOGIC; 
  signal N169 : STD_LOGIC; 
  signal N170 : STD_LOGIC; 
  signal N171 : STD_LOGIC; 
  signal N172 : STD_LOGIC; 
  signal N173 : STD_LOGIC; 
  signal N174 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N58 : STD_LOGIC; 
  signal N59 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N63 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N83 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N89 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N95 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N99 : STD_LOGIC; 
  signal clk_BUFGP_92 : STD_LOGIC; 
  signal mode_IBUF_94 : STD_LOGIC; 
  signal mode_inv : STD_LOGIC; 
  signal reg0_not0001 : STD_LOGIC; 
  signal reg0_not00011128_121 : STD_LOGIC; 
  signal reg0_not00011184_122 : STD_LOGIC; 
  signal reg0_not00011200_123 : STD_LOGIC; 
  signal reg0_not0001135_124 : STD_LOGIC; 
  signal reg0_not0001171_125 : STD_LOGIC; 
  signal reg1_not0001 : STD_LOGIC; 
  signal reg2_not0001 : STD_LOGIC; 
  signal reg3_not0001 : STD_LOGIC; 
  signal reg4_179 : STD_LOGIC; 
  signal reg4_not0001 : STD_LOGIC; 
  signal reg4_rstpot_181 : STD_LOGIC; 
  signal reg5 : STD_LOGIC; 
  signal registerAddress_0_IBUF_215 : STD_LOGIC; 
  signal registerAddress_10_IBUF_216 : STD_LOGIC; 
  signal registerAddress_11_IBUF_217 : STD_LOGIC; 
  signal registerAddress_12_IBUF_218 : STD_LOGIC; 
  signal registerAddress_13_IBUF_219 : STD_LOGIC; 
  signal registerAddress_14_IBUF_220 : STD_LOGIC; 
  signal registerAddress_15_IBUF_221 : STD_LOGIC; 
  signal registerAddress_16_IBUF_222 : STD_LOGIC; 
  signal registerAddress_17_IBUF_223 : STD_LOGIC; 
  signal registerAddress_18_IBUF_224 : STD_LOGIC; 
  signal registerAddress_19_IBUF_225 : STD_LOGIC; 
  signal registerAddress_1_IBUF_226 : STD_LOGIC; 
  signal registerAddress_20_IBUF_227 : STD_LOGIC; 
  signal registerAddress_21_IBUF_228 : STD_LOGIC; 
  signal registerAddress_22_IBUF_229 : STD_LOGIC; 
  signal registerAddress_23_IBUF_230 : STD_LOGIC; 
  signal registerAddress_24_IBUF_231 : STD_LOGIC; 
  signal registerAddress_25_IBUF_232 : STD_LOGIC; 
  signal registerAddress_26_IBUF_233 : STD_LOGIC; 
  signal registerAddress_27_IBUF_234 : STD_LOGIC; 
  signal registerAddress_28_IBUF_235 : STD_LOGIC; 
  signal registerAddress_29_IBUF_236 : STD_LOGIC; 
  signal registerAddress_2_IBUF_237 : STD_LOGIC; 
  signal registerAddress_30_IBUF_238 : STD_LOGIC; 
  signal registerAddress_31_IBUF_239 : STD_LOGIC; 
  signal registerAddress_3_IBUF_240 : STD_LOGIC; 
  signal registerAddress_4_IBUF_241 : STD_LOGIC; 
  signal registerAddress_5_IBUF_242 : STD_LOGIC; 
  signal registerAddress_6_IBUF_243 : STD_LOGIC; 
  signal registerAddress_7_IBUF_244 : STD_LOGIC; 
  signal registerAddress_8_IBUF_245 : STD_LOGIC; 
  signal registerAddress_9_IBUF_246 : STD_LOGIC; 
  signal registerInValue_0_IBUF_271 : STD_LOGIC; 
  signal registerInValue_10_IBUF_272 : STD_LOGIC; 
  signal registerInValue_11_IBUF_273 : STD_LOGIC; 
  signal registerInValue_12_IBUF_274 : STD_LOGIC; 
  signal registerInValue_13_IBUF_275 : STD_LOGIC; 
  signal registerInValue_14_IBUF_276 : STD_LOGIC; 
  signal registerInValue_15_IBUF_277 : STD_LOGIC; 
  signal registerInValue_16_IBUF_278 : STD_LOGIC; 
  signal registerInValue_17_IBUF_279 : STD_LOGIC; 
  signal registerInValue_18_IBUF_280 : STD_LOGIC; 
  signal registerInValue_19_IBUF_281 : STD_LOGIC; 
  signal registerInValue_1_IBUF_282 : STD_LOGIC; 
  signal registerInValue_20_IBUF_283 : STD_LOGIC; 
  signal registerInValue_21_IBUF_284 : STD_LOGIC; 
  signal registerInValue_22_IBUF_285 : STD_LOGIC; 
  signal registerInValue_23_IBUF_286 : STD_LOGIC; 
  signal registerInValue_2_IBUF_287 : STD_LOGIC; 
  signal registerInValue_3_IBUF_288 : STD_LOGIC; 
  signal registerInValue_4_IBUF_289 : STD_LOGIC; 
  signal registerInValue_5_IBUF_290 : STD_LOGIC; 
  signal registerInValue_6_IBUF_291 : STD_LOGIC; 
  signal registerInValue_7_IBUF_292 : STD_LOGIC; 
  signal registerInValue_8_IBUF_293 : STD_LOGIC; 
  signal registerInValue_9_IBUF_294 : STD_LOGIC; 
  signal registerOutValue_0_327 : STD_LOGIC; 
  signal registerOutValue_1_328 : STD_LOGIC; 
  signal registerOutValue_10_329 : STD_LOGIC; 
  signal registerOutValue_11_330 : STD_LOGIC; 
  signal registerOutValue_12_331 : STD_LOGIC; 
  signal registerOutValue_13_332 : STD_LOGIC; 
  signal registerOutValue_14_333 : STD_LOGIC; 
  signal registerOutValue_15_334 : STD_LOGIC; 
  signal registerOutValue_16_335 : STD_LOGIC; 
  signal registerOutValue_17_336 : STD_LOGIC; 
  signal registerOutValue_18_337 : STD_LOGIC; 
  signal registerOutValue_19_338 : STD_LOGIC; 
  signal registerOutValue_2_339 : STD_LOGIC; 
  signal registerOutValue_20_340 : STD_LOGIC; 
  signal registerOutValue_21_341 : STD_LOGIC; 
  signal registerOutValue_22_342 : STD_LOGIC; 
  signal registerOutValue_23_343 : STD_LOGIC; 
  signal registerOutValue_3_344 : STD_LOGIC; 
  signal registerOutValue_4_345 : STD_LOGIC; 
  signal registerOutValue_5_346 : STD_LOGIC; 
  signal registerOutValue_6_347 : STD_LOGIC; 
  signal registerOutValue_7_348 : STD_LOGIC; 
  signal registerOutValue_8_349 : STD_LOGIC; 
  signal registerOutValue_9_350 : STD_LOGIC; 
  signal registerOutValue_and0000 : STD_LOGIC; 
  signal registerOutValue_mux0000_0_139_353 : STD_LOGIC; 
  signal registerOutValue_mux0000_0_31_354 : STD_LOGIC; 
  signal registerOutValue_mux0000_10_60_356 : STD_LOGIC; 
  signal registerOutValue_mux0000_11_60_358 : STD_LOGIC; 
  signal registerOutValue_mux0000_12_60_360 : STD_LOGIC; 
  signal registerOutValue_mux0000_13_60_362 : STD_LOGIC; 
  signal registerOutValue_mux0000_14_60_364 : STD_LOGIC; 
  signal registerOutValue_mux0000_15_60_366 : STD_LOGIC; 
  signal registerOutValue_mux0000_16_60_368 : STD_LOGIC; 
  signal registerOutValue_mux0000_17_60_370 : STD_LOGIC; 
  signal registerOutValue_mux0000_18_60_372 : STD_LOGIC; 
  signal registerOutValue_mux0000_19_60_374 : STD_LOGIC; 
  signal registerOutValue_mux0000_1_2 : STD_LOGIC; 
  signal registerOutValue_mux0000_1_30_377 : STD_LOGIC; 
  signal registerOutValue_mux0000_1_81 : STD_LOGIC; 
  signal registerOutValue_mux0000_1_811_379 : STD_LOGIC; 
  signal registerOutValue_mux0000_1_812_380 : STD_LOGIC; 
  signal registerOutValue_mux0000_20_60_382 : STD_LOGIC; 
  signal registerOutValue_mux0000_21_60_384 : STD_LOGIC; 
  signal registerOutValue_mux0000_22_60_386 : STD_LOGIC; 
  signal registerOutValue_mux0000_23_60_388 : STD_LOGIC; 
  signal registerOutValue_mux0000_2_60_390 : STD_LOGIC; 
  signal registerOutValue_mux0000_3_60_392 : STD_LOGIC; 
  signal registerOutValue_mux0000_4_60_394 : STD_LOGIC; 
  signal registerOutValue_mux0000_5_60_396 : STD_LOGIC; 
  signal registerOutValue_mux0000_6_60_398 : STD_LOGIC; 
  signal registerOutValue_mux0000_7_60_400 : STD_LOGIC; 
  signal registerOutValue_mux0000_8_60_402 : STD_LOGIC; 
  signal registerOutValue_mux0000_9_60_404 : STD_LOGIC; 
  signal sobel_wrapper_inst_filteredPixelX_and0000_453 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_01_mand1_528 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_02_mand1_529 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_03_mand1_530 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_04_mand1_531 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_05_mand1_532 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_0_mand1_533 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_101_mand1_534 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_102_mand1_535 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_103_mand1_536 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_104_mand1_537 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_105_mand1_538 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_10_mand1_539 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_110_mand1_540 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_111_mand1_541 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_112_mand1_542 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_113_mand1_543 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_114_mand1_544 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_115_mand1_545 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_116_mand1_546 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_117_mand1_547 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_118_mand1_548 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_119_mand1_549 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_11_mand1_550 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_121_mand1_551 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_122_mand1_552 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_123_mand1_553 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_124_mand1_554 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_125_mand1_555 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_12_mand1_556 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_131_mand1_557 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_132_mand1_558 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_133_mand1_559 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_134_mand1_560 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_135_mand1_561 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_13_mand1_562 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_141_mand1_563 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_142_mand1_564 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_143_mand1_565 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_144_mand1_566 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_145_mand1_567 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_14_mand1_568 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_151_mand1_569 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_152_mand1_570 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_153_mand1_571 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_154_mand1_572 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_155_mand1_573 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_15_mand1_574 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_161_mand1_575 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_162_mand1_576 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_163_mand1_577 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_164_mand1_578 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_165_mand1_579 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_16_mand1_580 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_171_mand1_581 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_172_mand1_582 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_173_mand1_583 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_174_mand1_584 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_175_mand1_585 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_17_mand1_586 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_181_mand1_587 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_182_mand1_588 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_183_mand1_589 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_184_mand1_590 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_185_mand1_591 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_18_mand1_592 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_191_mand1_593 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_192_mand1_594 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_193_mand1_595 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_194_mand1_596 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_195_mand1_597 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_19_mand1_598 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_1_mand1_599 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_201_mand1_600 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_202_mand1_601 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_203_mand1_602 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_204_mand1_603 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_205_mand1_604 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_20_mand1_605 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_211_mand1_606 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_212_mand1_607 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_213_mand1_608 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_214_mand1_609 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_215_mand1_610 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_21_mand1_611 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_221_mand1_612 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_222_mand1_613 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_223_mand1_614 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_224_mand1_615 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_225_mand1_616 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_22_mand1_617 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_24_mand1_618 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_25_mand1_619 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_26_mand1_620 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_27_mand1_621 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_28_mand1_622 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_2_mand1_623 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_31_mand1_624 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_32_mand1_625 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_33_mand1_626 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_34_mand1_627 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_35_mand1_628 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_3_mand1_629 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_41_mand1_630 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_42_mand1_631 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_43_mand1_632 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_44_mand1_633 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_45_mand1_634 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_4_mand1_635 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_51_mand1_636 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_52_mand1_637 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_53_mand1_638 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_54_mand1_639 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_55_mand1_640 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_5_mand1_641 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_61_mand1_642 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_62_mand1_643 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_63_mand1_644 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_64_mand1_645 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_65_mand1_646 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_6_mand1_647 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_71_mand1_648 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_72_mand1_649 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_73_mand1_650 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_74_mand1_651 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_75_mand1_652 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_7_mand1_653 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_81_mand1_654 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_82_mand1_655 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_83_mand1_656 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_84_mand1_657 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_85_mand1_658 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_8_mand1_659 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_91_mand1_660 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_92_mand1_661 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_93_mand1_662 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_94_mand1_663 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_95_mand1_664 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Eqn_9_mand1_665 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C6_mand1_952 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C7_mand1_953 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2R : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_3_rt_959 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_4_rt_961 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_5_rt_963 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_6_rt_965 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_0_Q_969 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_10_Q_970 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_2_Q_971 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_7_Q_972 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_8_Q_973 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_9_Q_974 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_10_rt_977 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_11_rt_979 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_12_rt_981 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_13_rt_983 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_14_rt_985 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_15_rt_987 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_16_rt_989 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_17_rt_991 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_18_rt_993 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_19_rt_995 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_1_rt_997 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_20_rt_999 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_21_rt_1001 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_22_rt_1003 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_2_rt_1005 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_3_rt_1007 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_4_rt_1009 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_5_rt_1011 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_6_rt_1013 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_7_rt_1015 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_8_rt_1017 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_9_rt_1019 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_0_Q_1022 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_1_Q_1023 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_2_Q_1024 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi_1031 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi1_1032 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi2_1033 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi3_1034 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi4_1035 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Mshreg_ap_CS_fsm_FSM_FFd5_1036 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_N1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_N78 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_0_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_0_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_0_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_0_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_0_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_10_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_10_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_10_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_10_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_10_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_11_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_11_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_11_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_11_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_11_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_12_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_12_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_12_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_12_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_12_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_13_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_13_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_13_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_13_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_13_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_14_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_14_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_14_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_14_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_14_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_15_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_15_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_15_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_15_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_15_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_16_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_16_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_16_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_16_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_16_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_17_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_17_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_17_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_17_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_17_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_18_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_18_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_18_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_18_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_18_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_19_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_19_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_19_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_19_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_19_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_1_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_1_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_1_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_1_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_1_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_20_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_20_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_20_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_20_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_20_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_21_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_21_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_21_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_21_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_21_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_22_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_22_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_22_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_22_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_22_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_23_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_23_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_23_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_23_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_23_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_2_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_2_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_2_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_2_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_2_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_3_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_3_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_3_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_3_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_3_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_4_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_4_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_4_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_4_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_4_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_5_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_5_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_5_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_5_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_5_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_6_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_6_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_6_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_6_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_6_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_7_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_7_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_7_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_7_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_7_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_8_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_8_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_8_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_8_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_8_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_9_1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_9_2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_9_3 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_9_4 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_Result_9_5 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_rstpot_1185 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_In2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_rstpot_1188 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd6_1192 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_rstpot_1194 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_countY_and0000 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex0000 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex00001 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex00002 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex00001 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex00002 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2226_1232 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2226_1235 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2226_1238 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2226_1241 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2226_1244 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2226_1247 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_pixelLine_ce0 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_pixelLine_we0 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1444 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1445 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1446 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1447 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1448 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1449 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1450 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1451 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1452 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1453 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1454 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1508 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1509 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1510 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1511 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1512 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1513 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1514 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1527 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1528 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1529 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1530 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1531 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1532 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1533 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1534 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1535 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1536 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1537 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1591 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1592 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1593 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1594 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1595 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1596 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1597 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1607 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1608 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1609 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1610 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1611 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1612 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1613 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1614 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1615 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1616 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1617 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1671 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1672 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1673 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1674 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1675 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1676 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1677 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1687 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1688 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1689 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1690 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1691 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1692 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1693 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1694 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1695 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1696 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1748 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1749 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1750 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1751 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1752 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1753 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1757 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1758 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1759 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1760 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1761 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1762 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1763 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1764 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1765 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1766 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1818 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1819 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1820 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1821 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1822 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1823 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1825 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1826 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1827 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1828 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1829 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1830 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1831 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1832 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1833 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1834 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1886 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1887 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1888 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1889 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1890 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1891 : STD_LOGIC;
 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045_0_rstpot_1986 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049_0_rstpot_2016 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_and0000 : STD_LOGIC; 
  signal sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_rstpot_2041 : STD_LOGIC; 
  signal sobel_wrapper_inst_x_Sig_not0001 : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_CLKB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ENB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_REGCEB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_SSRB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRA_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRA_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRA_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIPA_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIPB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIPB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPA_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPA_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_WEB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_WEB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_REGCEBU_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_REGCEBL_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINLATA_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINLATB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINREGA_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINREGB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTLATA_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTLATB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTREGA_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTREGB_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_31_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_30_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_29_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_28_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_27_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_26_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_25_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_24_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_23_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_22_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_21_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_20_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_19_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_18_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_17_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_16_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPA_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPA_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_31_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_30_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_29_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_28_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_27_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_26_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_25_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_24_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_23_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_22_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_21_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_20_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_19_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_18_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_17_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_16_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_31_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_30_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_29_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_28_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_27_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_26_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_25_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_24_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_23_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_22_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_21_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_20_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_19_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_18_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_17_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_16_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPA_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPA_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_31_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_30_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_29_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_28_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_27_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_26_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_25_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_24_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_23_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_22_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_21_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_20_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_19_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_18_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_17_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_16_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_sobel_wrapper_inst_sobel_inst_Mshreg_ap_CS_fsm_FSM_FFd5_Q15_UNCONNECTED : STD_LOGIC; 
  signal reg0 : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal reg1 : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal reg2 : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal reg3 : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal registerOutValue_mux0000 : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_filteredPixelX : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_filteredPixelX_Sig : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_filteredPixelY : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_filteredPixelY_Sig : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_mode_Sig : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal sobel_wrapper_inst_pixel_Sig : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_cy : STD_LOGIC_VECTOR ( 7 downto 7 ); 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut : STD_LOGIC_VECTOR ( 10 downto 9 ); 
  signal sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy : STD_LOGIC_VECTOR ( 5 downto 5 ); 
  signal sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_Result : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_countY : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_q0 : STD_LOGIC_VECTOR ( 2 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0 : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_iftmp_2_fu_707_p3 : STD_LOGIC_VECTOR ( 17 downto 16 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelLine_address0 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelLine_q0 : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelOutXB : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelOutXG : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelOutXR : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelOutYB : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelOutYG : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_pixelOutYR : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut : STD_LOGIC_VECTOR ( 6 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy : STD_LOGIC_VECTOR ( 9 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut : STD_LOGIC_VECTOR ( 6 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy : STD_LOGIC_VECTOR ( 9 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut : STD_LOGIC_VECTOR ( 6 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy : STD_LOGIC_VECTOR ( 9 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut : STD_LOGIC_VECTOR ( 6 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy : STD_LOGIC_VECTOR ( 9 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a : STD_LOGIC_VECTOR ( 2 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut : STD_LOGIC_VECTOR ( 6 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy : STD_LOGIC_VECTOR ( 9 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut : STD_LOGIC_VECTOR ( 6 downto 2 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy : STD_LOGIC_VECTOR ( 9 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_storemerge_reg_258 : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_11_reg_270 : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_15_fu_548_p3 : STD_LOGIC_VECTOR ( 17 downto 16 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166 : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171 : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176 : STD_LOGIC_VECTOR ( 10 downto 1 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_40_fu_812_p2 : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_40_reg_1069 : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2 : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_sobel_inst_tmp_reg_1041 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal sobel_wrapper_inst_x_Sig : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal sobel_wrapper_inst_y_Sig : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  registerOutValue_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(0),
      Q => registerOutValue_0_327
    );
  registerOutValue_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(1),
      Q => registerOutValue_1_328
    );
  registerOutValue_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(2),
      Q => registerOutValue_2_339
    );
  registerOutValue_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(3),
      Q => registerOutValue_3_344
    );
  registerOutValue_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(4),
      Q => registerOutValue_4_345
    );
  registerOutValue_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(5),
      Q => registerOutValue_5_346
    );
  registerOutValue_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(6),
      Q => registerOutValue_6_347
    );
  registerOutValue_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(7),
      Q => registerOutValue_7_348
    );
  registerOutValue_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(8),
      Q => registerOutValue_8_349
    );
  registerOutValue_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(9),
      Q => registerOutValue_9_350
    );
  registerOutValue_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(10),
      Q => registerOutValue_10_329
    );
  registerOutValue_11 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(11),
      Q => registerOutValue_11_330
    );
  registerOutValue_12 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(12),
      Q => registerOutValue_12_331
    );
  registerOutValue_13 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(13),
      Q => registerOutValue_13_332
    );
  registerOutValue_14 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(14),
      Q => registerOutValue_14_333
    );
  registerOutValue_15 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(15),
      Q => registerOutValue_15_334
    );
  registerOutValue_16 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(16),
      Q => registerOutValue_16_335
    );
  registerOutValue_17 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(17),
      Q => registerOutValue_17_336
    );
  registerOutValue_18 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(18),
      Q => registerOutValue_18_337
    );
  registerOutValue_19 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(19),
      Q => registerOutValue_19_338
    );
  registerOutValue_20 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(20),
      Q => registerOutValue_20_340
    );
  registerOutValue_21 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(21),
      Q => registerOutValue_21_341
    );
  registerOutValue_22 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(22),
      Q => registerOutValue_22_342
    );
  registerOutValue_23 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => mode_inv,
      D => registerOutValue_mux0000(23),
      Q => registerOutValue_23_343
    );
  reg0_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_0_IBUF_271,
      Q => reg0(0)
    );
  reg0_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_1_IBUF_282,
      Q => reg0(1)
    );
  reg0_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_2_IBUF_287,
      Q => reg0(2)
    );
  reg0_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_3_IBUF_288,
      Q => reg0(3)
    );
  reg0_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_4_IBUF_289,
      Q => reg0(4)
    );
  reg0_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_5_IBUF_290,
      Q => reg0(5)
    );
  reg0_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_6_IBUF_291,
      Q => reg0(6)
    );
  reg0_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_7_IBUF_292,
      Q => reg0(7)
    );
  reg0_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_8_IBUF_293,
      Q => reg0(8)
    );
  reg0_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_9_IBUF_294,
      Q => reg0(9)
    );
  reg0_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_10_IBUF_272,
      Q => reg0(10)
    );
  reg0_11 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_11_IBUF_273,
      Q => reg0(11)
    );
  reg0_12 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_12_IBUF_274,
      Q => reg0(12)
    );
  reg0_13 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_13_IBUF_275,
      Q => reg0(13)
    );
  reg0_14 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_14_IBUF_276,
      Q => reg0(14)
    );
  reg0_15 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_15_IBUF_277,
      Q => reg0(15)
    );
  reg0_16 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_16_IBUF_278,
      Q => reg0(16)
    );
  reg0_17 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_17_IBUF_279,
      Q => reg0(17)
    );
  reg0_18 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_18_IBUF_280,
      Q => reg0(18)
    );
  reg0_19 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_19_IBUF_281,
      Q => reg0(19)
    );
  reg0_20 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_20_IBUF_283,
      Q => reg0(20)
    );
  reg0_21 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_21_IBUF_284,
      Q => reg0(21)
    );
  reg0_22 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_22_IBUF_285,
      Q => reg0(22)
    );
  reg0_23 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg0_not0001,
      D => registerInValue_23_IBUF_286,
      Q => reg0(23)
    );
  reg1_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_0_IBUF_271,
      Q => reg1(0)
    );
  reg1_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_1_IBUF_282,
      Q => reg1(1)
    );
  reg1_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_2_IBUF_287,
      Q => reg1(2)
    );
  reg1_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_3_IBUF_288,
      Q => reg1(3)
    );
  reg1_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_4_IBUF_289,
      Q => reg1(4)
    );
  reg1_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_5_IBUF_290,
      Q => reg1(5)
    );
  reg1_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_6_IBUF_291,
      Q => reg1(6)
    );
  reg1_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_7_IBUF_292,
      Q => reg1(7)
    );
  reg1_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_8_IBUF_293,
      Q => reg1(8)
    );
  reg1_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_9_IBUF_294,
      Q => reg1(9)
    );
  reg1_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_10_IBUF_272,
      Q => reg1(10)
    );
  reg1_11 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_11_IBUF_273,
      Q => reg1(11)
    );
  reg1_12 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_12_IBUF_274,
      Q => reg1(12)
    );
  reg1_13 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_13_IBUF_275,
      Q => reg1(13)
    );
  reg1_14 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_14_IBUF_276,
      Q => reg1(14)
    );
  reg1_15 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_15_IBUF_277,
      Q => reg1(15)
    );
  reg1_16 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_16_IBUF_278,
      Q => reg1(16)
    );
  reg1_17 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_17_IBUF_279,
      Q => reg1(17)
    );
  reg1_18 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_18_IBUF_280,
      Q => reg1(18)
    );
  reg1_19 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_19_IBUF_281,
      Q => reg1(19)
    );
  reg1_20 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_20_IBUF_283,
      Q => reg1(20)
    );
  reg1_21 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_21_IBUF_284,
      Q => reg1(21)
    );
  reg1_22 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_22_IBUF_285,
      Q => reg1(22)
    );
  reg1_23 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg1_not0001,
      D => registerInValue_23_IBUF_286,
      Q => reg1(23)
    );
  reg2_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_0_IBUF_271,
      Q => reg2(0)
    );
  reg2_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_1_IBUF_282,
      Q => reg2(1)
    );
  reg2_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_2_IBUF_287,
      Q => reg2(2)
    );
  reg2_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_3_IBUF_288,
      Q => reg2(3)
    );
  reg2_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_4_IBUF_289,
      Q => reg2(4)
    );
  reg2_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_5_IBUF_290,
      Q => reg2(5)
    );
  reg2_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_6_IBUF_291,
      Q => reg2(6)
    );
  reg2_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_7_IBUF_292,
      Q => reg2(7)
    );
  reg2_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_8_IBUF_293,
      Q => reg2(8)
    );
  reg2_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_9_IBUF_294,
      Q => reg2(9)
    );
  reg2_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_10_IBUF_272,
      Q => reg2(10)
    );
  reg2_11 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_11_IBUF_273,
      Q => reg2(11)
    );
  reg2_12 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_12_IBUF_274,
      Q => reg2(12)
    );
  reg2_13 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_13_IBUF_275,
      Q => reg2(13)
    );
  reg2_14 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_14_IBUF_276,
      Q => reg2(14)
    );
  reg2_15 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_15_IBUF_277,
      Q => reg2(15)
    );
  reg2_16 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_16_IBUF_278,
      Q => reg2(16)
    );
  reg2_17 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_17_IBUF_279,
      Q => reg2(17)
    );
  reg2_18 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_18_IBUF_280,
      Q => reg2(18)
    );
  reg2_19 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_19_IBUF_281,
      Q => reg2(19)
    );
  reg2_20 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_20_IBUF_283,
      Q => reg2(20)
    );
  reg2_21 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_21_IBUF_284,
      Q => reg2(21)
    );
  reg2_22 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_22_IBUF_285,
      Q => reg2(22)
    );
  reg2_23 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg2_not0001,
      D => registerInValue_23_IBUF_286,
      Q => reg2(23)
    );
  reg3_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg3_not0001,
      D => registerInValue_0_IBUF_271,
      Q => reg3(0)
    );
  reg3_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => reg3_not0001,
      D => registerInValue_1_IBUF_282,
      Q => reg3(1)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_0 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(0),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(0)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_1 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(1),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(1)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_2 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(2),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(2)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_3 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(3),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(3)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_4 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(4),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(4)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_5 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(5),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(5)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_6 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(6),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(6)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_7 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(7),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(7)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_8 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(8),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(8)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_9 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(9),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(9)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_10 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(10),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(10)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_11 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(11),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(11)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_12 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(12),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(12)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_13 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(13),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(13)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_14 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(14),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(14)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_15 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(15),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(15)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_16 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(16),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(16)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_17 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(17),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(17)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_18 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(18),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(18)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_19 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(19),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(19)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_20 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(20),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(20)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_21 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(21),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(21)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_22 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(22),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(22)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_23 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1,
      D => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(23),
      R => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      Q => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(23)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(0),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(1),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(2),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(3),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(4),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(5),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(6),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(7),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(8),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(8)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(9),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(9)
    );
  sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000,
      D => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(10),
      Q => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(10)
    );
  sobel_wrapper_inst_sobel_inst_countY_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(0),
      Q => sobel_wrapper_inst_sobel_inst_countY(0)
    );
  sobel_wrapper_inst_sobel_inst_countY_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(1),
      Q => sobel_wrapper_inst_sobel_inst_countY(1)
    );
  sobel_wrapper_inst_sobel_inst_countY_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(2),
      Q => sobel_wrapper_inst_sobel_inst_countY(2)
    );
  sobel_wrapper_inst_sobel_inst_countY_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(3),
      Q => sobel_wrapper_inst_sobel_inst_countY(3)
    );
  sobel_wrapper_inst_sobel_inst_countY_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(4),
      Q => sobel_wrapper_inst_sobel_inst_countY(4)
    );
  sobel_wrapper_inst_sobel_inst_countY_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(5),
      Q => sobel_wrapper_inst_sobel_inst_countY(5)
    );
  sobel_wrapper_inst_sobel_inst_countY_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(6),
      Q => sobel_wrapper_inst_sobel_inst_countY(6)
    );
  sobel_wrapper_inst_sobel_inst_countY_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(7),
      Q => sobel_wrapper_inst_sobel_inst_countY(7)
    );
  sobel_wrapper_inst_sobel_inst_countY_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(8),
      Q => sobel_wrapper_inst_sobel_inst_countY(8)
    );
  sobel_wrapper_inst_sobel_inst_countY_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(9),
      Q => sobel_wrapper_inst_sobel_inst_countY(9)
    );
  sobel_wrapper_inst_sobel_inst_countY_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(10),
      Q => sobel_wrapper_inst_sobel_inst_countY(10)
    );
  sobel_wrapper_inst_sobel_inst_countY_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(11),
      Q => sobel_wrapper_inst_sobel_inst_countY(11)
    );
  sobel_wrapper_inst_sobel_inst_countY_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(12),
      Q => sobel_wrapper_inst_sobel_inst_countY(12)
    );
  sobel_wrapper_inst_sobel_inst_countY_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(13),
      Q => sobel_wrapper_inst_sobel_inst_countY(13)
    );
  sobel_wrapper_inst_sobel_inst_countY_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(14),
      Q => sobel_wrapper_inst_sobel_inst_countY(14)
    );
  sobel_wrapper_inst_sobel_inst_countY_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(15),
      Q => sobel_wrapper_inst_sobel_inst_countY(15)
    );
  sobel_wrapper_inst_sobel_inst_countY_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(16),
      Q => sobel_wrapper_inst_sobel_inst_countY(16)
    );
  sobel_wrapper_inst_sobel_inst_countY_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(17),
      Q => sobel_wrapper_inst_sobel_inst_countY(17)
    );
  sobel_wrapper_inst_sobel_inst_countY_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(18),
      Q => sobel_wrapper_inst_sobel_inst_countY(18)
    );
  sobel_wrapper_inst_sobel_inst_countY_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(19),
      Q => sobel_wrapper_inst_sobel_inst_countY(19)
    );
  sobel_wrapper_inst_sobel_inst_countY_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(20),
      Q => sobel_wrapper_inst_sobel_inst_countY(20)
    );
  sobel_wrapper_inst_sobel_inst_countY_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(21),
      Q => sobel_wrapper_inst_sobel_inst_countY(21)
    );
  sobel_wrapper_inst_sobel_inst_countY_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(22),
      Q => sobel_wrapper_inst_sobel_inst_countY(22)
    );
  sobel_wrapper_inst_sobel_inst_countY_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_countY_and0000,
      D => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(23),
      Q => sobel_wrapper_inst_sobel_inst_countY(23)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(0),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(1),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(2),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(3),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(4),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(5),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(6),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_24_reg_1104_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(7),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_40_reg_1069_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      D => sobel_wrapper_inst_sobel_inst_tmp_40_fu_812_p2(0),
      Q => sobel_wrapper_inst_sobel_inst_tmp_40_reg_1069(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_40_reg_1069_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      D => sobel_wrapper_inst_sobel_inst_tmp_40_fu_812_p2(1),
      Q => sobel_wrapper_inst_sobel_inst_tmp_40_reg_1069(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(16),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(17),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(18),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(19),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(20),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(21),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(22),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_51_reg_1094_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(23),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(8),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(9),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(10),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(11),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(12),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(13),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(14),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_52_reg_1099_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_pixelLine_q0(15),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_11_reg_270_0 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd6_1192,
      D => sobel_wrapper_inst_sobel_inst_tmp_40_reg_1069(0),
      R => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_In2,
      Q => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_11_reg_270_1 : FDRE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd6_1192,
      D => sobel_wrapper_inst_sobel_inst_tmp_40_reg_1069(1),
      R => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_In2,
      Q => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1)
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_load_reg_1114_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0(0),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0)
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_load_reg_1114_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_q0(1),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1)
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_load_reg_1114_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_q0(2),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2)
    );
  sobel_wrapper_inst_sobel_inst_filterYConstants_load_reg_1109_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0(1),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1)
    );
  sobel_wrapper_inst_sobel_inst_filterYConstants_load_reg_1109_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      D => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0(2),
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1446,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1454,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1453,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1452,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1451,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1450,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1449,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1448,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1447,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(8)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1445,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(9)
    );
  sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1444,
      Q => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1529,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1537,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1536,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1535,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1534,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1533,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1532,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1531,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1530,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(8)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1528,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(9)
    );
  sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1527,
      Q => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1766,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1765,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1764,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1763,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1762,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1761,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1760,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1759,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(8)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1758,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(9)
    );
  sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1757,
      Q => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1609,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1617,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1616,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1615,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1614,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1613,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1612,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1611,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1610,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(8)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1608,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(9)
    );
  sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1607,
      Q => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1696,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1695,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1694,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1693,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1692,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1691,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1690,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1689,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(8)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1688,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(9)
    );
  sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1687,
      Q => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1834,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(1)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1833,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(2)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1832,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(3)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1831,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(4)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1830,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(5)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1829,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(6)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1828,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(7)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1827,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(8)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1826,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(9)
    );
  sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1825,
      Q => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10)
    );
  sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      D => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex0000,
      Q => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0(0)
    );
  sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      D => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex00001,
      Q => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0(1)
    );
  sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      D => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex00002,
      Q => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_q0(2)
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_q0_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      D => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex00001,
      Q => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_q0(1)
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_q0_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      D => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex00002,
      Q => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_q0(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(0),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(0)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(1),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(1)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(2),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(3),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(3)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(4),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(4)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(5),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(5)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(6),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(6)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(7),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(7)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(8),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(8)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(9),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(9)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(10),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(10)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(11),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(11)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(12),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(12)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(13),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(13)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(14),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(14)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(15),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(15)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(16),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(16)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(17),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(17)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(18),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(18)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(19),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(19)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(20),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(20)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(21),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(21)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(22),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(22)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXG_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result(23),
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXG(23)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_0_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(0)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_1_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(1)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_2_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_3_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(3)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_4_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(4)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_5_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(5)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_6_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(6)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_7_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(7)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_8_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(8)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_9_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(9)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_10_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(10)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_11_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(11)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_12_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(12)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_13_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(13)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_14_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(14)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_15_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(15)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_16_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(16)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_17_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(17)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_18_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(18)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_19_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(19)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_20_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(20)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_21_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(21)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_22_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(22)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_23_1,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXB(23)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_0_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(0)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_1_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(1)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_2_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_3_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(3)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_4_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(4)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_5_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(5)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_6_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(6)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_7_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(7)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_8_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(8)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_9_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(9)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_10_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(10)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_11_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(11)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_12_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(12)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_13_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(13)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_14_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(14)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_15_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(15)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_16_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(16)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_17_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(17)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_18_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(18)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_19_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(19)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_20_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(20)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_21_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(21)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_22_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(22)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXR_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_23_2,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutXR(23)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_0_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(0)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_1_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(1)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_2_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_3_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(3)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_4_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(4)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_5_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(5)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_6_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(6)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_7_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(7)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_8_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(8)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_9_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(9)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_10_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(10)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_11_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(11)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_12_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(12)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_13_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(13)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_14_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(14)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_15_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(15)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_16_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(16)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_17_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(17)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_18_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(18)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_19_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(19)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_20_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(20)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_21_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(21)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_22_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(22)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYB_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_23_3,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYB(23)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_0_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(0)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_1_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(1)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_2_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_3_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(3)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_4_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(4)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_5_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(5)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_6_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(6)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_7_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(7)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_8_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(8)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_9_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(9)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_10_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(10)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_11_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(11)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_12_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(12)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_13_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(13)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_14_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(14)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_15_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(15)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_16_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(16)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_17_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(17)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_18_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(18)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_19_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(19)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_20_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(20)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_21_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(21)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_22_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(22)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYG_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_23_4,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYG(23)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_0_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(0)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_1_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(1)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_2_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_3_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(3)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_4_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(4)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_5_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(5)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_6_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(6)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_7_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(7)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_8_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(8)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_9_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(9)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_10_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(10)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_11_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(11)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_12_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(12)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_13_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(13)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_14_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(14)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_15_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(15)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_16_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(16)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_17_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(17)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_18_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(18)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_19_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(19)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_20_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(20)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_21_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(21)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_22_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(22)
    );
  sobel_wrapper_inst_sobel_inst_pixelOutYR_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001,
      D => sobel_wrapper_inst_sobel_inst_Result_23_5,
      Q => sobel_wrapper_inst_sobel_inst_pixelOutYR(23)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1446
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1454
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1453
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1452
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1451
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1450
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1449
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1448
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1447
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1445
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1444
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1529
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1537
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1536
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1535
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1534
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1533
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1532
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1531
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1530
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1528
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1527
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_10_1609
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1617
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1616
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1615
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1614
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1613
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1612
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1611
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1610
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1608
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1607
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1696
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1695
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1694
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1693
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1692
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1691
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1690
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1689
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1688
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1687
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1766
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1765
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1764
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1763
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1762
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1761
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1760
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1759
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1758
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1757
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_9_1834
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_8_1833
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_7_1832
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_6_1831
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_5_1830
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_4_1829
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_3_1828
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_2_1827
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_1_1826
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102,
      Q => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_0_1825
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => N1,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_lut(0),
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(0)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(0),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_1_rt_997,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_1_rt_997,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(1)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(1),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_2_rt_1005,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_2_rt_1005,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(2)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(2),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_3_rt_1007,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_3_rt_1007,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(3)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(3),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_4_rt_1009,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_4_rt_1009,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(4)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(4),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_5_rt_1011,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_5_rt_1011,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(5)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(5),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_6_rt_1013,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_6_rt_1013,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(6)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_7_rt_1015,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_7_rt_1015,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(7)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(7),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_8_rt_1017,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_8_rt_1017,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(8)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(8),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_9_rt_1019,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_9_rt_1019,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(9)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_10_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(9),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_10_rt_977,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(10)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_10_rt_977,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(10)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_11_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(10),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_11_rt_979,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(11)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_11_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(10),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_11_rt_979,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(11)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_12_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(11),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_12_rt_981,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(12)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_12_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(11),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_12_rt_981,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(12)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_13_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(12),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_13_rt_983,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(13)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_13_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(12),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_13_rt_983,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(13)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_14_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(13),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_14_rt_985,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(14)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_14_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(13),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_14_rt_985,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(14)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_15_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(14),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_15_rt_987,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(15)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_15_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(14),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_15_rt_987,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(15)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_16_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(15),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_16_rt_989,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(16)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_16_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(15),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_16_rt_989,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(16)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_17_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(16),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_17_rt_991,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(17)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_17_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(16),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_17_rt_991,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(17)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_18_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(17),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_18_rt_993,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(18)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_18_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(17),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_18_rt_993,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(18)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_19_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(18),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_19_rt_995,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(19)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_19_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(18),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_19_rt_995,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(19)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_20_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(19),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_20_rt_999,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(20)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_20_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(19),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_20_rt_999,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(20)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_21_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(20),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_21_rt_1001,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(21)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_21_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(20),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_21_rt_1001,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(21)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_22_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(21),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_22_rt_1003,
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(22)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_22_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(21),
      LI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_22_rt_1003,
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(22)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_xor_23_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy(22),
      LI => sobel_wrapper_inst_sobel_inst_countY(23),
      O => sobel_wrapper_inst_sobel_inst_tmp_41_fu_900_p2(23)
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(4),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(3),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(2),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi_1031
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut_0_Q : LUT5
    generic map(
      INIT => X"00000008"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(0),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(1),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(2),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(3),
      I4 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(4),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(0)
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi_1031,
      S => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_0_Q_1022
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi1 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(9),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(8),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(7),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(6),
      I4 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(5),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi1_1032
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut_1_Q : LUT5
    generic map(
      INIT => X"00000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(5),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(6),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(7),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(8),
      I4 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(9),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_0_Q_1022,
      DI => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi1_1032,
      S => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_1_Q_1023
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi2 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(14),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(13),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(12),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(11),
      I4 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(10),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi2_1033
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut_2_Q : LUT5
    generic map(
      INIT => X"00000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(10),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(11),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(12),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(13),
      I4 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(14),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_1_Q_1023,
      DI => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi2_1033,
      S => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_2_Q_1024
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi3 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(19),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(18),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(17),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(16),
      I4 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(15),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi3_1034
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut_3_Q : LUT5
    generic map(
      INIT => X"00000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(15),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(16),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(17),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(18),
      I4 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(19),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi4 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(23),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(22),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(21),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(20),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi4_1035
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut_4_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(20),
      I1 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(21),
      I2 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(22),
      I3 => sobel_wrapper_inst_sobel_inst_storemerge_reg_258(23),
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_Eqn_0_mand1_533,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Result(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(0),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_1_mand1_599,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Result(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_2_mand1_623,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Result(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_3_mand1_629,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Result(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_4_mand1_635,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Result(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_5_mand1_641,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Result(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_6_mand1_647,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Result(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_7_mand1_653,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Result(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_8_mand1_659,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Result(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_9_mand1_665,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Result(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_10_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(9),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_10_mand1_539,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Result(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_11_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(10),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_11_mand1_550,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_11_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(10),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Result(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_12_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(11),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_12_mand1_556,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_12_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(11),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Result(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_13_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(12),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_13_mand1_562,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_13_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(12),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Result(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_14_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(13),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_14_mand1_568,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_14_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(13),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Result(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_15_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(14),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_15_mand1_574,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_15_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(14),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Result(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_16_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(15),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_16_mand1_580,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_16_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(15),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Result(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_17_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(16),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_17_mand1_586,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_17_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(16),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Result(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_18_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(17),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_18_mand1_592,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_18_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(17),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Result(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_19_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(18),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_19_mand1_598,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_19_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(18),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Result(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_20_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(19),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_20_mand1_605,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_20_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(19),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Result(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_21_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(20),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_21_mand1_611,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_21_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(20),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Result(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy_22_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(21),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_22_mand1_617,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_22_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(21),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Result(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_xor_23_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_cy(22),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(23),
      O => sobel_wrapper_inst_sobel_inst_Result(23)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_Eqn_01_mand1_528,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Result_0_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(0),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_110_mand1_540,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Result_1_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_24_mand1_618,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Result_2_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_31_mand1_624,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Result_3_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_41_mand1_630,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Result_4_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_51_mand1_636,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Result_5_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_61_mand1_642,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Result_6_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_71_mand1_648,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Result_7_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_81_mand1_654,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Result_8_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_91_mand1_660,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Result_9_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_10_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(9),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_101_mand1_534,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Result_10_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_11_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(10),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_111_mand1_541,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_11_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(10),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Result_11_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_12_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(11),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_121_mand1_551,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_12_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(11),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Result_12_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_13_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(12),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_131_mand1_557,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_13_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(12),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Result_13_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_14_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(13),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_141_mand1_563,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_14_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(13),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Result_14_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_15_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(14),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_151_mand1_569,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_15_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(14),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Result_15_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_16_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(15),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_161_mand1_575,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_16_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(15),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Result_16_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_17_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(16),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_171_mand1_581,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_17_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(16),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Result_17_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_18_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(17),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_181_mand1_587,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_18_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(17),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Result_18_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_19_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(18),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_191_mand1_593,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_19_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(18),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Result_19_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_20_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(19),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_201_mand1_600,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_20_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(19),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Result_20_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_21_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(20),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_211_mand1_606,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_21_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(20),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Result_21_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy_22_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(21),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_221_mand1_612,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_22_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(21),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Result_22_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_xor_23_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_cy(22),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(23),
      O => sobel_wrapper_inst_sobel_inst_Result_23_1
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_Eqn_02_mand1_529,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Result_0_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(0),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_112_mand1_542,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Result_1_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_25_mand1_619,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Result_2_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_32_mand1_625,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Result_3_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_42_mand1_631,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Result_4_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_52_mand1_637,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Result_5_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_62_mand1_643,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Result_6_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_72_mand1_649,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Result_7_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_82_mand1_655,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Result_8_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_92_mand1_661,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Result_9_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_10_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(9),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_102_mand1_535,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Result_10_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_11_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(10),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_113_mand1_543,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_11_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(10),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Result_11_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_12_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(11),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_122_mand1_552,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_12_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(11),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Result_12_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_13_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(12),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_132_mand1_558,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_13_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(12),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Result_13_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_14_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(13),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_142_mand1_564,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_14_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(13),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Result_14_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_15_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(14),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_152_mand1_570,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_15_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(14),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Result_15_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_16_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(15),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_162_mand1_576,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_16_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(15),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Result_16_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_17_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(16),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_172_mand1_582,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_17_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(16),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Result_17_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_18_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(17),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_182_mand1_588,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_18_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(17),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Result_18_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_19_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(18),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_192_mand1_594,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_19_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(18),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Result_19_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_20_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(19),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_202_mand1_601,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_20_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(19),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Result_20_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_21_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(20),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_212_mand1_607,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_21_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(20),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Result_21_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy_22_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(21),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_222_mand1_613,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_22_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(21),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Result_22_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_xor_23_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_cy(22),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(23),
      O => sobel_wrapper_inst_sobel_inst_Result_23_2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_Eqn_05_mand1_532,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Result_0_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(0),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_118_mand1_548,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Result_1_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_28_mand1_622,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Result_2_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_35_mand1_628,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Result_3_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_45_mand1_634,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Result_4_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_55_mand1_640,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Result_5_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_65_mand1_646,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Result_6_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_75_mand1_652,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Result_7_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_85_mand1_658,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Result_8_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_95_mand1_664,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Result_9_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_10_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(9),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_105_mand1_538,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Result_10_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_11_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(10),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_119_mand1_549,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_11_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(10),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Result_11_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_12_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(11),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_125_mand1_555,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_12_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(11),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Result_12_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_13_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(12),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_135_mand1_561,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_13_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(12),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Result_13_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_14_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(13),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_145_mand1_567,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_14_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(13),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Result_14_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_15_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(14),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_155_mand1_573,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_15_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(14),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Result_15_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_16_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(15),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_165_mand1_579,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_16_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(15),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Result_16_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_17_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(16),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_175_mand1_585,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_17_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(16),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Result_17_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_18_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(17),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_185_mand1_591,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_18_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(17),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Result_18_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_19_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(18),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_195_mand1_597,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_19_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(18),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Result_19_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_20_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(19),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_205_mand1_604,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_20_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(19),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Result_20_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_21_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(20),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_215_mand1_610,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_21_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(20),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Result_21_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy_22_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(21),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_225_mand1_616,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_22_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(21),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Result_22_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_xor_23_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_cy(22),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(23),
      O => sobel_wrapper_inst_sobel_inst_Result_23_5
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_Eqn_03_mand1_530,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Result_0_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(0),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_114_mand1_544,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Result_1_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_26_mand1_620,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Result_2_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_33_mand1_626,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Result_3_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_43_mand1_632,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Result_4_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_53_mand1_638,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Result_5_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_63_mand1_644,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Result_6_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_73_mand1_650,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Result_7_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_83_mand1_656,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Result_8_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_93_mand1_662,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Result_9_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_10_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(9),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_103_mand1_536,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Result_10_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_11_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(10),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_115_mand1_545,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_11_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(10),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Result_11_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_12_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(11),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_123_mand1_553,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_12_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(11),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Result_12_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_13_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(12),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_133_mand1_559,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_13_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(12),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Result_13_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_14_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(13),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_143_mand1_565,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_14_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(13),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Result_14_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_15_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(14),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_153_mand1_571,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_15_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(14),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Result_15_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_16_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(15),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_163_mand1_577,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_16_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(15),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Result_16_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_17_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(16),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_173_mand1_583,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_17_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(16),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Result_17_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_18_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(17),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_183_mand1_589,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_18_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(17),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Result_18_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_19_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(18),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_193_mand1_595,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_19_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(18),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Result_19_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_20_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(19),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_203_mand1_602,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_20_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(19),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Result_20_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_21_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(20),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_213_mand1_608,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_21_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(20),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Result_21_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy_22_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(21),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_223_mand1_614,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_22_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(21),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Result_22_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_xor_23_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_cy(22),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(23),
      O => sobel_wrapper_inst_sobel_inst_Result_23_3
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_Eqn_04_mand1_531,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(0),
      O => sobel_wrapper_inst_sobel_inst_Result_0_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(0),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_116_mand1_546,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(1),
      O => sobel_wrapper_inst_sobel_inst_Result_1_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_27_mand1_621,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(2),
      O => sobel_wrapper_inst_sobel_inst_Result_2_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_34_mand1_627,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(3),
      O => sobel_wrapper_inst_sobel_inst_Result_3_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_44_mand1_633,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(4),
      O => sobel_wrapper_inst_sobel_inst_Result_4_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_54_mand1_639,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(5),
      O => sobel_wrapper_inst_sobel_inst_Result_5_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_64_mand1_645,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(6),
      O => sobel_wrapper_inst_sobel_inst_Result_6_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_74_mand1_651,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(7),
      O => sobel_wrapper_inst_sobel_inst_Result_7_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_84_mand1_657,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(8),
      O => sobel_wrapper_inst_sobel_inst_Result_8_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_94_mand1_663,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(9),
      O => sobel_wrapper_inst_sobel_inst_Result_9_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_10_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(9),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_104_mand1_537,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(10),
      O => sobel_wrapper_inst_sobel_inst_Result_10_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_11_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(10),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_117_mand1_547,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_11_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(10),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(11),
      O => sobel_wrapper_inst_sobel_inst_Result_11_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_12_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(11),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_124_mand1_554,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_12_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(11),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(12),
      O => sobel_wrapper_inst_sobel_inst_Result_12_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_13_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(12),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_134_mand1_560,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_13_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(12),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(13),
      O => sobel_wrapper_inst_sobel_inst_Result_13_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_14_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(13),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_144_mand1_566,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_14_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(13),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(14),
      O => sobel_wrapper_inst_sobel_inst_Result_14_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_15_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(14),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_154_mand1_572,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_15_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(14),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(15),
      O => sobel_wrapper_inst_sobel_inst_Result_15_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_16_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(15),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_164_mand1_578,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_16_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(15),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(16),
      O => sobel_wrapper_inst_sobel_inst_Result_16_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_17_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(16),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_174_mand1_584,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_17_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(16),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(17),
      O => sobel_wrapper_inst_sobel_inst_Result_17_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_18_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(17),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_184_mand1_590,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_18_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(17),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(18),
      O => sobel_wrapper_inst_sobel_inst_Result_18_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_19_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(18),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_194_mand1_596,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_19_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(18),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(19),
      O => sobel_wrapper_inst_sobel_inst_Result_19_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_20_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(19),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_204_mand1_603,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_20_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(19),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(20),
      O => sobel_wrapper_inst_sobel_inst_Result_20_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_21_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(20),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_214_mand1_609,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_21_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(20),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(21),
      O => sobel_wrapper_inst_sobel_inst_Result_21_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy_22_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(21),
      DI => sobel_wrapper_inst_sobel_inst_Eqn_224_mand1_615,
      S => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_22_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(21),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(22),
      O => sobel_wrapper_inst_sobel_inst_Result_22_4
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_xor_23_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_cy(22),
      LI => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(23),
      O => sobel_wrapper_inst_sobel_inst_Result_23_4
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_2_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_2_Q : MUXCY
    port map (
      CI => N1,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1510,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_2_Q : XORCY
    port map (
      CI => N1,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_3_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1511,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_4_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1512,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_5_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1513,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_6_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1514,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1508,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1508,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      DI => N0,
      S => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_2_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_2_Q : MUXCY
    port map (
      CI => N1,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1593,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_2_Q : XORCY
    port map (
      CI => N1,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_3_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1594,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_4_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1595,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_5_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1596,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_6_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1597,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1591,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1591,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      DI => N0,
      S => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_2_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_2_Q : MUXCY
    port map (
      CI => N1,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1673,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_2_Q : XORCY
    port map (
      CI => N1,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_3_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1674,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_4_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1675,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_5_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1676,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_6_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1677,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1671,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1671,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      DI => N0,
      S => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_2_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_2_Q : MUXCY
    port map (
      CI => N1,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1749,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_2_Q : XORCY
    port map (
      CI => N1,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_3_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1750,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_4_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1751,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_5_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1752,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_6_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1753,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      DI => N0,
      S => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_2_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_2_Q : MUXCY
    port map (
      CI => N1,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1819,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_2_Q : XORCY
    port map (
      CI => N1,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_3_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1820,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_4_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1821,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_5_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1822,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_6_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1823,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      DI => N0,
      S => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_2_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_2_Q : MUXCY
    port map (
      CI => N1,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1887,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_2_Q : XORCY
    port map (
      CI => N1,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_3_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1888,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_4_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1889,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_5_Q : LUT4
    generic map(
      INIT => X"953F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1890,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut_6_Q : LUT4
    generic map(
      INIT => X"935F"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1891,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      DI => N0,
      S => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(8),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd1_cy(9),
      LI => N1,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_0_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_0_Q_969
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_0_Q_969,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(0)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_0_Q_969,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(0)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_1_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(0),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2R,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_1_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(0),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2R,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(1)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_2_Q_971,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_2_Q_971,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(2)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(2),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_3_rt_959,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_3_rt_959,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(3)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(3),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_4_rt_961,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_4_rt_961,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(4)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(4),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_5_rt_963,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_5_rt_963,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(5)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(5),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_6_rt_965,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_6_rt_965,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(6)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_7_Q : LUT4
    generic map(
      INIT => X"963C"
    )
    port map (
      I0 => N0,
      I1 => sobel_wrapper_inst_sobel_inst_countY(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(7),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(6),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_7_Q_972
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(6),
      DI => N0,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_7_Q_972,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_7_Q_972,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(7)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_8_Q : LUT4
    generic map(
      INIT => X"963C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(7),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(8),
      I2 => sobel_wrapper_inst_sobel_inst_countY(1),
      I3 => sobel_wrapper_inst_sobel_inst_countY(0),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_8_Q_973
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C6_mand1_952,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_8_Q_973,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_8_Q_973,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(8)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C7_mand1_953,
      S => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_9_Q_974,
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_9_Q_974,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(9)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_10_Q_970,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(10)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_1_Q : LUT4
    generic map(
      INIT => X"6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_1_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1509,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_1_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_1_Q : LUT4
    generic map(
      INIT => X"6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_1_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1592,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_1_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_1_Q : LUT4
    generic map(
      INIT => X"6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_1_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1672,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_1_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_1_Q : LUT4
    generic map(
      INIT => X"6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_1_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1748,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_1_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_1_Q : LUT4
    generic map(
      INIT => X"6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_1_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1818,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_1_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_1_Q : LUT4
    generic map(
      INIT => X"6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_1_Q : MUXCY
    port map (
      CI => N0,
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1886,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_1_Q : XORCY
    port map (
      CI => N0,
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_12
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_2_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_2_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(1),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_22
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_3_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_3_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(2),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_32
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_4_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_4_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(3),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_42
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_5_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_5_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(4),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_52
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_6_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_6_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(5),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_62
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_7_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_7_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(6),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_72
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_8_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_8_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(7),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_82
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy_9_Q : MUXCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      DI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      S => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_9_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(8),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_92
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_xor_10_Q : XORCY
    port map (
      CI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_cy(9),
      LI => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_102
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      Q => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191,
      Q => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd6_1192
    );
  sobel_wrapper_inst_filteredPixelY_23 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(23),
      Q => sobel_wrapper_inst_filteredPixelY(23)
    );
  sobel_wrapper_inst_filteredPixelY_22 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(22),
      Q => sobel_wrapper_inst_filteredPixelY(22)
    );
  sobel_wrapper_inst_filteredPixelY_21 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(21),
      Q => sobel_wrapper_inst_filteredPixelY(21)
    );
  sobel_wrapper_inst_filteredPixelY_20 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(20),
      Q => sobel_wrapper_inst_filteredPixelY(20)
    );
  sobel_wrapper_inst_filteredPixelY_19 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(19),
      Q => sobel_wrapper_inst_filteredPixelY(19)
    );
  sobel_wrapper_inst_filteredPixelY_18 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(18),
      Q => sobel_wrapper_inst_filteredPixelY(18)
    );
  sobel_wrapper_inst_filteredPixelY_17 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(17),
      Q => sobel_wrapper_inst_filteredPixelY(17)
    );
  sobel_wrapper_inst_filteredPixelY_16 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(16),
      Q => sobel_wrapper_inst_filteredPixelY(16)
    );
  sobel_wrapper_inst_filteredPixelY_15 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(15),
      Q => sobel_wrapper_inst_filteredPixelY(15)
    );
  sobel_wrapper_inst_filteredPixelY_14 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(14),
      Q => sobel_wrapper_inst_filteredPixelY(14)
    );
  sobel_wrapper_inst_filteredPixelY_13 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(13),
      Q => sobel_wrapper_inst_filteredPixelY(13)
    );
  sobel_wrapper_inst_filteredPixelY_12 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(12),
      Q => sobel_wrapper_inst_filteredPixelY(12)
    );
  sobel_wrapper_inst_filteredPixelY_11 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(11),
      Q => sobel_wrapper_inst_filteredPixelY(11)
    );
  sobel_wrapper_inst_filteredPixelY_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(10),
      Q => sobel_wrapper_inst_filteredPixelY(10)
    );
  sobel_wrapper_inst_filteredPixelY_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(9),
      Q => sobel_wrapper_inst_filteredPixelY(9)
    );
  sobel_wrapper_inst_filteredPixelY_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(8),
      Q => sobel_wrapper_inst_filteredPixelY(8)
    );
  sobel_wrapper_inst_filteredPixelY_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(7),
      Q => sobel_wrapper_inst_filteredPixelY(7)
    );
  sobel_wrapper_inst_filteredPixelY_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(6),
      Q => sobel_wrapper_inst_filteredPixelY(6)
    );
  sobel_wrapper_inst_filteredPixelY_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(5),
      Q => sobel_wrapper_inst_filteredPixelY(5)
    );
  sobel_wrapper_inst_filteredPixelY_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(4),
      Q => sobel_wrapper_inst_filteredPixelY(4)
    );
  sobel_wrapper_inst_filteredPixelY_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(3),
      Q => sobel_wrapper_inst_filteredPixelY(3)
    );
  sobel_wrapper_inst_filteredPixelY_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(2),
      Q => sobel_wrapper_inst_filteredPixelY(2)
    );
  sobel_wrapper_inst_filteredPixelY_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(1),
      Q => sobel_wrapper_inst_filteredPixelY(1)
    );
  sobel_wrapper_inst_filteredPixelY_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelY_Sig(0),
      Q => sobel_wrapper_inst_filteredPixelY(0)
    );
  sobel_wrapper_inst_filteredPixelX_23 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(23),
      Q => sobel_wrapper_inst_filteredPixelX(23)
    );
  sobel_wrapper_inst_filteredPixelX_22 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(22),
      Q => sobel_wrapper_inst_filteredPixelX(22)
    );
  sobel_wrapper_inst_filteredPixelX_21 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(21),
      Q => sobel_wrapper_inst_filteredPixelX(21)
    );
  sobel_wrapper_inst_filteredPixelX_20 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(20),
      Q => sobel_wrapper_inst_filteredPixelX(20)
    );
  sobel_wrapper_inst_filteredPixelX_19 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(19),
      Q => sobel_wrapper_inst_filteredPixelX(19)
    );
  sobel_wrapper_inst_filteredPixelX_18 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(18),
      Q => sobel_wrapper_inst_filteredPixelX(18)
    );
  sobel_wrapper_inst_filteredPixelX_17 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(17),
      Q => sobel_wrapper_inst_filteredPixelX(17)
    );
  sobel_wrapper_inst_filteredPixelX_16 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(16),
      Q => sobel_wrapper_inst_filteredPixelX(16)
    );
  sobel_wrapper_inst_filteredPixelX_15 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(15),
      Q => sobel_wrapper_inst_filteredPixelX(15)
    );
  sobel_wrapper_inst_filteredPixelX_14 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(14),
      Q => sobel_wrapper_inst_filteredPixelX(14)
    );
  sobel_wrapper_inst_filteredPixelX_13 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(13),
      Q => sobel_wrapper_inst_filteredPixelX(13)
    );
  sobel_wrapper_inst_filteredPixelX_12 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(12),
      Q => sobel_wrapper_inst_filteredPixelX(12)
    );
  sobel_wrapper_inst_filteredPixelX_11 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(11),
      Q => sobel_wrapper_inst_filteredPixelX(11)
    );
  sobel_wrapper_inst_filteredPixelX_10 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(10),
      Q => sobel_wrapper_inst_filteredPixelX(10)
    );
  sobel_wrapper_inst_filteredPixelX_9 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(9),
      Q => sobel_wrapper_inst_filteredPixelX(9)
    );
  sobel_wrapper_inst_filteredPixelX_8 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(8),
      Q => sobel_wrapper_inst_filteredPixelX(8)
    );
  sobel_wrapper_inst_filteredPixelX_7 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(7),
      Q => sobel_wrapper_inst_filteredPixelX(7)
    );
  sobel_wrapper_inst_filteredPixelX_6 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(6),
      Q => sobel_wrapper_inst_filteredPixelX(6)
    );
  sobel_wrapper_inst_filteredPixelX_5 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(5),
      Q => sobel_wrapper_inst_filteredPixelX(5)
    );
  sobel_wrapper_inst_filteredPixelX_4 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(4),
      Q => sobel_wrapper_inst_filteredPixelX(4)
    );
  sobel_wrapper_inst_filteredPixelX_3 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(3),
      Q => sobel_wrapper_inst_filteredPixelX(3)
    );
  sobel_wrapper_inst_filteredPixelX_2 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(2),
      Q => sobel_wrapper_inst_filteredPixelX(2)
    );
  sobel_wrapper_inst_filteredPixelX_1 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(1),
      Q => sobel_wrapper_inst_filteredPixelX(1)
    );
  sobel_wrapper_inst_filteredPixelX_0 : FDE
    port map (
      C => clk_BUFGP_92,
      CE => sobel_wrapper_inst_filteredPixelX_and0000_453,
      D => sobel_wrapper_inst_filteredPixelX_Sig(0),
      Q => sobel_wrapper_inst_filteredPixelX(0)
    );
  sobel_wrapper_inst_mode_Sig_1 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg3(1),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_mode_Sig(1)
    );
  sobel_wrapper_inst_mode_Sig_0 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg3(0),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_mode_Sig(0)
    );
  sobel_wrapper_inst_pixel_Sig_23 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(23),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(23)
    );
  sobel_wrapper_inst_pixel_Sig_22 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(22),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(22)
    );
  sobel_wrapper_inst_pixel_Sig_21 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(21),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(21)
    );
  sobel_wrapper_inst_pixel_Sig_20 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(20),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(20)
    );
  sobel_wrapper_inst_pixel_Sig_19 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(19),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(19)
    );
  sobel_wrapper_inst_pixel_Sig_18 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(18),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(18)
    );
  sobel_wrapper_inst_pixel_Sig_17 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(17),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(17)
    );
  sobel_wrapper_inst_pixel_Sig_16 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(16),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(16)
    );
  sobel_wrapper_inst_pixel_Sig_15 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(15),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(15)
    );
  sobel_wrapper_inst_pixel_Sig_14 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(14),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(14)
    );
  sobel_wrapper_inst_pixel_Sig_13 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(13),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(13)
    );
  sobel_wrapper_inst_pixel_Sig_12 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(12),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(12)
    );
  sobel_wrapper_inst_pixel_Sig_11 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(11),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(11)
    );
  sobel_wrapper_inst_pixel_Sig_10 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(10),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(10)
    );
  sobel_wrapper_inst_pixel_Sig_9 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(9),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(9)
    );
  sobel_wrapper_inst_pixel_Sig_8 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(8),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(8)
    );
  sobel_wrapper_inst_pixel_Sig_7 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(7),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(7)
    );
  sobel_wrapper_inst_pixel_Sig_6 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(6),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(6)
    );
  sobel_wrapper_inst_pixel_Sig_5 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(5),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(5)
    );
  sobel_wrapper_inst_pixel_Sig_4 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(4),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(4)
    );
  sobel_wrapper_inst_pixel_Sig_3 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(3),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(3)
    );
  sobel_wrapper_inst_pixel_Sig_2 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(2),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(2)
    );
  sobel_wrapper_inst_pixel_Sig_1 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(1),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(1)
    );
  sobel_wrapper_inst_pixel_Sig_0 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg0(0),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_pixel_Sig(0)
    );
  sobel_wrapper_inst_y_Sig_3 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg2(3),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_y_Sig(3)
    );
  sobel_wrapper_inst_y_Sig_2 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg2(2),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_y_Sig(2)
    );
  sobel_wrapper_inst_y_Sig_1 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg2(1),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_y_Sig(1)
    );
  sobel_wrapper_inst_y_Sig_0 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg2(0),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_y_Sig(0)
    );
  sobel_wrapper_inst_x_Sig_10 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(10),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(10)
    );
  sobel_wrapper_inst_x_Sig_9 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(9),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(9)
    );
  sobel_wrapper_inst_x_Sig_8 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(8),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(8)
    );
  sobel_wrapper_inst_x_Sig_7 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(7),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(7)
    );
  sobel_wrapper_inst_x_Sig_6 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(6),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(6)
    );
  sobel_wrapper_inst_x_Sig_5 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(5),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(5)
    );
  sobel_wrapper_inst_x_Sig_4 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(4),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(4)
    );
  sobel_wrapper_inst_x_Sig_3 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(3),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(3)
    );
  sobel_wrapper_inst_x_Sig_2 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(2),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(2)
    );
  sobel_wrapper_inst_x_Sig_1 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(1),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(1)
    );
  sobel_wrapper_inst_x_Sig_0 : FDR
    port map (
      C => clk_BUFGP_92,
      D => reg1(0),
      R => sobel_wrapper_inst_x_Sig_not0001,
      Q => sobel_wrapper_inst_x_Sig(0)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_0_Q
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_1_11 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(1),
      I1 => sobel_wrapper_inst_x_Sig(0),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(1)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_40_fu_812_p2_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      O => sobel_wrapper_inst_sobel_inst_tmp_40_fu_812_p2(1)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_2_11 : LUT3
    generic map(
      INIT => X"C9"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(0),
      I1 => sobel_wrapper_inst_x_Sig(2),
      I2 => sobel_wrapper_inst_x_Sig(1),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(2)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_3_11 : LUT4
    generic map(
      INIT => X"CCC9"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(0),
      I1 => sobel_wrapper_inst_x_Sig(3),
      I2 => sobel_wrapper_inst_x_Sig(1),
      I3 => sobel_wrapper_inst_x_Sig(2),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(3)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_4_11 : LUT5
    generic map(
      INIT => X"CCCCCCC9"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(0),
      I1 => sobel_wrapper_inst_x_Sig(4),
      I2 => sobel_wrapper_inst_x_Sig(1),
      I3 => sobel_wrapper_inst_x_Sig(2),
      I4 => sobel_wrapper_inst_x_Sig(3),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(4)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_5_11 : LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCCCC9"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(0),
      I1 => sobel_wrapper_inst_x_Sig(5),
      I2 => sobel_wrapper_inst_x_Sig(1),
      I3 => sobel_wrapper_inst_x_Sig(2),
      I4 => sobel_wrapper_inst_x_Sig(3),
      I5 => sobel_wrapper_inst_x_Sig(4),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(5)
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex000011 : LUT6
    generic map(
      INIT => X"8018898818011191"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I3 => sobel_wrapper_inst_sobel_inst_countY(1),
      I4 => sobel_wrapper_inst_sobel_inst_countY(3),
      I5 => sobel_wrapper_inst_sobel_inst_countY(2),
      O => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex0000
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex0000221 : LUT6
    generic map(
      INIT => X"0008C3100C018030"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I3 => sobel_wrapper_inst_sobel_inst_countY(2),
      I4 => sobel_wrapper_inst_sobel_inst_countY(3),
      I5 => sobel_wrapper_inst_sobel_inst_countY(1),
      O => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex00002
    );
  sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex0000211 : LUT6
    generic map(
      INIT => X"0600A01806018050"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I2 => sobel_wrapper_inst_sobel_inst_countY(1),
      I3 => sobel_wrapper_inst_sobel_inst_countY(2),
      I4 => sobel_wrapper_inst_sobel_inst_countY(3),
      I5 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      O => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex00002
    );
  sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex000011 : LUT6
    generic map(
      INIT => X"005A4201A8201584"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I3 => sobel_wrapper_inst_sobel_inst_countY(1),
      I4 => sobel_wrapper_inst_sobel_inst_countY(2),
      I5 => sobel_wrapper_inst_sobel_inst_countY(3),
      O => sobel_wrapper_inst_sobel_inst_filterYConstants_U_sobel_filterYConstants_rom_U_Mrom_varindex00001
    );
  sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex0000121 : LUT6
    generic map(
      INIT => X"0028C7100C018072"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I3 => sobel_wrapper_inst_sobel_inst_countY(2),
      I4 => sobel_wrapper_inst_sobel_inst_countY(3),
      I5 => sobel_wrapper_inst_sobel_inst_countY(1),
      O => sobel_wrapper_inst_sobel_inst_filterXConstants_U_sobel_filterXConstants_rom_U_Mrom_varindex00001
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and00011 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      O => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_In1
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_6_11 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(6),
      I1 => sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy(5),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(6)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_7_11 : LUT3
    generic map(
      INIT => X"C9"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy(5),
      I1 => sobel_wrapper_inst_x_Sig(7),
      I2 => sobel_wrapper_inst_x_Sig(6),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(7)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_8_11 : LUT4
    generic map(
      INIT => X"CCC9"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy(5),
      I1 => sobel_wrapper_inst_x_Sig(8),
      I2 => sobel_wrapper_inst_x_Sig(6),
      I3 => sobel_wrapper_inst_x_Sig(7),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(8)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_9_11 : LUT5
    generic map(
      INIT => X"CCCCCCC9"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy(5),
      I1 => sobel_wrapper_inst_x_Sig(9),
      I2 => sobel_wrapper_inst_x_Sig(6),
      I3 => sobel_wrapper_inst_x_Sig(7),
      I4 => sobel_wrapper_inst_x_Sig(8),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(9)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy_5_11 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(1),
      I1 => sobel_wrapper_inst_x_Sig(0),
      I2 => sobel_wrapper_inst_x_Sig(2),
      I3 => sobel_wrapper_inst_x_Sig(3),
      I4 => sobel_wrapper_inst_x_Sig(4),
      I5 => sobel_wrapper_inst_x_Sig(5),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy(5)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_10_11 : LUT6
    generic map(
      INIT => X"CCCCCCCCCCCCCCC9"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_cy(5),
      I1 => sobel_wrapper_inst_x_Sig(10),
      I2 => sobel_wrapper_inst_x_Sig(6),
      I3 => sobel_wrapper_inst_x_Sig(7),
      I4 => sobel_wrapper_inst_x_Sig(8),
      I5 => sobel_wrapper_inst_x_Sig(9),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(10)
    );
  sobel_wrapper_inst_x_Sig_not00011 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => reg3(0),
      I1 => reg3(1),
      O => sobel_wrapper_inst_x_Sig_not0001
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1886
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1818
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1748
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1672
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1592
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_0_mand1_1509
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_and00001 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      O => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000
    );
  reg4_not00011 : LUT6
    generic map(
      INIT => X"0000000000000800"
    )
    port map (
      I0 => mode_IBUF_94,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_1_IBUF_226,
      I3 => registerAddress_2_IBUF_237,
      I4 => registerAddress_3_IBUF_240,
      I5 => registerAddress_0_IBUF_215,
      O => reg4_not0001
    );
  reg3_not00011 : LUT6
    generic map(
      INIT => X"0000000008000000"
    )
    port map (
      I0 => registerAddress_1_IBUF_226,
      I1 => registerAddress_0_IBUF_215,
      I2 => registerAddress_3_IBUF_240,
      I3 => mode_IBUF_94,
      I4 => registerOutValue_and0000,
      I5 => registerAddress_2_IBUF_237,
      O => reg3_not0001
    );
  reg2_not00011 : LUT6
    generic map(
      INIT => X"0000000000000800"
    )
    port map (
      I0 => registerOutValue_and0000,
      I1 => mode_IBUF_94,
      I2 => registerAddress_2_IBUF_237,
      I3 => registerAddress_1_IBUF_226,
      I4 => registerAddress_3_IBUF_240,
      I5 => registerAddress_0_IBUF_215,
      O => reg2_not0001
    );
  reg1_not00011 : LUT6
    generic map(
      INIT => X"0000000000000800"
    )
    port map (
      I0 => registerAddress_0_IBUF_215,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_1_IBUF_226,
      I3 => mode_IBUF_94,
      I4 => registerAddress_3_IBUF_240,
      I5 => registerAddress_2_IBUF_237,
      O => reg1_not0001
    );
  reg0_not00012 : LUT6
    generic map(
      INIT => X"0000000000000040"
    )
    port map (
      I0 => registerAddress_1_IBUF_226,
      I1 => mode_IBUF_94,
      I2 => registerOutValue_and0000,
      I3 => registerAddress_2_IBUF_237,
      I4 => registerAddress_3_IBUF_240,
      I5 => registerAddress_0_IBUF_215,
      O => reg0_not0001
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In1 : LUT3
    generic map(
      INIT => X"4C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      O => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C7_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(8),
      I1 => sobel_wrapper_inst_sobel_inst_countY(1),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C7_mand1_953
    );
  registerOutValue_mux0000_1_21 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => registerAddress_3_IBUF_240,
      I1 => registerAddress_1_IBUF_226,
      I2 => registerAddress_2_IBUF_237,
      O => registerOutValue_mux0000_1_2
    );
  registerOutValue_mux0000_1_30 : LUT5
    generic map(
      INIT => X"00E00040"
    )
    port map (
      I0 => registerAddress_0_IBUF_215,
      I1 => reg2(1),
      I2 => registerAddress_1_IBUF_226,
      I3 => registerAddress_3_IBUF_240,
      I4 => reg3(1),
      O => registerOutValue_mux0000_1_30_377
    );
  registerOutValue_mux0000_1_136 : LUT6
    generic map(
      INIT => X"AAEEAAEA22EE22E2"
    )
    port map (
      I0 => registerOutValue_1_328,
      I1 => registerOutValue_and0000,
      I2 => registerOutValue_mux0000_1_81,
      I3 => registerAddress_2_IBUF_237,
      I4 => registerOutValue_mux0000_1_30_377,
      I5 => registerOutValue_mux0000_1_2,
      O => registerOutValue_mux0000(1)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C6_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(7),
      I1 => sobel_wrapper_inst_sobel_inst_countY(0),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C6_mand1_952
    );
  sobel_wrapper_inst_filteredPixelX_and0000_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      O => N46
    );
  sobel_wrapper_inst_filteredPixelX_and0000 : LUT6
    generic map(
      INIT => X"EAC0FAF0EAC0EAC0"
    )
    port map (
      I0 => sobel_wrapper_inst_mode_Sig(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_and0000,
      I4 => N46,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_filteredPixelX_and0000_453
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1891
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1823
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1753
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1677
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1597
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_5_mand1_1514
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2R1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2R
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1890
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1822
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1752
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1676
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1596
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_4_mand1_1513
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1889
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1821
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1751
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1675
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1595
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_3_mand1_1512
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1888
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1820
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1750
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1674
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1594
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_2_mand1_1511
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1887
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1819
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1749
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1673
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1593
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(1),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_1_x_b_1_mand1_1510
    );
  registerOutValue_mux0000_0_11 : LUT4
    generic map(
      INIT => X"AF8F"
    )
    port map (
      I0 => registerAddress_3_IBUF_240,
      I1 => registerAddress_1_IBUF_226,
      I2 => registerOutValue_and0000,
      I3 => registerAddress_2_IBUF_237,
      O => N01
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_ap_vld_or000011 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => reg4_179,
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      O => sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_and0000
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut_9_1 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(9),
      I1 => sobel_wrapper_inst_y_Sig(0),
      I2 => sobel_wrapper_inst_y_Sig(2),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2C
    );
  reg0_not0001135 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => registerAddress_10_IBUF_216,
      I1 => registerAddress_11_IBUF_217,
      I2 => registerAddress_12_IBUF_218,
      I3 => registerAddress_14_IBUF_220,
      I4 => registerAddress_13_IBUF_219,
      I5 => registerAddress_15_IBUF_221,
      O => reg0_not0001135_124
    );
  reg0_not0001171 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => registerAddress_16_IBUF_222,
      I1 => registerAddress_17_IBUF_223,
      I2 => registerAddress_18_IBUF_224,
      I3 => registerAddress_19_IBUF_225,
      I4 => registerAddress_20_IBUF_227,
      I5 => registerAddress_21_IBUF_228,
      O => reg0_not0001171_125
    );
  reg0_not00011128 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => registerAddress_5_IBUF_242,
      I1 => registerAddress_4_IBUF_241,
      I2 => registerAddress_6_IBUF_243,
      I3 => registerAddress_7_IBUF_244,
      I4 => registerAddress_8_IBUF_245,
      I5 => registerAddress_9_IBUF_246,
      O => reg0_not00011128_121
    );
  reg0_not00011184 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => registerAddress_24_IBUF_231,
      I1 => registerAddress_22_IBUF_229,
      I2 => registerAddress_23_IBUF_230,
      I3 => registerAddress_25_IBUF_232,
      I4 => registerAddress_27_IBUF_234,
      I5 => registerAddress_26_IBUF_233,
      O => reg0_not00011184_122
    );
  reg0_not00011200 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => registerAddress_30_IBUF_238,
      I1 => registerAddress_28_IBUF_235,
      I2 => registerAddress_29_IBUF_236,
      I3 => registerAddress_31_IBUF_239,
      O => reg0_not00011200_123
    );
  reg0_not00011221 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => reg0_not0001135_124,
      I1 => reg0_not0001171_125,
      I2 => reg0_not00011128_121,
      I3 => reg0_not00011184_122,
      I4 => reg0_not00011200_123,
      O => registerOutValue_and0000
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_cy_7_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sobel_wrapper_inst_y_Sig(0),
      I1 => sobel_wrapper_inst_x_Sig(7),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_cy(7)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_10_Q : LUT6
    generic map(
      INIT => X"D12EFFFFD12E0000"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(9),
      I1 => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut(9),
      I2 => N48,
      I3 => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut(10),
      I4 => sobel_wrapper_inst_sobel_inst_N1,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(10),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(10)
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_In11 : LUT4
    generic map(
      INIT => X"0020"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      O => sobel_wrapper_inst_sobel_inst_countY_and0000
    );
  registerOutValue_mux0000_0_139 : LUT6
    generic map(
      INIT => X"77B366A255914480"
    )
    port map (
      I0 => registerAddress_1_IBUF_226,
      I1 => registerAddress_2_IBUF_237,
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      I3 => reg4_179,
      I4 => reg0(0),
      I5 => reg2(0),
      O => registerOutValue_mux0000_0_139_353
    );
  sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2226 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(12),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(8),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYR(9),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutYR(10),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutYR(11),
      O => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2226_1247
    );
  sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2226 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(12),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(8),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(9),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutYG(10),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutYG(11),
      O => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2226_1244
    );
  sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2226 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(12),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(8),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(9),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutXB(10),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutXB(11),
      O => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2226_1241
    );
  sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2226 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(12),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(8),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(9),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutXG(10),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutXG(11),
      O => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2226_1238
    );
  sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2226 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(12),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(8),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXR(9),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutXR(10),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutXR(11),
      O => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2226_1235
    );
  sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2226 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(12),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(8),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(9),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutYB(10),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutYB(11),
      O => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2226_1232
    );
  sobel_wrapper_inst_sobel_inst_ap_NS_fsm_and00011 : LUT5
    generic map(
      INIT => X"AAAAA8AA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => reg5
    );
  mode_IBUF : IBUF
    port map (
      I => mode,
      O => mode_IBUF_94
    );
  registerAddress_31_IBUF : IBUF
    port map (
      I => registerAddress(31),
      O => registerAddress_31_IBUF_239
    );
  registerAddress_30_IBUF : IBUF
    port map (
      I => registerAddress(30),
      O => registerAddress_30_IBUF_238
    );
  registerAddress_29_IBUF : IBUF
    port map (
      I => registerAddress(29),
      O => registerAddress_29_IBUF_236
    );
  registerAddress_28_IBUF : IBUF
    port map (
      I => registerAddress(28),
      O => registerAddress_28_IBUF_235
    );
  registerAddress_27_IBUF : IBUF
    port map (
      I => registerAddress(27),
      O => registerAddress_27_IBUF_234
    );
  registerAddress_26_IBUF : IBUF
    port map (
      I => registerAddress(26),
      O => registerAddress_26_IBUF_233
    );
  registerAddress_25_IBUF : IBUF
    port map (
      I => registerAddress(25),
      O => registerAddress_25_IBUF_232
    );
  registerAddress_24_IBUF : IBUF
    port map (
      I => registerAddress(24),
      O => registerAddress_24_IBUF_231
    );
  registerAddress_23_IBUF : IBUF
    port map (
      I => registerAddress(23),
      O => registerAddress_23_IBUF_230
    );
  registerAddress_22_IBUF : IBUF
    port map (
      I => registerAddress(22),
      O => registerAddress_22_IBUF_229
    );
  registerAddress_21_IBUF : IBUF
    port map (
      I => registerAddress(21),
      O => registerAddress_21_IBUF_228
    );
  registerAddress_20_IBUF : IBUF
    port map (
      I => registerAddress(20),
      O => registerAddress_20_IBUF_227
    );
  registerAddress_19_IBUF : IBUF
    port map (
      I => registerAddress(19),
      O => registerAddress_19_IBUF_225
    );
  registerAddress_18_IBUF : IBUF
    port map (
      I => registerAddress(18),
      O => registerAddress_18_IBUF_224
    );
  registerAddress_17_IBUF : IBUF
    port map (
      I => registerAddress(17),
      O => registerAddress_17_IBUF_223
    );
  registerAddress_16_IBUF : IBUF
    port map (
      I => registerAddress(16),
      O => registerAddress_16_IBUF_222
    );
  registerAddress_15_IBUF : IBUF
    port map (
      I => registerAddress(15),
      O => registerAddress_15_IBUF_221
    );
  registerAddress_14_IBUF : IBUF
    port map (
      I => registerAddress(14),
      O => registerAddress_14_IBUF_220
    );
  registerAddress_13_IBUF : IBUF
    port map (
      I => registerAddress(13),
      O => registerAddress_13_IBUF_219
    );
  registerAddress_12_IBUF : IBUF
    port map (
      I => registerAddress(12),
      O => registerAddress_12_IBUF_218
    );
  registerAddress_11_IBUF : IBUF
    port map (
      I => registerAddress(11),
      O => registerAddress_11_IBUF_217
    );
  registerAddress_10_IBUF : IBUF
    port map (
      I => registerAddress(10),
      O => registerAddress_10_IBUF_216
    );
  registerAddress_9_IBUF : IBUF
    port map (
      I => registerAddress(9),
      O => registerAddress_9_IBUF_246
    );
  registerAddress_8_IBUF : IBUF
    port map (
      I => registerAddress(8),
      O => registerAddress_8_IBUF_245
    );
  registerAddress_7_IBUF : IBUF
    port map (
      I => registerAddress(7),
      O => registerAddress_7_IBUF_244
    );
  registerAddress_6_IBUF : IBUF
    port map (
      I => registerAddress(6),
      O => registerAddress_6_IBUF_243
    );
  registerAddress_5_IBUF : IBUF
    port map (
      I => registerAddress(5),
      O => registerAddress_5_IBUF_242
    );
  registerAddress_4_IBUF : IBUF
    port map (
      I => registerAddress(4),
      O => registerAddress_4_IBUF_241
    );
  registerAddress_3_IBUF : IBUF
    port map (
      I => registerAddress(3),
      O => registerAddress_3_IBUF_240
    );
  registerAddress_2_IBUF : IBUF
    port map (
      I => registerAddress(2),
      O => registerAddress_2_IBUF_237
    );
  registerAddress_1_IBUF : IBUF
    port map (
      I => registerAddress(1),
      O => registerAddress_1_IBUF_226
    );
  registerAddress_0_IBUF : IBUF
    port map (
      I => registerAddress(0),
      O => registerAddress_0_IBUF_215
    );
  registerInValue_23_IBUF : IBUF
    port map (
      I => registerInValue(23),
      O => registerInValue_23_IBUF_286
    );
  registerInValue_22_IBUF : IBUF
    port map (
      I => registerInValue(22),
      O => registerInValue_22_IBUF_285
    );
  registerInValue_21_IBUF : IBUF
    port map (
      I => registerInValue(21),
      O => registerInValue_21_IBUF_284
    );
  registerInValue_20_IBUF : IBUF
    port map (
      I => registerInValue(20),
      O => registerInValue_20_IBUF_283
    );
  registerInValue_19_IBUF : IBUF
    port map (
      I => registerInValue(19),
      O => registerInValue_19_IBUF_281
    );
  registerInValue_18_IBUF : IBUF
    port map (
      I => registerInValue(18),
      O => registerInValue_18_IBUF_280
    );
  registerInValue_17_IBUF : IBUF
    port map (
      I => registerInValue(17),
      O => registerInValue_17_IBUF_279
    );
  registerInValue_16_IBUF : IBUF
    port map (
      I => registerInValue(16),
      O => registerInValue_16_IBUF_278
    );
  registerInValue_15_IBUF : IBUF
    port map (
      I => registerInValue(15),
      O => registerInValue_15_IBUF_277
    );
  registerInValue_14_IBUF : IBUF
    port map (
      I => registerInValue(14),
      O => registerInValue_14_IBUF_276
    );
  registerInValue_13_IBUF : IBUF
    port map (
      I => registerInValue(13),
      O => registerInValue_13_IBUF_275
    );
  registerInValue_12_IBUF : IBUF
    port map (
      I => registerInValue(12),
      O => registerInValue_12_IBUF_274
    );
  registerInValue_11_IBUF : IBUF
    port map (
      I => registerInValue(11),
      O => registerInValue_11_IBUF_273
    );
  registerInValue_10_IBUF : IBUF
    port map (
      I => registerInValue(10),
      O => registerInValue_10_IBUF_272
    );
  registerInValue_9_IBUF : IBUF
    port map (
      I => registerInValue(9),
      O => registerInValue_9_IBUF_294
    );
  registerInValue_8_IBUF : IBUF
    port map (
      I => registerInValue(8),
      O => registerInValue_8_IBUF_293
    );
  registerInValue_7_IBUF : IBUF
    port map (
      I => registerInValue(7),
      O => registerInValue_7_IBUF_292
    );
  registerInValue_6_IBUF : IBUF
    port map (
      I => registerInValue(6),
      O => registerInValue_6_IBUF_291
    );
  registerInValue_5_IBUF : IBUF
    port map (
      I => registerInValue(5),
      O => registerInValue_5_IBUF_290
    );
  registerInValue_4_IBUF : IBUF
    port map (
      I => registerInValue(4),
      O => registerInValue_4_IBUF_289
    );
  registerInValue_3_IBUF : IBUF
    port map (
      I => registerInValue(3),
      O => registerInValue_3_IBUF_288
    );
  registerInValue_2_IBUF : IBUF
    port map (
      I => registerInValue(2),
      O => registerInValue_2_IBUF_287
    );
  registerInValue_1_IBUF : IBUF
    port map (
      I => registerInValue(1),
      O => registerInValue_1_IBUF_282
    );
  registerInValue_0_IBUF : IBUF
    port map (
      I => registerInValue(0),
      O => registerInValue_0_IBUF_271
    );
  registerOutValue_31_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(31)
    );
  registerOutValue_30_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(30)
    );
  registerOutValue_29_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(29)
    );
  registerOutValue_28_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(28)
    );
  registerOutValue_27_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(27)
    );
  registerOutValue_26_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(26)
    );
  registerOutValue_25_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(25)
    );
  registerOutValue_24_OBUF : OBUF
    port map (
      I => N0,
      O => registerOutValue(24)
    );
  registerOutValue_23_OBUF : OBUF
    port map (
      I => registerOutValue_23_343,
      O => registerOutValue(23)
    );
  registerOutValue_22_OBUF : OBUF
    port map (
      I => registerOutValue_22_342,
      O => registerOutValue(22)
    );
  registerOutValue_21_OBUF : OBUF
    port map (
      I => registerOutValue_21_341,
      O => registerOutValue(21)
    );
  registerOutValue_20_OBUF : OBUF
    port map (
      I => registerOutValue_20_340,
      O => registerOutValue(20)
    );
  registerOutValue_19_OBUF : OBUF
    port map (
      I => registerOutValue_19_338,
      O => registerOutValue(19)
    );
  registerOutValue_18_OBUF : OBUF
    port map (
      I => registerOutValue_18_337,
      O => registerOutValue(18)
    );
  registerOutValue_17_OBUF : OBUF
    port map (
      I => registerOutValue_17_336,
      O => registerOutValue(17)
    );
  registerOutValue_16_OBUF : OBUF
    port map (
      I => registerOutValue_16_335,
      O => registerOutValue(16)
    );
  registerOutValue_15_OBUF : OBUF
    port map (
      I => registerOutValue_15_334,
      O => registerOutValue(15)
    );
  registerOutValue_14_OBUF : OBUF
    port map (
      I => registerOutValue_14_333,
      O => registerOutValue(14)
    );
  registerOutValue_13_OBUF : OBUF
    port map (
      I => registerOutValue_13_332,
      O => registerOutValue(13)
    );
  registerOutValue_12_OBUF : OBUF
    port map (
      I => registerOutValue_12_331,
      O => registerOutValue(12)
    );
  registerOutValue_11_OBUF : OBUF
    port map (
      I => registerOutValue_11_330,
      O => registerOutValue(11)
    );
  registerOutValue_10_OBUF : OBUF
    port map (
      I => registerOutValue_10_329,
      O => registerOutValue(10)
    );
  registerOutValue_9_OBUF : OBUF
    port map (
      I => registerOutValue_9_350,
      O => registerOutValue(9)
    );
  registerOutValue_8_OBUF : OBUF
    port map (
      I => registerOutValue_8_349,
      O => registerOutValue(8)
    );
  registerOutValue_7_OBUF : OBUF
    port map (
      I => registerOutValue_7_348,
      O => registerOutValue(7)
    );
  registerOutValue_6_OBUF : OBUF
    port map (
      I => registerOutValue_6_347,
      O => registerOutValue(6)
    );
  registerOutValue_5_OBUF : OBUF
    port map (
      I => registerOutValue_5_346,
      O => registerOutValue(5)
    );
  registerOutValue_4_OBUF : OBUF
    port map (
      I => registerOutValue_4_345,
      O => registerOutValue(4)
    );
  registerOutValue_3_OBUF : OBUF
    port map (
      I => registerOutValue_3_344,
      O => registerOutValue(3)
    );
  registerOutValue_2_OBUF : OBUF
    port map (
      I => registerOutValue_2_339,
      O => registerOutValue(2)
    );
  registerOutValue_1_OBUF : OBUF
    port map (
      I => registerOutValue_1_328,
      O => registerOutValue(1)
    );
  registerOutValue_0_OBUF : OBUF
    port map (
      I => registerOutValue_0_327,
      O => registerOutValue(0)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(1),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_1_rt_997
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(2),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_2_rt_1005
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(3),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_3_rt_1007
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(4),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_4_rt_1009
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(5),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_5_rt_1011
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(6),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_6_rt_1013
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(7),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_7_rt_1015
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(8),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_8_rt_1017
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(9),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_9_rt_1019
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(10),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_10_rt_977
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(11),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_11_rt_979
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(12),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_12_rt_981
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(13),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_13_rt_983
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(14),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_14_rt_985
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(15),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_15_rt_987
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(16),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_16_rt_989
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(17),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_17_rt_991
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(18),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_18_rt_993
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(19),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_19_rt_995
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(20),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_20_rt_999
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(21),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_21_rt_1001
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(22),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_cy_22_rt_1003
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not11 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1508
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not11 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1591
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not11 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_a_0_x_b_7_not1_1671
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(3),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_3_rt_959
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(4),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_4_rt_961
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(5),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_5_rt_963
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(6),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_cy_6_rt_965
    );
  reg4_rstpot : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => reg4_not0001,
      I1 => reg4_179,
      I2 => registerInValue_0_IBUF_271,
      O => reg4_rstpot_181
    );
  reg4 : FD
    port map (
      C => clk_BUFGP_92,
      D => reg4_rstpot_181,
      Q => reg4_179
    );
  sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045_0 : FD
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045_0_rstpot_1986,
      Q => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049_0 : FD
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049_0_rstpot_2016,
      Q => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0)
    );
  sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0 : FD
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_rstpot_2041,
      Q => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0)
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_rstpot_1185,
      Q => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_rstpot_1188,
      Q => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_rstpot_1194,
      Q => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193
    );
  sobel_wrapper_inst_sobel_inst_tmp_15_fu_548_p3_16_1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(16),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_tmp_15_fu_548_p3(16)
    );
  sobel_wrapper_inst_sobel_inst_iftmp_2_fu_707_p3_16_1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(16),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_iftmp_2_fu_707_p3(16)
    );
  sobel_wrapper_inst_sobel_inst_tmp_15_fu_548_p3_17_1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_tmp_15_fu_548_p3(17)
    );
  sobel_wrapper_inst_sobel_inst_iftmp_2_fu_707_p3_17_1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_iftmp_2_fu_707_p3(17)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_7_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(7),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(7)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_6_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(6),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(6)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_5_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(5),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(5)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_4_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(4),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(4)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_3_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(3),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(3)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_2_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(2),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(2)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_1_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(1),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(1)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_0_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(0),
      I4 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelY_Sig(0)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_7_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(7),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(7)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_6_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(6),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(6)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_5_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(5),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(5)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_4_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(4),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(4)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_3_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(3),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(3)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_2_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(2),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(2)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_1_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(1),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(1)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_0_1 : LUT6
    generic map(
      INIT => X"F333F222F000F000"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I2 => sobel_wrapper_inst_sobel_inst_filteredYPixel_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(0),
      I4 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      I5 => sobel_wrapper_inst_sobel_inst_N78,
      O => sobel_wrapper_inst_filteredPixelX_Sig(0)
    );
  sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_SW0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(16),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(15),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYR(14),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutYR(22),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutYR(21),
      O => N50
    );
  sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I4 => N50,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2226_1247,
      O => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2
    );
  sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_SW0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(16),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(15),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(14),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutYG(22),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutYG(21),
      O => N52
    );
  sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => N52,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2226_1244,
      O => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2
    );
  sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_SW0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(16),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(15),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(14),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutXG(22),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutXG(21),
      O => N54
    );
  sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => N54,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2226_1238,
      O => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2
    );
  sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_SW0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(16),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(15),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXR(14),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutXR(22),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutXR(21),
      O => N56
    );
  sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I4 => N56,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2226_1235,
      O => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_8_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(8),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_8_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(8),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_8_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(8),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_8_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(8),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_8_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(8),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_8_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(8),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_9_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(9),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_9_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(9),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_9_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(9),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_9_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(9),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_9_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(9),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_9_Q : LUT6
    generic map(
      INIT => X"006666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(9),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_10_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_10_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_10_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_10_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_10_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_10_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_11_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_11_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_11_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_11_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_11_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_11_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(11)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_12_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_12_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_12_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_12_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_12_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_12_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(12)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_13_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_13_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_13_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_13_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_13_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_13_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(13)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_14_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_14_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_14_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_14_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_14_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_14_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(14)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_15_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_15_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_15_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_15_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_15_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_15_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(15)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_16_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_16_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_16_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_16_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_16_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_16_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(16)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_17_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_17_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_17_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_17_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_17_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_17_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(17)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_21_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_21_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_21_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_21_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_21_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_21_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(21)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_0_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_0_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_0_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_0_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_0_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_0_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(0)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_1_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(1),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_1_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(1),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_1_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(1),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_1_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(1),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_1_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(1),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_1_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(1),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(1)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_2_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(2),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_2_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(2),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_2_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(2),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_2_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(2),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_2_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(2),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_2_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(2),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_3_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(3),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_3_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(3),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_3_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(3),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_3_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(3),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_3_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(3),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_3_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(3),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_4_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(4),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_4_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(4),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_4_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(4),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_4_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(4),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_4_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(4),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_4_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(4),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_5_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(5),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_5_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(5),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_5_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(5),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_5_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(5),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_5_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(5),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_5_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(5),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_6_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(6),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_6_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(6),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_6_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(6),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_6_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(6),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_6_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(6),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_6_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(6),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_7_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(7),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_7_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(7),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_7_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(7),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_7_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(7),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_7_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(7),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_7_Q : LUT6
    generic map(
      INIT => X"0F6666660C666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(7),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_22_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_22_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_22_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_22_Q : LUT6
    generic map(
      INIT => X"006666660A666666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(22)
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_2_Q : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(2),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_2_Q_971
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_we01 : LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => sobel_wrapper_inst_mode_Sig(1),
      I1 => sobel_wrapper_inst_mode_Sig(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      I3 => reg4_179,
      O => sobel_wrapper_inst_sobel_inst_pixelLine_we0
    );
  registerOutValue_mux0000_0_89_SW0 : LUT6
    generic map(
      INIT => X"CCCCFFFF04C437F7"
    )
    port map (
      I0 => reg1(0),
      I1 => registerAddress_0_IBUF_215,
      I2 => registerAddress_1_IBUF_226,
      I3 => reg3(0),
      I4 => registerOutValue_mux0000_0_139_353,
      I5 => registerAddress_2_IBUF_237,
      O => N58
    );
  registerOutValue_mux0000_0_89_SW1 : LUT6
    generic map(
      INIT => X"1000130010FF13FF"
    )
    port map (
      I0 => reg3(0),
      I1 => registerAddress_2_IBUF_237,
      I2 => registerAddress_1_IBUF_226,
      I3 => registerAddress_0_IBUF_215,
      I4 => reg1(0),
      I5 => registerOutValue_mux0000_0_139_353,
      O => N59
    );
  registerOutValue_mux0000_0_186 : LUT6
    generic map(
      INIT => X"F0F4F0F4F0F0F4F4"
    )
    port map (
      I0 => registerAddress_3_IBUF_240,
      I1 => registerOutValue_and0000,
      I2 => registerOutValue_mux0000_0_31_354,
      I3 => N59,
      I4 => N58,
      I5 => reg5,
      O => registerOutValue_mux0000(0)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_7_1 : LUT5
    generic map(
      INIT => X"3CBE3C14"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      I1 => sobel_wrapper_inst_y_Sig(0),
      I2 => sobel_wrapper_inst_x_Sig(7),
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(7),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(7)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_22_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(22)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_22_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(22)
    );
  sobel_wrapper_inst_sobel_inst_Eqn_0_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_0_mand1_533
    );
  sobel_wrapper_inst_sobel_inst_Eqn_05_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_05_mand1_532
    );
  sobel_wrapper_inst_sobel_inst_Eqn_04_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_04_mand1_531
    );
  sobel_wrapper_inst_sobel_inst_Eqn_03_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_03_mand1_530
    );
  sobel_wrapper_inst_sobel_inst_Eqn_02_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_02_mand1_529
    );
  sobel_wrapper_inst_sobel_inst_Eqn_01_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_01_mand1_528
    );
  sobel_wrapper_inst_sobel_inst_Eqn_1_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_1_mand1_599
    );
  sobel_wrapper_inst_sobel_inst_Eqn_118_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_118_mand1_548
    );
  sobel_wrapper_inst_sobel_inst_Eqn_116_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_116_mand1_546
    );
  sobel_wrapper_inst_sobel_inst_Eqn_114_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_114_mand1_544
    );
  sobel_wrapper_inst_sobel_inst_Eqn_112_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_112_mand1_542
    );
  sobel_wrapper_inst_sobel_inst_Eqn_110_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(1),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_110_mand1_540
    );
  sobel_wrapper_inst_sobel_inst_Eqn_2_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(2),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_2_mand1_623
    );
  sobel_wrapper_inst_sobel_inst_Eqn_28_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(2),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_28_mand1_622
    );
  sobel_wrapper_inst_sobel_inst_Eqn_27_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(2),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_27_mand1_621
    );
  sobel_wrapper_inst_sobel_inst_Eqn_26_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(2),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_26_mand1_620
    );
  sobel_wrapper_inst_sobel_inst_Eqn_25_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(2),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_25_mand1_619
    );
  sobel_wrapper_inst_sobel_inst_Eqn_24_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(2),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_24_mand1_618
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_9_1 : LUT6
    generic map(
      INIT => X"17E8FFFF17E80000"
    )
    port map (
      I0 => sobel_wrapper_inst_y_Sig(1),
      I1 => sobel_wrapper_inst_x_Sig(8),
      I2 => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_cy(7),
      I3 => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut(9),
      I4 => sobel_wrapper_inst_sobel_inst_N1,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(9),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(9)
    );
  sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_SW0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(16),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(15),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(14),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutXB(22),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutXB(21),
      O => N61
    );
  sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => N61,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2226_1241,
      O => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2
    );
  sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_SW0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(17),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(16),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(15),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(14),
      I4 => sobel_wrapper_inst_sobel_inst_pixelOutYB(22),
      I5 => sobel_wrapper_inst_sobel_inst_pixelOutYB(21),
      O => N63
    );
  sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => N63,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2226_1232,
      O => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_9_Q : LUT5
    generic map(
      INIT => X"69A5965A"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(8),
      I2 => sobel_wrapper_inst_sobel_inst_countY(2),
      I3 => sobel_wrapper_inst_sobel_inst_countY(1),
      I4 => sobel_wrapper_inst_sobel_inst_countY(0),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_9_Q_974
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_23_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(23)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_23_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(23)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_23_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(23)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_23_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(23)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_23_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(23)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_23_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I3 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(23)
    );
  sobel_wrapper_inst_sobel_inst_Eqn_3_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(3),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_3_mand1_629
    );
  sobel_wrapper_inst_sobel_inst_Eqn_35_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(3),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_35_mand1_628
    );
  sobel_wrapper_inst_sobel_inst_Eqn_34_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(3),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_34_mand1_627
    );
  sobel_wrapper_inst_sobel_inst_Eqn_33_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(3),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_33_mand1_626
    );
  sobel_wrapper_inst_sobel_inst_Eqn_32_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(3),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_32_mand1_625
    );
  sobel_wrapper_inst_sobel_inst_Eqn_31_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(3),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_31_mand1_624
    );
  sobel_wrapper_inst_sobel_inst_Eqn_4_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(4),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_4_mand1_635
    );
  sobel_wrapper_inst_sobel_inst_Eqn_45_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(4),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_45_mand1_634
    );
  sobel_wrapper_inst_sobel_inst_Eqn_44_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(4),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_44_mand1_633
    );
  sobel_wrapper_inst_sobel_inst_Eqn_43_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(4),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_43_mand1_632
    );
  sobel_wrapper_inst_sobel_inst_Eqn_42_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(4),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_42_mand1_631
    );
  sobel_wrapper_inst_sobel_inst_Eqn_41_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(4),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_41_mand1_630
    );
  sobel_wrapper_inst_sobel_inst_Eqn_5_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(5),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_5_mand1_641
    );
  sobel_wrapper_inst_sobel_inst_Eqn_55_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(5),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_55_mand1_640
    );
  sobel_wrapper_inst_sobel_inst_Eqn_54_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(5),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_54_mand1_639
    );
  sobel_wrapper_inst_sobel_inst_Eqn_53_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(5),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_53_mand1_638
    );
  sobel_wrapper_inst_sobel_inst_Eqn_52_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(5),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_52_mand1_637
    );
  sobel_wrapper_inst_sobel_inst_Eqn_51_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(5),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_51_mand1_636
    );
  sobel_wrapper_inst_sobel_inst_Eqn_6_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(6),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_6_mand1_647
    );
  sobel_wrapper_inst_sobel_inst_Eqn_65_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(6),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_65_mand1_646
    );
  sobel_wrapper_inst_sobel_inst_Eqn_64_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(6),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_64_mand1_645
    );
  sobel_wrapper_inst_sobel_inst_Eqn_63_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(6),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_63_mand1_644
    );
  sobel_wrapper_inst_sobel_inst_Eqn_62_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(6),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_62_mand1_643
    );
  sobel_wrapper_inst_sobel_inst_Eqn_61_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(6),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_61_mand1_642
    );
  sobel_wrapper_inst_sobel_inst_Eqn_7_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(7),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_7_mand1_653
    );
  sobel_wrapper_inst_sobel_inst_Eqn_75_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(7),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_75_mand1_652
    );
  sobel_wrapper_inst_sobel_inst_Eqn_74_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(7),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_74_mand1_651
    );
  sobel_wrapper_inst_sobel_inst_Eqn_73_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(7),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_73_mand1_650
    );
  sobel_wrapper_inst_sobel_inst_Eqn_72_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(7),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_72_mand1_649
    );
  sobel_wrapper_inst_sobel_inst_Eqn_71_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(7),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_71_mand1_648
    );
  sobel_wrapper_inst_sobel_inst_Eqn_8_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_8_mand1_659
    );
  sobel_wrapper_inst_sobel_inst_Eqn_85_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_85_mand1_658
    );
  sobel_wrapper_inst_sobel_inst_Eqn_84_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_84_mand1_657
    );
  sobel_wrapper_inst_sobel_inst_Eqn_83_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_83_mand1_656
    );
  sobel_wrapper_inst_sobel_inst_Eqn_82_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_82_mand1_655
    );
  sobel_wrapper_inst_sobel_inst_Eqn_81_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_81_mand1_654
    );
  sobel_wrapper_inst_sobel_inst_Eqn_9_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_9_mand1_665
    );
  sobel_wrapper_inst_sobel_inst_Eqn_95_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_95_mand1_664
    );
  sobel_wrapper_inst_sobel_inst_Eqn_94_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_94_mand1_663
    );
  sobel_wrapper_inst_sobel_inst_Eqn_93_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_93_mand1_662
    );
  sobel_wrapper_inst_sobel_inst_Eqn_92_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_92_mand1_661
    );
  sobel_wrapper_inst_sobel_inst_Eqn_91_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_91_mand1_660
    );
  sobel_wrapper_inst_sobel_inst_Eqn_10_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_10_mand1_539
    );
  sobel_wrapper_inst_sobel_inst_Eqn_105_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_105_mand1_538
    );
  sobel_wrapper_inst_sobel_inst_Eqn_104_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_104_mand1_537
    );
  sobel_wrapper_inst_sobel_inst_Eqn_103_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_103_mand1_536
    );
  sobel_wrapper_inst_sobel_inst_Eqn_102_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_102_mand1_535
    );
  sobel_wrapper_inst_sobel_inst_Eqn_101_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_101_mand1_534
    );
  sobel_wrapper_inst_sobel_inst_Eqn_11_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_11_mand1_550
    );
  sobel_wrapper_inst_sobel_inst_Eqn_119_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_119_mand1_549
    );
  sobel_wrapper_inst_sobel_inst_Eqn_117_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_117_mand1_547
    );
  sobel_wrapper_inst_sobel_inst_Eqn_115_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_115_mand1_545
    );
  sobel_wrapper_inst_sobel_inst_Eqn_113_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_113_mand1_543
    );
  sobel_wrapper_inst_sobel_inst_Eqn_111_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_111_mand1_541
    );
  sobel_wrapper_inst_sobel_inst_Eqn_12_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_12_mand1_556
    );
  sobel_wrapper_inst_sobel_inst_Eqn_125_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_125_mand1_555
    );
  sobel_wrapper_inst_sobel_inst_Eqn_124_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_124_mand1_554
    );
  sobel_wrapper_inst_sobel_inst_Eqn_123_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_123_mand1_553
    );
  sobel_wrapper_inst_sobel_inst_Eqn_122_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_122_mand1_552
    );
  sobel_wrapper_inst_sobel_inst_Eqn_121_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_121_mand1_551
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_10_Q : LUT6
    generic map(
      INIT => X"5AA569966996A55A"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_countY(3),
      I1 => sobel_wrapper_inst_sobel_inst_countY(2),
      I2 => sobel_wrapper_inst_sobel_inst_countY(1),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(10),
      I4 => sobel_wrapper_inst_sobel_inst_countY(0),
      I5 => sobel_wrapper_inst_sobel_inst_tmp_8_cast_reg_1053(9),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr6_fu_857_p2_Madd_lut_10_Q_970
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFF020A0A0A"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I2 => reg4_179,
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I5 => reg5,
      O => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_rstpot_1194
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_9_Q : LUT5
    generic map(
      INIT => X"A9FF5600"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_9_Q : LUT5
    generic map(
      INIT => X"A9FF5600"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_9_Q : LUT5
    generic map(
      INIT => X"A9FF5600"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_9_Q : LUT5
    generic map(
      INIT => X"A9FF5600"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_9_Q : LUT5
    generic map(
      INIT => X"A9FF5600"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_9_Q : LUT5
    generic map(
      INIT => X"A9FF5600"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_91,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(9)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_8_Q : LUT5
    generic map(
      INIT => X"1F9FE060"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_8_Q : LUT5
    generic map(
      INIT => X"1F9FE060"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_8_Q : LUT5
    generic map(
      INIT => X"1F9FE060"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_8_Q : LUT5
    generic map(
      INIT => X"1F9FE060"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_8_Q : LUT5
    generic map(
      INIT => X"1F9FE060"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_8_Q : LUT5
    generic map(
      INIT => X"1F9FE060"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_81,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(8)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_7_Q : LUT5
    generic map(
      INIT => X"953F6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_7_Q : LUT5
    generic map(
      INIT => X"953F6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_7_Q : LUT5
    generic map(
      INIT => X"953F6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_7_Q : LUT5
    generic map(
      INIT => X"953F6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_7_Q : LUT5
    generic map(
      INIT => X"953F6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_7_Q : LUT5
    generic map(
      INIT => X"953F6AC0"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(1),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_71,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(7)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_22_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(14),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N65
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_21_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N67
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_22_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(14),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N69
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_21_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N71
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_20_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(12),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N73
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_19_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(11),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N75
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_18_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N77
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_17_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N79
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_16_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N81
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_20_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(12),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N83
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_19_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(11),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N85
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_18_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N87
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_17_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N89
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_16_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N91
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_9_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N93
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_9_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N93,
      O => sobel_wrapper_inst_filteredPixelY_Sig(9)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_8_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N95
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_8_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N95,
      O => sobel_wrapper_inst_filteredPixelY_Sig(8)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_23_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(15),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      O => N97
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_23_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N97,
      O => sobel_wrapper_inst_filteredPixelY_Sig(23)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_15_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(15),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N99
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_15_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N99,
      O => sobel_wrapper_inst_filteredPixelY_Sig(15)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_14_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(14),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N101
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_14_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N101,
      O => sobel_wrapper_inst_filteredPixelY_Sig(14)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_13_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N103
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_13_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N103,
      O => sobel_wrapper_inst_filteredPixelY_Sig(13)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_12_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(12),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N105
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_12_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N105,
      O => sobel_wrapper_inst_filteredPixelY_Sig(12)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_11_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(11),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N107
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_11_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N107,
      O => sobel_wrapper_inst_filteredPixelY_Sig(11)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_10_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2,
      O => N109
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_10_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N109,
      O => sobel_wrapper_inst_filteredPixelY_Sig(10)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_9_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(1),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(9),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N111
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_9_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(9),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N111,
      O => sobel_wrapper_inst_filteredPixelX_Sig(9)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_8_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(0),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(8),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N113
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_8_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(8),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N113,
      O => sobel_wrapper_inst_filteredPixelX_Sig(8)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_23_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(15),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      O => N115
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_23_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(23),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N115,
      O => sobel_wrapper_inst_filteredPixelX_Sig(23)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_15_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(7),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(15),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N117
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_15_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N117,
      O => sobel_wrapper_inst_filteredPixelX_Sig(15)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_14_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(6),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(14),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N119
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_14_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N119,
      O => sobel_wrapper_inst_filteredPixelX_Sig(14)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_13_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(5),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(13),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N121
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_13_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N121,
      O => sobel_wrapper_inst_filteredPixelX_Sig(13)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_12_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(4),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(12),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N123
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_12_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(12),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N123,
      O => sobel_wrapper_inst_filteredPixelX_Sig(12)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_11_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(3),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(11),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N125
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_11_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(11),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N125,
      O => sobel_wrapper_inst_filteredPixelX_Sig(11)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_10_1_SW0 : LUT6
    generic map(
      INIT => X"0F0F0A0A0FCF0ACE"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(2),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(10),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2,
      O => N127
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_10_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(10),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N127,
      O => sobel_wrapper_inst_filteredPixelX_Sig(10)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_18_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_18_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_18_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_18_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_18_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_18_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(18)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_19_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_19_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_19_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_19_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_19_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_19_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(19)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut_20_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_38_reg_1176(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXB_lut(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut_20_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_32_reg_1161(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYB_lut(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut_20_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_36_reg_1171(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXG_lut(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut_20_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_34_reg_1166(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutXR_lut(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut_20_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_26_reg_1151(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYR_lut(20)
    );
  sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut_20_Q : LUT4
    generic map(
      INIT => X"0666"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_29_reg_1156(10),
      I2 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Maccum_pixelOutYG_lut(20)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_6_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_6_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_6_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_6_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_6_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_6_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_61,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(6)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_5_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_5_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_5_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_5_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_5_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_5_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_51,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(5)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_4_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_4_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_4_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_4_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_4_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_4_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(4),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_41,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(4)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_0_11 : LUT6
    generic map(
      INIT => X"3F3F153F153F153F"
    )
    port map (
      I0 => sobel_wrapper_inst_mode_Sig(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_and0000,
      I4 => sobel_wrapper_inst_sobel_inst_countY_and0000,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_N78
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_3_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_3_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_3_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_3_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_3_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_3_Q : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(3),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_31,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(3)
    );
  sobel_wrapper_inst_sobel_inst_Eqn_13_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_13_mand1_562
    );
  sobel_wrapper_inst_sobel_inst_Eqn_135_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_135_mand1_561
    );
  sobel_wrapper_inst_sobel_inst_Eqn_134_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_134_mand1_560
    );
  sobel_wrapper_inst_sobel_inst_Eqn_133_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_133_mand1_559
    );
  sobel_wrapper_inst_sobel_inst_Eqn_132_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_132_mand1_558
    );
  sobel_wrapper_inst_sobel_inst_Eqn_131_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(13),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_131_mand1_557
    );
  sobel_wrapper_inst_sobel_inst_Eqn_14_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_14_mand1_568
    );
  sobel_wrapper_inst_sobel_inst_Eqn_145_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_145_mand1_567
    );
  sobel_wrapper_inst_sobel_inst_Eqn_144_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_144_mand1_566
    );
  sobel_wrapper_inst_sobel_inst_Eqn_143_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_143_mand1_565
    );
  sobel_wrapper_inst_sobel_inst_Eqn_142_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_142_mand1_564
    );
  sobel_wrapper_inst_sobel_inst_Eqn_141_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(14),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_141_mand1_563
    );
  sobel_wrapper_inst_sobel_inst_Eqn_15_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_15_mand1_574
    );
  sobel_wrapper_inst_sobel_inst_Eqn_155_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_155_mand1_573
    );
  sobel_wrapper_inst_sobel_inst_Eqn_154_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_154_mand1_572
    );
  sobel_wrapper_inst_sobel_inst_Eqn_153_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_153_mand1_571
    );
  sobel_wrapper_inst_sobel_inst_Eqn_152_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_152_mand1_570
    );
  sobel_wrapper_inst_sobel_inst_Eqn_151_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(15),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_151_mand1_569
    );
  sobel_wrapper_inst_sobel_inst_Eqn_16_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_16_mand1_580
    );
  sobel_wrapper_inst_sobel_inst_Eqn_165_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_165_mand1_579
    );
  sobel_wrapper_inst_sobel_inst_Eqn_164_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_164_mand1_578
    );
  sobel_wrapper_inst_sobel_inst_Eqn_163_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_163_mand1_577
    );
  sobel_wrapper_inst_sobel_inst_Eqn_162_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_162_mand1_576
    );
  sobel_wrapper_inst_sobel_inst_Eqn_161_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(16),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_161_mand1_575
    );
  sobel_wrapper_inst_sobel_inst_Eqn_17_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_17_mand1_586
    );
  sobel_wrapper_inst_sobel_inst_Eqn_175_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_175_mand1_585
    );
  sobel_wrapper_inst_sobel_inst_Eqn_174_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_174_mand1_584
    );
  sobel_wrapper_inst_sobel_inst_Eqn_173_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_173_mand1_583
    );
  sobel_wrapper_inst_sobel_inst_Eqn_172_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_172_mand1_582
    );
  sobel_wrapper_inst_sobel_inst_Eqn_171_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(17),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_171_mand1_581
    );
  sobel_wrapper_inst_sobel_inst_Eqn_18_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_18_mand1_592
    );
  sobel_wrapper_inst_sobel_inst_Eqn_185_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_185_mand1_591
    );
  sobel_wrapper_inst_sobel_inst_Eqn_184_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_184_mand1_590
    );
  sobel_wrapper_inst_sobel_inst_Eqn_183_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_183_mand1_589
    );
  sobel_wrapper_inst_sobel_inst_Eqn_182_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_182_mand1_588
    );
  sobel_wrapper_inst_sobel_inst_Eqn_181_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(18),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_181_mand1_587
    );
  sobel_wrapper_inst_sobel_inst_Eqn_19_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_19_mand1_598
    );
  sobel_wrapper_inst_sobel_inst_Eqn_195_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_195_mand1_597
    );
  sobel_wrapper_inst_sobel_inst_Eqn_194_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_194_mand1_596
    );
  sobel_wrapper_inst_sobel_inst_Eqn_193_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_193_mand1_595
    );
  sobel_wrapper_inst_sobel_inst_Eqn_192_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_192_mand1_594
    );
  sobel_wrapper_inst_sobel_inst_Eqn_191_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(19),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_191_mand1_593
    );
  sobel_wrapper_inst_sobel_inst_Eqn_20_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_20_mand1_605
    );
  sobel_wrapper_inst_sobel_inst_Eqn_205_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_205_mand1_604
    );
  sobel_wrapper_inst_sobel_inst_Eqn_204_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_204_mand1_603
    );
  sobel_wrapper_inst_sobel_inst_Eqn_203_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_203_mand1_602
    );
  sobel_wrapper_inst_sobel_inst_Eqn_202_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_202_mand1_601
    );
  sobel_wrapper_inst_sobel_inst_Eqn_201_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(20),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_201_mand1_600
    );
  sobel_wrapper_inst_sobel_inst_Eqn_21_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_21_mand1_611
    );
  sobel_wrapper_inst_sobel_inst_Eqn_215_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_215_mand1_610
    );
  sobel_wrapper_inst_sobel_inst_Eqn_214_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_214_mand1_609
    );
  sobel_wrapper_inst_sobel_inst_Eqn_213_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_213_mand1_608
    );
  sobel_wrapper_inst_sobel_inst_Eqn_212_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_212_mand1_607
    );
  sobel_wrapper_inst_sobel_inst_Eqn_211_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(21),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_211_mand1_606
    );
  sobel_wrapper_inst_sobel_inst_Eqn_22_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_22_mand1_617
    );
  sobel_wrapper_inst_sobel_inst_Eqn_225_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_225_mand1_616
    );
  sobel_wrapper_inst_sobel_inst_Eqn_224_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_224_mand1_615
    );
  sobel_wrapper_inst_sobel_inst_Eqn_223_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_223_mand1_614
    );
  sobel_wrapper_inst_sobel_inst_Eqn_222_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_222_mand1_613
    );
  sobel_wrapper_inst_sobel_inst_Eqn_221_mand1 : LUT6
    generic map(
      INIT => X"AAA2AAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(22),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_Eqn_221_mand1_612
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_20_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(20),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N73,
      O => sobel_wrapper_inst_filteredPixelY_Sig(20)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_19_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(19),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N75,
      O => sobel_wrapper_inst_filteredPixelY_Sig(19)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_18_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(18),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N77,
      O => sobel_wrapper_inst_filteredPixelY_Sig(18)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_20_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(20),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N83,
      O => sobel_wrapper_inst_filteredPixelX_Sig(20)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_19_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(19),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N85,
      O => sobel_wrapper_inst_filteredPixelX_Sig(19)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_18_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(18),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N87,
      O => sobel_wrapper_inst_filteredPixelX_Sig(18)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_22_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(22),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N65,
      O => sobel_wrapper_inst_filteredPixelY_Sig(22)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_21_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(21),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N67,
      O => sobel_wrapper_inst_filteredPixelY_Sig(21)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_22_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(22),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N69,
      O => sobel_wrapper_inst_filteredPixelX_Sig(22)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_21_1 : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(21),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => N71,
      O => sobel_wrapper_inst_filteredPixelX_Sig(21)
    );
  sobel_wrapper_inst_sobel_inst_tmp_11_reg_270_and00001 : LUT5
    generic map(
      INIT => X"00000400"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I1 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I3 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_In2
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_17_1 : LUT6
    generic map(
      INIT => X"FF80FF80FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(17),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => sobel_wrapper_inst_sobel_inst_tmp_15_fu_548_p3(17),
      I5 => N79,
      O => sobel_wrapper_inst_filteredPixelY_Sig(17)
    );
  sobel_wrapper_inst_sobel_inst_filteredYPixel_16_1 : LUT6
    generic map(
      INIT => X"FF80FF80FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(16),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => sobel_wrapper_inst_sobel_inst_tmp_15_fu_548_p3(16),
      I5 => N81,
      O => sobel_wrapper_inst_filteredPixelY_Sig(16)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_17_1 : LUT6
    generic map(
      INIT => X"FF80FF80FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(17),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => sobel_wrapper_inst_sobel_inst_iftmp_2_fu_707_p3(17),
      I5 => N89,
      O => sobel_wrapper_inst_filteredPixelX_Sig(17)
    );
  sobel_wrapper_inst_sobel_inst_filteredXPixel_16_1 : LUT6
    generic map(
      INIT => X"FF80FF80FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I2 => sobel_wrapper_inst_sobel_inst_pixelLine_q0(16),
      I3 => sobel_wrapper_inst_sobel_inst_N78,
      I4 => sobel_wrapper_inst_sobel_inst_iftmp_2_fu_707_p3(16),
      I5 => N91,
      O => sobel_wrapper_inst_filteredPixelX_Sig(16)
    );
  registerOutValue_mux0000_0_31_SW0 : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => registerAddress_1_IBUF_226,
      I1 => registerAddress_3_IBUF_240,
      I2 => registerOutValue_and0000,
      I3 => registerAddress_2_IBUF_237,
      O => N129
    );
  registerOutValue_mux0000_0_31 : LUT6
    generic map(
      INIT => X"FFFF0D080D080D08"
    )
    port map (
      I0 => registerAddress_0_IBUF_215,
      I1 => sobel_wrapper_inst_filteredPixelY(0),
      I2 => N129,
      I3 => sobel_wrapper_inst_filteredPixelX(0),
      I4 => registerOutValue_0_327,
      I5 => N01,
      O => registerOutValue_mux0000_0_31_354
    );
  sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut_10_1 : LUT5
    generic map(
      INIT => X"6996C33C"
    )
    port map (
      I0 => sobel_wrapper_inst_y_Sig(0),
      I1 => sobel_wrapper_inst_y_Sig(1),
      I2 => sobel_wrapper_inst_y_Sig(3),
      I3 => sobel_wrapper_inst_x_Sig(10),
      I4 => sobel_wrapper_inst_y_Sig(2),
      O => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_10_Q : LUT5
    generic map(
      INIT => X"ABFF5400"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_10_Q : LUT5
    generic map(
      INIT => X"ABFF5400"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_10_Q : LUT5
    generic map(
      INIT => X"ABFF5400"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_10_Q : LUT5
    generic map(
      INIT => X"ABFF5400"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_10_Q : LUT5
    generic map(
      INIT => X"ABFF5400"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_10_Q : LUT5
    generic map(
      INIT => X"ABFF5400"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(7),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(6),
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(5),
      I3 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_a(2),
      I4 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_101,
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(10)
    );
  registerOutValue_mux0000_9_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_9_60_404,
      I1 => N01,
      I2 => registerOutValue_9_350,
      I3 => N26,
      I4 => reg2(9),
      O => registerOutValue_mux0000(9)
    );
  registerOutValue_mux0000_8_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_8_60_402,
      I1 => N01,
      I2 => registerOutValue_8_349,
      I3 => N26,
      I4 => reg2(8),
      O => registerOutValue_mux0000(8)
    );
  registerOutValue_mux0000_7_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_7_60_400,
      I1 => N01,
      I2 => registerOutValue_7_348,
      I3 => N26,
      I4 => reg2(7),
      O => registerOutValue_mux0000(7)
    );
  registerOutValue_mux0000_6_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_6_60_398,
      I1 => N01,
      I2 => registerOutValue_6_347,
      I3 => N26,
      I4 => reg2(6),
      O => registerOutValue_mux0000(6)
    );
  registerOutValue_mux0000_5_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_5_60_396,
      I1 => N01,
      I2 => registerOutValue_5_346,
      I3 => N26,
      I4 => reg2(5),
      O => registerOutValue_mux0000(5)
    );
  registerOutValue_mux0000_4_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_4_60_394,
      I1 => N01,
      I2 => registerOutValue_4_345,
      I3 => N26,
      I4 => reg2(4),
      O => registerOutValue_mux0000(4)
    );
  registerOutValue_mux0000_3_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_3_60_392,
      I1 => N01,
      I2 => registerOutValue_3_344,
      I3 => N26,
      I4 => reg2(3),
      O => registerOutValue_mux0000(3)
    );
  registerOutValue_mux0000_2_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_2_60_390,
      I1 => N01,
      I2 => registerOutValue_2_339,
      I3 => N26,
      I4 => reg2(2),
      O => registerOutValue_mux0000(2)
    );
  registerOutValue_mux0000_23_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_23_60_388,
      I1 => N01,
      I2 => registerOutValue_23_343,
      I3 => N26,
      I4 => reg2(23),
      O => registerOutValue_mux0000(23)
    );
  registerOutValue_mux0000_22_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_22_60_386,
      I1 => N01,
      I2 => registerOutValue_22_342,
      I3 => N26,
      I4 => reg2(22),
      O => registerOutValue_mux0000(22)
    );
  registerOutValue_mux0000_21_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_21_60_384,
      I1 => N01,
      I2 => registerOutValue_21_341,
      I3 => N26,
      I4 => reg2(21),
      O => registerOutValue_mux0000(21)
    );
  registerOutValue_mux0000_20_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_20_60_382,
      I1 => N01,
      I2 => registerOutValue_20_340,
      I3 => N26,
      I4 => reg2(20),
      O => registerOutValue_mux0000(20)
    );
  registerOutValue_mux0000_19_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_19_60_374,
      I1 => N01,
      I2 => registerOutValue_19_338,
      I3 => N26,
      I4 => reg2(19),
      O => registerOutValue_mux0000(19)
    );
  registerOutValue_mux0000_18_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_18_60_372,
      I1 => N01,
      I2 => registerOutValue_18_337,
      I3 => N26,
      I4 => reg2(18),
      O => registerOutValue_mux0000(18)
    );
  registerOutValue_mux0000_17_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_17_60_370,
      I1 => N01,
      I2 => registerOutValue_17_336,
      I3 => N26,
      I4 => reg2(17),
      O => registerOutValue_mux0000(17)
    );
  registerOutValue_mux0000_16_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_16_60_368,
      I1 => N01,
      I2 => registerOutValue_16_335,
      I3 => N26,
      I4 => reg2(16),
      O => registerOutValue_mux0000(16)
    );
  registerOutValue_mux0000_15_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_15_60_366,
      I1 => N01,
      I2 => registerOutValue_15_334,
      I3 => N26,
      I4 => reg2(15),
      O => registerOutValue_mux0000(15)
    );
  registerOutValue_mux0000_14_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_14_60_364,
      I1 => N01,
      I2 => registerOutValue_14_333,
      I3 => N26,
      I4 => reg2(14),
      O => registerOutValue_mux0000(14)
    );
  registerOutValue_mux0000_13_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_13_60_362,
      I1 => N01,
      I2 => registerOutValue_13_332,
      I3 => N26,
      I4 => reg2(13),
      O => registerOutValue_mux0000(13)
    );
  registerOutValue_mux0000_12_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_12_60_360,
      I1 => N01,
      I2 => registerOutValue_12_331,
      I3 => N26,
      I4 => reg2(12),
      O => registerOutValue_mux0000(12)
    );
  registerOutValue_mux0000_11_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_11_60_358,
      I1 => N01,
      I2 => registerOutValue_11_330,
      I3 => N26,
      I4 => reg2(11),
      O => registerOutValue_mux0000(11)
    );
  registerOutValue_mux0000_10_88 : LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
    port map (
      I0 => registerOutValue_mux0000_10_60_356,
      I1 => N01,
      I2 => registerOutValue_10_329,
      I3 => N26,
      I4 => reg2(10),
      O => registerOutValue_mux0000(10)
    );
  sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and00001 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => sobel_wrapper_inst_mode_Sig(1),
      I1 => sobel_wrapper_inst_mode_Sig(0),
      I2 => reg4_179,
      I3 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      O => sobel_wrapper_inst_sobel_inst_storemerge_reg_258_and0000
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_10_SW0 : LUT4
    generic map(
      INIT => X"157F"
    )
    port map (
      I0 => sobel_wrapper_inst_y_Sig(1),
      I1 => sobel_wrapper_inst_y_Sig(0),
      I2 => sobel_wrapper_inst_x_Sig(7),
      I3 => sobel_wrapper_inst_x_Sig(8),
      O => N48
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_ce0_or00001 : LUT6
    generic map(
      INIT => X"22F22222AAFAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      I3 => sobel_wrapper_inst_mode_Sig(1),
      I4 => reg4_179,
      I5 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_ce0
    );
  sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_rstpot : LUT5
    generic map(
      INIT => X"4C4C4CEC"
    )
    port map (
      I0 => reg4_179,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      I3 => sobel_wrapper_inst_mode_Sig(0),
      I4 => sobel_wrapper_inst_mode_Sig(1),
      O => sobel_wrapper_inst_sobel_inst_tmp_reg_1041_0_rstpot_2041
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_rstpot : LUT5
    generic map(
      INIT => X"FF808080"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I3 => reg4_179,
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      O => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_rstpot_1185
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_8_1 : LUT6
    generic map(
      INIT => X"C33CEBBEC33C4114"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_In,
      I1 => sobel_wrapper_inst_y_Sig(1),
      I2 => sobel_wrapper_inst_x_Sig(8),
      I3 => sobel_wrapper_inst_sobel_inst_Madd_pixelLine_addr1_fu_381_p2_cy(7),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(8),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(8)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_6_1 : LUT6
    generic map(
      INIT => X"AAAAAEEEAAAAA222"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(6),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(6),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(6)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_5_1 : LUT6
    generic map(
      INIT => X"AAAAAEEEAAAAA222"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(5),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(5),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(5)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_0_11 : LUT4
    generic map(
      INIT => X"FFD5"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I3 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      O => sobel_wrapper_inst_sobel_inst_N1
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_4_1 : LUT6
    generic map(
      INIT => X"AAAAAEEEAAAAA222"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(4),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(4),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(4)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_3_1 : LUT6
    generic map(
      INIT => X"AAAAAEEEAAAAA222"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(3),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(3),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(3)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_2_1 : LUT6
    generic map(
      INIT => X"AAAAAEEEAAAAA222"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(2),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(2),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(2)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_1_1 : LUT6
    generic map(
      INIT => X"AAAAAEEEAAAAA222"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(1),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(1),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(1)
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_address0_0_1 : LUT6
    generic map(
      INIT => X"AAAAAEEEAAAAA222"
    )
    port map (
      I0 => sobel_wrapper_inst_x_Sig(0),
      I1 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_1186,
      I2 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(1),
      I4 => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      I5 => sobel_wrapper_inst_sobel_inst_pixelLine_addr6_fu_857_p2(0),
      O => sobel_wrapper_inst_sobel_inst_pixelLine_address0(0)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_2_Q : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_2_Q : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_2_Q : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_2_Q : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U4_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_2_Q : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U2_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U5_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut_2_Q : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U3_sobel_mul_3s_8s_13_2_MulnS_0_U_b(2),
      I1 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd_21,
      I2 => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U1_sobel_mul_3s_8s_13_2_MulnS_0_U_a(0),
      O => sobel_wrapper_inst_sobel_inst_sobel_mul_3s_8s_13_2_U6_sobel_mul_3s_8s_13_2_MulnS_0_U_Mmult_tmp_product_mult0000_Madd2_lut(2)
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_rstpot : LUT6
    generic map(
      INIT => X"AAAAAAAAAABAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd6_1192,
      I1 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I5 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      O => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd2_rstpot_1188
    );
  sobel_wrapper_inst_sobel_inst_pixelOutXB_not00011 : LUT6
    generic map(
      INIT => X"AABAAAAAAAAAAAAA"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd6_1192,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I2 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      I3 => sobel_wrapper_inst_sobel_inst_tmp_reg_1041(0),
      I4 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd1_1183,
      I5 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q,
      O => sobel_wrapper_inst_sobel_inst_pixelOutXB_not0001
    );
  registerOutValue_mux0000_10_21 : LUT5
    generic map(
      INIT => X"00000008"
    )
    port map (
      I0 => registerOutValue_and0000,
      I1 => registerAddress_1_IBUF_226,
      I2 => registerAddress_2_IBUF_237,
      I3 => registerAddress_3_IBUF_240,
      I4 => registerAddress_0_IBUF_215,
      O => N26
    );
  sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045_0_rstpot : LUT5
    generic map(
      INIT => X"4CEC4CCC"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      I1 => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045(0),
      I2 => reg4_179,
      I3 => sobel_wrapper_inst_mode_Sig(1),
      I4 => sobel_wrapper_inst_mode_Sig(0),
      O => sobel_wrapper_inst_sobel_inst_tmp_3_reg_1045_0_rstpot_1986
    );
  sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049_0_rstpot : LUT5
    generic map(
      INIT => X"7FFF0080"
    )
    port map (
      I0 => sobel_wrapper_inst_mode_Sig(1),
      I1 => reg4_179,
      I2 => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd7_1193,
      I3 => sobel_wrapper_inst_mode_Sig(0),
      I4 => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049(0),
      O => sobel_wrapper_inst_sobel_inst_tmp_6_reg_1049_0_rstpot_2016
    );
  sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXB(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXB(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXB(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXB(23),
      I4 => N61,
      I5 => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2226_1241,
      O => sobel_wrapper_inst_sobel_inst_icmp4_fu_673_p2249_1242
    );
  sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYB(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYB(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYB(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYB(23),
      I4 => N63,
      I5 => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2226_1232,
      O => sobel_wrapper_inst_sobel_inst_icmp1_fu_514_p2249_1233
    );
  sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYG(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYG(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYG(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYG(23),
      I4 => N52,
      I5 => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2226_1244,
      O => sobel_wrapper_inst_sobel_inst_icmp8_fu_461_p2249_1245
    );
  sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXG(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXG(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXG(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXG(23),
      I4 => N54,
      I5 => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2226_1238,
      O => sobel_wrapper_inst_sobel_inst_icmp3_fu_620_p2249_1239
    );
  sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutYR(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutYR(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutYR(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutYR(23),
      I4 => N50,
      I5 => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2226_1247,
      O => sobel_wrapper_inst_sobel_inst_icmp_fu_408_p2249_1248
    );
  sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1 : LUT6
    generic map(
      INIT => X"00FF00FF00FE00FF"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_pixelOutXR(18),
      I1 => sobel_wrapper_inst_sobel_inst_pixelOutXR(19),
      I2 => sobel_wrapper_inst_sobel_inst_pixelOutXR(20),
      I3 => sobel_wrapper_inst_sobel_inst_pixelOutXR(23),
      I4 => N56,
      I5 => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2226_1235,
      O => sobel_wrapper_inst_sobel_inst_icmp2_fu_567_p2249_1236
    );
  sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_1 : LUT5
    generic map(
      INIT => X"FDA87520"
    )
    port map (
      I0 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(4),
      I1 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lut(3),
      I2 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi3_1034,
      I3 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_lutdi4_1035,
      I4 => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_2_Q_1024,
      O => sobel_wrapper_inst_sobel_inst_Mcompar_tmp_9_fu_392_p2_0_cmp_lt0000_cy_4_Q
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_92
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_lut_0_INV_0 : INV
    port map (
      I => sobel_wrapper_inst_sobel_inst_countY(0),
      O => sobel_wrapper_inst_sobel_inst_Madd_tmp_41_fu_900_p2_lut(0)
    );
  mode_inv1_INV_0 : INV
    port map (
      I => mode_IBUF_94,
      O => mode_inv
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_8_cast_fu_304_p2_xor_0_11_INV_0 : INV
    port map (
      I => sobel_wrapper_inst_x_Sig(0),
      O => sobel_wrapper_inst_sobel_inst_tmp_8_cast_fu_304_p2(0)
    );
  sobel_wrapper_inst_sobel_inst_Madd_tmp_40_fu_812_p2_xor_0_11_INV_0 : INV
    port map (
      I => sobel_wrapper_inst_sobel_inst_tmp_11_reg_270(0),
      O => sobel_wrapper_inst_sobel_inst_tmp_40_fu_812_p2(0)
    );
  registerOutValue_mux0000_9_60 : MUXF7
    port map (
      I0 => N131,
      I1 => N132,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_9_60_404
    );
  registerOutValue_mux0000_9_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(9),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(9),
      O => N131
    );
  registerOutValue_mux0000_9_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(9),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(9),
      O => N132
    );
  registerOutValue_mux0000_8_60 : MUXF7
    port map (
      I0 => N133,
      I1 => N134,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_8_60_402
    );
  registerOutValue_mux0000_8_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(8),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(8),
      O => N133
    );
  registerOutValue_mux0000_8_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(8),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(8),
      O => N134
    );
  registerOutValue_mux0000_7_60 : MUXF7
    port map (
      I0 => N135,
      I1 => N136,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_7_60_400
    );
  registerOutValue_mux0000_7_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(7),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(7),
      O => N135
    );
  registerOutValue_mux0000_7_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(7),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(7),
      O => N136
    );
  registerOutValue_mux0000_6_60 : MUXF7
    port map (
      I0 => N137,
      I1 => N138,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_6_60_398
    );
  registerOutValue_mux0000_6_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(6),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(6),
      O => N137
    );
  registerOutValue_mux0000_6_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(6),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(6),
      O => N138
    );
  registerOutValue_mux0000_5_60 : MUXF7
    port map (
      I0 => N139,
      I1 => N140,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_5_60_396
    );
  registerOutValue_mux0000_5_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(5),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(5),
      O => N139
    );
  registerOutValue_mux0000_5_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(5),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(5),
      O => N140
    );
  registerOutValue_mux0000_4_60 : MUXF7
    port map (
      I0 => N141,
      I1 => N142,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_4_60_394
    );
  registerOutValue_mux0000_4_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(4),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(4),
      O => N141
    );
  registerOutValue_mux0000_4_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(4),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(4),
      O => N142
    );
  registerOutValue_mux0000_3_60 : MUXF7
    port map (
      I0 => N143,
      I1 => N144,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_3_60_392
    );
  registerOutValue_mux0000_3_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(3),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(3),
      O => N143
    );
  registerOutValue_mux0000_3_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(3),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(3),
      O => N144
    );
  registerOutValue_mux0000_2_60 : MUXF7
    port map (
      I0 => N145,
      I1 => N146,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_2_60_390
    );
  registerOutValue_mux0000_2_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(2),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(2),
      O => N145
    );
  registerOutValue_mux0000_2_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(2),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(2),
      O => N146
    );
  registerOutValue_mux0000_23_60 : MUXF7
    port map (
      I0 => N147,
      I1 => N148,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_23_60_388
    );
  registerOutValue_mux0000_23_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(23),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(23),
      O => N147
    );
  registerOutValue_mux0000_23_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(23),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(23),
      O => N148
    );
  registerOutValue_mux0000_22_60 : MUXF7
    port map (
      I0 => N149,
      I1 => N150,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_22_60_386
    );
  registerOutValue_mux0000_22_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(22),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(22),
      O => N149
    );
  registerOutValue_mux0000_22_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(22),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(22),
      O => N150
    );
  registerOutValue_mux0000_21_60 : MUXF7
    port map (
      I0 => N151,
      I1 => N152,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_21_60_384
    );
  registerOutValue_mux0000_21_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(21),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(21),
      O => N151
    );
  registerOutValue_mux0000_21_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(21),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(21),
      O => N152
    );
  registerOutValue_mux0000_20_60 : MUXF7
    port map (
      I0 => N153,
      I1 => N154,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_20_60_382
    );
  registerOutValue_mux0000_20_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(20),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(20),
      O => N153
    );
  registerOutValue_mux0000_20_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(20),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(20),
      O => N154
    );
  registerOutValue_mux0000_19_60 : MUXF7
    port map (
      I0 => N155,
      I1 => N156,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_19_60_374
    );
  registerOutValue_mux0000_19_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(19),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(19),
      O => N155
    );
  registerOutValue_mux0000_19_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(19),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(19),
      O => N156
    );
  registerOutValue_mux0000_18_60 : MUXF7
    port map (
      I0 => N157,
      I1 => N158,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_18_60_372
    );
  registerOutValue_mux0000_18_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(18),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(18),
      O => N157
    );
  registerOutValue_mux0000_18_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(18),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(18),
      O => N158
    );
  registerOutValue_mux0000_17_60 : MUXF7
    port map (
      I0 => N159,
      I1 => N160,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_17_60_370
    );
  registerOutValue_mux0000_17_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(17),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(17),
      O => N159
    );
  registerOutValue_mux0000_17_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(17),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(17),
      O => N160
    );
  registerOutValue_mux0000_16_60 : MUXF7
    port map (
      I0 => N161,
      I1 => N162,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_16_60_368
    );
  registerOutValue_mux0000_16_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(16),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(16),
      O => N161
    );
  registerOutValue_mux0000_16_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(16),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(16),
      O => N162
    );
  registerOutValue_mux0000_15_60 : MUXF7
    port map (
      I0 => N163,
      I1 => N164,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_15_60_366
    );
  registerOutValue_mux0000_15_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(15),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(15),
      O => N163
    );
  registerOutValue_mux0000_15_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(15),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(15),
      O => N164
    );
  registerOutValue_mux0000_14_60 : MUXF7
    port map (
      I0 => N165,
      I1 => N166,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_14_60_364
    );
  registerOutValue_mux0000_14_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(14),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(14),
      O => N165
    );
  registerOutValue_mux0000_14_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(14),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(14),
      O => N166
    );
  registerOutValue_mux0000_13_60 : MUXF7
    port map (
      I0 => N167,
      I1 => N168,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_13_60_362
    );
  registerOutValue_mux0000_13_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(13),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(13),
      O => N167
    );
  registerOutValue_mux0000_13_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(13),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(13),
      O => N168
    );
  registerOutValue_mux0000_12_60 : MUXF7
    port map (
      I0 => N169,
      I1 => N170,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_12_60_360
    );
  registerOutValue_mux0000_12_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(12),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(12),
      O => N169
    );
  registerOutValue_mux0000_12_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(12),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(12),
      O => N170
    );
  registerOutValue_mux0000_11_60 : MUXF7
    port map (
      I0 => N171,
      I1 => N172,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_11_60_358
    );
  registerOutValue_mux0000_11_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(11),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(11),
      O => N171
    );
  registerOutValue_mux0000_11_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(11),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(11),
      O => N172
    );
  registerOutValue_mux0000_10_60 : MUXF7
    port map (
      I0 => N173,
      I1 => N174,
      S => registerAddress_0_IBUF_215,
      O => registerOutValue_mux0000_10_60_356
    );
  registerOutValue_mux0000_10_60_F : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelX(10),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg0(10),
      O => N173
    );
  registerOutValue_mux0000_10_60_G : LUT6
    generic map(
      INIT => X"0000440400004000"
    )
    port map (
      I0 => registerAddress_2_IBUF_237,
      I1 => registerOutValue_and0000,
      I2 => registerAddress_3_IBUF_240,
      I3 => sobel_wrapper_inst_filteredPixelY(10),
      I4 => registerAddress_1_IBUF_226,
      I5 => reg1(10),
      O => N174
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2 : RAMB18
    generic map(
      WRITE_MODE_B => "WRITE_FIRST",
      SRVAL_A => X"00000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      READ_WIDTH_A => 9,
      WRITE_WIDTH_A => 9,
      DOA_REG => 0,
      DOB_REG => 0,
      READ_WIDTH_B => 0,
      WRITE_WIDTH_B => 0,
      INIT_FILE => "NONE",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      SIM_COLLISION_CHECK => "ALL",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      SRVAL_B => X"00000"
    )
    port map (
      CLKA => clk_BUFGP_92,
      CLKB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_CLKB_UNCONNECTED,
      ENA => sobel_wrapper_inst_sobel_inst_pixelLine_ce0,
      ENB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ENB_UNCONNECTED,
      REGCEA => N0,
      REGCEB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_REGCEB_UNCONNECTED,
      SSRA => N0,
      SSRB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_SSRB_UNCONNECTED,
      ADDRA(13) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(10),
      ADDRA(12) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(9),
      ADDRA(11) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(8),
      ADDRA(10) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(7),
      ADDRA(9) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(6),
      ADDRA(8) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(5),
      ADDRA(7) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(4),
      ADDRA(6) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(3),
      ADDRA(5) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(2),
      ADDRA(4) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(1),
      ADDRA(3) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(0),
      ADDRA(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRA_2_UNCONNECTED,
      ADDRA(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRA_1_UNCONNECTED,
      ADDRA(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRA_0_UNCONNECTED,
      ADDRB(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_13_UNCONNECTED,
      ADDRB(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_12_UNCONNECTED,
      ADDRB(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_11_UNCONNECTED,
      ADDRB(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_10_UNCONNECTED,
      ADDRB(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_9_UNCONNECTED,
      ADDRB(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_8_UNCONNECTED,
      ADDRB(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_7_UNCONNECTED,
      ADDRB(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_6_UNCONNECTED,
      ADDRB(5) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_5_UNCONNECTED,
      ADDRB(4) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_4_UNCONNECTED,
      ADDRB(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_3_UNCONNECTED,
      ADDRB(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_2_UNCONNECTED,
      ADDRB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_1_UNCONNECTED,
      ADDRB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_ADDRB_0_UNCONNECTED,
      DIA(15) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_15_UNCONNECTED,
      DIA(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_14_UNCONNECTED,
      DIA(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_13_UNCONNECTED,
      DIA(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_12_UNCONNECTED,
      DIA(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_11_UNCONNECTED,
      DIA(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_10_UNCONNECTED,
      DIA(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_9_UNCONNECTED,
      DIA(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIA_8_UNCONNECTED,
      DIA(7) => N0,
      DIA(6) => N0,
      DIA(5) => sobel_wrapper_inst_pixel_Sig(23),
      DIA(4) => sobel_wrapper_inst_pixel_Sig(22),
      DIA(3) => sobel_wrapper_inst_pixel_Sig(21),
      DIA(2) => sobel_wrapper_inst_pixel_Sig(20),
      DIA(1) => sobel_wrapper_inst_pixel_Sig(19),
      DIA(0) => sobel_wrapper_inst_pixel_Sig(18),
      DIB(15) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_15_UNCONNECTED,
      DIB(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_14_UNCONNECTED,
      DIB(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_13_UNCONNECTED,
      DIB(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_12_UNCONNECTED,
      DIB(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_11_UNCONNECTED,
      DIB(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_10_UNCONNECTED,
      DIB(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_9_UNCONNECTED,
      DIB(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_8_UNCONNECTED,
      DIB(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_7_UNCONNECTED,
      DIB(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_6_UNCONNECTED,
      DIB(5) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_5_UNCONNECTED,
      DIB(4) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_4_UNCONNECTED,
      DIB(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_3_UNCONNECTED,
      DIB(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_2_UNCONNECTED,
      DIB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_1_UNCONNECTED,
      DIB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIB_0_UNCONNECTED,
      DIPA(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIPA_1_UNCONNECTED,
      DIPA(0) => N0,
      DIPB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIPB_1_UNCONNECTED,
      DIPB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DIPB_0_UNCONNECTED,
      DOA(15) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_15_UNCONNECTED,
      DOA(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_14_UNCONNECTED,
      DOA(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_13_UNCONNECTED,
      DOA(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_12_UNCONNECTED,
      DOA(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_11_UNCONNECTED,
      DOA(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_10_UNCONNECTED,
      DOA(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_9_UNCONNECTED,
      DOA(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_8_UNCONNECTED,
      DOA(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_7_UNCONNECTED,
      DOA(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOA_6_UNCONNECTED,
      DOA(5) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(23),
      DOA(4) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(22),
      DOA(3) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(21),
      DOA(2) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(20),
      DOA(1) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(19),
      DOA(0) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(18),
      DOB(15) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_15_UNCONNECTED,
      DOB(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_14_UNCONNECTED,
      DOB(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_13_UNCONNECTED,
      DOB(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_12_UNCONNECTED,
      DOB(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_11_UNCONNECTED,
      DOB(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_10_UNCONNECTED,
      DOB(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_9_UNCONNECTED,
      DOB(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_8_UNCONNECTED,
      DOB(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_7_UNCONNECTED,
      DOB(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_6_UNCONNECTED,
      DOB(5) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_5_UNCONNECTED,
      DOB(4) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_4_UNCONNECTED,
      DOB(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_3_UNCONNECTED,
      DOB(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_2_UNCONNECTED,
      DOB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_1_UNCONNECTED,
      DOB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOB_0_UNCONNECTED,
      DOPA(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPA_1_UNCONNECTED,
      DOPA(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPA_0_UNCONNECTED,
      DOPB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPB_1_UNCONNECTED,
      DOPB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_DOPB_0_UNCONNECTED,
      WEA(1) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEA(0) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_WEB_1_UNCONNECTED,
      WEB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram2_WEB_0_UNCONNECTED
    );
  sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1 : RAMB36_EXP
    generic map(
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      READ_WIDTH_A => 18,
      WRITE_WIDTH_A => 18,
      DOA_REG => 0,
      DOB_REG => 0,
      READ_WIDTH_B => 0,
      WRITE_WIDTH_B => 0,
      WRITE_MODE_B => "WRITE_FIRST",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      SIM_COLLISION_CHECK => "ALL",
      INIT_B => X"000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_FILE => "NONE",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      ENAU => sobel_wrapper_inst_sobel_inst_pixelLine_ce0,
      ENAL => sobel_wrapper_inst_sobel_inst_pixelLine_ce0,
      ENBU => N0,
      ENBL => N0,
      SSRAU => N0,
      SSRAL => N0,
      SSRBU => N0,
      SSRBL => N0,
      CLKAU => clk_BUFGP_92,
      CLKAL => clk_BUFGP_92,
      CLKBU => N0,
      CLKBL => N0,
      REGCLKAU => clk_BUFGP_92,
      REGCLKAL => clk_BUFGP_92,
      REGCLKBU => N0,
      REGCLKBL => N0,
      REGCEAU => N0,
      REGCEAL => N0,
      REGCEBU => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_REGCEBU_UNCONNECTED,
      REGCEBL => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_REGCEBL_UNCONNECTED,
      CASCADEINLATA => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINLATA_UNCONNECTED,
      CASCADEINLATB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINLATB_UNCONNECTED,
      CASCADEINREGA => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINREGA_UNCONNECTED,
      CASCADEINREGB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEINREGB_UNCONNECTED,
      CASCADEOUTLATA => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTLATA_UNCONNECTED,
      CASCADEOUTLATB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTLATB_UNCONNECTED,
      CASCADEOUTREGA => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTREGA_UNCONNECTED,
      CASCADEOUTREGB => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_CASCADEOUTREGB_UNCONNECTED,
      DIA(31) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_31_UNCONNECTED,
      DIA(30) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_30_UNCONNECTED,
      DIA(29) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_29_UNCONNECTED,
      DIA(28) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_28_UNCONNECTED,
      DIA(27) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_27_UNCONNECTED,
      DIA(26) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_26_UNCONNECTED,
      DIA(25) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_25_UNCONNECTED,
      DIA(24) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_24_UNCONNECTED,
      DIA(23) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_23_UNCONNECTED,
      DIA(22) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_22_UNCONNECTED,
      DIA(21) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_21_UNCONNECTED,
      DIA(20) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_20_UNCONNECTED,
      DIA(19) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_19_UNCONNECTED,
      DIA(18) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_18_UNCONNECTED,
      DIA(17) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_17_UNCONNECTED,
      DIA(16) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIA_16_UNCONNECTED,
      DIA(15) => sobel_wrapper_inst_pixel_Sig(15),
      DIA(14) => sobel_wrapper_inst_pixel_Sig(14),
      DIA(13) => sobel_wrapper_inst_pixel_Sig(13),
      DIA(12) => sobel_wrapper_inst_pixel_Sig(12),
      DIA(11) => sobel_wrapper_inst_pixel_Sig(11),
      DIA(10) => sobel_wrapper_inst_pixel_Sig(10),
      DIA(9) => sobel_wrapper_inst_pixel_Sig(9),
      DIA(8) => sobel_wrapper_inst_pixel_Sig(8),
      DIA(7) => sobel_wrapper_inst_pixel_Sig(7),
      DIA(6) => sobel_wrapper_inst_pixel_Sig(6),
      DIA(5) => sobel_wrapper_inst_pixel_Sig(5),
      DIA(4) => sobel_wrapper_inst_pixel_Sig(4),
      DIA(3) => sobel_wrapper_inst_pixel_Sig(3),
      DIA(2) => sobel_wrapper_inst_pixel_Sig(2),
      DIA(1) => sobel_wrapper_inst_pixel_Sig(1),
      DIA(0) => sobel_wrapper_inst_pixel_Sig(0),
      DIPA(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPA_3_UNCONNECTED,
      DIPA(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPA_2_UNCONNECTED,
      DIPA(1) => sobel_wrapper_inst_pixel_Sig(17),
      DIPA(0) => sobel_wrapper_inst_pixel_Sig(16),
      DIB(31) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_31_UNCONNECTED,
      DIB(30) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_30_UNCONNECTED,
      DIB(29) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_29_UNCONNECTED,
      DIB(28) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_28_UNCONNECTED,
      DIB(27) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_27_UNCONNECTED,
      DIB(26) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_26_UNCONNECTED,
      DIB(25) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_25_UNCONNECTED,
      DIB(24) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_24_UNCONNECTED,
      DIB(23) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_23_UNCONNECTED,
      DIB(22) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_22_UNCONNECTED,
      DIB(21) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_21_UNCONNECTED,
      DIB(20) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_20_UNCONNECTED,
      DIB(19) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_19_UNCONNECTED,
      DIB(18) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_18_UNCONNECTED,
      DIB(17) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_17_UNCONNECTED,
      DIB(16) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_16_UNCONNECTED,
      DIB(15) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_15_UNCONNECTED,
      DIB(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_14_UNCONNECTED,
      DIB(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_13_UNCONNECTED,
      DIB(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_12_UNCONNECTED,
      DIB(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_11_UNCONNECTED,
      DIB(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_10_UNCONNECTED,
      DIB(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_9_UNCONNECTED,
      DIB(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_8_UNCONNECTED,
      DIB(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_7_UNCONNECTED,
      DIB(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_6_UNCONNECTED,
      DIB(5) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_5_UNCONNECTED,
      DIB(4) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_4_UNCONNECTED,
      DIB(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_3_UNCONNECTED,
      DIB(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_2_UNCONNECTED,
      DIB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_1_UNCONNECTED,
      DIB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIB_0_UNCONNECTED,
      DIPB(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_3_UNCONNECTED,
      DIPB(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_2_UNCONNECTED,
      DIPB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_1_UNCONNECTED,
      DIPB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DIPB_0_UNCONNECTED,
      ADDRAL(15) => N0,
      ADDRAL(14) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(10),
      ADDRAL(13) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(9),
      ADDRAL(12) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(8),
      ADDRAL(11) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(7),
      ADDRAL(10) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(6),
      ADDRAL(9) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(5),
      ADDRAL(8) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(4),
      ADDRAL(7) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(3),
      ADDRAL(6) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(2),
      ADDRAL(5) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(1),
      ADDRAL(4) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(0),
      ADDRAL(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_3_UNCONNECTED,
      ADDRAL(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_2_UNCONNECTED,
      ADDRAL(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_1_UNCONNECTED,
      ADDRAL(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAL_0_UNCONNECTED,
      ADDRAU(14) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(10),
      ADDRAU(13) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(9),
      ADDRAU(12) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(8),
      ADDRAU(11) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(7),
      ADDRAU(10) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(6),
      ADDRAU(9) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(5),
      ADDRAU(8) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(4),
      ADDRAU(7) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(3),
      ADDRAU(6) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(2),
      ADDRAU(5) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(1),
      ADDRAU(4) => sobel_wrapper_inst_sobel_inst_pixelLine_address0(0),
      ADDRAU(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_3_UNCONNECTED,
      ADDRAU(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_2_UNCONNECTED,
      ADDRAU(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_1_UNCONNECTED,
      ADDRAU(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRAU_0_UNCONNECTED,
      ADDRBL(15) => N1,
      ADDRBL(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_14_UNCONNECTED,
      ADDRBL(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_13_UNCONNECTED,
      ADDRBL(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_12_UNCONNECTED,
      ADDRBL(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_11_UNCONNECTED,
      ADDRBL(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_10_UNCONNECTED,
      ADDRBL(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_9_UNCONNECTED,
      ADDRBL(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_8_UNCONNECTED,
      ADDRBL(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_7_UNCONNECTED,
      ADDRBL(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_6_UNCONNECTED,
      ADDRBL(5) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_5_UNCONNECTED,
      ADDRBL(4) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_4_UNCONNECTED,
      ADDRBL(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_3_UNCONNECTED,
      ADDRBL(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_2_UNCONNECTED,
      ADDRBL(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_1_UNCONNECTED,
      ADDRBL(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBL_0_UNCONNECTED,
      ADDRBU(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_14_UNCONNECTED,
      ADDRBU(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_13_UNCONNECTED,
      ADDRBU(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_12_UNCONNECTED,
      ADDRBU(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_11_UNCONNECTED,
      ADDRBU(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_10_UNCONNECTED,
      ADDRBU(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_9_UNCONNECTED,
      ADDRBU(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_8_UNCONNECTED,
      ADDRBU(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_7_UNCONNECTED,
      ADDRBU(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_6_UNCONNECTED,
      ADDRBU(5) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_5_UNCONNECTED,
      ADDRBU(4) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_4_UNCONNECTED,
      ADDRBU(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_3_UNCONNECTED,
      ADDRBU(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_2_UNCONNECTED,
      ADDRBU(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_1_UNCONNECTED,
      ADDRBU(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_ADDRBU_0_UNCONNECTED,
      WEAU(3) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEAU(2) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEAU(1) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEAU(0) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEAL(3) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEAL(2) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEAL(1) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEAL(0) => sobel_wrapper_inst_sobel_inst_pixelLine_we0,
      WEBU(7) => N0,
      WEBU(6) => N0,
      WEBU(5) => N0,
      WEBU(4) => N0,
      WEBU(3) => N0,
      WEBU(2) => N0,
      WEBU(1) => N0,
      WEBU(0) => N0,
      WEBL(7) => N0,
      WEBL(6) => N0,
      WEBL(5) => N0,
      WEBL(4) => N0,
      WEBL(3) => N0,
      WEBL(2) => N0,
      WEBL(1) => N0,
      WEBL(0) => N0,
      DOA(31) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_31_UNCONNECTED,
      DOA(30) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_30_UNCONNECTED,
      DOA(29) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_29_UNCONNECTED,
      DOA(28) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_28_UNCONNECTED,
      DOA(27) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_27_UNCONNECTED,
      DOA(26) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_26_UNCONNECTED,
      DOA(25) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_25_UNCONNECTED,
      DOA(24) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_24_UNCONNECTED,
      DOA(23) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_23_UNCONNECTED,
      DOA(22) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_22_UNCONNECTED,
      DOA(21) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_21_UNCONNECTED,
      DOA(20) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_20_UNCONNECTED,
      DOA(19) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_19_UNCONNECTED,
      DOA(18) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_18_UNCONNECTED,
      DOA(17) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_17_UNCONNECTED,
      DOA(16) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOA_16_UNCONNECTED,
      DOA(15) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(15),
      DOA(14) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(14),
      DOA(13) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(13),
      DOA(12) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(12),
      DOA(11) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(11),
      DOA(10) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(10),
      DOA(9) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(9),
      DOA(8) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(8),
      DOA(7) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(7),
      DOA(6) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(6),
      DOA(5) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(5),
      DOA(4) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(4),
      DOA(3) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(3),
      DOA(2) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(2),
      DOA(1) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(1),
      DOA(0) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(0),
      DOPA(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPA_3_UNCONNECTED,
      DOPA(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPA_2_UNCONNECTED,
      DOPA(1) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(17),
      DOPA(0) => sobel_wrapper_inst_sobel_inst_pixelLine_q0(16),
      DOB(31) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_31_UNCONNECTED,
      DOB(30) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_30_UNCONNECTED,
      DOB(29) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_29_UNCONNECTED,
      DOB(28) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_28_UNCONNECTED,
      DOB(27) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_27_UNCONNECTED,
      DOB(26) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_26_UNCONNECTED,
      DOB(25) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_25_UNCONNECTED,
      DOB(24) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_24_UNCONNECTED,
      DOB(23) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_23_UNCONNECTED,
      DOB(22) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_22_UNCONNECTED,
      DOB(21) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_21_UNCONNECTED,
      DOB(20) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_20_UNCONNECTED,
      DOB(19) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_19_UNCONNECTED,
      DOB(18) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_18_UNCONNECTED,
      DOB(17) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_17_UNCONNECTED,
      DOB(16) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_16_UNCONNECTED,
      DOB(15) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_15_UNCONNECTED,
      DOB(14) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_14_UNCONNECTED,
      DOB(13) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_13_UNCONNECTED,
      DOB(12) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_12_UNCONNECTED,
      DOB(11) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_11_UNCONNECTED,
      DOB(10) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_10_UNCONNECTED,
      DOB(9) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_9_UNCONNECTED,
      DOB(8) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_8_UNCONNECTED,
      DOB(7) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_7_UNCONNECTED,
      DOB(6) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_6_UNCONNECTED,
      DOB(5) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_5_UNCONNECTED,
      DOB(4) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_4_UNCONNECTED,
      DOB(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_3_UNCONNECTED,
      DOB(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_2_UNCONNECTED,
      DOB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_1_UNCONNECTED,
      DOB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOB_0_UNCONNECTED,
      DOPB(3) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_3_UNCONNECTED,
      DOPB(2) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_2_UNCONNECTED,
      DOPB(1) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_1_UNCONNECTED,
      DOPB(0) => NLW_sobel_wrapper_inst_sobel_inst_pixelLine_U_sobel_pixelLine_ram_U_Mram_ram1_DOPB_0_UNCONNECTED
    );
  registerOutValue_mux0000_1_811 : LUT6
    generic map(
      INIT => X"0F0E0B0A0D0C0908"
    )
    port map (
      I0 => registerAddress_3_IBUF_240,
      I1 => registerAddress_0_IBUF_215,
      I2 => registerAddress_1_IBUF_226,
      I3 => reg0(1),
      I4 => reg1(1),
      I5 => sobel_wrapper_inst_filteredPixelX(1),
      O => registerOutValue_mux0000_1_811_379
    );
  registerOutValue_mux0000_1_812 : LUT6
    generic map(
      INIT => X"0706030205040100"
    )
    port map (
      I0 => registerAddress_0_IBUF_215,
      I1 => registerAddress_3_IBUF_240,
      I2 => registerAddress_1_IBUF_226,
      I3 => reg0(1),
      I4 => sobel_wrapper_inst_filteredPixelX(1),
      I5 => reg1(1),
      O => registerOutValue_mux0000_1_812_380
    );
  registerOutValue_mux0000_1_81_f7 : MUXF7
    port map (
      I0 => registerOutValue_mux0000_1_812_380,
      I1 => registerOutValue_mux0000_1_811_379,
      S => sobel_wrapper_inst_filteredPixelY(1),
      O => registerOutValue_mux0000_1_81
    );
  sobel_wrapper_inst_sobel_inst_Mshreg_ap_CS_fsm_FSM_FFd5 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => N0,
      A3 => N0,
      CE => N1,
      CLK => clk_BUFGP_92,
      D => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd3_1189,
      Q => sobel_wrapper_inst_sobel_inst_Mshreg_ap_CS_fsm_FSM_FFd5_1036,
      Q15 => NLW_sobel_wrapper_inst_sobel_inst_Mshreg_ap_CS_fsm_FSM_FFd5_Q15_UNCONNECTED
    );
  sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_92,
      CE => N1,
      D => sobel_wrapper_inst_sobel_inst_Mshreg_ap_CS_fsm_FSM_FFd5_1036,
      Q => sobel_wrapper_inst_sobel_inst_ap_CS_fsm_FSM_FFd5_1191
    );

end Structure;


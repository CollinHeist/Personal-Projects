// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Tue Feb 25 17:18:19 2020
// Host        : ece-bel215-02 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {U:/ECE
//               440/Project_5/Project_5.sim/sim_1/synth/func/testbench_func_synth.v}
// Design      : hardware_wrapper
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_3_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *) 
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "5" *) 
  (* C_ADDRB_WIDTH = "5" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.64555 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "17" *) 
  (* C_READ_DEPTH_B = "17" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "17" *) 
  (* C_WRITE_DEPTH_B = "17" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  blk_mem_gen_0blk_mem_gen_v8_3_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[4:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[4:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

module debounce
   (Q,
    D,
    clock_IBUF_BUFG);
  output [0:0]Q;
  input [0:0]D;
  input clock_IBUF_BUFG;

  wire [0:0]D;
  wire [0:0]Q;
  wire clock_IBUF_BUFG;
  wire [0:0]p_0_in;

  FDRE #(
    .INIT(1'b0)) 
    \rst_sreg_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in),
        .Q(Q),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rst_sreg_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(D),
        .Q(p_0_in),
        .R(1'b0));
endmodule

module dp
   (x_min_y,
    Q,
    y_min_x,
    CO,
    \y_reg[0]_0 ,
    data0_out,
    x_equal_y,
    \FSM_sequential_state_reg[1] ,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[1]_1 ,
    \FSM_sequential_state_reg[2] ,
    \data_y_reg[7] ,
    \data_x_reg[7] ,
    \rst_sreg_reg[0] ,
    E,
    D,
    clock_IBUF_BUFG,
    \FSM_sequential_state_reg[1]_2 ,
    \FSM_sequential_state_reg[0] );
  output [7:0]x_min_y;
  output [7:0]Q;
  output [7:0]y_min_x;
  output [0:0]CO;
  output \y_reg[0]_0 ;
  output [7:0]data0_out;
  output x_equal_y;
  output \FSM_sequential_state_reg[1] ;
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[1]_1 ;
  input [2:0]\FSM_sequential_state_reg[2] ;
  input [7:0]\data_y_reg[7] ;
  input [7:0]\data_x_reg[7] ;
  input [0:0]\rst_sreg_reg[0] ;
  input [0:0]E;
  input [7:0]D;
  input clock_IBUF_BUFG;
  input [0:0]\FSM_sequential_state_reg[1]_2 ;
  input [7:0]\FSM_sequential_state_reg[0] ;

  wire [0:0]CO;
  wire [7:0]D;
  wire [0:0]E;
  wire [7:0]\FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire [0:0]\FSM_sequential_state_reg[1]_2 ;
  wire [2:0]\FSM_sequential_state_reg[2] ;
  wire [7:0]Q;
  wire clock_IBUF_BUFG;
  wire [7:0]data0_out;
  wire [7:0]\data_x_reg[7] ;
  wire [7:0]\data_y_reg[7] ;
  wire [0:0]\rst_sreg_reg[0] ;
  wire x_equal_y;
  wire x_greater_y_carry_i_1_n_0;
  wire x_greater_y_carry_i_2_n_0;
  wire x_greater_y_carry_i_3_n_0;
  wire x_greater_y_carry_i_4_n_0;
  wire x_greater_y_carry_i_5_n_0;
  wire x_greater_y_carry_i_6_n_0;
  wire x_greater_y_carry_i_7_n_0;
  wire x_greater_y_carry_i_8_n_0;
  wire x_greater_y_carry_n_1;
  wire x_greater_y_carry_n_2;
  wire x_greater_y_carry_n_3;
  wire [7:0]x_min_y;
  wire x_min_y_carry__0_i_1_n_0;
  wire x_min_y_carry__0_i_2_n_0;
  wire x_min_y_carry__0_i_3_n_0;
  wire x_min_y_carry__0_i_4_n_0;
  wire x_min_y_carry__0_n_1;
  wire x_min_y_carry__0_n_2;
  wire x_min_y_carry__0_n_3;
  wire x_min_y_carry_i_1_n_0;
  wire x_min_y_carry_i_2_n_0;
  wire x_min_y_carry_i_3_n_0;
  wire x_min_y_carry_i_4_n_0;
  wire x_min_y_carry_n_0;
  wire x_min_y_carry_n_1;
  wire x_min_y_carry_n_2;
  wire x_min_y_carry_n_3;
  wire [7:0]y;
  wire [7:0]y_min_x;
  wire y_min_x_carry__0_i_1_n_0;
  wire y_min_x_carry__0_i_2_n_0;
  wire y_min_x_carry__0_i_3_n_0;
  wire y_min_x_carry__0_i_4_n_0;
  wire y_min_x_carry__0_n_1;
  wire y_min_x_carry__0_n_2;
  wire y_min_x_carry__0_n_3;
  wire y_min_x_carry_i_1_n_0;
  wire y_min_x_carry_i_2_n_0;
  wire y_min_x_carry_i_3_n_0;
  wire y_min_x_carry_i_4_n_0;
  wire y_min_x_carry_n_0;
  wire y_min_x_carry_n_1;
  wire y_min_x_carry_n_2;
  wire y_min_x_carry_n_3;
  wire \y_reg[0]_0 ;
  wire [3:0]NLW_x_greater_y_carry_O_UNCONNECTED;
  wire [3:3]NLW_x_min_y_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_y_min_x_carry__0_CO_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h9)) 
    i___0_i_5
       (.I0(y[3]),
        .I1(Q[3]),
        .O(\y_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h41000000)) 
    update_x_i_1
       (.I0(\FSM_sequential_state_reg[1] ),
        .I1(Q[3]),
        .I2(y[3]),
        .I3(\FSM_sequential_state_reg[1]_0 ),
        .I4(\FSM_sequential_state_reg[1]_1 ),
        .O(x_equal_y));
  LUT4 #(
    .INIT(16'h6FF6)) 
    update_x_i_3
       (.I0(Q[6]),
        .I1(y[6]),
        .I2(Q[7]),
        .I3(y[7]),
        .O(\FSM_sequential_state_reg[1] ));
  LUT4 #(
    .INIT(16'h9009)) 
    update_x_i_4
       (.I0(Q[4]),
        .I1(y[4]),
        .I2(Q[5]),
        .I3(y[5]),
        .O(\FSM_sequential_state_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    update_x_i_5
       (.I0(Q[0]),
        .I1(y[0]),
        .I2(y[2]),
        .I3(Q[2]),
        .I4(y[1]),
        .I5(Q[1]),
        .O(\FSM_sequential_state_reg[1]_1 ));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[0]_i_2 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [0]),
        .I3(\data_x_reg[7] [0]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[0]));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[1]_i_2 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [1]),
        .I3(\data_x_reg[7] [1]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[1]));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[2]_i_2 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [2]),
        .I3(\data_x_reg[7] [2]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[2]));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[3]_i_2 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [3]),
        .I3(\data_x_reg[7] [3]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[3]));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[4]_i_2 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [4]),
        .I3(\data_x_reg[7] [4]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[4]));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[5]_i_2 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [5]),
        .I3(\data_x_reg[7] [5]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[5]));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[6]_i_2 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [6]),
        .I3(\data_x_reg[7] [6]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[6]));
  LUT6 #(
    .INIT(64'h0000000040404400)) 
    \x[7]_i_3 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [1]),
        .I2(\data_y_reg[7] [7]),
        .I3(\data_x_reg[7] [7]),
        .I4(\FSM_sequential_state_reg[2] [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(data0_out[7]));
  CARRY4 x_greater_y_carry
       (.CI(1'b0),
        .CO({CO,x_greater_y_carry_n_1,x_greater_y_carry_n_2,x_greater_y_carry_n_3}),
        .CYINIT(1'b0),
        .DI({x_greater_y_carry_i_1_n_0,x_greater_y_carry_i_2_n_0,x_greater_y_carry_i_3_n_0,x_greater_y_carry_i_4_n_0}),
        .O(NLW_x_greater_y_carry_O_UNCONNECTED[3:0]),
        .S({x_greater_y_carry_i_5_n_0,x_greater_y_carry_i_6_n_0,x_greater_y_carry_i_7_n_0,x_greater_y_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    x_greater_y_carry_i_1
       (.I0(Q[6]),
        .I1(y[6]),
        .I2(y[7]),
        .I3(Q[7]),
        .O(x_greater_y_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    x_greater_y_carry_i_2
       (.I0(Q[4]),
        .I1(y[4]),
        .I2(y[5]),
        .I3(Q[5]),
        .O(x_greater_y_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    x_greater_y_carry_i_3
       (.I0(Q[2]),
        .I1(y[2]),
        .I2(y[3]),
        .I3(Q[3]),
        .O(x_greater_y_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    x_greater_y_carry_i_4
       (.I0(Q[0]),
        .I1(y[0]),
        .I2(y[1]),
        .I3(Q[1]),
        .O(x_greater_y_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_5
       (.I0(y[7]),
        .I1(Q[7]),
        .I2(y[6]),
        .I3(Q[6]),
        .O(x_greater_y_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_6
       (.I0(Q[4]),
        .I1(y[4]),
        .I2(Q[5]),
        .I3(y[5]),
        .O(x_greater_y_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_7
       (.I0(Q[2]),
        .I1(y[2]),
        .I2(Q[3]),
        .I3(y[3]),
        .O(x_greater_y_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_8
       (.I0(Q[0]),
        .I1(y[0]),
        .I2(Q[1]),
        .I3(y[1]),
        .O(x_greater_y_carry_i_8_n_0));
  CARRY4 x_min_y_carry
       (.CI(1'b0),
        .CO({x_min_y_carry_n_0,x_min_y_carry_n_1,x_min_y_carry_n_2,x_min_y_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O(x_min_y[3:0]),
        .S({x_min_y_carry_i_1_n_0,x_min_y_carry_i_2_n_0,x_min_y_carry_i_3_n_0,x_min_y_carry_i_4_n_0}));
  CARRY4 x_min_y_carry__0
       (.CI(x_min_y_carry_n_0),
        .CO({NLW_x_min_y_carry__0_CO_UNCONNECTED[3],x_min_y_carry__0_n_1,x_min_y_carry__0_n_2,x_min_y_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,Q[6:4]}),
        .O(x_min_y[7:4]),
        .S({x_min_y_carry__0_i_1_n_0,x_min_y_carry__0_i_2_n_0,x_min_y_carry__0_i_3_n_0,x_min_y_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_1
       (.I0(Q[7]),
        .I1(y[7]),
        .O(x_min_y_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_2
       (.I0(Q[6]),
        .I1(y[6]),
        .O(x_min_y_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_3
       (.I0(Q[5]),
        .I1(y[5]),
        .O(x_min_y_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_4
       (.I0(Q[4]),
        .I1(y[4]),
        .O(x_min_y_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_1
       (.I0(Q[3]),
        .I1(y[3]),
        .O(x_min_y_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_2
       (.I0(Q[2]),
        .I1(y[2]),
        .O(x_min_y_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_3
       (.I0(Q[1]),
        .I1(y[1]),
        .O(x_min_y_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_4
       (.I0(Q[0]),
        .I1(y[0]),
        .O(x_min_y_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
  CARRY4 y_min_x_carry
       (.CI(1'b0),
        .CO({y_min_x_carry_n_0,y_min_x_carry_n_1,y_min_x_carry_n_2,y_min_x_carry_n_3}),
        .CYINIT(1'b1),
        .DI(y[3:0]),
        .O(y_min_x[3:0]),
        .S({y_min_x_carry_i_1_n_0,y_min_x_carry_i_2_n_0,y_min_x_carry_i_3_n_0,y_min_x_carry_i_4_n_0}));
  CARRY4 y_min_x_carry__0
       (.CI(y_min_x_carry_n_0),
        .CO({NLW_y_min_x_carry__0_CO_UNCONNECTED[3],y_min_x_carry__0_n_1,y_min_x_carry__0_n_2,y_min_x_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,y[6:4]}),
        .O(y_min_x[7:4]),
        .S({y_min_x_carry__0_i_1_n_0,y_min_x_carry__0_i_2_n_0,y_min_x_carry__0_i_3_n_0,y_min_x_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_1
       (.I0(y[7]),
        .I1(Q[7]),
        .O(y_min_x_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_2
       (.I0(y[6]),
        .I1(Q[6]),
        .O(y_min_x_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_3
       (.I0(y[5]),
        .I1(Q[5]),
        .O(y_min_x_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_4
       (.I0(y[4]),
        .I1(Q[4]),
        .O(y_min_x_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_1
       (.I0(y[3]),
        .I1(Q[3]),
        .O(y_min_x_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_2
       (.I0(y[2]),
        .I1(Q[2]),
        .O(y_min_x_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_3
       (.I0(y[1]),
        .I1(Q[1]),
        .O(y_min_x_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_4
       (.I0(y[0]),
        .I1(Q[0]),
        .O(y_min_x_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [0]),
        .Q(y[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [1]),
        .Q(y[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [2]),
        .Q(y[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [3]),
        .Q(y[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [4]),
        .Q(y[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [5]),
        .Q(y[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [6]),
        .Q(y[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_2 ),
        .D(\FSM_sequential_state_reg[0] [7]),
        .Q(y[7]),
        .R(1'b0));
endmodule

module fsm
   (E,
    \y_reg[0] ,
    \y_reg[0]_0 ,
    out,
    \gcd_reg[7] ,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[2]_0 ,
    D,
    \y_reg[7] ,
    slave_select_OBUF,
    \FSM_sequential_state_reg[0]_0 ,
    \FSM_sequential_state_reg[2]_1 ,
    \y_reg[0]_1 ,
    \y_reg[0]_2 ,
    CO,
    x_equal_y,
    \FSM_sequential_state_reg[2]_2 ,
    \FSM_sequential_state_reg[0]_1 ,
    \FSM_sequential_state_reg[2]_3 ,
    \FSM_sequential_state_reg[1]_1 ,
    \FSM_sequential_state_reg[2]_4 ,
    \rst_sreg_reg[0] ,
    \FSM_sequential_state_reg[1]_2 ,
    \bbstub_douta[2] ,
    in0,
    \state_reg[0] ,
    data0_out,
    x_min_y,
    y_min_x,
    \FSM_sequential_state_reg[2]_5 ,
    clock_IBUF_BUFG,
    \x_reg[6] ,
    \y_reg[3] ,
    \x_reg[4] ,
    \x_reg[0] );
  output [0:0]E;
  output \y_reg[0] ;
  output [0:0]\y_reg[0]_0 ;
  output [0:0]out;
  output \gcd_reg[7] ;
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[2]_0 ;
  output [7:0]D;
  output [7:0]\y_reg[7] ;
  output slave_select_OBUF;
  output \FSM_sequential_state_reg[0]_0 ;
  output \FSM_sequential_state_reg[2]_1 ;
  output \y_reg[0]_1 ;
  output \y_reg[0]_2 ;
  input [0:0]CO;
  input x_equal_y;
  input [2:0]\FSM_sequential_state_reg[2]_2 ;
  input \FSM_sequential_state_reg[0]_1 ;
  input [2:0]\FSM_sequential_state_reg[2]_3 ;
  input \FSM_sequential_state_reg[1]_1 ;
  input \FSM_sequential_state_reg[2]_4 ;
  input [0:0]\rst_sreg_reg[0] ;
  input \FSM_sequential_state_reg[1]_2 ;
  input \bbstub_douta[2] ;
  input [1:0]in0;
  input \state_reg[0] ;
  input [7:0]data0_out;
  input [7:0]x_min_y;
  input [7:0]y_min_x;
  input [1:0]\FSM_sequential_state_reg[2]_5 ;
  input clock_IBUF_BUFG;
  input \x_reg[6] ;
  input \y_reg[3] ;
  input \x_reg[4] ;
  input \x_reg[0] ;

  wire [0:0]CO;
  wire [7:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2__0_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2__0_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[0]_1 ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[1]_2 ;
  wire \FSM_sequential_state_reg[2]_0 ;
  wire \FSM_sequential_state_reg[2]_1 ;
  wire [2:0]\FSM_sequential_state_reg[2]_2 ;
  wire [2:0]\FSM_sequential_state_reg[2]_3 ;
  wire \FSM_sequential_state_reg[2]_4 ;
  wire [1:0]\FSM_sequential_state_reg[2]_5 ;
  wire \bbstub_douta[2] ;
  wire clock_IBUF_BUFG;
  wire [7:0]data0_out;
  wire \gcd_reg[7] ;
  wire [1:0]in0;
  (* RTL_KEEP = "yes" *) wire [0:0]out;
  wire [0:0]\rst_sreg_reg[0] ;
  wire slave_select_OBUF;
  (* RTL_KEEP = "yes" *) wire [2:1]state;
  wire \state_reg[0] ;
  wire update_x_i_2_n_0;
  wire update_x_n_0;
  wire x_equal_y;
  wire [7:0]x_min_y;
  wire \x_reg[0] ;
  wire \x_reg[4] ;
  wire \x_reg[6] ;
  wire [7:0]y_min_x;
  wire \y_reg[0] ;
  wire [0:0]\y_reg[0]_0 ;
  wire \y_reg[0]_1 ;
  wire \y_reg[0]_2 ;
  wire \y_reg[3] ;
  wire [7:0]\y_reg[7] ;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(\y_reg[0] ),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCCF20032)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(\FSM_sequential_state[0]_i_2__0_n_0 ),
        .I1(\FSM_sequential_state_reg[2]_2 [2]),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [0]),
        .I4(\FSM_sequential_state_reg[2]_5 [0]),
        .O(\FSM_sequential_state_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hF5F0FFCC05000FCC)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(x_equal_y),
        .I1(update_x_i_2_n_0),
        .I2(state[2]),
        .I3(state[1]),
        .I4(out),
        .I5(out),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010111111)) 
    \FSM_sequential_state[0]_i_2__0 
       (.I0(\FSM_sequential_state_reg[1]_1 ),
        .I1(\FSM_sequential_state_reg[2]_3 [2]),
        .I2(\FSM_sequential_state_reg[1]_2 ),
        .I3(\FSM_sequential_state[2]_i_2__0_n_0 ),
        .I4(\FSM_sequential_state_reg[2]_2 [2]),
        .I5(\rst_sreg_reg[0] ),
        .O(\FSM_sequential_state[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A83CA8FC)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(out),
        .I2(state[1]),
        .I3(state[2]),
        .I4(x_equal_y),
        .I5(\y_reg[0] ),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF3F5FF0003050F00)) 
    \FSM_sequential_state[1]_i_1__1 
       (.I0(\bbstub_douta[2] ),
        .I1(\gcd_reg[7] ),
        .I2(\FSM_sequential_state_reg[2]_3 [2]),
        .I3(\FSM_sequential_state_reg[2]_3 [1]),
        .I4(\FSM_sequential_state_reg[2]_3 [0]),
        .I5(in0[0]),
        .O(\FSM_sequential_state_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h00000000EEEE2E22)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(update_x_i_2_n_0),
        .I3(state[2]),
        .I4(\FSM_sequential_state[2]_i_3_n_0 ),
        .I5(\y_reg[0] ),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFCC43004)) 
    \FSM_sequential_state[2]_i_1__0 
       (.I0(\FSM_sequential_state[2]_i_2__0_n_0 ),
        .I1(\FSM_sequential_state_reg[2]_2 [2]),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [0]),
        .I4(\FSM_sequential_state_reg[2]_5 [1]),
        .O(\FSM_sequential_state_reg[2]_1 ));
  LUT6 #(
    .INIT(64'hFAF0F0C00A0000C0)) 
    \FSM_sequential_state[2]_i_1__1 
       (.I0(\gcd_reg[7] ),
        .I1(\state_reg[0] ),
        .I2(\FSM_sequential_state_reg[2]_3 [2]),
        .I3(\FSM_sequential_state_reg[2]_3 [1]),
        .I4(\FSM_sequential_state_reg[2]_3 [0]),
        .I5(in0[1]),
        .O(\FSM_sequential_state_reg[2]_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(out),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030040004)) 
    \FSM_sequential_state[2]_i_2__0 
       (.I0(update_x_i_2_n_0),
        .I1(state[2]),
        .I2(state[1]),
        .I3(out),
        .I4(x_equal_y),
        .I5(\y_reg[0] ),
        .O(\FSM_sequential_state[2]_i_2__0_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(out),
        .I1(state[1]),
        .I2(x_equal_y),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(out),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000008)) 
    \gcd[7]_i_1 
       (.I0(\FSM_sequential_state_reg[2]_2 [2]),
        .I1(\FSM_sequential_state[2]_i_2__0_n_0 ),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [0]),
        .I4(\rst_sreg_reg[0] ),
        .O(\gcd_reg[7] ));
  LUT6 #(
    .INIT(64'h4444444444404444)) 
    i___0_i_2
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [2]),
        .I4(\FSM_sequential_state_reg[2]_2 [0]),
        .I5(\rst_sreg_reg[0] ),
        .O(\y_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h0400000000000000)) 
    i___0_i_3
       (.I0(state[2]),
        .I1(state[1]),
        .I2(\x_reg[6] ),
        .I3(\y_reg[3] ),
        .I4(\x_reg[4] ),
        .I5(\x_reg[0] ),
        .O(\y_reg[0]_2 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    i___0_i_4
       (.I0(\FSM_sequential_state_reg[2]_2 [1]),
        .I1(\FSM_sequential_state_reg[0]_1 ),
        .I2(\FSM_sequential_state_reg[2]_3 [2]),
        .I3(\FSM_sequential_state_reg[1]_1 ),
        .I4(\FSM_sequential_state_reg[2]_4 ),
        .I5(\rst_sreg_reg[0] ),
        .O(\y_reg[0] ));
  LUT6 #(
    .INIT(64'hFFFABFFFFFFFFFFF)) 
    slave_select_OBUF_inst_i_1
       (.I0(\rst_sreg_reg[0] ),
        .I1(\gcd_reg[7] ),
        .I2(\FSM_sequential_state_reg[2]_3 [0]),
        .I3(\FSM_sequential_state_reg[2]_3 [1]),
        .I4(\FSM_sequential_state_reg[2]_3 [2]),
        .I5(\state_reg[0] ),
        .O(slave_select_OBUF));
  LUT6 #(
    .INIT(64'h000F000020F020F0)) 
    update_x
       (.I0(CO),
        .I1(x_equal_y),
        .I2(out),
        .I3(state[1]),
        .I4(update_x_i_2_n_0),
        .I5(state[2]),
        .O(update_x_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    update_x_i_2
       (.I0(\FSM_sequential_state_reg[2]_2 [1]),
        .I1(\FSM_sequential_state_reg[2]_2 [2]),
        .I2(\FSM_sequential_state_reg[2]_2 [0]),
        .I3(\rst_sreg_reg[0] ),
        .O(update_x_i_2_n_0));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[0]_i_1 
       (.I0(data0_out[0]),
        .I1(x_min_y[0]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[1]_i_1 
       (.I0(data0_out[1]),
        .I1(x_min_y[1]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[2]_i_1 
       (.I0(data0_out[2]),
        .I1(x_min_y[2]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[3]_i_1 
       (.I0(data0_out[3]),
        .I1(x_min_y[3]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[4]_i_1 
       (.I0(data0_out[4]),
        .I1(x_min_y[4]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[5]_i_1 
       (.I0(data0_out[5]),
        .I1(x_min_y[5]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[6]_i_1 
       (.I0(data0_out[6]),
        .I1(x_min_y[6]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \x[7]_i_1 
       (.I0(update_x_n_0),
        .I1(\y_reg[0] ),
        .O(E));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[7]_i_2 
       (.I0(data0_out[7]),
        .I1(x_min_y[7]),
        .I2(state[1]),
        .I3(out),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[0]_i_1 
       (.I0(data0_out[0]),
        .I1(y_min_x[0]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [0]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[1]_i_1 
       (.I0(data0_out[1]),
        .I1(y_min_x[1]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [1]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[2]_i_1 
       (.I0(data0_out[2]),
        .I1(y_min_x[2]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [2]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[3]_i_1 
       (.I0(data0_out[3]),
        .I1(y_min_x[3]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [3]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[4]_i_1 
       (.I0(data0_out[4]),
        .I1(y_min_x[4]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [4]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[5]_i_1 
       (.I0(data0_out[5]),
        .I1(y_min_x[5]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [5]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[6]_i_1 
       (.I0(data0_out[6]),
        .I1(y_min_x[6]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [6]));
  LUT6 #(
    .INIT(64'h000000000000222A)) 
    \y[7]_i_1 
       (.I0(state[1]),
        .I1(out),
        .I2(CO),
        .I3(x_equal_y),
        .I4(state[2]),
        .I5(\y_reg[0] ),
        .O(\y_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[7]_i_2 
       (.I0(data0_out[7]),
        .I1(y_min_x[7]),
        .I2(out),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\y_reg[0] ),
        .O(\y_reg[7] [7]));
endmodule

module gcd_calculator
   (Q,
    \y_reg[0] ,
    \gcd_reg[7] ,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[2]_0 ,
    slave_select_OBUF,
    out,
    \FSM_sequential_state_reg[1]_1 ,
    \rst_sreg_reg[0] ,
    \bbstub_douta[2] ,
    in0,
    \state_reg[0] ,
    \data_y_reg[7] ,
    \data_x_reg[7] ,
    clock_IBUF_BUFG);
  output [7:0]Q;
  output \y_reg[0] ;
  output \gcd_reg[7] ;
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[2]_0 ;
  output slave_select_OBUF;
  input [2:0]out;
  input \FSM_sequential_state_reg[1]_1 ;
  input [0:0]\rst_sreg_reg[0] ;
  input \bbstub_douta[2] ;
  input [1:0]in0;
  input \state_reg[0] ;
  input [7:0]\data_y_reg[7] ;
  input [7:0]\data_x_reg[7] ;
  input clock_IBUF_BUFG;

  wire \/i__n_0 ;
  wire \FSM_sequential_state[1]_i_1__0_n_0 ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[2]_0 ;
  wire [7:0]Q;
  wire \bbstub_douta[2] ;
  wire clock_IBUF_BUFG;
  wire [7:0]\data_x_reg[7] ;
  wire [7:0]\data_y_reg[7] ;
  wire gcd_core_instance_n_14;
  wire gcd_core_instance_n_15;
  wire gcd_core_instance_n_16;
  wire gcd_core_instance_n_17;
  wire gcd_core_instance_n_8;
  wire gcd_core_instance_n_9;
  wire \gcd_reg[7] ;
  wire i___0_i_1_n_0;
  wire [1:0]in0;
  wire [2:0]out;
  wire [0:0]\rst_sreg_reg[0] ;
  wire slave_select_OBUF;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire \state_reg[0] ;
  wire \y_reg[0] ;

  LUT2 #(
    .INIT(4'hE)) 
    \/i_ 
       (.I0(state[2]),
        .I1(state[0]),
        .O(\/i__n_0 ));
  LUT6 #(
    .INIT(64'h0000540400000000)) 
    \/i___0 
       (.I0(i___0_i_1_n_0),
        .I1(gcd_core_instance_n_16),
        .I2(gcd_core_instance_n_9),
        .I3(gcd_core_instance_n_17),
        .I4(gcd_core_instance_n_8),
        .I5(state[2]),
        .O(\y_reg[0] ));
  LUT4 #(
    .INIT(16'hBC14)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[1]),
        .O(\FSM_sequential_state[1]_i_1__0_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_core_instance_n_14),
        .Q(state[0]),
        .R(\rst_sreg_reg[0] ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1__0_n_0 ),
        .Q(state[1]),
        .R(\rst_sreg_reg[0] ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_core_instance_n_15),
        .Q(state[2]),
        .R(\rst_sreg_reg[0] ));
  gcd_core gcd_core_instance
       (.\FSM_sequential_state_reg[0] (gcd_core_instance_n_14),
        .\FSM_sequential_state_reg[0]_0 (\y_reg[0] ),
        .\FSM_sequential_state_reg[1] (\FSM_sequential_state_reg[1]_0 ),
        .\FSM_sequential_state_reg[1]_0 (\FSM_sequential_state_reg[1]_1 ),
        .\FSM_sequential_state_reg[1]_1 (i___0_i_1_n_0),
        .\FSM_sequential_state_reg[2] (\FSM_sequential_state_reg[2]_0 ),
        .\FSM_sequential_state_reg[2]_0 (gcd_core_instance_n_15),
        .\FSM_sequential_state_reg[2]_1 (state),
        .\FSM_sequential_state_reg[2]_2 (out),
        .\FSM_sequential_state_reg[2]_3 (\/i__n_0 ),
        .\FSM_sequential_state_reg[2]_4 ({state[2],state[0]}),
        .Q(Q),
        .\bbstub_douta[2] (\bbstub_douta[2] ),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .\data_x_reg[7] (\data_x_reg[7] ),
        .\data_y_reg[7] (\data_y_reg[7] ),
        .\gcd_reg[7] (\gcd_reg[7] ),
        .in0(in0),
        .out(gcd_core_instance_n_9),
        .\rst_sreg_reg[0] (\rst_sreg_reg[0] ),
        .slave_select_OBUF(slave_select_OBUF),
        .\state_reg[0] (\state_reg[0] ),
        .\y_reg[0] (gcd_core_instance_n_8),
        .\y_reg[0]_0 (gcd_core_instance_n_16),
        .\y_reg[0]_1 (gcd_core_instance_n_17));
  LUT2 #(
    .INIT(4'hE)) 
    i___0_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .O(i___0_i_1_n_0));
endmodule

module gcd_core
   (Q,
    \y_reg[0] ,
    out,
    \gcd_reg[7] ,
    \FSM_sequential_state_reg[1] ,
    \FSM_sequential_state_reg[2] ,
    slave_select_OBUF,
    \FSM_sequential_state_reg[0] ,
    \FSM_sequential_state_reg[2]_0 ,
    \y_reg[0]_0 ,
    \y_reg[0]_1 ,
    \FSM_sequential_state_reg[2]_1 ,
    \FSM_sequential_state_reg[0]_0 ,
    \FSM_sequential_state_reg[2]_2 ,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[2]_3 ,
    \rst_sreg_reg[0] ,
    \FSM_sequential_state_reg[1]_1 ,
    \bbstub_douta[2] ,
    in0,
    \state_reg[0] ,
    \data_y_reg[7] ,
    \data_x_reg[7] ,
    \FSM_sequential_state_reg[2]_4 ,
    clock_IBUF_BUFG);
  output [7:0]Q;
  output \y_reg[0] ;
  output [0:0]out;
  output \gcd_reg[7] ;
  output \FSM_sequential_state_reg[1] ;
  output \FSM_sequential_state_reg[2] ;
  output slave_select_OBUF;
  output \FSM_sequential_state_reg[0] ;
  output \FSM_sequential_state_reg[2]_0 ;
  output \y_reg[0]_0 ;
  output \y_reg[0]_1 ;
  input [2:0]\FSM_sequential_state_reg[2]_1 ;
  input \FSM_sequential_state_reg[0]_0 ;
  input [2:0]\FSM_sequential_state_reg[2]_2 ;
  input \FSM_sequential_state_reg[1]_0 ;
  input \FSM_sequential_state_reg[2]_3 ;
  input [0:0]\rst_sreg_reg[0] ;
  input \FSM_sequential_state_reg[1]_1 ;
  input \bbstub_douta[2] ;
  input [1:0]in0;
  input \state_reg[0] ;
  input [7:0]\data_y_reg[7] ;
  input [7:0]\data_x_reg[7] ;
  input [1:0]\FSM_sequential_state_reg[2]_4 ;
  input clock_IBUF_BUFG;

  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[2] ;
  wire \FSM_sequential_state_reg[2]_0 ;
  wire [2:0]\FSM_sequential_state_reg[2]_1 ;
  wire [2:0]\FSM_sequential_state_reg[2]_2 ;
  wire \FSM_sequential_state_reg[2]_3 ;
  wire [1:0]\FSM_sequential_state_reg[2]_4 ;
  wire [7:0]Q;
  wire \bbstub_douta[2] ;
  wire clock_IBUF_BUFG;
  wire [7:0]data0_out;
  wire [7:0]\data_x_reg[7] ;
  wire [7:0]\data_y_reg[7] ;
  wire datapath_n_25;
  wire datapath_n_35;
  wire datapath_n_36;
  wire datapath_n_37;
  wire fsm_n_0;
  wire fsm_n_10;
  wire fsm_n_11;
  wire fsm_n_12;
  wire fsm_n_13;
  wire fsm_n_14;
  wire fsm_n_15;
  wire fsm_n_16;
  wire fsm_n_17;
  wire fsm_n_18;
  wire fsm_n_19;
  wire fsm_n_2;
  wire fsm_n_20;
  wire fsm_n_21;
  wire fsm_n_22;
  wire fsm_n_7;
  wire fsm_n_8;
  wire fsm_n_9;
  wire \gcd_reg[7] ;
  wire [1:0]in0;
  wire [0:0]out;
  wire [0:0]\rst_sreg_reg[0] ;
  wire slave_select_OBUF;
  wire \state_reg[0] ;
  wire x_equal_y;
  wire x_greater_y;
  wire [7:0]x_min_y;
  wire [7:0]y_min_x;
  wire \y_reg[0] ;
  wire \y_reg[0]_0 ;
  wire \y_reg[0]_1 ;

  dp datapath
       (.CO(x_greater_y),
        .D({fsm_n_7,fsm_n_8,fsm_n_9,fsm_n_10,fsm_n_11,fsm_n_12,fsm_n_13,fsm_n_14}),
        .E(fsm_n_0),
        .\FSM_sequential_state_reg[0] ({fsm_n_15,fsm_n_16,fsm_n_17,fsm_n_18,fsm_n_19,fsm_n_20,fsm_n_21,fsm_n_22}),
        .\FSM_sequential_state_reg[1] (datapath_n_35),
        .\FSM_sequential_state_reg[1]_0 (datapath_n_36),
        .\FSM_sequential_state_reg[1]_1 (datapath_n_37),
        .\FSM_sequential_state_reg[1]_2 (fsm_n_2),
        .\FSM_sequential_state_reg[2] (\FSM_sequential_state_reg[2]_1 ),
        .Q(Q),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .data0_out(data0_out),
        .\data_x_reg[7] (\data_x_reg[7] ),
        .\data_y_reg[7] (\data_y_reg[7] ),
        .\rst_sreg_reg[0] (\rst_sreg_reg[0] ),
        .x_equal_y(x_equal_y),
        .x_min_y(x_min_y),
        .y_min_x(y_min_x),
        .\y_reg[0]_0 (datapath_n_25));
  fsm fsm
       (.CO(x_greater_y),
        .D({fsm_n_7,fsm_n_8,fsm_n_9,fsm_n_10,fsm_n_11,fsm_n_12,fsm_n_13,fsm_n_14}),
        .E(fsm_n_0),
        .\FSM_sequential_state_reg[0]_0 (\FSM_sequential_state_reg[0] ),
        .\FSM_sequential_state_reg[0]_1 (\FSM_sequential_state_reg[0]_0 ),
        .\FSM_sequential_state_reg[1]_0 (\FSM_sequential_state_reg[1] ),
        .\FSM_sequential_state_reg[1]_1 (\FSM_sequential_state_reg[1]_0 ),
        .\FSM_sequential_state_reg[1]_2 (\FSM_sequential_state_reg[1]_1 ),
        .\FSM_sequential_state_reg[2]_0 (\FSM_sequential_state_reg[2] ),
        .\FSM_sequential_state_reg[2]_1 (\FSM_sequential_state_reg[2]_0 ),
        .\FSM_sequential_state_reg[2]_2 (\FSM_sequential_state_reg[2]_1 ),
        .\FSM_sequential_state_reg[2]_3 (\FSM_sequential_state_reg[2]_2 ),
        .\FSM_sequential_state_reg[2]_4 (\FSM_sequential_state_reg[2]_3 ),
        .\FSM_sequential_state_reg[2]_5 (\FSM_sequential_state_reg[2]_4 ),
        .\bbstub_douta[2] (\bbstub_douta[2] ),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .data0_out(data0_out),
        .\gcd_reg[7] (\gcd_reg[7] ),
        .in0(in0),
        .out(out),
        .\rst_sreg_reg[0] (\rst_sreg_reg[0] ),
        .slave_select_OBUF(slave_select_OBUF),
        .\state_reg[0] (\state_reg[0] ),
        .x_equal_y(x_equal_y),
        .x_min_y(x_min_y),
        .\x_reg[0] (datapath_n_37),
        .\x_reg[4] (datapath_n_36),
        .\x_reg[6] (datapath_n_35),
        .y_min_x(y_min_x),
        .\y_reg[0] (\y_reg[0] ),
        .\y_reg[0]_0 (fsm_n_2),
        .\y_reg[0]_1 (\y_reg[0]_0 ),
        .\y_reg[0]_2 (\y_reg[0]_1 ),
        .\y_reg[3] (datapath_n_25),
        .\y_reg[7] ({fsm_n_15,fsm_n_16,fsm_n_17,fsm_n_18,fsm_n_19,fsm_n_20,fsm_n_21,fsm_n_22}));
endmodule

(* NotValidForBitStream *)
module hardware_wrapper
   (clock,
    reset_button,
    slave_select,
    spi_clock,
    mosi);
  input clock;
  input reset_button;
  output slave_select;
  output spi_clock;
  output mosi;

  wire clock;
  wire clock_IBUF;
  wire clock_IBUF_BUFG;
  wire mosi;
  wire mosi_OBUF;
  wire reset;
  wire reset_button;
  wire reset_button_IBUF;
  wire slave_select;
  wire slave_select_OBUF;
  wire spi_clock;
  wire spi_clock_OBUF;

  BUFG clock_IBUF_BUFG_inst
       (.I(clock_IBUF),
        .O(clock_IBUF_BUFG));
  IBUF clock_IBUF_inst
       (.I(clock),
        .O(clock_IBUF));
  debounce debounce_instance
       (.D(reset_button_IBUF),
        .Q(reset),
        .clock_IBUF_BUFG(clock_IBUF_BUFG));
  memory_reader memory_reader_instance
       (.Q(reset),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .mosi_OBUF(mosi_OBUF),
        .slave_select_OBUF(slave_select_OBUF),
        .spi_clock_OBUF(spi_clock_OBUF));
  OBUF mosi_OBUF_inst
       (.I(mosi_OBUF),
        .O(mosi));
  IBUF reset_button_IBUF_inst
       (.I(reset_button),
        .O(reset_button_IBUF));
  OBUF slave_select_OBUF_inst
       (.I(slave_select_OBUF),
        .O(slave_select));
  OBUF spi_clock_OBUF_inst
       (.I(spi_clock_OBUF),
        .O(spi_clock));
endmodule

module memory_reader
   (spi_clock_OBUF,
    slave_select_OBUF,
    mosi_OBUF,
    clock_IBUF_BUFG,
    Q);
  output spi_clock_OBUF;
  output slave_select_OBUF;
  output mosi_OBUF;
  input clock_IBUF_BUFG;
  input [0:0]Q;

  wire \/i__n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire [0:0]Q;
  wire [4:0]address_reg__0;
  wire clock_IBUF_BUFG;
  wire [7:0]data;
  wire [7:0]data_x;
  wire \data_x[7]_i_1_n_0 ;
  wire [7:0]data_y;
  wire \data_y[7]_i_1_n_0 ;
  wire enable;
  wire [7:0]gcd;
  wire gcd_calculator_instance_n_10;
  wire gcd_calculator_instance_n_11;
  wire gcd_calculator_instance_n_8;
  wire gcd_calculator_instance_n_9;
  wire [7:0]memory_out;
  wire mosi_OBUF;
  wire [4:0]p_0_in__0;
  wire slave_select_OBUF;
  wire spi_clock_OBUF;
  wire spi_instance_n_1;
  wire spi_instance_n_2;
  wire spi_instance_n_3;
  wire spi_instance_n_5;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire [7:0]x;

  LUT2 #(
    .INIT(4'h7)) 
    \/i_ 
       (.I0(state[1]),
        .I1(state[0]),
        .O(\/i__n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(memory_out[4]),
        .I1(memory_out[5]),
        .I2(memory_out[7]),
        .I3(memory_out[6]),
        .I4(\FSM_sequential_state[1]_i_3_n_0 ),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(memory_out[1]),
        .I1(memory_out[0]),
        .I2(memory_out[3]),
        .I3(memory_out[2]),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(spi_instance_n_5),
        .Q(state[0]),
        .R(Q));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_calculator_instance_n_10),
        .Q(state[1]),
        .R(Q));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_calculator_instance_n_11),
        .Q(state[2]),
        .R(Q));
  LUT1 #(
    .INIT(2'h1)) 
    \address[0]_i_1 
       (.I0(address_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \address[1]_i_1 
       (.I0(address_reg__0[0]),
        .I1(address_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \address[2]_i_1 
       (.I0(address_reg__0[0]),
        .I1(address_reg__0[1]),
        .I2(address_reg__0[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \address[3]_i_1 
       (.I0(address_reg__0[1]),
        .I1(address_reg__0[0]),
        .I2(address_reg__0[2]),
        .I3(address_reg__0[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \address[4]_i_2 
       (.I0(address_reg__0[2]),
        .I1(address_reg__0[0]),
        .I2(address_reg__0[1]),
        .I3(address_reg__0[3]),
        .I4(address_reg__0[4]),
        .O(p_0_in__0[4]));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(enable),
        .D(p_0_in__0[0]),
        .Q(address_reg__0[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(enable),
        .D(p_0_in__0[1]),
        .Q(address_reg__0[1]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(enable),
        .D(p_0_in__0[2]),
        .Q(address_reg__0[2]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(enable),
        .D(p_0_in__0[3]),
        .Q(address_reg__0[3]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(enable),
        .D(p_0_in__0[4]),
        .Q(address_reg__0[4]),
        .R(Q));
  (* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *) 
  blk_mem_gen_0 block_memory
       (.addra(address_reg__0),
        .clka(clock_IBUF_BUFG),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(memory_out),
        .ena(spi_instance_n_3),
        .wea(1'b0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.CLR(1'b0),
        .D(gcd[0]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.CLR(1'b0),
        .D(gcd[1]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.CLR(1'b0),
        .D(gcd[2]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.CLR(1'b0),
        .D(gcd[3]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.CLR(1'b0),
        .D(gcd[4]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.CLR(1'b0),
        .D(gcd[5]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.CLR(1'b0),
        .D(gcd[6]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.CLR(1'b0),
        .D(gcd[7]),
        .G(spi_instance_n_1),
        .GE(1'b1),
        .Q(data[7]));
  LUT5 #(
    .INIT(32'h00000004)) 
    \data_x[7]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(Q),
        .O(\data_x[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(data_x[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(data_x[1]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(data_x[2]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(data_x[3]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[4]),
        .Q(data_x[4]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[5]),
        .Q(data_x[5]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[6]),
        .Q(data_x[6]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_x[7]_i_1_n_0 ),
        .D(memory_out[7]),
        .Q(data_x[7]),
        .R(Q));
  LUT4 #(
    .INIT(16'h0010)) 
    \data_y[7]_i_1 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(Q),
        .O(\data_y[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(data_y[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(data_y[1]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(data_y[2]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(data_y[3]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[4]),
        .Q(data_y[4]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[5]),
        .Q(data_y[5]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[6]),
        .Q(data_y[6]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\data_y[7]_i_1_n_0 ),
        .D(memory_out[7]),
        .Q(data_y[7]),
        .R(Q));
  gcd_calculator gcd_calculator_instance
       (.\FSM_sequential_state_reg[1]_0 (gcd_calculator_instance_n_10),
        .\FSM_sequential_state_reg[1]_1 (\/i__n_0 ),
        .\FSM_sequential_state_reg[2]_0 (gcd_calculator_instance_n_11),
        .Q(x),
        .\bbstub_douta[2] (\FSM_sequential_state[1]_i_2_n_0 ),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .\data_x_reg[7] (data_x),
        .\data_y_reg[7] (data_y),
        .\gcd_reg[7] (gcd_calculator_instance_n_9),
        .in0(state[2:1]),
        .out(state),
        .\rst_sreg_reg[0] (Q),
        .slave_select_OBUF(slave_select_OBUF),
        .\state_reg[0] (spi_instance_n_2),
        .\y_reg[0] (gcd_calculator_instance_n_8));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[0]),
        .Q(gcd[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[1]),
        .Q(gcd[1]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[2]),
        .Q(gcd[2]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[3]),
        .Q(gcd[3]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[4]),
        .Q(gcd[4]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[5]),
        .Q(gcd[5]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[6]),
        .Q(gcd[6]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \gcd_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(gcd_calculator_instance_n_9),
        .D(x[7]),
        .Q(gcd[7]),
        .R(Q));
  spi spi_instance
       (.E(enable),
        .\FSM_sequential_state_reg[0] (spi_instance_n_5),
        .\FSM_sequential_state_reg[0]_0 (gcd_calculator_instance_n_8),
        .\FSM_sequential_state_reg[2] (spi_instance_n_2),
        .\FSM_sequential_state_reg[2]_0 (gcd_calculator_instance_n_9),
        .Q(Q),
        .\address_reg[2]_0 (spi_clock_OBUF),
        .\bbstub_douta[2] (\FSM_sequential_state[1]_i_2_n_0 ),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .ena(spi_instance_n_3),
        .\gcd_reg[7] (data),
        .in0(state[0]),
        .mosi_OBUF(mosi_OBUF),
        .out(state),
        .\state_reg[1]_0 (spi_instance_n_1));
endmodule

module spi
   (\address_reg[2]_0 ,
    \state_reg[1]_0 ,
    \FSM_sequential_state_reg[2] ,
    ena,
    E,
    \FSM_sequential_state_reg[0] ,
    mosi_OBUF,
    clock_IBUF_BUFG,
    out,
    \FSM_sequential_state_reg[0]_0 ,
    Q,
    \bbstub_douta[2] ,
    \FSM_sequential_state_reg[2]_0 ,
    in0,
    \gcd_reg[7] );
  output \address_reg[2]_0 ;
  output \state_reg[1]_0 ;
  output \FSM_sequential_state_reg[2] ;
  output ena;
  output [0:0]E;
  output \FSM_sequential_state_reg[0] ;
  output mosi_OBUF;
  input clock_IBUF_BUFG;
  input [2:0]out;
  input \FSM_sequential_state_reg[0]_0 ;
  input [0:0]Q;
  input \bbstub_douta[2] ;
  input [0:0]\FSM_sequential_state_reg[2]_0 ;
  input [0:0]in0;
  input [7:0]\gcd_reg[7] ;

  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_2__1_n_0 ;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[2] ;
  wire [0:0]\FSM_sequential_state_reg[2]_0 ;
  wire [0:0]Q;
  wire [2:0]address;
  wire \address[0]_i_1_n_0 ;
  wire \address[1]_i_1_n_0 ;
  wire \address[2]_i_1_n_0 ;
  wire \address_reg[2]_0 ;
  wire \bbstub_douta[2] ;
  wire clock_IBUF_BUFG;
  wire clock_counter;
  wire \clock_counter[0]_i_1_n_0 ;
  wire ena;
  wire end_of_message__1;
  wire [7:0]\gcd_reg[7] ;
  wire [0:0]in0;
  wire mosi_OBUF;
  wire mosi_OBUF_inst_i_2_n_0;
  wire mosi_OBUF_inst_i_3_n_0;
  wire [2:0]out;
  wire spi_clock_i_1_n_0;
  wire [1:0]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state_reg[1]_0 ;

  LUT6 #(
    .INIT(64'hF3F0FF5F03000F5F)) 
    \FSM_sequential_state[0]_i_1__1 
       (.I0(\FSM_sequential_state[0]_i_2__1_n_0 ),
        .I1(\FSM_sequential_state_reg[2]_0 ),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .I5(in0),
        .O(\FSM_sequential_state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \FSM_sequential_state[0]_i_2__1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\bbstub_douta[2] ),
        .O(\FSM_sequential_state[0]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFF97)) 
    \address[0]_i_1 
       (.I0(address[0]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(Q),
        .O(\address[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFAB97)) 
    \address[1]_i_1 
       (.I0(address[1]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(address[0]),
        .I4(Q),
        .O(\address[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFABABAB97)) 
    \address[2]_i_1 
       (.I0(address[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(address[1]),
        .I4(address[0]),
        .I5(Q),
        .O(\address[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0100000015151515)) 
    \address[4]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(\bbstub_douta[2] ),
        .I3(state[0]),
        .I4(state[1]),
        .I5(out[2]),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(\address_reg[2]_0 ),
        .CE(1'b1),
        .D(\address[0]_i_1_n_0 ),
        .Q(address[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(\address_reg[2]_0 ),
        .CE(1'b1),
        .D(\address[1]_i_1_n_0 ),
        .Q(address[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(\address_reg[2]_0 ),
        .CE(1'b1),
        .D(\address[2]_i_1_n_0 ),
        .Q(address[2]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    block_memory_i_1
       (.I0(E),
        .I1(Q),
        .O(ena));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \clock_counter[0]_i_1 
       (.I0(clock_counter),
        .I1(Q),
        .O(\clock_counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_counter_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\clock_counter[0]_i_1_n_0 ),
        .Q(clock_counter),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000050080008)) 
    \data_reg[7]_i_1 
       (.I0(out[2]),
        .I1(\FSM_sequential_state_reg[2] ),
        .I2(out[1]),
        .I3(out[0]),
        .I4(\FSM_sequential_state_reg[0]_0 ),
        .I5(Q),
        .O(\state_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h2800282828000000)) 
    mosi_OBUF_inst_i_1
       (.I0(\state_reg[1]_0 ),
        .I1(state[0]),
        .I2(state[1]),
        .I3(mosi_OBUF_inst_i_2_n_0),
        .I4(address[2]),
        .I5(mosi_OBUF_inst_i_3_n_0),
        .O(mosi_OBUF));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mosi_OBUF_inst_i_2
       (.I0(\gcd_reg[7] [7]),
        .I1(\gcd_reg[7] [6]),
        .I2(address[1]),
        .I3(\gcd_reg[7] [5]),
        .I4(address[0]),
        .I5(\gcd_reg[7] [4]),
        .O(mosi_OBUF_inst_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mosi_OBUF_inst_i_3
       (.I0(\gcd_reg[7] [3]),
        .I1(\gcd_reg[7] [2]),
        .I2(address[1]),
        .I3(\gcd_reg[7] [1]),
        .I4(address[0]),
        .I5(\gcd_reg[7] [0]),
        .O(mosi_OBUF_inst_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    slave_select_OBUF_inst_i_2
       (.I0(state[0]),
        .I1(state[1]),
        .O(\FSM_sequential_state_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h06)) 
    spi_clock_i_1
       (.I0(\address_reg[2]_0 ),
        .I1(clock_counter),
        .I2(Q),
        .O(spi_clock_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    spi_clock_reg
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(spi_clock_i_1_n_0),
        .Q(\address_reg[2]_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h000088E2)) 
    \state[0]_i_1 
       (.I0(\state_reg[1]_0 ),
        .I1(state[1]),
        .I2(end_of_message__1),
        .I3(state[0]),
        .I4(Q),
        .O(\state[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \state[0]_i_2 
       (.I0(address[2]),
        .I1(address[0]),
        .I2(address[1]),
        .O(end_of_message__1));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h00E6)) 
    \state[1]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\state_reg[1]_0 ),
        .I3(Q),
        .O(\state[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(\address_reg[2]_0 ),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(\address_reg[2]_0 ),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module blk_mem_gen_0blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module blk_mem_gen_0blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_13 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_21 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_29 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9 ;
  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000002010202030202010000030202020001020300010002),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,addra,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,addra,1'b1,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[3:2],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[1:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:6],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[5:4]}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_5 ,douta[3:2],\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_13 ,douta[1:0]}),
        .DOBDO({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_21 ,douta[7:6],\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_29 ,douta[5:4]}),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33 }),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35 }),
        .ENARDEN(ena),
        .ENBWREN(ena),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,wea,wea}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module blk_mem_gen_0blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "5" *) (* C_ADDRB_WIDTH = "5" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.64555 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
(* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "17" *) (* C_READ_DEPTH_B = "17" *) (* C_READ_WIDTH_A = "8" *) 
(* C_READ_WIDTH_B = "8" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "1" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "17" *) (* C_WRITE_DEPTH_B = "17" *) (* C_WRITE_MODE_A = "READ_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "8" *) (* C_WRITE_WIDTH_B = "8" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_3_5" *) (* downgradeipidentifiedwarnings = "yes" *) 
module blk_mem_gen_0blk_mem_gen_v8_3_5
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [4:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [4:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [4:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [7:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [7:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [4:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  blk_mem_gen_0blk_mem_gen_v8_3_5_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_5_synth" *) 
module blk_mem_gen_0blk_mem_gen_v8_3_5_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

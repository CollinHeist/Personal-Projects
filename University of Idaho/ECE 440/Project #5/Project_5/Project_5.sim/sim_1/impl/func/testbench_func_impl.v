// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Feb 26 12:59:31 2020
// Host        : ece-bel215-02 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {U:/ECE
//               440/Project_5/Project_5.sim/sim_1/impl/func/testbench_func_impl.v}
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
    douta,
    pwropt,
    pwropt_1);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;
  input pwropt;
  input pwropt_1;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire pwropt;
  wire pwropt_1;
  wire [0:0]wea;
  wire NLW_U0_clkb_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_deepsleep_UNCONNECTED;
  wire NLW_U0_eccpipece_UNCONNECTED;
  wire NLW_U0_enb_UNCONNECTED;
  wire NLW_U0_injectdbiterr_UNCONNECTED;
  wire NLW_U0_injectsbiterr_UNCONNECTED;
  wire NLW_U0_regcea_UNCONNECTED;
  wire NLW_U0_regceb_UNCONNECTED;
  wire NLW_U0_rsta_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_aclk_UNCONNECTED;
  wire NLW_U0_s_aresetn_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_arvalid_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_awvalid_UNCONNECTED;
  wire NLW_U0_s_axi_bready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_injectdbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_injectsbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rready_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wlast_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axi_wvalid_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_shutdown_UNCONNECTED;
  wire NLW_U0_sleep_UNCONNECTED;
  wire [4:0]NLW_U0_addrb_UNCONNECTED;
  wire [7:0]NLW_U0_dinb_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_arlen_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_arsize_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_awlen_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_awsize_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_web_UNCONNECTED;

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
        .addrb(NLW_U0_addrb_UNCONNECTED[4:0]),
        .clka(clka),
        .clkb(NLW_U0_clkb_UNCONNECTED),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(NLW_U0_deepsleep_UNCONNECTED),
        .dina(dina),
        .dinb(NLW_U0_dinb_UNCONNECTED[7:0]),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(NLW_U0_eccpipece_UNCONNECTED),
        .ena(ena),
        .enb(NLW_U0_enb_UNCONNECTED),
        .injectdbiterr(NLW_U0_injectdbiterr_UNCONNECTED),
        .injectsbiterr(NLW_U0_injectsbiterr_UNCONNECTED),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[4:0]),
        .regcea(NLW_U0_regcea_UNCONNECTED),
        .regceb(NLW_U0_regceb_UNCONNECTED),
        .rsta(NLW_U0_rsta_UNCONNECTED),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(NLW_U0_rstb_UNCONNECTED),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(NLW_U0_s_aclk_UNCONNECTED),
        .s_aresetn(NLW_U0_s_aresetn_UNCONNECTED),
        .s_axi_araddr(NLW_U0_s_axi_araddr_UNCONNECTED[31:0]),
        .s_axi_arburst(NLW_U0_s_axi_arburst_UNCONNECTED[1:0]),
        .s_axi_arid(NLW_U0_s_axi_arid_UNCONNECTED[3:0]),
        .s_axi_arlen(NLW_U0_s_axi_arlen_UNCONNECTED[7:0]),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize(NLW_U0_s_axi_arsize_UNCONNECTED[2:0]),
        .s_axi_arvalid(NLW_U0_s_axi_arvalid_UNCONNECTED),
        .s_axi_awaddr(NLW_U0_s_axi_awaddr_UNCONNECTED[31:0]),
        .s_axi_awburst(NLW_U0_s_axi_awburst_UNCONNECTED[1:0]),
        .s_axi_awid(NLW_U0_s_axi_awid_UNCONNECTED[3:0]),
        .s_axi_awlen(NLW_U0_s_axi_awlen_UNCONNECTED[7:0]),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize(NLW_U0_s_axi_awsize_UNCONNECTED[2:0]),
        .s_axi_awvalid(NLW_U0_s_axi_awvalid_UNCONNECTED),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(NLW_U0_s_axi_bready_UNCONNECTED),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(NLW_U0_s_axi_injectdbiterr_UNCONNECTED),
        .s_axi_injectsbiterr(NLW_U0_s_axi_injectsbiterr_UNCONNECTED),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[4:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(NLW_U0_s_axi_rready_UNCONNECTED),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata(NLW_U0_s_axi_wdata_UNCONNECTED[7:0]),
        .s_axi_wlast(NLW_U0_s_axi_wlast_UNCONNECTED),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(NLW_U0_s_axi_wstrb_UNCONNECTED[0]),
        .s_axi_wvalid(NLW_U0_s_axi_wvalid_UNCONNECTED),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(NLW_U0_shutdown_UNCONNECTED),
        .sleep(NLW_U0_sleep_UNCONNECTED),
        .wea(wea),
        .web(NLW_U0_web_UNCONNECTED[0]));
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
    \reset_register_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(p_0_in),
        .Q(Q),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \reset_register_reg[1] 
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
    reset_fsm2_out,
    \y_reg[7]_0 ,
    x_equal_y,
    \FSM_sequential_state_reg[1] ,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[1]_1 ,
    \FSM_sequential_state_reg[1]_2 ,
    \FSM_sequential_state_reg[2] ,
    \reset_register_reg[0] ,
    E,
    D,
    clock_IBUF_BUFG,
    \FSM_sequential_state_reg[1]_3 ,
    \FSM_sequential_state_reg[0] );
  output [7:0]x_min_y;
  output [7:0]Q;
  output [7:0]y_min_x;
  output [0:0]CO;
  output reset_fsm2_out;
  output \y_reg[7]_0 ;
  output x_equal_y;
  output \FSM_sequential_state_reg[1] ;
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[1]_1 ;
  output \FSM_sequential_state_reg[1]_2 ;
  input [2:0]\FSM_sequential_state_reg[2] ;
  input [0:0]\reset_register_reg[0] ;
  input [0:0]E;
  input [7:0]D;
  input clock_IBUF_BUFG;
  input [0:0]\FSM_sequential_state_reg[1]_3 ;
  input [7:0]\FSM_sequential_state_reg[0] ;

  wire [0:0]CO;
  wire [7:0]D;
  wire [0:0]E;
  wire [7:0]\FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[1]_2 ;
  wire [0:0]\FSM_sequential_state_reg[1]_3 ;
  wire [2:0]\FSM_sequential_state_reg[2] ;
  wire [7:0]Q;
  wire clock_IBUF_BUFG;
  wire reset_fsm2_out;
  wire [0:0]\reset_register_reg[0] ;
  wire x_equal_y;
  wire x_greater_y_carry_i_1_n_0;
  wire x_greater_y_carry_i_2_n_0;
  wire x_greater_y_carry_i_3_n_0;
  wire x_greater_y_carry_i_4_n_0;
  wire x_greater_y_carry_i_5_n_0;
  wire x_greater_y_carry_i_6_n_0;
  wire x_greater_y_carry_i_7_n_0;
  wire x_greater_y_carry_i_8_n_0;
  wire [7:0]x_min_y;
  wire x_min_y_carry__0_i_1_n_0;
  wire x_min_y_carry__0_i_2_n_0;
  wire x_min_y_carry__0_i_3_n_0;
  wire x_min_y_carry__0_i_4_n_0;
  wire x_min_y_carry_i_1_n_0;
  wire x_min_y_carry_i_2_n_0;
  wire x_min_y_carry_i_3_n_0;
  wire x_min_y_carry_i_4_n_0;
  wire x_min_y_carry_n_0;
  wire [7:0]y;
  wire [7:0]y_min_x;
  wire y_min_x_carry__0_i_1_n_0;
  wire y_min_x_carry__0_i_2_n_0;
  wire y_min_x_carry__0_i_3_n_0;
  wire y_min_x_carry__0_i_4_n_0;
  wire y_min_x_carry_i_1_n_0;
  wire y_min_x_carry_i_2_n_0;
  wire y_min_x_carry_i_3_n_0;
  wire y_min_x_carry_i_4_n_0;
  wire y_min_x_carry_n_0;
  wire \y_reg[7]_0 ;
  wire [2:0]NLW_x_greater_y_carry_CO_UNCONNECTED;
  wire [3:0]NLW_x_greater_y_carry_O_UNCONNECTED;
  wire [2:0]NLW_x_min_y_carry_CO_UNCONNECTED;
  wire [3:0]NLW_x_min_y_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_y_min_x_carry_CO_UNCONNECTED;
  wire [3:0]NLW_y_min_x_carry__0_CO_UNCONNECTED;

  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [0]),
        .I2(\FSM_sequential_state_reg[2] [1]),
        .I3(\reset_register_reg[0] ),
        .O(reset_fsm2_out));
  LUT4 #(
    .INIT(16'h0004)) 
    update_x_i_1
       (.I0(\FSM_sequential_state_reg[1] ),
        .I1(\FSM_sequential_state_reg[1]_0 ),
        .I2(\FSM_sequential_state_reg[1]_1 ),
        .I3(\FSM_sequential_state_reg[1]_2 ),
        .O(x_equal_y));
  LUT4 #(
    .INIT(16'h6FF6)) 
    update_x_i_3
       (.I0(Q[7]),
        .I1(y[7]),
        .I2(y[6]),
        .I3(Q[6]),
        .O(\FSM_sequential_state_reg[1] ));
  LUT4 #(
    .INIT(16'h9009)) 
    update_x_i_4
       (.I0(y[5]),
        .I1(Q[5]),
        .I2(y[4]),
        .I3(Q[4]),
        .O(\FSM_sequential_state_reg[1]_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    update_x_i_5
       (.I0(y[1]),
        .I1(Q[1]),
        .I2(y[0]),
        .I3(Q[0]),
        .O(\FSM_sequential_state_reg[1]_1 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    update_x_i_6
       (.I0(y[3]),
        .I1(Q[3]),
        .I2(y[2]),
        .I3(Q[2]),
        .O(\FSM_sequential_state_reg[1]_2 ));
  LUT4 #(
    .INIT(16'hFF01)) 
    \x[7]_i_6 
       (.I0(\FSM_sequential_state_reg[2] [2]),
        .I1(\FSM_sequential_state_reg[2] [0]),
        .I2(\FSM_sequential_state_reg[2] [1]),
        .I3(\reset_register_reg[0] ),
        .O(\y_reg[7]_0 ));
  CARRY4 x_greater_y_carry
       (.CI(1'b0),
        .CO({CO,NLW_x_greater_y_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({x_greater_y_carry_i_1_n_0,x_greater_y_carry_i_2_n_0,x_greater_y_carry_i_3_n_0,x_greater_y_carry_i_4_n_0}),
        .O(NLW_x_greater_y_carry_O_UNCONNECTED[3:0]),
        .S({x_greater_y_carry_i_5_n_0,x_greater_y_carry_i_6_n_0,x_greater_y_carry_i_7_n_0,x_greater_y_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h20F2)) 
    x_greater_y_carry_i_1
       (.I0(Q[6]),
        .I1(y[6]),
        .I2(Q[7]),
        .I3(y[7]),
        .O(x_greater_y_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h20F2)) 
    x_greater_y_carry_i_2
       (.I0(Q[4]),
        .I1(y[4]),
        .I2(Q[5]),
        .I3(y[5]),
        .O(x_greater_y_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h20F2)) 
    x_greater_y_carry_i_3
       (.I0(Q[2]),
        .I1(y[2]),
        .I2(Q[3]),
        .I3(y[3]),
        .O(x_greater_y_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h20F2)) 
    x_greater_y_carry_i_4
       (.I0(Q[0]),
        .I1(y[0]),
        .I2(Q[1]),
        .I3(y[1]),
        .O(x_greater_y_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_5
       (.I0(Q[6]),
        .I1(y[6]),
        .I2(y[7]),
        .I3(Q[7]),
        .O(x_greater_y_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_6
       (.I0(y[5]),
        .I1(Q[5]),
        .I2(y[4]),
        .I3(Q[4]),
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
        .CO({x_min_y_carry_n_0,NLW_x_min_y_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O(x_min_y[3:0]),
        .S({x_min_y_carry_i_1_n_0,x_min_y_carry_i_2_n_0,x_min_y_carry_i_3_n_0,x_min_y_carry_i_4_n_0}));
  CARRY4 x_min_y_carry__0
       (.CI(x_min_y_carry_n_0),
        .CO(NLW_x_min_y_carry__0_CO_UNCONNECTED[3:0]),
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
       (.I0(y[6]),
        .I1(Q[6]),
        .O(x_min_y_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_3
       (.I0(y[5]),
        .I1(Q[5]),
        .O(x_min_y_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_4
       (.I0(y[4]),
        .I1(Q[4]),
        .O(x_min_y_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_1
       (.I0(y[3]),
        .I1(Q[3]),
        .O(x_min_y_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_2
       (.I0(y[2]),
        .I1(Q[2]),
        .O(x_min_y_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_3
       (.I0(y[1]),
        .I1(Q[1]),
        .O(x_min_y_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_4
       (.I0(y[0]),
        .I1(Q[0]),
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
        .CO({y_min_x_carry_n_0,NLW_y_min_x_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI(y[3:0]),
        .O(y_min_x[3:0]),
        .S({y_min_x_carry_i_1_n_0,y_min_x_carry_i_2_n_0,y_min_x_carry_i_3_n_0,y_min_x_carry_i_4_n_0}));
  CARRY4 y_min_x_carry__0
       (.CI(y_min_x_carry_n_0),
        .CO(NLW_y_min_x_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,y[6:4]}),
        .O(y_min_x[7:4]),
        .S({y_min_x_carry__0_i_1_n_0,y_min_x_carry__0_i_2_n_0,y_min_x_carry__0_i_3_n_0,y_min_x_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_1
       (.I0(Q[7]),
        .I1(y[7]),
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
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [0]),
        .Q(y[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [1]),
        .Q(y[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [2]),
        .Q(y[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [3]),
        .Q(y[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [4]),
        .Q(y[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [5]),
        .Q(y[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [6]),
        .Q(y[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1]_3 ),
        .D(\FSM_sequential_state_reg[0] [7]),
        .Q(y[7]),
        .R(1'b0));
endmodule

module fsm
   (\FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[1]_1 ,
    \FSM_sequential_state_reg[2]_0 ,
    start,
    \y_reg[7] ,
    \y_reg[7]_0 ,
    D,
    E,
    \FSM_sequential_state_reg[2]_1 ,
    \FSM_sequential_state_reg[0]_0 ,
    x_equal_y,
    enable4_in,
    out,
    in0,
    done,
    \FSM_sequential_state_reg[2]_2 ,
    \reset_register_reg[0] ,
    reset_fsm2_out,
    y_min_x,
    data,
    \FSM_sequential_state_reg[2]_3 ,
    CO,
    x_min_y,
    \FSM_sequential_state_reg[2]_4 ,
    \reset_register_reg[0]_0 ,
    clock_IBUF_BUFG,
    \x_reg[7] ,
    \y_reg[5] ,
    \y_reg[1] ,
    \y_reg[3] );
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[1]_1 ;
  output \FSM_sequential_state_reg[2]_0 ;
  output start;
  output [7:0]\y_reg[7] ;
  output [0:0]\y_reg[7]_0 ;
  output [7:0]D;
  output [0:0]E;
  output \FSM_sequential_state_reg[2]_1 ;
  output \FSM_sequential_state_reg[0]_0 ;
  input x_equal_y;
  input enable4_in;
  input [2:0]out;
  input [1:0]in0;
  input done;
  input [2:0]\FSM_sequential_state_reg[2]_2 ;
  input [0:0]\reset_register_reg[0] ;
  input reset_fsm2_out;
  input [7:0]y_min_x;
  input [7:0]data;
  input \FSM_sequential_state_reg[2]_3 ;
  input [0:0]CO;
  input [7:0]x_min_y;
  input [1:0]\FSM_sequential_state_reg[2]_4 ;
  input \reset_register_reg[0]_0 ;
  input clock_IBUF_BUFG;
  input \x_reg[7] ;
  input \y_reg[5] ;
  input \y_reg[1] ;
  input \y_reg[3] ;

  wire [0:0]CO;
  wire [7:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[2]_0 ;
  wire \FSM_sequential_state_reg[2]_1 ;
  wire [2:0]\FSM_sequential_state_reg[2]_2 ;
  wire \FSM_sequential_state_reg[2]_3 ;
  wire clock_IBUF_BUFG;
  wire [7:0]data;
  wire done;
  wire done_0;
  wire enable4_in;
  wire i__i_2_n_0;
  wire i__i_3_n_0;
  wire i__i_4_n_0;
  wire load3_out;
  wire [2:0]out;
  wire reset_fsm2_out;
  wire [0:0]\reset_register_reg[0] ;
  wire \reset_register_reg[0]_0 ;
  wire start;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire update_x_n_0;
  wire \x[7]_i_3_n_0 ;
  wire \x[7]_i_4_n_0 ;
  wire x_equal_y;
  wire [7:0]x_min_y;
  wire \x_reg[7] ;
  wire \y[7]_i_3_n_0 ;
  wire \y[7]_i_4_n_0 ;
  wire [7:0]y_min_x;
  wire \y_reg[1] ;
  wire \y_reg[3] ;
  wire \y_reg[5] ;
  wire [7:0]\y_reg[7] ;
  wire [0:0]\y_reg[7]_0 ;

  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(\reset_register_reg[0] ),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [0]),
        .I4(\FSM_sequential_state_reg[2]_2 [2]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hC2)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(\reset_register_reg[0]_0 ),
        .I1(\FSM_sequential_state_reg[2]_2 [2]),
        .I2(\FSM_sequential_state_reg[2]_2 [0]),
        .O(\FSM_sequential_state_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hF5F00FCC)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(x_equal_y),
        .I1(load3_out),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000A6AE)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x_equal_y),
        .I4(reset_fsm2_out),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF30AFF00)) 
    \FSM_sequential_state[1]_i_1__1 
       (.I0(enable4_in),
        .I1(\FSM_sequential_state_reg[1]_1 ),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(\FSM_sequential_state_reg[1]_0 ));
  LUT5 #(
    .INIT(32'h0000EE2A)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(load3_out),
        .I3(\FSM_sequential_state[2]_i_3_n_0 ),
        .I4(reset_fsm2_out),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFCC4)) 
    \FSM_sequential_state[2]_i_1__0 
       (.I0(done_0),
        .I1(\FSM_sequential_state_reg[2]_2 [2]),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [0]),
        .O(\FSM_sequential_state_reg[2]_1 ));
  LUT5 #(
    .INIT(32'hFAF0F030)) 
    \FSM_sequential_state[2]_i_1__1 
       (.I0(\FSM_sequential_state_reg[1]_1 ),
        .I1(done),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(\FSM_sequential_state_reg[2]_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030040004)) 
    \FSM_sequential_state[2]_i_2__0 
       (.I0(load3_out),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(x_equal_y),
        .I5(reset_fsm2_out),
        .O(done_0));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(state[0]),
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
        .Q(state[0]),
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
  LUT5 #(
    .INIT(32'h00000200)) 
    i__i_1
       (.I0(\FSM_sequential_state_reg[2]_2 [2]),
        .I1(\FSM_sequential_state_reg[2]_2 [0]),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(i__i_2_n_0),
        .I4(\reset_register_reg[0] ),
        .O(\FSM_sequential_state_reg[1]_1 ));
  MUXF7 i__i_2
       (.I0(i__i_3_n_0),
        .I1(i__i_4_n_0),
        .O(i__i_2_n_0),
        .S(state[0]));
  LUT6 #(
    .INIT(64'h4444444444404444)) 
    i__i_3
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [2]),
        .I4(\FSM_sequential_state_reg[2]_2 [0]),
        .I5(\reset_register_reg[0] ),
        .O(i__i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    i__i_4
       (.I0(state[2]),
        .I1(state[1]),
        .I2(\x_reg[7] ),
        .I3(\y_reg[5] ),
        .I4(\y_reg[1] ),
        .I5(\y_reg[3] ),
        .O(i__i_4_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    slave_select_OBUF_inst_i_3
       (.I0(\FSM_sequential_state_reg[1]_1 ),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[1]),
        .O(start));
  LUT6 #(
    .INIT(64'h000F000020F020F0)) 
    update_x
       (.I0(CO),
        .I1(x_equal_y),
        .I2(state[0]),
        .I3(state[1]),
        .I4(load3_out),
        .I5(state[2]),
        .O(update_x_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    update_x_i_2
       (.I0(\FSM_sequential_state_reg[2]_2 [1]),
        .I1(\FSM_sequential_state_reg[2]_2 [2]),
        .I2(\FSM_sequential_state_reg[2]_2 [0]),
        .I3(\reset_register_reg[0] ),
        .O(load3_out));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[0]_i_1 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[0]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[1]_i_1 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[1]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[1]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[2]_i_1 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[2]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[2]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[3]_i_1 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[3]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[3]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[4]_i_1 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[4]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[4]),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[5]_i_1 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[5]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[5]),
        .O(D[5]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[6]_i_1 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[6]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[6]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \x[7]_i_1 
       (.I0(update_x_n_0),
        .I1(\reset_register_reg[0] ),
        .I2(\FSM_sequential_state_reg[2]_2 [1]),
        .I3(\FSM_sequential_state_reg[2]_2 [0]),
        .I4(\FSM_sequential_state_reg[2]_2 [2]),
        .O(E));
  LUT4 #(
    .INIT(16'h4F44)) 
    \x[7]_i_2 
       (.I0(\x[7]_i_3_n_0 ),
        .I1(x_min_y[7]),
        .I2(\x[7]_i_4_n_0 ),
        .I3(data[7]),
        .O(D[7]));
  LUT4 #(
    .INIT(16'h0014)) 
    \x[7]_i_3 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(reset_fsm2_out),
        .O(\x[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFEEF)) 
    \x[7]_i_4 
       (.I0(\FSM_sequential_state_reg[2]_3 ),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[2]),
        .O(\x[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[0]_i_1 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[0]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[0]),
        .O(\y_reg[7] [0]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[1]_i_1 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[1]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[1]),
        .O(\y_reg[7] [1]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[2]_i_1 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[2]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[2]),
        .O(\y_reg[7] [2]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[3]_i_1 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[3]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[3]),
        .O(\y_reg[7] [3]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[4]_i_1 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[4]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[4]),
        .O(\y_reg[7] [4]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[5]_i_1 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[5]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[5]),
        .O(\y_reg[7] [5]));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[6]_i_1 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[6]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[6]),
        .O(\y_reg[7] [6]));
  LUT6 #(
    .INIT(64'h000000000000222A)) 
    \y[7]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(CO),
        .I3(x_equal_y),
        .I4(state[2]),
        .I5(reset_fsm2_out),
        .O(\y_reg[7]_0 ));
  LUT4 #(
    .INIT(16'h4F44)) 
    \y[7]_i_2 
       (.I0(\y[7]_i_3_n_0 ),
        .I1(y_min_x[7]),
        .I2(\y[7]_i_4_n_0 ),
        .I3(data[7]),
        .O(\y_reg[7] [7]));
  LUT4 #(
    .INIT(16'h0010)) 
    \y[7]_i_3 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(reset_fsm2_out),
        .O(\y[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFEFF)) 
    \y[7]_i_4 
       (.I0(\FSM_sequential_state_reg[2]_3 ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .O(\y[7]_i_4_n_0 ));
endmodule

module gcd_calculator
   (Q,
    \FSM_sequential_state_reg[1]_0 ,
    gcd_ready,
    \FSM_sequential_state_reg[2]_0 ,
    start,
    enable4_in,
    out,
    in0,
    done,
    \reset_register_reg[0] ,
    clock_IBUF_BUFG,
    \data_x_reg[7] ,
    \data_y_reg[7] );
  output [7:0]Q;
  output \FSM_sequential_state_reg[1]_0 ;
  output gcd_ready;
  output \FSM_sequential_state_reg[2]_0 ;
  output start;
  input enable4_in;
  input [2:0]out;
  input [1:0]in0;
  input done;
  input [0:0]\reset_register_reg[0] ;
  input clock_IBUF_BUFG;
  input [7:0]\data_x_reg[7] ;
  input [7:0]\data_y_reg[7] ;

  wire \/i__n_0 ;
  wire \FSM_sequential_state[1]_i_1__0_n_0 ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[2]_0 ;
  wire [7:0]Q;
  wire clock_IBUF_BUFG;
  wire [7:0]data;
  wire [7:0]\data_x_reg[7] ;
  wire [7:0]\data_y_reg[7] ;
  wire done;
  wire enable4_in;
  wire gcd_core_instance_n_12;
  wire gcd_core_instance_n_13;
  wire gcd_ready;
  wire [2:0]out;
  wire [0:0]\reset_register_reg[0] ;
  wire start;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire [1:0]\NLW_gcd_core_instance_FSM_sequential_state_reg[2]_2_UNCONNECTED ;
  wire [1:0]NLW_gcd_core_instance_in0_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFFFFFF01000000)) 
    \/i_ 
       (.I0(\reset_register_reg[0] ),
        .I1(gcd_ready),
        .I2(out[2]),
        .I3(out[0]),
        .I4(out[1]),
        .I5(state[1]),
        .O(\/i__n_0 ));
  LUT3 #(
    .INIT(8'h9C)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[1]_i_1__0_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_core_instance_n_13),
        .Q(state[0]),
        .R(\reset_register_reg[0] ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1__0_n_0 ),
        .Q(state[1]),
        .R(\reset_register_reg[0] ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_core_instance_n_12),
        .Q(state[2]),
        .R(\reset_register_reg[0] ));
  gcd_core gcd_core_instance
       (.\FSM_sequential_state_reg[0] (gcd_core_instance_n_13),
        .\FSM_sequential_state_reg[1] (\FSM_sequential_state_reg[1]_0 ),
        .\FSM_sequential_state_reg[1]_0 (gcd_ready),
        .\FSM_sequential_state_reg[2] (\FSM_sequential_state_reg[2]_0 ),
        .\FSM_sequential_state_reg[2]_0 (gcd_core_instance_n_12),
        .\FSM_sequential_state_reg[2]_1 (state),
        .\FSM_sequential_state_reg[2]_2 (\NLW_gcd_core_instance_FSM_sequential_state_reg[2]_2_UNCONNECTED [1:0]),
        .Q(Q),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .data(data),
        .done(done),
        .enable4_in(enable4_in),
        .in0(NLW_gcd_core_instance_in0_UNCONNECTED[1:0]),
        .out(out),
        .\reset_register_reg[0] (\reset_register_reg[0] ),
        .\reset_register_reg[0]_0 (\/i__n_0 ),
        .start(start));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[0]_i_2 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [0]),
        .I2(\data_y_reg[7] [0]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[0]));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[1]_i_2 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [1]),
        .I2(\data_y_reg[7] [1]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[1]));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[2]_i_2 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [2]),
        .I2(\data_y_reg[7] [2]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[2]));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[3]_i_2 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [3]),
        .I2(\data_y_reg[7] [3]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[3]));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[4]_i_2 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [4]),
        .I2(\data_y_reg[7] [4]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[4]));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[5]_i_2 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [5]),
        .I2(\data_y_reg[7] [5]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[5]));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[6]_i_2 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [6]),
        .I2(\data_y_reg[7] [6]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[6]));
  LUT5 #(
    .INIT(32'h0000E400)) 
    \x[7]_i_5 
       (.I0(state[0]),
        .I1(\data_x_reg[7] [7]),
        .I2(\data_y_reg[7] [7]),
        .I3(state[1]),
        .I4(state[2]),
        .O(data[7]));
endmodule

module gcd_core
   (Q,
    \FSM_sequential_state_reg[1] ,
    \FSM_sequential_state_reg[1]_0 ,
    \FSM_sequential_state_reg[2] ,
    start,
    \FSM_sequential_state_reg[2]_0 ,
    \FSM_sequential_state_reg[0] ,
    enable4_in,
    out,
    in0,
    done,
    \FSM_sequential_state_reg[2]_1 ,
    \reset_register_reg[0] ,
    data,
    \FSM_sequential_state_reg[2]_2 ,
    \reset_register_reg[0]_0 ,
    clock_IBUF_BUFG);
  output [7:0]Q;
  output \FSM_sequential_state_reg[1] ;
  output \FSM_sequential_state_reg[1]_0 ;
  output \FSM_sequential_state_reg[2] ;
  output start;
  output \FSM_sequential_state_reg[2]_0 ;
  output \FSM_sequential_state_reg[0] ;
  input enable4_in;
  input [2:0]out;
  input [1:0]in0;
  input done;
  input [2:0]\FSM_sequential_state_reg[2]_1 ;
  input [0:0]\reset_register_reg[0] ;
  input [7:0]data;
  input [1:0]\FSM_sequential_state_reg[2]_2 ;
  input \reset_register_reg[0]_0 ;
  input clock_IBUF_BUFG;

  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[2] ;
  wire \FSM_sequential_state_reg[2]_0 ;
  wire [2:0]\FSM_sequential_state_reg[2]_1 ;
  wire [7:0]Q;
  wire clock_IBUF_BUFG;
  wire [7:0]data;
  wire datapath_n_26;
  wire datapath_n_28;
  wire datapath_n_29;
  wire datapath_n_30;
  wire datapath_n_31;
  wire done;
  wire enable4_in;
  wire fsm_n_10;
  wire fsm_n_11;
  wire fsm_n_13;
  wire fsm_n_14;
  wire fsm_n_15;
  wire fsm_n_16;
  wire fsm_n_17;
  wire fsm_n_18;
  wire fsm_n_19;
  wire fsm_n_20;
  wire fsm_n_4;
  wire fsm_n_5;
  wire fsm_n_6;
  wire fsm_n_7;
  wire fsm_n_8;
  wire fsm_n_9;
  wire [2:0]out;
  wire reset_fsm2_out;
  wire [0:0]\reset_register_reg[0] ;
  wire \reset_register_reg[0]_0 ;
  wire start;
  wire update_x;
  wire update_y;
  wire x_equal_y;
  wire x_greater_y;
  wire [7:0]x_min_y;
  wire [7:0]y_min_x;
  wire [1:0]\NLW_fsm_FSM_sequential_state_reg[2]_4_UNCONNECTED ;
  wire [1:0]NLW_fsm_in0_UNCONNECTED;

  dp datapath
       (.CO(x_greater_y),
        .D({fsm_n_13,fsm_n_14,fsm_n_15,fsm_n_16,fsm_n_17,fsm_n_18,fsm_n_19,fsm_n_20}),
        .E(update_x),
        .\FSM_sequential_state_reg[0] ({fsm_n_4,fsm_n_5,fsm_n_6,fsm_n_7,fsm_n_8,fsm_n_9,fsm_n_10,fsm_n_11}),
        .\FSM_sequential_state_reg[1] (datapath_n_28),
        .\FSM_sequential_state_reg[1]_0 (datapath_n_29),
        .\FSM_sequential_state_reg[1]_1 (datapath_n_30),
        .\FSM_sequential_state_reg[1]_2 (datapath_n_31),
        .\FSM_sequential_state_reg[1]_3 (update_y),
        .\FSM_sequential_state_reg[2] (\FSM_sequential_state_reg[2]_1 ),
        .Q(Q),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .reset_fsm2_out(reset_fsm2_out),
        .\reset_register_reg[0] (\reset_register_reg[0] ),
        .x_equal_y(x_equal_y),
        .x_min_y(x_min_y),
        .y_min_x(y_min_x),
        .\y_reg[7]_0 (datapath_n_26));
  fsm fsm
       (.CO(x_greater_y),
        .D({fsm_n_13,fsm_n_14,fsm_n_15,fsm_n_16,fsm_n_17,fsm_n_18,fsm_n_19,fsm_n_20}),
        .E(update_x),
        .\FSM_sequential_state_reg[0]_0 (\FSM_sequential_state_reg[0] ),
        .\FSM_sequential_state_reg[1]_0 (\FSM_sequential_state_reg[1] ),
        .\FSM_sequential_state_reg[1]_1 (\FSM_sequential_state_reg[1]_0 ),
        .\FSM_sequential_state_reg[2]_0 (\FSM_sequential_state_reg[2] ),
        .\FSM_sequential_state_reg[2]_1 (\FSM_sequential_state_reg[2]_0 ),
        .\FSM_sequential_state_reg[2]_2 (\FSM_sequential_state_reg[2]_1 ),
        .\FSM_sequential_state_reg[2]_3 (datapath_n_26),
        .\FSM_sequential_state_reg[2]_4 (\NLW_fsm_FSM_sequential_state_reg[2]_4_UNCONNECTED [1:0]),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .data(data),
        .done(done),
        .enable4_in(enable4_in),
        .in0(NLW_fsm_in0_UNCONNECTED[1:0]),
        .out(out),
        .reset_fsm2_out(reset_fsm2_out),
        .\reset_register_reg[0] (\reset_register_reg[0] ),
        .\reset_register_reg[0]_0 (\reset_register_reg[0]_0 ),
        .start(start),
        .x_equal_y(x_equal_y),
        .x_min_y(x_min_y),
        .\x_reg[7] (datapath_n_28),
        .y_min_x(y_min_x),
        .\y_reg[1] (datapath_n_30),
        .\y_reg[3] (datapath_n_31),
        .\y_reg[5] (datapath_n_29),
        .\y_reg[7] ({fsm_n_4,fsm_n_5,fsm_n_6,fsm_n_7,fsm_n_8,fsm_n_9,fsm_n_10,fsm_n_11}),
        .\y_reg[7]_0 (update_y));
endmodule

(* ECO_CHECKSUM = "37640a7f" *) (* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "0" *) 
(* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
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
   (mosi_OBUF,
    spi_clock_OBUF,
    slave_select_OBUF,
    clock_IBUF_BUFG,
    Q);
  output mosi_OBUF;
  output spi_clock_OBUF;
  output slave_select_OBUF;
  input clock_IBUF_BUFG;
  input [0:0]Q;

  wire \/i___0_n_0 ;
  wire [0:0]Q;
  wire address;
  wire \address[0]_i_1__0_n_0 ;
  wire \address[1]_i_1_n_0 ;
  wire \address[2]_i_1_n_0 ;
  wire \address[2]_i_2_n_0 ;
  wire \address[3]_i_1__0_n_0 ;
  wire \address[3]_i_2__0_n_0 ;
  wire \address[4]_i_1_n_0 ;
  wire \address[4]_i_2_n_0 ;
  wire \address_reg_n_0_[0] ;
  wire \address_reg_n_0_[1] ;
  wire \address_reg_n_0_[2] ;
  wire \address_reg_n_0_[3] ;
  wire \address_reg_n_0_[4] ;
  wire clock_IBUF_BUFG;
  wire [7:0]data;
  wire [7:0]data_x;
  wire [7:0]data_y;
  wire done;
  wire enable3_out;
  wire enable4_in;
  wire gcd_calculator_instance_n_10;
  wire gcd_calculator_instance_n_8;
  wire gcd_ready;
  wire i__i_3_n_0;
  wire load_x9_out;
  wire load_y7_out;
  wire [7:0]memory_out;
  wire mosi_OBUF;
  wire slave_select_OBUF;
  wire spi_clock_OBUF;
  wire spi_instance_n_0;
  wire start;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire [7:0]x;
  wire [1:0]NLW_gcd_calculator_instance_in0_UNCONNECTED;
  wire [0:0]NLW_spi_instance_in0_UNCONNECTED;

  LUT5 #(
    .INIT(32'h10005555)) 
    \/i_ 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(done),
        .I3(enable4_in),
        .I4(state[2]),
        .O(address));
  LUT2 #(
    .INIT(4'h7)) 
    \/i___0 
       (.I0(done),
        .I1(enable4_in),
        .O(\/i___0_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(spi_instance_n_0),
        .Q(state[0]),
        .R(Q));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_calculator_instance_n_8),
        .Q(state[1]),
        .R(Q));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(gcd_calculator_instance_n_10),
        .Q(state[2]),
        .R(Q));
  LUT5 #(
    .INIT(32'h00001511)) 
    \address[0]_i_1__0 
       (.I0(\address_reg_n_0_[0] ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(enable4_in),
        .I4(state[1]),
        .O(\address[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000006660606)) 
    \address[1]_i_1 
       (.I0(\address_reg_n_0_[0] ),
        .I1(\address_reg_n_0_[1] ),
        .I2(state[0]),
        .I3(state[2]),
        .I4(enable4_in),
        .I5(state[1]),
        .O(\address[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00002A22)) 
    \address[2]_i_1 
       (.I0(\address[2]_i_2_n_0 ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(enable4_in),
        .I4(state[1]),
        .O(\address[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \address[2]_i_2 
       (.I0(\address_reg_n_0_[2] ),
        .I1(\address_reg_n_0_[0] ),
        .I2(\address_reg_n_0_[1] ),
        .O(\address[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00002A22)) 
    \address[3]_i_1__0 
       (.I0(\address[3]_i_2__0_n_0 ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(enable4_in),
        .I4(state[1]),
        .O(\address[3]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h6AAA)) 
    \address[3]_i_2__0 
       (.I0(\address_reg_n_0_[3] ),
        .I1(\address_reg_n_0_[2] ),
        .I2(\address_reg_n_0_[1] ),
        .I3(\address_reg_n_0_[0] ),
        .O(\address[3]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h00001511)) 
    \address[4]_i_1 
       (.I0(\address[4]_i_2_n_0 ),
        .I1(state[0]),
        .I2(state[2]),
        .I3(enable4_in),
        .I4(state[1]),
        .O(\address[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h95555555)) 
    \address[4]_i_2 
       (.I0(\address_reg_n_0_[4] ),
        .I1(\address_reg_n_0_[3] ),
        .I2(\address_reg_n_0_[0] ),
        .I3(\address_reg_n_0_[1] ),
        .I4(\address_reg_n_0_[2] ),
        .O(\address[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(address),
        .D(\address[0]_i_1__0_n_0 ),
        .Q(\address_reg_n_0_[0] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(address),
        .D(\address[1]_i_1_n_0 ),
        .Q(\address_reg_n_0_[1] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(address),
        .D(\address[2]_i_1_n_0 ),
        .Q(\address_reg_n_0_[2] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(address),
        .D(\address[3]_i_1__0_n_0 ),
        .Q(\address_reg_n_0_[3] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(address),
        .D(\address[4]_i_1_n_0 ),
        .Q(\address_reg_n_0_[4] ),
        .R(Q));
  (* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *) 
  blk_mem_gen_0 block_memory
       (.addra({\address_reg_n_0_[4] ,\address_reg_n_0_[3] ,\address_reg_n_0_[2] ,\address_reg_n_0_[1] ,\address_reg_n_0_[0] }),
        .clka(clock_IBUF_BUFG),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(memory_out),
        .ena(enable3_out),
        .pwropt(Q),
        .pwropt_1(address),
        .wea(1'b0));
  LUT5 #(
    .INIT(32'h00000008)) 
    \data_x[7]_i_1 
       (.I0(enable4_in),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(Q),
        .O(load_x9_out));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
        .D(memory_out[0]),
        .Q(data_x[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
        .D(memory_out[1]),
        .Q(data_x[1]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
        .D(memory_out[2]),
        .Q(data_x[2]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
        .D(memory_out[3]),
        .Q(data_x[3]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
        .D(memory_out[4]),
        .Q(data_x[4]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
        .D(memory_out[5]),
        .Q(data_x[5]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
        .D(memory_out[6]),
        .Q(data_x[6]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_x_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(load_x9_out),
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
        .O(load_y7_out));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[0]),
        .Q(data_y[0]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[1]),
        .Q(data_y[1]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[2]),
        .Q(data_y[2]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[3]),
        .Q(data_y[3]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[4]),
        .Q(data_y[4]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[5]),
        .Q(data_y[5]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[6]),
        .Q(data_y[6]),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \data_y_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(load_y7_out),
        .D(memory_out[7]),
        .Q(data_y[7]),
        .R(Q));
  gcd_calculator gcd_calculator_instance
       (.\FSM_sequential_state_reg[1]_0 (gcd_calculator_instance_n_8),
        .\FSM_sequential_state_reg[2]_0 (gcd_calculator_instance_n_10),
        .Q(x),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .\data_x_reg[7] (data_x),
        .\data_y_reg[7] (data_y),
        .done(done),
        .enable4_in(enable4_in),
        .gcd_ready(gcd_ready),
        .in0(NLW_gcd_calculator_instance_in0_UNCONNECTED[1:0]),
        .out(state),
        .\reset_register_reg[0] (Q),
        .start(start));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    i__i_2
       (.I0(memory_out[7]),
        .I1(memory_out[5]),
        .I2(memory_out[2]),
        .I3(memory_out[0]),
        .I4(i__i_3_n_0),
        .O(enable4_in));
  LUT4 #(
    .INIT(16'hFFFE)) 
    i__i_3
       (.I0(memory_out[4]),
        .I1(memory_out[6]),
        .I2(memory_out[1]),
        .I3(memory_out[3]),
        .O(i__i_3_n_0));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_10
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[5]),
        .I4(done),
        .I5(state[1]),
        .O(data[5]));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_11
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[2]),
        .I4(done),
        .I5(state[1]),
        .O(data[2]));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_12
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[6]),
        .I4(done),
        .I5(state[1]),
        .O(data[6]));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_13
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[7]),
        .I4(done),
        .I5(state[1]),
        .O(data[7]));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_14
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[3]),
        .I4(done),
        .I5(state[1]),
        .O(data[3]));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_7
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[4]),
        .I4(done),
        .I5(state[1]),
        .O(data[4]));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_8
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[0]),
        .I4(done),
        .I5(state[1]),
        .O(data[0]));
  LUT6 #(
    .INIT(64'h0800080000003000)) 
    mosi_OBUF_inst_i_9
       (.I0(gcd_ready),
        .I1(state[0]),
        .I2(state[2]),
        .I3(x[1]),
        .I4(done),
        .I5(state[1]),
        .O(data[1]));
  spi spi_instance
       (.\FSM_sequential_state_reg[0] (spi_instance_n_0),
        .Q(Q),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .data(data),
        .done(done),
        .ena(enable3_out),
        .enable4_in(enable4_in),
        .gcd_ready(gcd_ready),
        .in0(NLW_spi_instance_in0_UNCONNECTED[0]),
        .mosi_OBUF(mosi_OBUF),
        .out(state),
        .slave_select_OBUF(slave_select_OBUF),
        .spi_clock_OBUF(spi_clock_OBUF),
        .start(start),
        .\state_reg[1]_0 (\/i___0_n_0 ));
endmodule

module spi
   (\FSM_sequential_state_reg[0] ,
    mosi_OBUF,
    spi_clock_OBUF,
    slave_select_OBUF,
    ena,
    done,
    \state_reg[1]_0 ,
    gcd_ready,
    out,
    in0,
    Q,
    data,
    start,
    enable4_in,
    clock_IBUF_BUFG);
  output \FSM_sequential_state_reg[0] ;
  output mosi_OBUF;
  output spi_clock_OBUF;
  output slave_select_OBUF;
  output ena;
  output done;
  input \state_reg[1]_0 ;
  input gcd_ready;
  input [2:0]out;
  input [0:0]in0;
  input [0:0]Q;
  input [7:0]data;
  input start;
  input enable4_in;
  input clock_IBUF_BUFG;

  wire \FSM_sequential_state_reg[0] ;
  wire [0:0]Q;
  wire [2:0]address;
  wire \address[0]_i_1_n_0 ;
  wire \address[1]_i_1__0_n_0 ;
  wire \address[2]_i_1__0_n_0 ;
  wire \address[3]_i_1_n_0 ;
  wire \address[3]_i_2_n_0 ;
  wire \address[3]_i_3_n_0 ;
  wire \address_reg_n_0_[3] ;
  wire clock_IBUF_BUFG;
  wire \counter[5]_i_2_n_0 ;
  wire \counter[9]_i_1_n_0 ;
  wire \counter[9]_i_3_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire \counter_reg_n_0_[7] ;
  wire \counter_reg_n_0_[8] ;
  wire \counter_reg_n_0_[9] ;
  wire [7:0]data;
  wire done;
  wire ena;
  wire enable4_in;
  wire gcd_ready;
  wire mosi_OBUF;
  wire mosi_OBUF_inst_i_2_n_0;
  wire mosi_OBUF_inst_i_3_n_0;
  wire mosi_OBUF_inst_i_4_n_0;
  wire mosi_OBUF_inst_i_5_n_0;
  wire mosi_OBUF_inst_i_6_n_0;
  wire [2:0]out;
  wire [9:0]p_1_in;
  wire slave_select_OBUF;
  wire slave_select_OBUF_inst_i_2_n_0;
  wire spi_clock_OBUF;
  wire spi_clock_OBUF_inst_i_2_n_0;
  wire spi_clock_OBUF_inst_i_3_n_0;
  wire spi_clock_OBUF_inst_i_4_n_0;
  wire spi_clock_OBUF_inst_i_5_n_0;
  wire start;
  wire \state[0]_i_1_n_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state_reg[1]_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;

  LUT5 #(
    .INIT(32'hF3F00F5F)) 
    \FSM_sequential_state[0]_i_1__1 
       (.I0(\state_reg[1]_0 ),
        .I1(gcd_ready),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[0]),
        .O(\FSM_sequential_state_reg[0] ));
  LUT2 #(
    .INIT(4'hB)) 
    \address[0]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(address[0]),
        .O(\address[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hEB)) 
    \address[1]_i_1__0 
       (.I0(\state_reg_n_0_[0] ),
        .I1(address[0]),
        .I2(address[1]),
        .O(\address[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFEAB)) 
    \address[2]_i_1__0 
       (.I0(\state_reg_n_0_[0] ),
        .I1(address[1]),
        .I2(address[0]),
        .I3(address[2]),
        .O(\address[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFE0000)) 
    \address[3]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\address_reg_n_0_[3] ),
        .I2(address[2]),
        .I3(\address[3]_i_3_n_0 ),
        .I4(\state_reg_n_0_[1] ),
        .I5(slave_select_OBUF_inst_i_2_n_0),
        .O(\address[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h55540001)) 
    \address[3]_i_2 
       (.I0(\state_reg_n_0_[0] ),
        .I1(address[2]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(\address_reg_n_0_[3] ),
        .O(\address[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \address[3]_i_3 
       (.I0(address[1]),
        .I1(address[0]),
        .O(\address[3]_i_3_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \address_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[3]_i_1_n_0 ),
        .D(\address[0]_i_1_n_0 ),
        .Q(address[0]),
        .S(Q));
  FDSE #(
    .INIT(1'b1)) 
    \address_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[3]_i_1_n_0 ),
        .D(\address[1]_i_1__0_n_0 ),
        .Q(address[1]),
        .S(Q));
  FDSE #(
    .INIT(1'b1)) 
    \address_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[3]_i_1_n_0 ),
        .D(\address[2]_i_1__0_n_0 ),
        .Q(address[2]),
        .S(Q));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[3]_i_1_n_0 ),
        .D(\address[3]_i_2_n_0 ),
        .Q(\address_reg_n_0_[3] ),
        .R(Q));
  LUT6 #(
    .INIT(64'h00000000000050D5)) 
    block_memory_i_1
       (.I0(out[2]),
        .I1(done),
        .I2(enable4_in),
        .I3(out[0]),
        .I4(out[1]),
        .I5(Q),
        .O(ena));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .O(p_1_in[0]));
  LUT3 #(
    .INIT(8'h28)) 
    \counter[1]_i_1 
       (.I0(slave_select_OBUF_inst_i_2_n_0),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counter[2]_i_1 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter[3]_i_1 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[2] ),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \counter[4]_i_1 
       (.I0(slave_select_OBUF_inst_i_2_n_0),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[0] ),
        .I5(\counter_reg_n_0_[4] ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \counter[5]_i_1 
       (.I0(slave_select_OBUF_inst_i_2_n_0),
        .I1(\counter[5]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\counter_reg_n_0_[4] ),
        .I5(\counter_reg_n_0_[5] ),
        .O(p_1_in[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \counter[5]_i_2 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .O(\counter[5]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h82)) 
    \counter[6]_i_1 
       (.I0(slave_select_OBUF_inst_i_2_n_0),
        .I1(\counter[9]_i_3_n_0 ),
        .I2(\counter_reg_n_0_[6] ),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \counter[7]_i_1 
       (.I0(\counter_reg_n_0_[7] ),
        .I1(\counter[9]_i_3_n_0 ),
        .I2(\counter_reg_n_0_[6] ),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \counter[8]_i_1 
       (.I0(\counter_reg_n_0_[8] ),
        .I1(\counter_reg_n_0_[6] ),
        .I2(\counter[9]_i_3_n_0 ),
        .I3(\counter_reg_n_0_[7] ),
        .O(p_1_in[8]));
  LUT2 #(
    .INIT(4'hE)) 
    \counter[9]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(\counter[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF000008000800)) 
    \counter[9]_i_2 
       (.I0(\counter_reg_n_0_[8] ),
        .I1(\counter_reg_n_0_[6] ),
        .I2(\counter[9]_i_3_n_0 ),
        .I3(\counter_reg_n_0_[7] ),
        .I4(spi_clock_OBUF_inst_i_3_n_0),
        .I5(\counter_reg_n_0_[9] ),
        .O(p_1_in[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \counter[9]_i_3 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[5] ),
        .I2(\counter_reg_n_0_[4] ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\counter_reg_n_0_[3] ),
        .I5(\counter_reg_n_0_[1] ),
        .O(\counter[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(\counter_reg_n_0_[0] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(\counter_reg_n_0_[1] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(\counter_reg_n_0_[2] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(\counter_reg_n_0_[3] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(\counter_reg_n_0_[4] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(\counter_reg_n_0_[5] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(\counter_reg_n_0_[6] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(\counter_reg_n_0_[7] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(\counter_reg_n_0_[8] ),
        .R(Q));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clock_IBUF_BUFG),
        .CE(\counter[9]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(\counter_reg_n_0_[9] ),
        .R(Q));
  LUT5 #(
    .INIT(32'h00000800)) 
    i__i_1__0
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(spi_clock_OBUF_inst_i_3_n_0),
        .I3(\counter_reg_n_0_[9] ),
        .I4(Q),
        .O(done));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    mosi_OBUF_inst_i_1
       (.I0(mosi_OBUF_inst_i_2_n_0),
        .I1(mosi_OBUF_inst_i_3_n_0),
        .I2(mosi_OBUF_inst_i_4_n_0),
        .I3(mosi_OBUF_inst_i_5_n_0),
        .I4(mosi_OBUF_inst_i_6_n_0),
        .I5(Q),
        .O(mosi_OBUF));
  LUT3 #(
    .INIT(8'h26)) 
    mosi_OBUF_inst_i_2
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(slave_select_OBUF_inst_i_2_n_0),
        .O(mosi_OBUF_inst_i_2_n_0));
  LUT5 #(
    .INIT(32'h000000B8)) 
    mosi_OBUF_inst_i_3
       (.I0(data[4]),
        .I1(address[2]),
        .I2(data[0]),
        .I3(address[1]),
        .I4(address[0]),
        .O(mosi_OBUF_inst_i_3_n_0));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    mosi_OBUF_inst_i_4
       (.I0(address[1]),
        .I1(address[0]),
        .I2(data[1]),
        .I3(address[2]),
        .I4(data[5]),
        .O(mosi_OBUF_inst_i_4_n_0));
  LUT5 #(
    .INIT(32'h0000E200)) 
    mosi_OBUF_inst_i_5
       (.I0(data[2]),
        .I1(address[2]),
        .I2(data[6]),
        .I3(address[1]),
        .I4(address[0]),
        .O(mosi_OBUF_inst_i_5_n_0));
  LUT5 #(
    .INIT(32'h8A800000)) 
    mosi_OBUF_inst_i_6
       (.I0(address[0]),
        .I1(data[7]),
        .I2(address[2]),
        .I3(data[3]),
        .I4(address[1]),
        .O(mosi_OBUF_inst_i_6_n_0));
  LUT5 #(
    .INIT(32'hFFFF5003)) 
    slave_select_OBUF_inst_i_1
       (.I0(slave_select_OBUF_inst_i_2_n_0),
        .I1(start),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(Q),
        .O(slave_select_OBUF));
  LUT2 #(
    .INIT(4'hB)) 
    slave_select_OBUF_inst_i_2
       (.I0(spi_clock_OBUF_inst_i_3_n_0),
        .I1(\counter_reg_n_0_[9] ),
        .O(slave_select_OBUF_inst_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFBAAAFFFFBAAF)) 
    spi_clock_OBUF_inst_i_1
       (.I0(spi_clock_OBUF_inst_i_2_n_0),
        .I1(spi_clock_OBUF_inst_i_3_n_0),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(Q),
        .I5(start),
        .O(spi_clock_OBUF));
  LUT5 #(
    .INIT(32'h00045555)) 
    spi_clock_OBUF_inst_i_2
       (.I0(\counter_reg_n_0_[9] ),
        .I1(spi_clock_OBUF_inst_i_4_n_0),
        .I2(\counter_reg_n_0_[7] ),
        .I3(\counter_reg_n_0_[6] ),
        .I4(\counter_reg_n_0_[8] ),
        .O(spi_clock_OBUF_inst_i_2_n_0));
  LUT5 #(
    .INIT(32'hBFFFFFFF)) 
    spi_clock_OBUF_inst_i_3
       (.I0(spi_clock_OBUF_inst_i_5_n_0),
        .I1(\counter_reg_n_0_[4] ),
        .I2(\counter_reg_n_0_[5] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\counter_reg_n_0_[6] ),
        .O(spi_clock_OBUF_inst_i_3_n_0));
  LUT6 #(
    .INIT(64'h01FFFFFFFFFFFFFF)) 
    spi_clock_OBUF_inst_i_4
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\counter_reg_n_0_[5] ),
        .I5(\counter_reg_n_0_[4] ),
        .O(spi_clock_OBUF_inst_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    spi_clock_OBUF_inst_i_5
       (.I0(\counter_reg_n_0_[1] ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(\counter_reg_n_0_[7] ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\counter_reg_n_0_[8] ),
        .O(spi_clock_OBUF_inst_i_5_n_0));
  LUT6 #(
    .INIT(64'h00000000F437F404)) 
    \state[0]_i_1 
       (.I0(\state[0]_i_2_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(slave_select_OBUF_inst_i_2_n_0),
        .I3(\state_reg_n_0_[0] ),
        .I4(start),
        .I5(Q),
        .O(\state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state[0]_i_2 
       (.I0(address[1]),
        .I1(address[0]),
        .I2(address[2]),
        .I3(\address_reg_n_0_[3] ),
        .I4(\state_reg_n_0_[0] ),
        .O(\state[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00D2)) 
    \state[1]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(slave_select_OBUF_inst_i_2_n_0),
        .I2(\state_reg_n_0_[1] ),
        .I3(Q),
        .O(\state[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg_n_0_[1] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module blk_mem_gen_0blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea,
    pwropt,
    pwropt_1);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;
  input pwropt;
  input pwropt_1;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire pwropt;
  wire pwropt_1;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea,
    pwropt,
    pwropt_1);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;
  input pwropt;
  input pwropt_1;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire pwropt;
  wire pwropt_1;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module blk_mem_gen_0blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea,
    pwropt,
    pwropt_1);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;
  input pwropt;
  input pwropt_1;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENARDEN_cooolgate_en_sig_4 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENBWREN_cooolgate_en_sig_5 ;
  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire \memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_1 ;
  wire \memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_2 ;
  wire \memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_3 ;
  wire pwropt;
  wire pwropt_1;
  wire [0:0]wea;
  wire [15:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* IS_CLOCK_GATED *) 
  (* POWER_OPTED_CE = "ENBWREN=AUG:ENARDEN=AUG" *) 
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
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOADO_UNCONNECTED [15:10],douta[3:2],\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOADO_UNCONNECTED [7:2],douta[1:0]}),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOBDO_UNCONNECTED [15:10],douta[7:6],\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOBDO_UNCONNECTED [7:2],douta[5:4]}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENARDEN_cooolgate_en_sig_4 ),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENBWREN_cooolgate_en_sig_5 ),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,wea,wea}));
  LUT4 #(
    .INIT(16'hfd00)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENARDEN_cooolgate_en_gate_4 
       (.I0(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_3 ),
        .I1(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_2 ),
        .I2(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_1 ),
        .I3(ena),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENARDEN_cooolgate_en_sig_4 ));
  LUT4 #(
    .INIT(16'hfd00)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENBWREN_cooolgate_en_gate_6 
       (.I0(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_3 ),
        .I1(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_2 ),
        .I2(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_1 ),
        .I3(ena),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_ENBWREN_cooolgate_en_sig_5 ));
  FDCE #(
    .INIT(1'b1)) 
    \memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_gate_1_cooolDelFlop 
       (.C(clka),
        .CE(1'b1),
        .CLR(1'b0),
        .D(pwropt),
        .Q(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_1 ));
  FDCE #(
    .INIT(1'b1)) 
    \memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_gate_2_cooolDelFlop 
       (.C(clka),
        .CE(1'b1),
        .CLR(1'b0),
        .D(pwropt_1),
        .Q(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_2 ));
  FDCE #(
    .INIT(1'b0)) 
    \memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_gate_3_cooolDelFlop 
       (.C(clka),
        .CE(1'b1),
        .CLR(1'b0),
        .D(ena),
        .Q(\memory_reader_instance/block_memory/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_cooolgate_en_sig_3 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module blk_mem_gen_0blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea,
    pwropt,
    pwropt_1);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;
  input pwropt;
  input pwropt_1;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire pwropt;
  wire pwropt_1;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
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
    s_axi_rdaddrecc,
    pwropt,
    pwropt_1);
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
  input pwropt;
  input pwropt_1;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire pwropt;
  wire pwropt_1;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_v8_3_5_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_5_synth" *) 
module blk_mem_gen_0blk_mem_gen_v8_3_5_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea,
    pwropt,
    pwropt_1);
  output [7:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [7:0]dina;
  input [0:0]wea;
  input pwropt;
  input pwropt_1;

  wire [4:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
  wire pwropt;
  wire pwropt_1;
  wire [0:0]wea;

  blk_mem_gen_0blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .pwropt(pwropt),
        .pwropt_1(pwropt_1),
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

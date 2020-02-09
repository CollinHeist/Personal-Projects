// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Feb 05 12:51:34 2020
// Host        : ece-bel215-02 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {U:/ECE
//               440/Project_3/Project_3.sim/sim_1/synth/timing/testbench_time_synth.v}
// Design      : wrapper
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module dp
   (x_min_y,
    y_min_x,
    CO,
    leds_OBUF,
    x_equal_y,
    switches_IBUF,
    load_reg,
    E,
    D,
    clock_IBUF_BUFG,
    \FSM_sequential_state_reg[1] ,
    \data_reg[7] );
  output [7:0]x_min_y;
  output [7:0]y_min_x;
  output [0:0]CO;
  output [3:0]leds_OBUF;
  output x_equal_y;
  input [1:0]switches_IBUF;
  input load_reg;
  input [0:0]E;
  input [7:0]D;
  input clock_IBUF_BUFG;
  input [0:0]\FSM_sequential_state_reg[1] ;
  input [7:0]\data_reg[7] ;

  wire [0:0]CO;
  wire [7:0]D;
  wire [0:0]E;
  wire [0:0]\FSM_sequential_state_reg[1] ;
  wire clock_IBUF_BUFG;
  wire [7:0]\data_reg[7] ;
  wire [7:0]gcd_result;
  wire [3:0]leds_OBUF;
  wire load_reg;
  wire [1:0]switches_IBUF;
  wire update_x_i_2_n_0;
  wire update_x_i_3_n_0;
  wire update_x_i_4_n_0;
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
  wire \y_reg_n_0_[0] ;
  wire \y_reg_n_0_[1] ;
  wire \y_reg_n_0_[2] ;
  wire \y_reg_n_0_[3] ;
  wire \y_reg_n_0_[4] ;
  wire \y_reg_n_0_[5] ;
  wire \y_reg_n_0_[6] ;
  wire \y_reg_n_0_[7] ;
  wire [3:0]NLW_x_greater_y_carry_O_UNCONNECTED;
  wire [3:3]NLW_x_min_y_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_y_min_x_carry__0_CO_UNCONNECTED;

  LUT5 #(
    .INIT(32'h8A80AAAA)) 
    \leds_OBUF[0]_inst_i_1 
       (.I0(load_reg),
        .I1(gcd_result[0]),
        .I2(switches_IBUF[0]),
        .I3(gcd_result[4]),
        .I4(switches_IBUF[1]),
        .O(leds_OBUF[0]));
  LUT5 #(
    .INIT(32'hE2000000)) 
    \leds_OBUF[1]_inst_i_1 
       (.I0(gcd_result[5]),
        .I1(switches_IBUF[0]),
        .I2(gcd_result[1]),
        .I3(switches_IBUF[1]),
        .I4(load_reg),
        .O(leds_OBUF[1]));
  LUT5 #(
    .INIT(32'hE2000000)) 
    \leds_OBUF[2]_inst_i_1 
       (.I0(gcd_result[6]),
        .I1(switches_IBUF[0]),
        .I2(gcd_result[2]),
        .I3(switches_IBUF[1]),
        .I4(load_reg),
        .O(leds_OBUF[2]));
  LUT5 #(
    .INIT(32'hE2000000)) 
    \leds_OBUF[3]_inst_i_1 
       (.I0(gcd_result[7]),
        .I1(switches_IBUF[0]),
        .I2(gcd_result[3]),
        .I3(switches_IBUF[1]),
        .I4(load_reg),
        .O(leds_OBUF[3]));
  LUT5 #(
    .INIT(32'h41000000)) 
    update_x_i_1
       (.I0(update_x_i_2_n_0),
        .I1(gcd_result[3]),
        .I2(\y_reg_n_0_[3] ),
        .I3(update_x_i_3_n_0),
        .I4(update_x_i_4_n_0),
        .O(x_equal_y));
  LUT4 #(
    .INIT(16'h6FF6)) 
    update_x_i_2
       (.I0(gcd_result[6]),
        .I1(\y_reg_n_0_[6] ),
        .I2(gcd_result[7]),
        .I3(\y_reg_n_0_[7] ),
        .O(update_x_i_2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    update_x_i_3
       (.I0(gcd_result[4]),
        .I1(\y_reg_n_0_[4] ),
        .I2(gcd_result[5]),
        .I3(\y_reg_n_0_[5] ),
        .O(update_x_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    update_x_i_4
       (.I0(gcd_result[0]),
        .I1(\y_reg_n_0_[0] ),
        .I2(\y_reg_n_0_[2] ),
        .I3(gcd_result[2]),
        .I4(\y_reg_n_0_[1] ),
        .I5(gcd_result[1]),
        .O(update_x_i_4_n_0));
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
       (.I0(gcd_result[6]),
        .I1(\y_reg_n_0_[6] ),
        .I2(\y_reg_n_0_[7] ),
        .I3(gcd_result[7]),
        .O(x_greater_y_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    x_greater_y_carry_i_2
       (.I0(gcd_result[4]),
        .I1(\y_reg_n_0_[4] ),
        .I2(\y_reg_n_0_[5] ),
        .I3(gcd_result[5]),
        .O(x_greater_y_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    x_greater_y_carry_i_3
       (.I0(gcd_result[2]),
        .I1(\y_reg_n_0_[2] ),
        .I2(\y_reg_n_0_[3] ),
        .I3(gcd_result[3]),
        .O(x_greater_y_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    x_greater_y_carry_i_4
       (.I0(gcd_result[0]),
        .I1(\y_reg_n_0_[0] ),
        .I2(\y_reg_n_0_[1] ),
        .I3(gcd_result[1]),
        .O(x_greater_y_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_5
       (.I0(\y_reg_n_0_[7] ),
        .I1(gcd_result[7]),
        .I2(\y_reg_n_0_[6] ),
        .I3(gcd_result[6]),
        .O(x_greater_y_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_6
       (.I0(gcd_result[4]),
        .I1(\y_reg_n_0_[4] ),
        .I2(gcd_result[5]),
        .I3(\y_reg_n_0_[5] ),
        .O(x_greater_y_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_7
       (.I0(gcd_result[2]),
        .I1(\y_reg_n_0_[2] ),
        .I2(gcd_result[3]),
        .I3(\y_reg_n_0_[3] ),
        .O(x_greater_y_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    x_greater_y_carry_i_8
       (.I0(gcd_result[0]),
        .I1(\y_reg_n_0_[0] ),
        .I2(gcd_result[1]),
        .I3(\y_reg_n_0_[1] ),
        .O(x_greater_y_carry_i_8_n_0));
  CARRY4 x_min_y_carry
       (.CI(1'b0),
        .CO({x_min_y_carry_n_0,x_min_y_carry_n_1,x_min_y_carry_n_2,x_min_y_carry_n_3}),
        .CYINIT(1'b1),
        .DI(gcd_result[3:0]),
        .O(x_min_y[3:0]),
        .S({x_min_y_carry_i_1_n_0,x_min_y_carry_i_2_n_0,x_min_y_carry_i_3_n_0,x_min_y_carry_i_4_n_0}));
  CARRY4 x_min_y_carry__0
       (.CI(x_min_y_carry_n_0),
        .CO({NLW_x_min_y_carry__0_CO_UNCONNECTED[3],x_min_y_carry__0_n_1,x_min_y_carry__0_n_2,x_min_y_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,gcd_result[6:4]}),
        .O(x_min_y[7:4]),
        .S({x_min_y_carry__0_i_1_n_0,x_min_y_carry__0_i_2_n_0,x_min_y_carry__0_i_3_n_0,x_min_y_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_1
       (.I0(gcd_result[7]),
        .I1(\y_reg_n_0_[7] ),
        .O(x_min_y_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_2
       (.I0(gcd_result[6]),
        .I1(\y_reg_n_0_[6] ),
        .O(x_min_y_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_3
       (.I0(gcd_result[5]),
        .I1(\y_reg_n_0_[5] ),
        .O(x_min_y_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry__0_i_4
       (.I0(gcd_result[4]),
        .I1(\y_reg_n_0_[4] ),
        .O(x_min_y_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_1
       (.I0(gcd_result[3]),
        .I1(\y_reg_n_0_[3] ),
        .O(x_min_y_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_2
       (.I0(gcd_result[2]),
        .I1(\y_reg_n_0_[2] ),
        .O(x_min_y_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_3
       (.I0(gcd_result[1]),
        .I1(\y_reg_n_0_[1] ),
        .O(x_min_y_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    x_min_y_carry_i_4
       (.I0(gcd_result[0]),
        .I1(\y_reg_n_0_[0] ),
        .O(x_min_y_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[0]),
        .Q(gcd_result[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[1]),
        .Q(gcd_result[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[2]),
        .Q(gcd_result[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[3]),
        .Q(gcd_result[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[4]),
        .Q(gcd_result[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[5]),
        .Q(gcd_result[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[6]),
        .Q(gcd_result[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(D[7]),
        .Q(gcd_result[7]),
        .R(1'b0));
  CARRY4 y_min_x_carry
       (.CI(1'b0),
        .CO({y_min_x_carry_n_0,y_min_x_carry_n_1,y_min_x_carry_n_2,y_min_x_carry_n_3}),
        .CYINIT(1'b1),
        .DI({\y_reg_n_0_[3] ,\y_reg_n_0_[2] ,\y_reg_n_0_[1] ,\y_reg_n_0_[0] }),
        .O(y_min_x[3:0]),
        .S({y_min_x_carry_i_1_n_0,y_min_x_carry_i_2_n_0,y_min_x_carry_i_3_n_0,y_min_x_carry_i_4_n_0}));
  CARRY4 y_min_x_carry__0
       (.CI(y_min_x_carry_n_0),
        .CO({NLW_y_min_x_carry__0_CO_UNCONNECTED[3],y_min_x_carry__0_n_1,y_min_x_carry__0_n_2,y_min_x_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\y_reg_n_0_[6] ,\y_reg_n_0_[5] ,\y_reg_n_0_[4] }),
        .O(y_min_x[7:4]),
        .S({y_min_x_carry__0_i_1_n_0,y_min_x_carry__0_i_2_n_0,y_min_x_carry__0_i_3_n_0,y_min_x_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_1
       (.I0(\y_reg_n_0_[7] ),
        .I1(gcd_result[7]),
        .O(y_min_x_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_2
       (.I0(\y_reg_n_0_[6] ),
        .I1(gcd_result[6]),
        .O(y_min_x_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_3
       (.I0(\y_reg_n_0_[5] ),
        .I1(gcd_result[5]),
        .O(y_min_x_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry__0_i_4
       (.I0(\y_reg_n_0_[4] ),
        .I1(gcd_result[4]),
        .O(y_min_x_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_1
       (.I0(\y_reg_n_0_[3] ),
        .I1(gcd_result[3]),
        .O(y_min_x_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_2
       (.I0(\y_reg_n_0_[2] ),
        .I1(gcd_result[2]),
        .O(y_min_x_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_3
       (.I0(\y_reg_n_0_[1] ),
        .I1(gcd_result[1]),
        .O(y_min_x_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    y_min_x_carry_i_4
       (.I0(\y_reg_n_0_[0] ),
        .I1(gcd_result[0]),
        .O(y_min_x_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [0]),
        .Q(\y_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [1]),
        .Q(\y_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [2]),
        .Q(\y_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [3]),
        .Q(\y_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [4]),
        .Q(\y_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [5]),
        .Q(\y_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [6]),
        .Q(\y_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_sequential_state_reg[1] ),
        .D(\data_reg[7] [7]),
        .Q(\y_reg_n_0_[7] ),
        .R(1'b0));
endmodule

module fsm
   (\y_reg[7] ,
    D,
    \leds[0] ,
    \y_reg[0] ,
    E,
    Q,
    y_min_x,
    buttons_IBUF,
    x_min_y,
    load_reg,
    x_equal_y,
    CO,
    clock_IBUF_BUFG);
  output [7:0]\y_reg[7] ;
  output [7:0]D;
  output \leds[0] ;
  output [0:0]\y_reg[0] ;
  output [0:0]E;
  input [7:0]Q;
  input [7:0]y_min_x;
  input [0:0]buttons_IBUF;
  input [7:0]x_min_y;
  input load_reg;
  input x_equal_y;
  input [0:0]CO;
  input clock_IBUF_BUFG;

  wire [0:0]CO;
  wire [7:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire [7:0]Q;
  wire [0:0]buttons_IBUF;
  wire clock_IBUF_BUFG;
  wire \leds[0] ;
  wire load_reg;
  (* RTL_KEEP = "yes" *) wire [2:0]state;
  wire update_x_n_0;
  wire x_equal_y;
  wire [7:0]x_min_y;
  wire [7:0]y_min_x;
  wire [0:0]\y_reg[0] ;
  wire [7:0]\y_reg[7] ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(buttons_IBUF),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF5F0FFCC05000FCC)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(x_equal_y),
        .I1(load_reg),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[0]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A83CA8FC)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(x_equal_y),
        .I5(buttons_IBUF),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEEE2E22)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(load_reg),
        .I3(state[2]),
        .I4(\FSM_sequential_state[2]_i_3_n_0 ),
        .I5(buttons_IBUF),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
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
  LUT6 #(
    .INIT(64'h0000000030040004)) 
    \leds_OBUF[3]_inst_i_2 
       (.I0(load_reg),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(x_equal_y),
        .I5(buttons_IBUF),
        .O(\leds[0] ));
  LUT6 #(
    .INIT(64'h000F000020F020F0)) 
    update_x
       (.I0(CO),
        .I1(x_equal_y),
        .I2(state[0]),
        .I3(state[1]),
        .I4(load_reg),
        .I5(state[2]),
        .O(update_x_n_0));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[0]_i_1 
       (.I0(Q[0]),
        .I1(x_min_y[0]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[1]_i_1 
       (.I0(Q[1]),
        .I1(x_min_y[1]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[2]_i_1 
       (.I0(Q[2]),
        .I1(x_min_y[2]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[3]_i_1 
       (.I0(Q[3]),
        .I1(x_min_y[3]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[4]_i_1 
       (.I0(Q[4]),
        .I1(x_min_y[4]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[5]_i_1 
       (.I0(Q[5]),
        .I1(x_min_y[5]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[6]_i_1 
       (.I0(Q[6]),
        .I1(x_min_y[6]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \x[7]_i_1__0 
       (.I0(update_x_n_0),
        .I1(buttons_IBUF),
        .O(E));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACACC)) 
    \x[7]_i_2 
       (.I0(Q[7]),
        .I1(x_min_y[7]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[0]_i_1 
       (.I0(Q[0]),
        .I1(y_min_x[0]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [0]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[1]_i_1 
       (.I0(Q[1]),
        .I1(y_min_x[1]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [1]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[2]_i_1 
       (.I0(Q[2]),
        .I1(y_min_x[2]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [2]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[3]_i_1 
       (.I0(Q[3]),
        .I1(y_min_x[3]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [3]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[4]_i_1 
       (.I0(Q[4]),
        .I1(y_min_x[4]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [4]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[5]_i_1 
       (.I0(Q[5]),
        .I1(y_min_x[5]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [5]));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[6]_i_1 
       (.I0(Q[6]),
        .I1(y_min_x[6]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [6]));
  LUT6 #(
    .INIT(64'h000000000000222A)) 
    \y[7]_i_1__0 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(CO),
        .I3(x_equal_y),
        .I4(state[2]),
        .I5(buttons_IBUF),
        .O(\y_reg[0] ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCACCCC)) 
    \y[7]_i_2 
       (.I0(Q[7]),
        .I1(y_min_x[7]),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(buttons_IBUF),
        .O(\y_reg[7] [7]));
endmodule

module gcd_core
   (leds_OBUF,
    switches_IBUF,
    Q,
    buttons_IBUF,
    load_reg,
    clock_IBUF_BUFG);
  output [3:0]leds_OBUF;
  input [1:0]switches_IBUF;
  input [7:0]Q;
  input [0:0]buttons_IBUF;
  input load_reg;
  input clock_IBUF_BUFG;

  wire [7:0]Q;
  wire [0:0]buttons_IBUF;
  wire clock_IBUF_BUFG;
  wire fsm_n_0;
  wire fsm_n_1;
  wire fsm_n_16;
  wire fsm_n_17;
  wire fsm_n_18;
  wire fsm_n_2;
  wire fsm_n_3;
  wire fsm_n_4;
  wire fsm_n_5;
  wire fsm_n_6;
  wire fsm_n_7;
  wire [3:0]leds_OBUF;
  wire load_reg;
  wire [7:0]p_0_in;
  wire [1:0]switches_IBUF;
  wire x_equal_y;
  wire x_greater_y;
  wire [7:0]x_min_y;
  wire [7:0]y_min_x;

  dp datapath
       (.CO(x_greater_y),
        .D(p_0_in),
        .E(fsm_n_18),
        .\FSM_sequential_state_reg[1] (fsm_n_17),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .\data_reg[7] ({fsm_n_0,fsm_n_1,fsm_n_2,fsm_n_3,fsm_n_4,fsm_n_5,fsm_n_6,fsm_n_7}),
        .leds_OBUF(leds_OBUF),
        .load_reg(fsm_n_16),
        .switches_IBUF(switches_IBUF),
        .x_equal_y(x_equal_y),
        .x_min_y(x_min_y),
        .y_min_x(y_min_x));
  fsm fsm
       (.CO(x_greater_y),
        .D(p_0_in),
        .E(fsm_n_18),
        .Q(Q),
        .buttons_IBUF(buttons_IBUF),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .\leds[0] (fsm_n_16),
        .load_reg(load_reg),
        .x_equal_y(x_equal_y),
        .x_min_y(x_min_y),
        .y_min_x(y_min_x),
        .\y_reg[0] (fsm_n_17),
        .\y_reg[7] ({fsm_n_0,fsm_n_1,fsm_n_2,fsm_n_3,fsm_n_4,fsm_n_5,fsm_n_6,fsm_n_7}));
endmodule

(* NotValidForBitStream *)
module wrapper
   (clock,
    buttons,
    switches,
    leds);
  input clock;
  input [1:0]buttons;
  input [3:0]switches;
  output [3:0]leds;

  wire [1:0]buttons;
  wire [1:0]buttons_IBUF;
  wire clock;
  wire clock_IBUF;
  wire clock_IBUF_BUFG;
  wire \data[0]_i_1_n_0 ;
  wire \data[1]_i_1_n_0 ;
  wire \data[2]_i_1_n_0 ;
  wire \data[3]_i_1_n_0 ;
  wire \data[4]_i_1_n_0 ;
  wire \data[5]_i_1_n_0 ;
  wire \data[6]_i_1_n_0 ;
  wire \data[7]_i_1_n_0 ;
  wire \data[7]_i_2_n_0 ;
  wire \data_reg_n_0_[0] ;
  wire \data_reg_n_0_[1] ;
  wire \data_reg_n_0_[2] ;
  wire \data_reg_n_0_[3] ;
  wire \data_reg_n_0_[4] ;
  wire \data_reg_n_0_[5] ;
  wire \data_reg_n_0_[6] ;
  wire \data_reg_n_0_[7] ;
  wire [3:0]leds;
  wire [3:0]leds_OBUF;
  wire load_i_1_n_0;
  wire load_reg_n_0;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire [3:0]switches;
  wire [3:0]switches_IBUF;
  wire [5:3]x;
  wire \x[3]_i_1__0_n_0 ;
  wire \x[4]_i_1__0_n_0 ;
  wire \x[5]_i_1__0_n_0 ;
  wire \x[6]_i_1__0_n_0 ;
  wire \x[7]_i_2__0_n_0 ;
  wire \x_reg_n_0_[0] ;
  wire \x_reg_n_0_[1] ;
  wire \x_reg_n_0_[2] ;
  wire \x_reg_n_0_[3] ;
  wire \x_reg_n_0_[4] ;
  wire \x_reg_n_0_[5] ;
  wire \x_reg_n_0_[6] ;
  wire \x_reg_n_0_[7] ;
  wire [5:3]y;
  wire \y[3]_i_1__0_n_0 ;
  wire \y[4]_i_1__0_n_0 ;
  wire \y[5]_i_1__0_n_0 ;
  wire \y[6]_i_1__0_n_0 ;
  wire \y[7]_i_2__0_n_0 ;
  wire \y_reg_n_0_[0] ;
  wire \y_reg_n_0_[1] ;
  wire \y_reg_n_0_[2] ;
  wire \y_reg_n_0_[3] ;
  wire \y_reg_n_0_[4] ;
  wire \y_reg_n_0_[5] ;
  wire \y_reg_n_0_[6] ;
  wire \y_reg_n_0_[7] ;

initial begin
 $sdf_annotate("testbench_time_synth.sdf",,,,"tool_control");
end
  IBUF \buttons_IBUF[0]_inst 
       (.I(buttons[0]),
        .O(buttons_IBUF[0]));
  IBUF \buttons_IBUF[1]_inst 
       (.I(buttons[1]),
        .O(buttons_IBUF[1]));
  BUFG clock_IBUF_BUFG_inst
       (.I(clock_IBUF),
        .O(clock_IBUF_BUFG));
  IBUF clock_IBUF_inst
       (.I(clock),
        .O(clock_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[0]_i_1 
       (.I0(\y_reg_n_0_[0] ),
        .I1(\x_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[1]_i_1 
       (.I0(\y_reg_n_0_[1] ),
        .I1(\x_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[2]_i_1 
       (.I0(\y_reg_n_0_[2] ),
        .I1(\x_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[3]_i_1 
       (.I0(\y_reg_n_0_[3] ),
        .I1(\x_reg_n_0_[3] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[4]_i_1 
       (.I0(\y_reg_n_0_[4] ),
        .I1(\x_reg_n_0_[4] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[5]_i_1 
       (.I0(\y_reg_n_0_[5] ),
        .I1(\x_reg_n_0_[5] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[6]_i_1 
       (.I0(\y_reg_n_0_[6] ),
        .I1(\x_reg_n_0_[6] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0028)) 
    \data[7]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .I3(buttons_IBUF[0]),
        .O(\data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data[7]_i_2 
       (.I0(\y_reg_n_0_[7] ),
        .I1(\x_reg_n_0_[7] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\data[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[0]_i_1_n_0 ),
        .Q(\data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[1]_i_1_n_0 ),
        .Q(\data_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[2]_i_1_n_0 ),
        .Q(\data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[3]_i_1_n_0 ),
        .Q(\data_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[4]_i_1_n_0 ),
        .Q(\data_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[5]_i_1_n_0 ),
        .Q(\data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[6]_i_1_n_0 ),
        .Q(\data_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\data[7]_i_1_n_0 ),
        .D(\data[7]_i_2_n_0 ),
        .Q(\data_reg_n_0_[7] ),
        .R(1'b0));
  gcd_core gcd_core_inst
       (.Q({\data_reg_n_0_[7] ,\data_reg_n_0_[6] ,\data_reg_n_0_[5] ,\data_reg_n_0_[4] ,\data_reg_n_0_[3] ,\data_reg_n_0_[2] ,\data_reg_n_0_[1] ,\data_reg_n_0_[0] }),
        .buttons_IBUF(buttons_IBUF[0]),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .leds_OBUF(leds_OBUF),
        .load_reg(load_reg_n_0),
        .switches_IBUF(switches_IBUF[1:0]));
  OBUF \leds_OBUF[0]_inst 
       (.I(leds_OBUF[0]),
        .O(leds[0]));
  OBUF \leds_OBUF[1]_inst 
       (.I(leds_OBUF[1]),
        .O(leds[1]));
  OBUF \leds_OBUF[2]_inst 
       (.I(leds_OBUF[2]),
        .O(leds[2]));
  OBUF \leds_OBUF[3]_inst 
       (.I(leds_OBUF[3]),
        .O(leds[3]));
  LUT5 #(
    .INIT(32'h33130010)) 
    load_i_1
       (.I0(\state_reg_n_0_[0] ),
        .I1(buttons_IBUF[0]),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(load_reg_n_0),
        .O(load_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    load_reg
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(load_i_1_n_0),
        .Q(load_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h50051144)) 
    \state[0]_i_1 
       (.I0(buttons_IBUF[0]),
        .I1(buttons_IBUF[1]),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h55001450)) 
    \state[1]_i_1 
       (.I0(buttons_IBUF[0]),
        .I1(buttons_IBUF[1]),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .O(\state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h55054000)) 
    \state[2]_i_1 
       (.I0(buttons_IBUF[0]),
        .I1(buttons_IBUF[1]),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .O(\state[2]_i_1_n_0 ));
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
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\state[2]_i_1_n_0 ),
        .Q(\state_reg_n_0_[2] ),
        .R(1'b0));
  IBUF \switches_IBUF[0]_inst 
       (.I(switches[0]),
        .O(switches_IBUF[0]));
  IBUF \switches_IBUF[1]_inst 
       (.I(switches[1]),
        .O(switches_IBUF[1]));
  IBUF \switches_IBUF[2]_inst 
       (.I(switches[2]),
        .O(switches_IBUF[2]));
  IBUF \switches_IBUF[3]_inst 
       (.I(switches[3]),
        .O(switches_IBUF[3]));
  LUT5 #(
    .INIT(32'h00000004)) 
    \x[3]_i_1__0 
       (.I0(\state_reg_n_0_[1] ),
        .I1(buttons_IBUF[1]),
        .I2(\state_reg_n_0_[2] ),
        .I3(buttons_IBUF[0]),
        .I4(\state_reg_n_0_[0] ),
        .O(\x[3]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \x[3]_i_2 
       (.I0(buttons_IBUF[0]),
        .I1(\state_reg_n_0_[2] ),
        .I2(buttons_IBUF[1]),
        .I3(\state_reg_n_0_[1] ),
        .O(x[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[4]_i_1__0 
       (.I0(\x_reg_n_0_[4] ),
        .I1(switches_IBUF[0]),
        .I2(\state_reg_n_0_[0] ),
        .O(\x[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[5]_i_1__0 
       (.I0(\x_reg_n_0_[5] ),
        .I1(switches_IBUF[1]),
        .I2(\state_reg_n_0_[0] ),
        .O(\x[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[6]_i_1__0 
       (.I0(\x_reg_n_0_[6] ),
        .I1(switches_IBUF[2]),
        .I2(\state_reg_n_0_[0] ),
        .O(\x[6]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \x[7]_i_1 
       (.I0(buttons_IBUF[0]),
        .I1(\state_reg_n_0_[2] ),
        .I2(buttons_IBUF[1]),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[1] ),
        .O(x[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[7]_i_2__0 
       (.I0(\x_reg_n_0_[7] ),
        .I1(switches_IBUF[3]),
        .I2(\state_reg_n_0_[0] ),
        .O(\x[7]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(x[3]),
        .D(switches_IBUF[0]),
        .Q(\x_reg_n_0_[0] ),
        .R(\x[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(x[3]),
        .D(switches_IBUF[1]),
        .Q(\x_reg_n_0_[1] ),
        .R(\x[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(x[3]),
        .D(switches_IBUF[2]),
        .Q(\x_reg_n_0_[2] ),
        .R(\x[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(x[3]),
        .D(switches_IBUF[3]),
        .Q(\x_reg_n_0_[3] ),
        .R(\x[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(x[5]),
        .D(\x[4]_i_1__0_n_0 ),
        .Q(\x_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(x[5]),
        .D(\x[5]_i_1__0_n_0 ),
        .Q(\x_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(x[5]),
        .D(\x[6]_i_1__0_n_0 ),
        .Q(\x_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(x[5]),
        .D(\x[7]_i_2__0_n_0 ),
        .Q(\x_reg_n_0_[7] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000008)) 
    \y[3]_i_1__0 
       (.I0(\state_reg_n_0_[1] ),
        .I1(buttons_IBUF[1]),
        .I2(\state_reg_n_0_[2] ),
        .I3(buttons_IBUF[0]),
        .I4(\state_reg_n_0_[0] ),
        .O(\y[3]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \y[3]_i_2 
       (.I0(buttons_IBUF[0]),
        .I1(\state_reg_n_0_[2] ),
        .I2(buttons_IBUF[1]),
        .I3(\state_reg_n_0_[1] ),
        .O(y[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[4]_i_1__0 
       (.I0(\y_reg_n_0_[4] ),
        .I1(switches_IBUF[0]),
        .I2(\state_reg_n_0_[0] ),
        .O(\y[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[5]_i_1__0 
       (.I0(\y_reg_n_0_[5] ),
        .I1(switches_IBUF[1]),
        .I2(\state_reg_n_0_[0] ),
        .O(\y[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[6]_i_1__0 
       (.I0(\y_reg_n_0_[6] ),
        .I1(switches_IBUF[2]),
        .I2(\state_reg_n_0_[0] ),
        .O(\y[6]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h01000000)) 
    \y[7]_i_1 
       (.I0(buttons_IBUF[0]),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(buttons_IBUF[1]),
        .O(y[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[7]_i_2__0 
       (.I0(\y_reg_n_0_[7] ),
        .I1(switches_IBUF[3]),
        .I2(\state_reg_n_0_[0] ),
        .O(\y[7]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(y[3]),
        .D(switches_IBUF[0]),
        .Q(\y_reg_n_0_[0] ),
        .R(\y[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(y[3]),
        .D(switches_IBUF[1]),
        .Q(\y_reg_n_0_[1] ),
        .R(\y[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(y[3]),
        .D(switches_IBUF[2]),
        .Q(\y_reg_n_0_[2] ),
        .R(\y[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(y[3]),
        .D(switches_IBUF[3]),
        .Q(\y_reg_n_0_[3] ),
        .R(\y[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(y[5]),
        .D(\y[4]_i_1__0_n_0 ),
        .Q(\y_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(y[5]),
        .D(\y[5]_i_1__0_n_0 ),
        .Q(\y_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(y[5]),
        .D(\y[6]_i_1__0_n_0 ),
        .Q(\y_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(y[5]),
        .D(\y[7]_i_2__0_n_0 ),
        .Q(\y_reg_n_0_[7] ),
        .R(1'b0));
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

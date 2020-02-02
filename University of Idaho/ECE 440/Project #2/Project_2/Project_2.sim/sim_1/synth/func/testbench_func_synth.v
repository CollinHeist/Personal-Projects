// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Tue Jan 28 15:38:35 2020
// Host        : ece-bel215-13 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {U:/ECE
//               440/Project_2/Project_2.sim/sim_1/synth/func/testbench_func_synth.v}
// Design      : gcd_core
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dp
   (update_x_reg,
    Q,
    CO,
    E,
    CLK,
    update_y_reg,
    data_IBUF,
    data_is_x,
    data_is_y);
  output update_x_reg;
  output [7:0]Q;
  output [0:0]CO;
  input [0:0]E;
  input CLK;
  input [0:0]update_y_reg;
  input [7:0]data_IBUF;
  input data_is_x;
  input data_is_y;

  wire CLK;
  wire [0:0]CO;
  wire [0:0]E;
  wire [7:0]Q;
  wire [7:0]data_IBUF;
  wire data_is_x;
  wire data_is_y;
  wire i___0_i_2_n_0;
  wire i___0_i_3_n_0;
  wire i___0_i_4_n_0;
  wire [7:0]p_0_in;
  wire update_x_reg;
  wire [0:0]update_y_reg;
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
  wire \y[0]_i_1_n_0 ;
  wire \y[1]_i_1_n_0 ;
  wire \y[2]_i_1_n_0 ;
  wire \y[3]_i_1_n_0 ;
  wire \y[4]_i_1_n_0 ;
  wire \y[5]_i_1_n_0 ;
  wire \y[6]_i_1_n_0 ;
  wire \y[7]_i_1_n_0 ;
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
  wire [3:0]NLW_x_greater_y_carry_O_UNCONNECTED;
  wire [3:3]NLW_x_min_y_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_y_min_x_carry__0_CO_UNCONNECTED;

  LUT5 #(
    .INIT(32'h82000000)) 
    i___0_i_1
       (.I0(i___0_i_2_n_0),
        .I1(Q[3]),
        .I2(y[3]),
        .I3(i___0_i_3_n_0),
        .I4(i___0_i_4_n_0),
        .O(update_x_reg));
  LUT4 #(
    .INIT(16'h9009)) 
    i___0_i_2
       (.I0(Q[6]),
        .I1(y[6]),
        .I2(Q[7]),
        .I3(y[7]),
        .O(i___0_i_2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i___0_i_3
       (.I0(Q[4]),
        .I1(y[4]),
        .I2(Q[5]),
        .I3(y[5]),
        .O(i___0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i___0_i_4
       (.I0(Q[0]),
        .I1(y[0]),
        .I2(y[2]),
        .I3(Q[2]),
        .I4(y[1]),
        .I5(Q[1]),
        .O(i___0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[0]_i_1 
       (.I0(data_IBUF[0]),
        .I1(x_min_y[0]),
        .I2(data_is_x),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[1]_i_1 
       (.I0(data_IBUF[1]),
        .I1(x_min_y[1]),
        .I2(data_is_x),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[2]_i_1 
       (.I0(data_IBUF[2]),
        .I1(x_min_y[2]),
        .I2(data_is_x),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[3]_i_1 
       (.I0(data_IBUF[3]),
        .I1(x_min_y[3]),
        .I2(data_is_x),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[4]_i_1 
       (.I0(data_IBUF[4]),
        .I1(x_min_y[4]),
        .I2(data_is_x),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[5]_i_1 
       (.I0(data_IBUF[5]),
        .I1(x_min_y[5]),
        .I2(data_is_x),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[6]_i_1 
       (.I0(data_IBUF[6]),
        .I1(x_min_y[6]),
        .I2(data_is_x),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \x[7]_i_1 
       (.I0(data_IBUF[7]),
        .I1(x_min_y[7]),
        .I2(data_is_x),
        .O(p_0_in[7]));
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
       (.I0(Q[6]),
        .I1(y[6]),
        .I2(Q[7]),
        .I3(y[7]),
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
       (.C(CLK),
        .CE(E),
        .D(p_0_in[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(p_0_in[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(p_0_in[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(p_0_in[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(p_0_in[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(p_0_in[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(p_0_in[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(p_0_in[7]),
        .Q(Q[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[0]_i_1 
       (.I0(data_IBUF[0]),
        .I1(y_min_x[0]),
        .I2(data_is_y),
        .O(\y[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[1]_i_1 
       (.I0(data_IBUF[1]),
        .I1(y_min_x[1]),
        .I2(data_is_y),
        .O(\y[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[2]_i_1 
       (.I0(data_IBUF[2]),
        .I1(y_min_x[2]),
        .I2(data_is_y),
        .O(\y[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[3]_i_1 
       (.I0(data_IBUF[3]),
        .I1(y_min_x[3]),
        .I2(data_is_y),
        .O(\y[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[4]_i_1 
       (.I0(data_IBUF[4]),
        .I1(y_min_x[4]),
        .I2(data_is_y),
        .O(\y[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[5]_i_1 
       (.I0(data_IBUF[5]),
        .I1(y_min_x[5]),
        .I2(data_is_y),
        .O(\y[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[6]_i_1 
       (.I0(data_IBUF[6]),
        .I1(y_min_x[6]),
        .I2(data_is_y),
        .O(\y[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \y[7]_i_1 
       (.I0(data_IBUF[7]),
        .I1(y_min_x[7]),
        .I2(data_is_y),
        .O(\y[7]_i_1_n_0 ));
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
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[0]_i_1_n_0 ),
        .Q(y[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[1] 
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[1]_i_1_n_0 ),
        .Q(y[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[2] 
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[2]_i_1_n_0 ),
        .Q(y[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[3] 
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[3]_i_1_n_0 ),
        .Q(y[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[4] 
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[4]_i_1_n_0 ),
        .Q(y[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[5] 
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[5]_i_1_n_0 ),
        .Q(y[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[6] 
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[6]_i_1_n_0 ),
        .Q(y[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[7] 
       (.C(CLK),
        .CE(update_y_reg),
        .D(\y[7]_i_1_n_0 ),
        .Q(y[7]),
        .R(1'b0));
endmodule

module fsm
   (\y_reg[7] ,
    data_is_y,
    E,
    data_is_x,
    done_OBUF,
    reset_IBUF,
    CLK,
    CO,
    \x_reg[3] ,
    load_IBUF);
  output [0:0]\y_reg[7] ;
  output data_is_y;
  output [0:0]E;
  output data_is_x;
  output done_OBUF;
  input reset_IBUF;
  input CLK;
  input [0:0]CO;
  input \x_reg[3] ;
  input load_IBUF;

  wire \/i___0_n_0 ;
  wire \/i___1_n_0 ;
  wire \/i___2_n_0 ;
  wire \/i___3_n_0 ;
  wire \/i___4_n_0 ;
  wire CLK;
  wire [0:0]CO;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire data_is_x;
  wire data_is_y;
  wire done_OBUF;
  wire load_IBUF;
  wire reset_IBUF;
  wire state;
  (* RTL_KEEP = "yes" *) wire [2:0]state__0;
  wire \x_reg[3] ;
  wire [0:0]\y_reg[7] ;

  LUT3 #(
    .INIT(8'h7F)) 
    \/i_ 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(state__0[2]),
        .O(state));
  LUT6 #(
    .INIT(64'h0000000020200F00)) 
    \/i___0 
       (.I0(CO),
        .I1(\x_reg[3] ),
        .I2(state__0[0]),
        .I3(load_IBUF),
        .I4(state__0[1]),
        .I5(state__0[2]),
        .O(\/i___0_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \/i___1 
       (.I0(state__0[0]),
        .I1(state__0[2]),
        .I2(load_IBUF),
        .I3(state__0[1]),
        .O(\/i___1_n_0 ));
  LUT5 #(
    .INIT(32'h01550000)) 
    \/i___2 
       (.I0(state__0[2]),
        .I1(CO),
        .I2(\x_reg[3] ),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(\/i___2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \/i___3 
       (.I0(state__0[0]),
        .I1(state__0[2]),
        .I2(state__0[1]),
        .O(\/i___3_n_0 ));
  LUT5 #(
    .INIT(32'h08380000)) 
    \/i___4 
       (.I0(\x_reg[3] ),
        .I1(state__0[0]),
        .I2(state__0[2]),
        .I3(load_IBUF),
        .I4(state__0[1]),
        .O(\/i___4_n_0 ));
  LUT6 #(
    .INIT(64'h0F100FFF0F100FF0)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(CO),
        .I1(\x_reg[3] ),
        .I2(state__0[1]),
        .I3(state__0[2]),
        .I4(state__0[0]),
        .I5(load_IBUF),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8BFFBBCC)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\x_reg[3] ),
        .I1(state__0[0]),
        .I2(load_IBUF),
        .I3(state__0[1]),
        .I4(state__0[2]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAA08)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state__0[1]),
        .I1(state__0[2]),
        .I2(load_IBUF),
        .I3(state__0[0]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(state),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state__0[0]),
        .R(reset_IBUF));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(state),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state__0[1]),
        .R(reset_IBUF));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(CLK),
        .CE(state),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state__0[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    data_is_x_reg
       (.C(CLK),
        .CE(state),
        .D(\/i___1_n_0 ),
        .Q(data_is_x),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    data_is_y_reg
       (.C(CLK),
        .CE(state),
        .D(\/i___3_n_0 ),
        .Q(data_is_y),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(CLK),
        .CE(state),
        .D(\/i___4_n_0 ),
        .Q(done_OBUF),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    update_x_reg
       (.C(CLK),
        .CE(state),
        .D(\/i___0_n_0 ),
        .Q(E),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    update_y_reg
       (.C(CLK),
        .CE(state),
        .D(\/i___2_n_0 ),
        .Q(\y_reg[7] ),
        .R(reset_IBUF));
endmodule

(* NotValidForBitStream *)
module gcd_core
   (clock,
    reset,
    load,
    data,
    gcd_result,
    done);
  input clock;
  input reset;
  input load;
  input [7:0]data;
  output [7:0]gcd_result;
  output done;

  wire clock;
  wire clock_IBUF;
  wire clock_IBUF_BUFG;
  wire [7:0]data;
  wire [7:0]data_IBUF;
  wire data_is_x;
  wire data_is_y;
  wire datapath_n_0;
  wire done;
  wire done_OBUF;
  wire [7:0]gcd_result;
  wire [7:0]gcd_result_OBUF;
  wire load;
  wire load_IBUF;
  wire reset;
  wire reset_IBUF;
  wire update_x;
  wire update_y;
  wire x_greater_y;

  BUFG clock_IBUF_BUFG_inst
       (.I(clock_IBUF),
        .O(clock_IBUF_BUFG));
  IBUF clock_IBUF_inst
       (.I(clock),
        .O(clock_IBUF));
  IBUF \data_IBUF[0]_inst 
       (.I(data[0]),
        .O(data_IBUF[0]));
  IBUF \data_IBUF[1]_inst 
       (.I(data[1]),
        .O(data_IBUF[1]));
  IBUF \data_IBUF[2]_inst 
       (.I(data[2]),
        .O(data_IBUF[2]));
  IBUF \data_IBUF[3]_inst 
       (.I(data[3]),
        .O(data_IBUF[3]));
  IBUF \data_IBUF[4]_inst 
       (.I(data[4]),
        .O(data_IBUF[4]));
  IBUF \data_IBUF[5]_inst 
       (.I(data[5]),
        .O(data_IBUF[5]));
  IBUF \data_IBUF[6]_inst 
       (.I(data[6]),
        .O(data_IBUF[6]));
  IBUF \data_IBUF[7]_inst 
       (.I(data[7]),
        .O(data_IBUF[7]));
  dp datapath
       (.CLK(clock_IBUF_BUFG),
        .CO(x_greater_y),
        .E(update_x),
        .Q(gcd_result_OBUF),
        .data_IBUF(data_IBUF),
        .data_is_x(data_is_x),
        .data_is_y(data_is_y),
        .update_x_reg(datapath_n_0),
        .update_y_reg(update_y));
  OBUF done_OBUF_inst
       (.I(done_OBUF),
        .O(done));
  fsm fsm
       (.CLK(clock_IBUF_BUFG),
        .CO(x_greater_y),
        .E(update_x),
        .data_is_x(data_is_x),
        .data_is_y(data_is_y),
        .done_OBUF(done_OBUF),
        .load_IBUF(load_IBUF),
        .reset_IBUF(reset_IBUF),
        .\x_reg[3] (datapath_n_0),
        .\y_reg[7] (update_y));
  OBUF \gcd_result_OBUF[0]_inst 
       (.I(gcd_result_OBUF[0]),
        .O(gcd_result[0]));
  OBUF \gcd_result_OBUF[1]_inst 
       (.I(gcd_result_OBUF[1]),
        .O(gcd_result[1]));
  OBUF \gcd_result_OBUF[2]_inst 
       (.I(gcd_result_OBUF[2]),
        .O(gcd_result[2]));
  OBUF \gcd_result_OBUF[3]_inst 
       (.I(gcd_result_OBUF[3]),
        .O(gcd_result[3]));
  OBUF \gcd_result_OBUF[4]_inst 
       (.I(gcd_result_OBUF[4]),
        .O(gcd_result[4]));
  OBUF \gcd_result_OBUF[5]_inst 
       (.I(gcd_result_OBUF[5]),
        .O(gcd_result[5]));
  OBUF \gcd_result_OBUF[6]_inst 
       (.I(gcd_result_OBUF[6]),
        .O(gcd_result[6]));
  OBUF \gcd_result_OBUF[7]_inst 
       (.I(gcd_result_OBUF[7]),
        .O(gcd_result[7]));
  IBUF load_IBUF_inst
       (.I(load),
        .O(load_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
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

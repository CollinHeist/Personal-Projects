// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun Mar 22 16:58:02 2020
// Host        : ece-bel215-02 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {C:/Users/heis0741/OneDrive - University
//               of Idaho/U-Drive/ECE 440/Project_8/Project_8.sim/sim_1/synth/timing/testbench_time_synth.v}
// Design      : hardware_wrapper
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module codon_counter
   (douta,
    \counts_reg[2][0]_0 ,
    leds_OBUF,
    Q,
    \codon_index_reg[2]_0 ,
    \previous_matches_reg[3]_0 ,
    \counts_reg[4][0]_0 ,
    \address_reg[0]_0 ,
    clock_IBUF_BUFG,
    \codon_index_reg[2]_1 ,
    reset_IBUF,
    \state_reg[1]_0 ,
    \state_reg[0]_0 ,
    \previous_matches_reg[3]_1 ,
    \previous_matches_reg[4]_0 ,
    \previous_matches_reg[4]_1 ,
    \codon_index_reg[2]_2 ,
    switches_IBUF,
    \previous_matches_reg[2]_0 ,
    \codons_reg[2][4][3] ,
    \codons_reg[1][4][3] ,
    \codon_index_reg[2]_3 ,
    \codon_index_reg[2]_4 ,
    D,
    E);
  output [3:0]douta;
  output \counts_reg[2][0]_0 ;
  output [3:0]leds_OBUF;
  output [2:0]Q;
  output \codon_index_reg[2]_0 ;
  output [4:0]\previous_matches_reg[3]_0 ;
  output \counts_reg[4][0]_0 ;
  output \address_reg[0]_0 ;
  input clock_IBUF_BUFG;
  input \codon_index_reg[2]_1 ;
  input reset_IBUF;
  input \state_reg[1]_0 ;
  input \state_reg[0]_0 ;
  input \previous_matches_reg[3]_1 ;
  input \previous_matches_reg[4]_0 ;
  input \previous_matches_reg[4]_1 ;
  input \codon_index_reg[2]_2 ;
  input [2:0]switches_IBUF;
  input \previous_matches_reg[2]_0 ;
  input \codons_reg[2][4][3] ;
  input \codons_reg[1][4][3] ;
  input \codon_index_reg[2]_3 ;
  input \codon_index_reg[2]_4 ;
  input [4:0]D;
  input [0:0]E;

  wire [4:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire [7:0]address;
  wire \address[7]_i_1_n_0 ;
  wire \address[7]_i_4_n_0 ;
  wire \address[7]_i_5_n_0 ;
  wire \address_reg[0]_0 ;
  wire await_new_read;
  wire await_new_read_i_1_n_0;
  wire clock_IBUF_BUFG;
  wire [1:0]codon_index;
  wire \codon_index[2]_i_1_n_0 ;
  wire \codon_index[2]_i_2_n_0 ;
  wire \codon_index_reg[2]_0 ;
  wire \codon_index_reg[2]_1 ;
  wire \codon_index_reg[2]_2 ;
  wire \codon_index_reg[2]_3 ;
  wire \codon_index_reg[2]_4 ;
  wire \codons_reg[1][4][3] ;
  wire \codons_reg[2][4][3] ;
  wire \counts[0][3]_i_1_n_0 ;
  wire \counts[1][3]_i_1_n_0 ;
  wire \counts[1][3]_i_3_n_0 ;
  wire \counts[1][3]_i_4_n_0 ;
  wire \counts[2][3]_i_1_n_0 ;
  wire \counts[2][3]_i_3_n_0 ;
  wire \counts[4][3]_i_1_n_0 ;
  wire [3:0]\counts_reg[0]__0 ;
  wire [3:0]\counts_reg[1]__0 ;
  wire \counts_reg[2][0]_0 ;
  wire [3:0]\counts_reg[2]__0 ;
  wire [3:0]\counts_reg[3]__0 ;
  wire \counts_reg[4][0]_0 ;
  wire [3:0]\counts_reg[4]__0 ;
  wire [3:0]douta;
  wire [3:0]leds_OBUF;
  wire \leds_OBUF[0]_inst_i_2_n_0 ;
  wire \leds_OBUF[0]_inst_i_3_n_0 ;
  wire \leds_OBUF[1]_inst_i_2_n_0 ;
  wire \leds_OBUF[2]_inst_i_2_n_0 ;
  wire \leds_OBUF[3]_inst_i_2_n_0 ;
  wire \leds_OBUF[3]_inst_i_3_n_0 ;
  wire [3:0]p_0_in__0;
  wire [3:0]p_0_in__1;
  wire [3:0]p_0_in__2;
  wire [3:0]p_0_in__3;
  wire [3:0]p_0_in__4;
  wire [7:0]p_0_in__5;
  wire \previous_matches_reg[2]_0 ;
  wire [4:0]\previous_matches_reg[3]_0 ;
  wire \previous_matches_reg[3]_1 ;
  wire \previous_matches_reg[4]_0 ;
  wire \previous_matches_reg[4]_1 ;
  wire reset_IBUF;
  wire [2:0]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire \state[2]_i_2_n_0 ;
  wire \state_reg[0]_0 ;
  wire \state_reg[1]_0 ;
  wire [2:0]switches_IBUF;

  LUT1 #(
    .INIT(2'h1)) 
    \address[0]_i_1__0 
       (.I0(address[0]),
        .O(p_0_in__5[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \address[1]_i_1__0 
       (.I0(address[0]),
        .I1(address[1]),
        .O(p_0_in__5[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \address[2]_i_1__0 
       (.I0(address[2]),
        .I1(address[1]),
        .I2(address[0]),
        .O(p_0_in__5[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \address[3]_i_1__0 
       (.I0(address[3]),
        .I1(address[0]),
        .I2(address[1]),
        .I3(address[2]),
        .O(p_0_in__5[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \address[4]_i_1 
       (.I0(address[4]),
        .I1(address[2]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(address[3]),
        .O(p_0_in__5[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \address[5]_i_1 
       (.I0(address[5]),
        .I1(address[3]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[2]),
        .I5(address[4]),
        .O(p_0_in__5[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \address[6]_i_1 
       (.I0(address[6]),
        .I1(\address[7]_i_5_n_0 ),
        .O(p_0_in__5[6]));
  LUT4 #(
    .INIT(16'h00F2)) 
    \address[7]_i_1 
       (.I0(state[1]),
        .I1(\codon_index_reg[2]_1 ),
        .I2(\state[2]_i_2_n_0 ),
        .I3(\address[7]_i_4_n_0 ),
        .O(\address[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \address[7]_i_2 
       (.I0(address[7]),
        .I1(\address[7]_i_5_n_0 ),
        .I2(address[6]),
        .O(p_0_in__5[7]));
  LUT5 #(
    .INIT(32'hEEEAFFFF)) 
    \address[7]_i_4 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(await_new_read),
        .I4(\state[1]_i_2_n_0 ),
        .O(\address[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \address[7]_i_5 
       (.I0(address[5]),
        .I1(address[3]),
        .I2(address[0]),
        .I3(address[1]),
        .I4(address[2]),
        .I5(address[4]),
        .O(\address[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \address[7]_i_6 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\address_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[0]),
        .Q(address[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[1]),
        .Q(address[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[2]),
        .Q(address[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[3]),
        .Q(address[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[4]),
        .Q(address[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[5]),
        .Q(address[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[6]),
        .Q(address[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(clock_IBUF_BUFG),
        .CE(\address[7]_i_1_n_0 ),
        .D(p_0_in__5[7]),
        .Q(address[7]),
        .R(reset_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00008A9A)) 
    await_new_read_i_1
       (.I0(await_new_read),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(reset_IBUF),
        .O(await_new_read_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    await_new_read_reg
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(await_new_read_i_1_n_0),
        .Q(await_new_read),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0051)) 
    \codon_index[0]_i_1 
       (.I0(Q[0]),
        .I1(\codon_index_reg[2]_0 ),
        .I2(\previous_matches_reg[2]_0 ),
        .I3(\codon_index_reg[2]_2 ),
        .O(codon_index[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00006606)) 
    \codon_index[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\codon_index_reg[2]_0 ),
        .I3(\previous_matches_reg[2]_0 ),
        .I4(\codon_index_reg[2]_2 ),
        .O(codon_index[1]));
  LUT4 #(
    .INIT(16'h0004)) 
    \codon_index[2]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(await_new_read),
        .O(\codon_index[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000078780078)) 
    \codon_index[2]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\codon_index_reg[2]_0 ),
        .I4(\previous_matches_reg[2]_0 ),
        .I5(\codon_index_reg[2]_2 ),
        .O(\codon_index[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0DDD)) 
    \codon_index[2]_i_3 
       (.I0(\previous_matches_reg[3]_0 [3]),
        .I1(\codon_index_reg[2]_3 ),
        .I2(\codon_index_reg[2]_4 ),
        .I3(\previous_matches_reg[3]_0 [4]),
        .O(\codon_index_reg[2]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \codon_index_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(codon_index[0]),
        .Q(Q[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \codon_index_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(codon_index[1]),
        .Q(Q[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \codon_index_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(\codon_index[2]_i_2_n_0 ),
        .Q(Q[2]),
        .R(reset_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counts[0][0]_i_1 
       (.I0(\counts_reg[0]__0 [0]),
        .O(p_0_in__4[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counts[0][1]_i_1 
       (.I0(\counts_reg[0]__0 [0]),
        .I1(\counts_reg[0]__0 [1]),
        .O(p_0_in__4[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counts[0][2]_i_1 
       (.I0(\counts_reg[0]__0 [2]),
        .I1(\counts_reg[0]__0 [1]),
        .I2(\counts_reg[0]__0 [0]),
        .O(p_0_in__4[2]));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \counts[0][3]_i_1 
       (.I0(\previous_matches_reg[4]_1 ),
        .I1(\codon_index_reg[2]_2 ),
        .I2(\codon_index[2]_i_1_n_0 ),
        .I3(\counts[2][3]_i_3_n_0 ),
        .I4(\counts[1][3]_i_3_n_0 ),
        .I5(\counts[1][3]_i_4_n_0 ),
        .O(\counts[0][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counts[0][3]_i_2 
       (.I0(\counts_reg[0]__0 [3]),
        .I1(\counts_reg[0]__0 [0]),
        .I2(\counts_reg[0]__0 [1]),
        .I3(\counts_reg[0]__0 [2]),
        .O(p_0_in__4[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counts[1][0]_i_1 
       (.I0(\counts_reg[1]__0 [0]),
        .O(p_0_in__3[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counts[1][1]_i_1 
       (.I0(\counts_reg[1]__0 [0]),
        .I1(\counts_reg[1]__0 [1]),
        .O(p_0_in__3[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counts[1][2]_i_1 
       (.I0(\counts_reg[1]__0 [2]),
        .I1(\counts_reg[1]__0 [1]),
        .I2(\counts_reg[1]__0 [0]),
        .O(p_0_in__3[2]));
  LUT4 #(
    .INIT(16'h0040)) 
    \counts[1][3]_i_1 
       (.I0(\counts[2][3]_i_3_n_0 ),
        .I1(\codon_index[2]_i_1_n_0 ),
        .I2(\counts[1][3]_i_3_n_0 ),
        .I3(\counts[1][3]_i_4_n_0 ),
        .O(\counts[1][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counts[1][3]_i_2 
       (.I0(\counts_reg[1]__0 [3]),
        .I1(\counts_reg[1]__0 [0]),
        .I2(\counts_reg[1]__0 [1]),
        .I3(\counts_reg[1]__0 [2]),
        .O(p_0_in__3[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \counts[1][3]_i_3 
       (.I0(\previous_matches_reg[3]_0 [1]),
        .I1(\codons_reg[1][4][3] ),
        .O(\counts[1][3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEEEEEEEEEEEEEEE)) 
    \counts[1][3]_i_4 
       (.I0(\previous_matches_reg[4]_0 ),
        .I1(\previous_matches_reg[3]_1 ),
        .I2(douta[0]),
        .I3(douta[2]),
        .I4(douta[1]),
        .I5(douta[3]),
        .O(\counts[1][3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counts[2][0]_i_1 
       (.I0(\counts_reg[2]__0 [0]),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counts[2][1]_i_1 
       (.I0(\counts_reg[2]__0 [0]),
        .I1(\counts_reg[2]__0 [1]),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counts[2][2]_i_1 
       (.I0(\counts_reg[2]__0 [2]),
        .I1(\counts_reg[2]__0 [1]),
        .I2(\counts_reg[2]__0 [0]),
        .O(p_0_in__2[2]));
  LUT3 #(
    .INIT(8'h08)) 
    \counts[2][3]_i_1 
       (.I0(\counts_reg[2][0]_0 ),
        .I1(\counts[2][3]_i_3_n_0 ),
        .I2(\previous_matches_reg[3]_1 ),
        .O(\counts[2][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counts[2][3]_i_2 
       (.I0(\counts_reg[2]__0 [3]),
        .I1(\counts_reg[2]__0 [0]),
        .I2(\counts_reg[2]__0 [1]),
        .I3(\counts_reg[2]__0 [2]),
        .O(p_0_in__2[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \counts[2][3]_i_3 
       (.I0(\previous_matches_reg[3]_0 [2]),
        .I1(\codons_reg[2][4][3] ),
        .O(\counts[2][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counts[3][0]_i_1 
       (.I0(\counts_reg[3]__0 [0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counts[3][1]_i_1 
       (.I0(\counts_reg[3]__0 [0]),
        .I1(\counts_reg[3]__0 [1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counts[3][2]_i_1 
       (.I0(\counts_reg[3]__0 [2]),
        .I1(\counts_reg[3]__0 [1]),
        .I2(\counts_reg[3]__0 [0]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counts[3][3]_i_2 
       (.I0(\counts_reg[3]__0 [3]),
        .I1(\counts_reg[3]__0 [0]),
        .I2(\counts_reg[3]__0 [1]),
        .I3(\counts_reg[3]__0 [2]),
        .O(p_0_in__1[3]));
  LUT6 #(
    .INIT(64'h0444444444444444)) 
    \counts[3][3]_i_4 
       (.I0(\previous_matches_reg[4]_0 ),
        .I1(\codon_index[2]_i_1_n_0 ),
        .I2(douta[0]),
        .I3(douta[2]),
        .I4(douta[1]),
        .I5(douta[3]),
        .O(\counts_reg[2][0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counts[4][0]_i_1 
       (.I0(\counts_reg[4]__0 [0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counts[4][1]_i_1 
       (.I0(\counts_reg[4]__0 [0]),
        .I1(\counts_reg[4]__0 [1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counts[4][2]_i_1 
       (.I0(\counts_reg[4]__0 [2]),
        .I1(\counts_reg[4]__0 [1]),
        .I2(\counts_reg[4]__0 [0]),
        .O(p_0_in__0[2]));
  LUT6 #(
    .INIT(64'h0888888888888888)) 
    \counts[4][3]_i_1 
       (.I0(\previous_matches_reg[4]_0 ),
        .I1(\codon_index[2]_i_1_n_0 ),
        .I2(douta[0]),
        .I3(douta[2]),
        .I4(douta[1]),
        .I5(douta[3]),
        .O(\counts[4][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counts[4][3]_i_2 
       (.I0(\counts_reg[4]__0 [3]),
        .I1(\counts_reg[4]__0 [2]),
        .I2(\counts_reg[4]__0 [0]),
        .I3(\counts_reg[4]__0 [1]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h95)) 
    \counts[4][3]_i_5 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\counts_reg[4][0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[0][0] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[0][3]_i_1_n_0 ),
        .D(p_0_in__4[0]),
        .Q(\counts_reg[0]__0 [0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[0][1] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[0][3]_i_1_n_0 ),
        .D(p_0_in__4[1]),
        .Q(\counts_reg[0]__0 [1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[0][2] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[0][3]_i_1_n_0 ),
        .D(p_0_in__4[2]),
        .Q(\counts_reg[0]__0 [2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[0][3] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[0][3]_i_1_n_0 ),
        .D(p_0_in__4[3]),
        .Q(\counts_reg[0]__0 [3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[1][0] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[1][3]_i_1_n_0 ),
        .D(p_0_in__3[0]),
        .Q(\counts_reg[1]__0 [0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[1][1] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[1][3]_i_1_n_0 ),
        .D(p_0_in__3[1]),
        .Q(\counts_reg[1]__0 [1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[1][2] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[1][3]_i_1_n_0 ),
        .D(p_0_in__3[2]),
        .Q(\counts_reg[1]__0 [2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[1][3] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[1][3]_i_1_n_0 ),
        .D(p_0_in__3[3]),
        .Q(\counts_reg[1]__0 [3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[2][0] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[2][3]_i_1_n_0 ),
        .D(p_0_in__2[0]),
        .Q(\counts_reg[2]__0 [0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[2][1] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[2][3]_i_1_n_0 ),
        .D(p_0_in__2[1]),
        .Q(\counts_reg[2]__0 [1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[2][2] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[2][3]_i_1_n_0 ),
        .D(p_0_in__2[2]),
        .Q(\counts_reg[2]__0 [2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[2][3] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[2][3]_i_1_n_0 ),
        .D(p_0_in__2[3]),
        .Q(\counts_reg[2]__0 [3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[3][0] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[0]),
        .Q(\counts_reg[3]__0 [0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[3][1] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[1]),
        .Q(\counts_reg[3]__0 [1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[3][2] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[2]),
        .Q(\counts_reg[3]__0 [2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[3][3] 
       (.C(clock_IBUF_BUFG),
        .CE(E),
        .D(p_0_in__1[3]),
        .Q(\counts_reg[3]__0 [3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[4][0] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[4][3]_i_1_n_0 ),
        .D(p_0_in__0[0]),
        .Q(\counts_reg[4]__0 [0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[4][1] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[4][3]_i_1_n_0 ),
        .D(p_0_in__0[1]),
        .Q(\counts_reg[4]__0 [1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[4][2] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[4][3]_i_1_n_0 ),
        .D(p_0_in__0[2]),
        .Q(\counts_reg[4]__0 [2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \counts_reg[4][3] 
       (.C(clock_IBUF_BUFG),
        .CE(\counts[4][3]_i_1_n_0 ),
        .D(p_0_in__0[3]),
        .Q(\counts_reg[4]__0 [3]),
        .R(reset_IBUF));
  (* syn_black_box = "TRUE" *) 
  (* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *) 
  gene_memory gene_memory_instance
       (.addra(address),
        .clka(clock_IBUF_BUFG),
        .dina({1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .ena(1'b1),
        .wea(1'b0));
  LUT6 #(
    .INIT(64'h00000000EEEB222B)) 
    \leds_OBUF[0]_inst_i_1 
       (.I0(\leds_OBUF[0]_inst_i_2_n_0 ),
        .I1(switches_IBUF[2]),
        .I2(switches_IBUF[1]),
        .I3(switches_IBUF[0]),
        .I4(\counts_reg[4]__0 [0]),
        .I5(\leds_OBUF[0]_inst_i_3_n_0 ),
        .O(leds_OBUF[0]));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \leds_OBUF[0]_inst_i_2 
       (.I0(\counts_reg[0]__0 [0]),
        .I1(\counts_reg[1]__0 [0]),
        .I2(switches_IBUF[0]),
        .I3(switches_IBUF[1]),
        .I4(\counts_reg[2]__0 [0]),
        .I5(\counts_reg[3]__0 [0]),
        .O(\leds_OBUF[0]_inst_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \leds_OBUF[0]_inst_i_3 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .O(\leds_OBUF[0]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CCCAAAAC)) 
    \leds_OBUF[1]_inst_i_1 
       (.I0(\leds_OBUF[1]_inst_i_2_n_0 ),
        .I1(\counts_reg[4]__0 [1]),
        .I2(switches_IBUF[0]),
        .I3(switches_IBUF[1]),
        .I4(switches_IBUF[2]),
        .I5(\leds_OBUF[3]_inst_i_3_n_0 ),
        .O(leds_OBUF[1]));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \leds_OBUF[1]_inst_i_2 
       (.I0(\counts_reg[0]__0 [1]),
        .I1(\counts_reg[1]__0 [1]),
        .I2(switches_IBUF[0]),
        .I3(switches_IBUF[1]),
        .I4(\counts_reg[2]__0 [1]),
        .I5(\counts_reg[3]__0 [1]),
        .O(\leds_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CCCAAAAC)) 
    \leds_OBUF[2]_inst_i_1 
       (.I0(\leds_OBUF[2]_inst_i_2_n_0 ),
        .I1(\counts_reg[4]__0 [2]),
        .I2(switches_IBUF[0]),
        .I3(switches_IBUF[1]),
        .I4(switches_IBUF[2]),
        .I5(\leds_OBUF[3]_inst_i_3_n_0 ),
        .O(leds_OBUF[2]));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \leds_OBUF[2]_inst_i_2 
       (.I0(\counts_reg[0]__0 [2]),
        .I1(\counts_reg[1]__0 [2]),
        .I2(switches_IBUF[0]),
        .I3(switches_IBUF[1]),
        .I4(\counts_reg[2]__0 [2]),
        .I5(\counts_reg[3]__0 [2]),
        .O(\leds_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CCCAAAAC)) 
    \leds_OBUF[3]_inst_i_1 
       (.I0(\leds_OBUF[3]_inst_i_2_n_0 ),
        .I1(\counts_reg[4]__0 [3]),
        .I2(switches_IBUF[0]),
        .I3(switches_IBUF[1]),
        .I4(switches_IBUF[2]),
        .I5(\leds_OBUF[3]_inst_i_3_n_0 ),
        .O(leds_OBUF[3]));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \leds_OBUF[3]_inst_i_2 
       (.I0(\counts_reg[0]__0 [3]),
        .I1(\counts_reg[1]__0 [3]),
        .I2(switches_IBUF[0]),
        .I3(switches_IBUF[1]),
        .I4(\counts_reg[2]__0 [3]),
        .I5(\counts_reg[3]__0 [3]),
        .O(\leds_OBUF[3]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF01FFFFFFFF)) 
    \leds_OBUF[3]_inst_i_3 
       (.I0(switches_IBUF[2]),
        .I1(switches_IBUF[0]),
        .I2(switches_IBUF[1]),
        .I3(state[0]),
        .I4(state[1]),
        .I5(state[2]),
        .O(\leds_OBUF[3]_inst_i_3_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \previous_matches_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(D[0]),
        .Q(\previous_matches_reg[3]_0 [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \previous_matches_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(D[1]),
        .Q(\previous_matches_reg[3]_0 [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \previous_matches_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(D[2]),
        .Q(\previous_matches_reg[3]_0 [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \previous_matches_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(D[3]),
        .Q(\previous_matches_reg[3]_0 [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \previous_matches_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\codon_index[2]_i_1_n_0 ),
        .D(D[4]),
        .Q(\previous_matches_reg[3]_0 [4]),
        .S(reset_IBUF));
  LUT6 #(
    .INIT(64'hFFFF0000FB3B0BBB)) 
    \state[0]_i_1 
       (.I0(\state[2]_i_2_n_0 ),
        .I1(\state[1]_i_2_n_0 ),
        .I2(state[1]),
        .I3(await_new_read),
        .I4(state[0]),
        .I5(state[2]),
        .O(\state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0FAFAAA2AFAAA)) 
    \state[1]_i_1 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(\state[2]_i_2_n_0 ),
        .I2(state[1]),
        .I3(await_new_read),
        .I4(state[0]),
        .I5(state[2]),
        .O(\state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBAAAAAAA)) 
    \state[1]_i_2 
       (.I0(state[1]),
        .I1(reset_IBUF),
        .I2(state[0]),
        .I3(\state_reg[1]_0 ),
        .I4(\state_reg[0]_0 ),
        .O(\state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0800)) 
    \state[2]_i_1 
       (.I0(\state[2]_i_2_n_0 ),
        .I1(state[1]),
        .I2(await_new_read),
        .I3(state[0]),
        .I4(state[2]),
        .O(\state[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \state[2]_i_2 
       (.I0(douta[0]),
        .I1(douta[2]),
        .I2(douta[1]),
        .I3(douta[3]),
        .O(\state[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(reset_IBUF));
endmodule

(* CHECK_LICENSE_TYPE = "codon_memory,blk_mem_gen_v8_3_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *) 
module codon_memory
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [3:0]douta;

  wire [4:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
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
  wire [3:0]NLW_U0_doutb_UNCONNECTED;
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_DEFAULT_DATA = "F" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.37365 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
  (* C_INIT_FILE = "codon_memory.mem" *) 
  (* C_INIT_FILE_NAME = "codon_memory.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "32" *) 
  (* C_READ_DEPTH_B = "32" *) 
  (* C_READ_WIDTH_A = "4" *) 
  (* C_READ_WIDTH_B = "4" *) 
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
  (* C_WRITE_DEPTH_A = "32" *) 
  (* C_WRITE_DEPTH_B = "32" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "4" *) 
  (* C_WRITE_WIDTH_B = "4" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  codon_memory_blk_mem_gen_v8_3_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[3:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[3:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0}),
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

module codon_reader
   (\state_reg[1]_0 ,
    \state_reg[1]_1 ,
    E,
    \counts_reg[3][3] ,
    D,
    \previous_matches_reg[1] ,
    \previous_matches_reg[1]_0 ,
    \previous_matches_reg[1]_1 ,
    \previous_matches_reg[1]_2 ,
    \counts_reg[4][0] ,
    \address_reg[0]_0 ,
    \previous_matches_reg[3] ,
    \previous_matches_reg[3]_0 ,
    \counts_reg[0][0] ,
    CLK,
    reset_IBUF,
    \previous_matches_reg[4] ,
    \previous_matches_reg[3]_1 ,
    \codon_index_reg[2] ,
    \previous_matches_reg[4]_0 ,
    Q,
    \codon_index_reg[2]_0 ,
    douta);
  output \state_reg[1]_0 ;
  output \state_reg[1]_1 ;
  output [0:0]E;
  output \counts_reg[3][3] ;
  output [4:0]D;
  output \previous_matches_reg[1] ;
  output \previous_matches_reg[1]_0 ;
  output \previous_matches_reg[1]_1 ;
  output \previous_matches_reg[1]_2 ;
  output \counts_reg[4][0] ;
  output \address_reg[0]_0 ;
  output \previous_matches_reg[3] ;
  output \previous_matches_reg[3]_0 ;
  output \counts_reg[0][0] ;
  input CLK;
  input reset_IBUF;
  input \previous_matches_reg[4] ;
  input \previous_matches_reg[3]_1 ;
  input \codon_index_reg[2] ;
  input [4:0]\previous_matches_reg[4]_0 ;
  input [2:0]Q;
  input \codon_index_reg[2]_0 ;
  input [3:0]douta;

  wire CLK;
  wire [4:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire [4:0]address;
  wire \address[4]_i_1__0_n_0 ;
  wire \address_reg[0]_0 ;
  wire \codon_index[2]_i_11_n_0 ;
  wire \codon_index[2]_i_12_n_0 ;
  wire \codon_index[2]_i_13_n_0 ;
  wire \codon_index[2]_i_14_n_0 ;
  wire \codon_index[2]_i_15_n_0 ;
  wire \codon_index[2]_i_16_n_0 ;
  wire \codon_index[2]_i_17_n_0 ;
  wire \codon_index[2]_i_18_n_0 ;
  wire \codon_index[2]_i_19_n_0 ;
  wire \codon_index[2]_i_20_n_0 ;
  wire \codon_index[2]_i_21_n_0 ;
  wire \codon_index[2]_i_22_n_0 ;
  wire \codon_index[2]_i_23_n_0 ;
  wire \codon_index[2]_i_24_n_0 ;
  wire \codon_index[2]_i_25_n_0 ;
  wire \codon_index[2]_i_26_n_0 ;
  wire \codon_index[2]_i_27_n_0 ;
  wire \codon_index[2]_i_28_n_0 ;
  wire \codon_index[2]_i_29_n_0 ;
  wire \codon_index[2]_i_30_n_0 ;
  wire \codon_index[2]_i_31_n_0 ;
  wire \codon_index[2]_i_32_n_0 ;
  wire \codon_index[2]_i_33_n_0 ;
  wire \codon_index[2]_i_34_n_0 ;
  wire \codon_index[2]_i_6_n_0 ;
  wire \codon_index[2]_i_7_n_0 ;
  wire \codon_index[2]_i_8_n_0 ;
  wire \codon_index_reg[2] ;
  wire \codon_index_reg[2]_0 ;
  wire [2:0]codon_num;
  wire \codon_num[0]_i_1_n_0 ;
  wire \codon_num[1]_i_1_n_0 ;
  wire \codon_num[2]_i_1_n_0 ;
  wire \codon_sub_addr[0]_i_1_n_0 ;
  wire \codon_sub_addr[1]_i_1_n_0 ;
  wire \codon_sub_addr[2]_i_1_n_0 ;
  wire \codon_sub_addr[3]_i_1_n_0 ;
  wire \codon_sub_addr[3]_i_2_n_0 ;
  wire \codon_sub_addr_reg_n_0_[0] ;
  wire \codon_sub_addr_reg_n_0_[1] ;
  wire \codon_sub_addr_reg_n_0_[2] ;
  wire \codon_sub_addr_reg_n_0_[3] ;
  wire \codons[0][0][3]_i_1_n_0 ;
  wire \codons[0][1][3]_i_1_n_0 ;
  wire \codons[0][2][3]_i_1_n_0 ;
  wire \codons[0][3][3]_i_1_n_0 ;
  wire \codons[0][4][3]_i_1_n_0 ;
  wire \codons[0][4][3]_i_2_n_0 ;
  wire \codons[0][5][3]_i_1_n_0 ;
  wire \codons[0][5][3]_i_2_n_0 ;
  wire \codons[0][5][3]_i_3_n_0 ;
  wire \codons[1][0][3]_i_1_n_0 ;
  wire \codons[1][1][3]_i_1_n_0 ;
  wire \codons[1][2][3]_i_1_n_0 ;
  wire \codons[1][3][3]_i_1_n_0 ;
  wire \codons[1][4][3]_i_1_n_0 ;
  wire \codons[1][4][3]_i_2_n_0 ;
  wire \codons[1][5][3]_i_1_n_0 ;
  wire \codons[2][0][3]_i_1_n_0 ;
  wire \codons[2][1][3]_i_1_n_0 ;
  wire \codons[2][2][3]_i_1_n_0 ;
  wire \codons[2][3][3]_i_1_n_0 ;
  wire \codons[2][4][3]_i_1_n_0 ;
  wire \codons[2][4][3]_i_2_n_0 ;
  wire \codons[2][5][3]_i_1_n_0 ;
  wire \codons[3][0][3]_i_1_n_0 ;
  wire \codons[3][1][3]_i_1_n_0 ;
  wire \codons[3][2][3]_i_1_n_0 ;
  wire \codons[3][3][3]_i_1_n_0 ;
  wire \codons[3][4][3]_i_1_n_0 ;
  wire \codons[3][4][3]_i_2_n_0 ;
  wire \codons[3][5][3]_i_1_n_0 ;
  wire \codons[4][0][3]_i_1_n_0 ;
  wire \codons[4][1][3]_i_1_n_0 ;
  wire \codons[4][2][3]_i_1_n_0 ;
  wire \codons[4][3][3]_i_1_n_0 ;
  wire \codons[4][4][3]_i_1_n_0 ;
  wire \codons[4][5][3]_i_1_n_0 ;
  wire [3:0]\codons_reg[0][0] ;
  wire [3:0]\codons_reg[0][1] ;
  wire [3:0]\codons_reg[0][2] ;
  wire [3:0]\codons_reg[0][3] ;
  wire [3:0]\codons_reg[0][4] ;
  wire [3:0]\codons_reg[0][5] ;
  wire [3:0]\codons_reg[1][0] ;
  wire [3:0]\codons_reg[1][1] ;
  wire [3:0]\codons_reg[1][2] ;
  wire [3:0]\codons_reg[1][3] ;
  wire [3:0]\codons_reg[1][4] ;
  wire [3:0]\codons_reg[1][5] ;
  wire [3:0]\codons_reg[2][0] ;
  wire [3:0]\codons_reg[2][1] ;
  wire [3:0]\codons_reg[2][2] ;
  wire [3:0]\codons_reg[2][3] ;
  wire [3:0]\codons_reg[2][4] ;
  wire [3:0]\codons_reg[2][5] ;
  wire [3:0]\codons_reg[3][0] ;
  wire [3:0]\codons_reg[3][1] ;
  wire [3:0]\codons_reg[3][2] ;
  wire [3:0]\codons_reg[3][3] ;
  wire [3:0]\codons_reg[3][4] ;
  wire [3:0]\codons_reg[3][5] ;
  wire [3:0]\codons_reg[4][0] ;
  wire [3:0]\codons_reg[4][1] ;
  wire [3:0]\codons_reg[4][2] ;
  wire [3:0]\codons_reg[4][3] ;
  wire [3:0]\codons_reg[4][4] ;
  wire [3:0]\codons_reg[4][5] ;
  wire \counts[0][3]_i_4_n_0 ;
  wire \counts[0][3]_i_5_n_0 ;
  wire \counts[0][3]_i_6_n_0 ;
  wire \counts[3][3]_i_10_n_0 ;
  wire \counts[3][3]_i_11_n_0 ;
  wire \counts[3][3]_i_12_n_0 ;
  wire \counts[3][3]_i_5_n_0 ;
  wire \counts[3][3]_i_6_n_0 ;
  wire \counts[3][3]_i_7_n_0 ;
  wire \counts[3][3]_i_8_n_0 ;
  wire \counts[3][3]_i_9_n_0 ;
  wire \counts[4][3]_i_10_n_0 ;
  wire \counts[4][3]_i_11_n_0 ;
  wire \counts[4][3]_i_12_n_0 ;
  wire \counts[4][3]_i_4_n_0 ;
  wire \counts[4][3]_i_6_n_0 ;
  wire \counts[4][3]_i_7_n_0 ;
  wire \counts[4][3]_i_8_n_0 ;
  wire \counts[4][3]_i_9_n_0 ;
  wire \counts_reg[0][0] ;
  wire \counts_reg[3][3] ;
  wire \counts_reg[4][0] ;
  wire [3:0]douta;
  wire [3:0]memory_out;
  wire [4:0]p_0_in;
  wire \previous_matches[0]_i_10_n_0 ;
  wire \previous_matches[0]_i_11_n_0 ;
  wire \previous_matches[0]_i_12_n_0 ;
  wire \previous_matches[0]_i_13_n_0 ;
  wire \previous_matches[0]_i_14_n_0 ;
  wire \previous_matches[0]_i_15_n_0 ;
  wire \previous_matches[0]_i_2_n_0 ;
  wire \previous_matches[0]_i_7_n_0 ;
  wire \previous_matches[0]_i_8_n_0 ;
  wire \previous_matches[0]_i_9_n_0 ;
  wire \previous_matches[1]_i_10_n_0 ;
  wire \previous_matches[1]_i_11_n_0 ;
  wire \previous_matches[1]_i_12_n_0 ;
  wire \previous_matches[1]_i_13_n_0 ;
  wire \previous_matches[1]_i_14_n_0 ;
  wire \previous_matches[1]_i_15_n_0 ;
  wire \previous_matches[1]_i_2_n_0 ;
  wire \previous_matches[1]_i_3_n_0 ;
  wire \previous_matches[1]_i_8_n_0 ;
  wire \previous_matches[1]_i_9_n_0 ;
  wire \previous_matches[2]_i_10_n_0 ;
  wire \previous_matches[2]_i_11_n_0 ;
  wire \previous_matches[2]_i_12_n_0 ;
  wire \previous_matches[2]_i_13_n_0 ;
  wire \previous_matches[2]_i_14_n_0 ;
  wire \previous_matches[2]_i_15_n_0 ;
  wire \previous_matches[2]_i_2_n_0 ;
  wire \previous_matches[2]_i_3_n_0 ;
  wire \previous_matches[2]_i_8_n_0 ;
  wire \previous_matches[2]_i_9_n_0 ;
  wire \previous_matches[4]_i_11_n_0 ;
  wire \previous_matches[4]_i_12_n_0 ;
  wire \previous_matches[4]_i_13_n_0 ;
  wire \previous_matches[4]_i_14_n_0 ;
  wire \previous_matches[4]_i_15_n_0 ;
  wire \previous_matches[4]_i_16_n_0 ;
  wire \previous_matches[4]_i_17_n_0 ;
  wire \previous_matches[4]_i_18_n_0 ;
  wire \previous_matches[4]_i_19_n_0 ;
  wire \previous_matches[4]_i_20_n_0 ;
  wire \previous_matches[4]_i_21_n_0 ;
  wire \previous_matches[4]_i_22_n_0 ;
  wire \previous_matches[4]_i_23_n_0 ;
  wire \previous_matches[4]_i_26_n_0 ;
  wire \previous_matches[4]_i_27_n_0 ;
  wire \previous_matches[4]_i_28_n_0 ;
  wire \previous_matches[4]_i_29_n_0 ;
  wire \previous_matches[4]_i_8_n_0 ;
  wire \previous_matches_reg[0]_i_3_n_0 ;
  wire \previous_matches_reg[0]_i_4_n_0 ;
  wire \previous_matches_reg[0]_i_5_n_0 ;
  wire \previous_matches_reg[0]_i_6_n_0 ;
  wire \previous_matches_reg[1] ;
  wire \previous_matches_reg[1]_0 ;
  wire \previous_matches_reg[1]_1 ;
  wire \previous_matches_reg[1]_2 ;
  wire \previous_matches_reg[1]_i_4_n_0 ;
  wire \previous_matches_reg[1]_i_5_n_0 ;
  wire \previous_matches_reg[1]_i_6_n_0 ;
  wire \previous_matches_reg[1]_i_7_n_0 ;
  wire \previous_matches_reg[2]_i_4_n_0 ;
  wire \previous_matches_reg[2]_i_5_n_0 ;
  wire \previous_matches_reg[2]_i_6_n_0 ;
  wire \previous_matches_reg[2]_i_7_n_0 ;
  wire \previous_matches_reg[3] ;
  wire \previous_matches_reg[3]_0 ;
  wire \previous_matches_reg[3]_1 ;
  wire \previous_matches_reg[4] ;
  wire [4:0]\previous_matches_reg[4]_0 ;
  wire \previous_matches_reg[4]_i_10_n_0 ;
  wire \previous_matches_reg[4]_i_24_n_0 ;
  wire \previous_matches_reg[4]_i_25_n_0 ;
  wire \previous_matches_reg[4]_i_4_n_0 ;
  wire \previous_matches_reg[4]_i_5_n_0 ;
  wire \previous_matches_reg[4]_i_6_n_0 ;
  wire \previous_matches_reg[4]_i_7_n_0 ;
  wire \previous_matches_reg[4]_i_9_n_0 ;
  wire reset_IBUF;
  wire \state[0]_i_1_n_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2__0_n_0 ;
  wire \state_reg[1]_0 ;
  wire \state_reg[1]_1 ;

  LUT1 #(
    .INIT(2'h1)) 
    \address[0]_i_1 
       (.I0(address[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \address[1]_i_1 
       (.I0(address[0]),
        .I1(address[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \address[2]_i_1 
       (.I0(address[2]),
        .I1(address[1]),
        .I2(address[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \address[3]_i_1 
       (.I0(address[3]),
        .I1(address[0]),
        .I2(address[1]),
        .I3(address[2]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'h00007FFFFFFFFFFF)) 
    \address[4]_i_1__0 
       (.I0(memory_out[0]),
        .I1(memory_out[2]),
        .I2(memory_out[1]),
        .I3(memory_out[3]),
        .I4(\state_reg[1]_1 ),
        .I5(\state_reg[1]_0 ),
        .O(\address[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \address[4]_i_2 
       (.I0(address[4]),
        .I1(address[2]),
        .I2(address[1]),
        .I3(address[0]),
        .I4(address[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    \address[7]_i_3 
       (.I0(\previous_matches[0]_i_2_n_0 ),
        .I1(\previous_matches_reg[3] ),
        .I2(\previous_matches[1]_i_2_n_0 ),
        .I3(\previous_matches_reg[3]_0 ),
        .I4(\previous_matches[2]_i_2_n_0 ),
        .I5(\codon_index_reg[2]_0 ),
        .O(\address_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(CLK),
        .CE(\address[4]_i_1__0_n_0 ),
        .D(p_0_in[0]),
        .Q(address[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(CLK),
        .CE(\address[4]_i_1__0_n_0 ),
        .D(p_0_in[1]),
        .Q(address[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(CLK),
        .CE(\address[4]_i_1__0_n_0 ),
        .D(p_0_in[2]),
        .Q(address[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(CLK),
        .CE(\address[4]_i_1__0_n_0 ),
        .D(p_0_in[3]),
        .Q(address[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(CLK),
        .CE(\address[4]_i_1__0_n_0 ),
        .D(p_0_in[4]),
        .Q(address[4]),
        .R(reset_IBUF));
  LUT6 #(
    .INIT(64'h00000000FD0D0000)) 
    \codon_index[2]_i_10 
       (.I0(\codon_index[2]_i_22_n_0 ),
        .I1(\codon_index[2]_i_23_n_0 ),
        .I2(\codon_index_reg[2] ),
        .I3(\codon_index[2]_i_24_n_0 ),
        .I4(\codon_index[2]_i_25_n_0 ),
        .I5(\previous_matches[1]_i_3_n_0 ),
        .O(\previous_matches_reg[1]_2 ));
  LUT6 #(
    .INIT(64'h00000000FF7FFFFF)) 
    \codon_index[2]_i_11 
       (.I0(\codons_reg[0][5] [0]),
        .I1(\codons_reg[0][5] [3]),
        .I2(\codons_reg[0][5] [2]),
        .I3(Q[0]),
        .I4(\codons_reg[0][5] [1]),
        .I5(\codon_index[2]_i_26_n_0 ),
        .O(\codon_index[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_12 
       (.I0(\codons_reg[0][2] [2]),
        .I1(\codons_reg[0][3] [2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[0][0] [2]),
        .I5(\codons_reg[0][1] [2]),
        .O(\codon_index[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_13 
       (.I0(\codons_reg[0][2] [1]),
        .I1(\codons_reg[0][3] [1]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[0][0] [1]),
        .I5(\codons_reg[0][1] [1]),
        .O(\codon_index[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_14 
       (.I0(\codons_reg[0][2] [0]),
        .I1(\codons_reg[0][3] [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[0][0] [0]),
        .I5(\codons_reg[0][1] [0]),
        .O(\codon_index[2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_15 
       (.I0(\codons_reg[0][2] [3]),
        .I1(\codons_reg[0][3] [3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[0][0] [3]),
        .I5(\codons_reg[0][1] [3]),
        .O(\codon_index[2]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \codon_index[2]_i_16 
       (.I0(Q[0]),
        .I1(\codons_reg[3][5] [1]),
        .I2(\codons_reg[3][5] [2]),
        .I3(\codons_reg[3][5] [3]),
        .I4(\codons_reg[3][5] [0]),
        .O(\codon_index[2]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \codon_index[2]_i_17 
       (.I0(\counts[3][3]_i_12_n_0 ),
        .I1(\counts[3][3]_i_11_n_0 ),
        .I2(\counts[3][3]_i_10_n_0 ),
        .I3(\counts[3][3]_i_9_n_0 ),
        .O(\codon_index[2]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \codon_index[2]_i_18 
       (.I0(\codons_reg[2][4] [3]),
        .I1(\codons_reg[2][4] [0]),
        .I2(Q[0]),
        .I3(\codons_reg[2][4] [2]),
        .I4(\codons_reg[2][4] [1]),
        .O(\codon_index[2]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \codon_index[2]_i_19 
       (.I0(Q[0]),
        .I1(\codons_reg[2][5] [1]),
        .I2(\codons_reg[2][5] [2]),
        .I3(\codons_reg[2][5] [3]),
        .I4(\codons_reg[2][5] [0]),
        .O(\codon_index[2]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \codon_index[2]_i_20 
       (.I0(\codon_index[2]_i_27_n_0 ),
        .I1(\codon_index[2]_i_28_n_0 ),
        .I2(\codon_index[2]_i_29_n_0 ),
        .I3(\codon_index[2]_i_30_n_0 ),
        .O(\codon_index[2]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h7F0000FF)) 
    \codon_index[2]_i_21 
       (.I0(\previous_matches_reg[2]_i_7_n_0 ),
        .I1(\previous_matches_reg[2]_i_6_n_0 ),
        .I2(\previous_matches_reg[2]_i_5_n_0 ),
        .I3(\previous_matches_reg[2]_i_4_n_0 ),
        .I4(douta[1]),
        .O(\codon_index[2]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \codon_index[2]_i_22 
       (.I0(\codons_reg[1][4] [3]),
        .I1(\codons_reg[1][4] [0]),
        .I2(Q[0]),
        .I3(\codons_reg[1][4] [2]),
        .I4(\codons_reg[1][4] [1]),
        .O(\codon_index[2]_i_22_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \codon_index[2]_i_23 
       (.I0(Q[0]),
        .I1(\codons_reg[1][5] [1]),
        .I2(\codons_reg[1][5] [2]),
        .I3(\codons_reg[1][5] [3]),
        .I4(\codons_reg[1][5] [0]),
        .O(\codon_index[2]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \codon_index[2]_i_24 
       (.I0(\codon_index[2]_i_31_n_0 ),
        .I1(\codon_index[2]_i_32_n_0 ),
        .I2(\codon_index[2]_i_33_n_0 ),
        .I3(\codon_index[2]_i_34_n_0 ),
        .O(\codon_index[2]_i_24_n_0 ));
  LUT5 #(
    .INIT(32'h7F0000FF)) 
    \codon_index[2]_i_25 
       (.I0(\previous_matches_reg[1]_i_7_n_0 ),
        .I1(\previous_matches_reg[1]_i_6_n_0 ),
        .I2(\previous_matches_reg[1]_i_5_n_0 ),
        .I3(\previous_matches_reg[1]_i_4_n_0 ),
        .I4(douta[1]),
        .O(\codon_index[2]_i_25_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \codon_index[2]_i_26 
       (.I0(\codons_reg[0][4] [3]),
        .I1(\codons_reg[0][4] [0]),
        .I2(Q[0]),
        .I3(\codons_reg[0][4] [2]),
        .I4(\codons_reg[0][4] [1]),
        .O(\codon_index[2]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_27 
       (.I0(\codons_reg[2][2] [0]),
        .I1(\codons_reg[2][3] [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[2][0] [0]),
        .I5(\codons_reg[2][1] [0]),
        .O(\codon_index[2]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_28 
       (.I0(\codons_reg[2][2] [3]),
        .I1(\codons_reg[2][3] [3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[2][0] [3]),
        .I5(\codons_reg[2][1] [3]),
        .O(\codon_index[2]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_29 
       (.I0(\codons_reg[2][2] [2]),
        .I1(\codons_reg[2][3] [2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[2][0] [2]),
        .I5(\codons_reg[2][1] [2]),
        .O(\codon_index[2]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_30 
       (.I0(\codons_reg[2][2] [1]),
        .I1(\codons_reg[2][3] [1]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[2][0] [1]),
        .I5(\codons_reg[2][1] [1]),
        .O(\codon_index[2]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_31 
       (.I0(\codons_reg[1][2] [2]),
        .I1(\codons_reg[1][3] [2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[1][0] [2]),
        .I5(\codons_reg[1][1] [2]),
        .O(\codon_index[2]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_32 
       (.I0(\codons_reg[1][2] [3]),
        .I1(\codons_reg[1][3] [3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[1][0] [3]),
        .I5(\codons_reg[1][1] [3]),
        .O(\codon_index[2]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_33 
       (.I0(\codons_reg[1][2] [1]),
        .I1(\codons_reg[1][3] [1]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[1][0] [1]),
        .I5(\codons_reg[1][1] [1]),
        .O(\codon_index[2]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \codon_index[2]_i_34 
       (.I0(\codons_reg[1][2] [0]),
        .I1(\codons_reg[1][3] [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[1][0] [0]),
        .I5(\codons_reg[1][1] [0]),
        .O(\codon_index[2]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hF444F444FFFFF444)) 
    \codon_index[2]_i_4 
       (.I0(\previous_matches[2]_i_2_n_0 ),
        .I1(\previous_matches_reg[4]_0 [2]),
        .I2(\previous_matches_reg[4]_0 [0]),
        .I3(\previous_matches[0]_i_2_n_0 ),
        .I4(\previous_matches_reg[4]_0 [1]),
        .I5(\previous_matches[1]_i_2_n_0 ),
        .O(\previous_matches_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF2)) 
    \codon_index[2]_i_5 
       (.I0(\previous_matches[0]_i_2_n_0 ),
        .I1(\codon_index[2]_i_6_n_0 ),
        .I2(\codon_index[2]_i_7_n_0 ),
        .I3(\codon_index[2]_i_8_n_0 ),
        .I4(\previous_matches_reg[1]_1 ),
        .I5(\previous_matches_reg[1]_2 ),
        .O(\previous_matches_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h3FFFFFFFAAAAAAAA)) 
    \codon_index[2]_i_6 
       (.I0(\codon_index[2]_i_11_n_0 ),
        .I1(\codon_index[2]_i_12_n_0 ),
        .I2(\codon_index[2]_i_13_n_0 ),
        .I3(\codon_index[2]_i_14_n_0 ),
        .I4(\codon_index[2]_i_15_n_0 ),
        .I5(\codon_index_reg[2] ),
        .O(\codon_index[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1111110100001101)) 
    \codon_index[2]_i_7 
       (.I0(\previous_matches[4]_i_11_n_0 ),
        .I1(\counts[3][3]_i_8_n_0 ),
        .I2(\counts[3][3]_i_7_n_0 ),
        .I3(\codon_index[2]_i_16_n_0 ),
        .I4(\codon_index_reg[2] ),
        .I5(\codon_index[2]_i_17_n_0 ),
        .O(\codon_index[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00044404)) 
    \codon_index[2]_i_8 
       (.I0(\previous_matches[4]_i_8_n_0 ),
        .I1(\counts[4][3]_i_7_n_0 ),
        .I2(\counts[4][3]_i_6_n_0 ),
        .I3(\codon_index_reg[2] ),
        .I4(\counts[4][3]_i_4_n_0 ),
        .O(\codon_index[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FD0D0000)) 
    \codon_index[2]_i_9 
       (.I0(\codon_index[2]_i_18_n_0 ),
        .I1(\codon_index[2]_i_19_n_0 ),
        .I2(\codon_index_reg[2] ),
        .I3(\codon_index[2]_i_20_n_0 ),
        .I4(\codon_index[2]_i_21_n_0 ),
        .I5(\previous_matches[2]_i_3_n_0 ),
        .O(\previous_matches_reg[1]_1 ));
  (* syn_black_box = "TRUE" *) 
  (* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *) 
  codon_memory codon_memory_instance
       (.addra(address),
        .clka(CLK),
        .dina({1'b0,1'b0,1'b0,1'b0}),
        .douta(memory_out),
        .ena(1'b1),
        .wea(1'b0));
  LUT3 #(
    .INIT(8'h78)) 
    \codon_num[0]_i_1 
       (.I0(\state[0]_i_2_n_0 ),
        .I1(\state_reg[1]_1 ),
        .I2(codon_num[0]),
        .O(\codon_num[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \codon_num[1]_i_1 
       (.I0(codon_num[0]),
        .I1(\state_reg[1]_1 ),
        .I2(\state[0]_i_2_n_0 ),
        .I3(codon_num[1]),
        .O(\codon_num[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \codon_num[2]_i_1 
       (.I0(codon_num[1]),
        .I1(codon_num[0]),
        .I2(\state_reg[1]_1 ),
        .I3(\state[0]_i_2_n_0 ),
        .I4(codon_num[2]),
        .O(\codon_num[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \codon_num_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\codon_num[0]_i_1_n_0 ),
        .Q(codon_num[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \codon_num_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\codon_num[1]_i_1_n_0 ),
        .Q(codon_num[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \codon_num_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\codon_num[2]_i_1_n_0 ),
        .Q(codon_num[2]),
        .R(reset_IBUF));
  LUT6 #(
    .INIT(64'h5555555515555555)) 
    \codon_sub_addr[0]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[0] ),
        .I1(memory_out[0]),
        .I2(memory_out[2]),
        .I3(memory_out[1]),
        .I4(memory_out[3]),
        .I5(\state_reg[1]_0 ),
        .O(\codon_sub_addr[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h06)) 
    \codon_sub_addr[1]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[1] ),
        .I1(\codon_sub_addr_reg_n_0_[0] ),
        .I2(\state[0]_i_2_n_0 ),
        .O(\codon_sub_addr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \codon_sub_addr[2]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[0] ),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[2] ),
        .I3(\state[0]_i_2_n_0 ),
        .O(\codon_sub_addr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00007FFFFFFF0000)) 
    \codon_sub_addr[3]_i_1 
       (.I0(memory_out[3]),
        .I1(memory_out[1]),
        .I2(memory_out[2]),
        .I3(memory_out[0]),
        .I4(\state_reg[1]_1 ),
        .I5(\state_reg[1]_0 ),
        .O(\codon_sub_addr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \codon_sub_addr[3]_i_2 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[3] ),
        .I4(\state[0]_i_2_n_0 ),
        .O(\codon_sub_addr[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \codon_sub_addr_reg[0] 
       (.C(CLK),
        .CE(\codon_sub_addr[3]_i_1_n_0 ),
        .D(\codon_sub_addr[0]_i_1_n_0 ),
        .Q(\codon_sub_addr_reg_n_0_[0] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \codon_sub_addr_reg[1] 
       (.C(CLK),
        .CE(\codon_sub_addr[3]_i_1_n_0 ),
        .D(\codon_sub_addr[1]_i_1_n_0 ),
        .Q(\codon_sub_addr_reg_n_0_[1] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \codon_sub_addr_reg[2] 
       (.C(CLK),
        .CE(\codon_sub_addr[3]_i_1_n_0 ),
        .D(\codon_sub_addr[2]_i_1_n_0 ),
        .Q(\codon_sub_addr_reg_n_0_[2] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \codon_sub_addr_reg[3] 
       (.C(CLK),
        .CE(\codon_sub_addr[3]_i_1_n_0 ),
        .D(\codon_sub_addr[3]_i_2_n_0 ),
        .Q(\codon_sub_addr_reg_n_0_[3] ),
        .R(reset_IBUF));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \codons[0][0][3]_i_1 
       (.I0(\codons[0][4][3]_i_2_n_0 ),
        .I1(\codon_sub_addr_reg_n_0_[2] ),
        .I2(\codon_sub_addr_reg_n_0_[3] ),
        .I3(\codon_sub_addr_reg_n_0_[1] ),
        .I4(\codon_sub_addr_reg_n_0_[0] ),
        .I5(codon_num[2]),
        .O(\codons[0][0][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \codons[0][1][3]_i_1 
       (.I0(\codons[0][4][3]_i_2_n_0 ),
        .I1(\codon_sub_addr_reg_n_0_[2] ),
        .I2(\codon_sub_addr_reg_n_0_[3] ),
        .I3(\codon_sub_addr_reg_n_0_[1] ),
        .I4(\codon_sub_addr_reg_n_0_[0] ),
        .I5(codon_num[2]),
        .O(\codons[0][1][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \codons[0][2][3]_i_1 
       (.I0(\codons[0][4][3]_i_2_n_0 ),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(codon_num[2]),
        .O(\codons[0][2][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002000000)) 
    \codons[0][3][3]_i_1 
       (.I0(\codons[0][4][3]_i_2_n_0 ),
        .I1(\codon_sub_addr_reg_n_0_[2] ),
        .I2(\codon_sub_addr_reg_n_0_[3] ),
        .I3(\codon_sub_addr_reg_n_0_[1] ),
        .I4(\codon_sub_addr_reg_n_0_[0] ),
        .I5(codon_num[2]),
        .O(\codons[0][3][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \codons[0][4][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(\codons[0][4][3]_i_2_n_0 ),
        .O(\codons[0][4][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \codons[0][4][3]_i_2 
       (.I0(codon_num[1]),
        .I1(codon_num[0]),
        .I2(\codons[0][5][3]_i_3_n_0 ),
        .O(\codons[0][4][3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \codons[0][5][3]_i_1 
       (.I0(codon_num[1]),
        .I1(codon_num[0]),
        .I2(\codons[0][5][3]_i_2_n_0 ),
        .O(\codons[0][5][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
    \codons[0][5][3]_i_2 
       (.I0(\codons[0][5][3]_i_3_n_0 ),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(codon_num[2]),
        .O(\codons[0][5][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hFFD0)) 
    \codons[0][5][3]_i_3 
       (.I0(\state[1]_i_2__0_n_0 ),
        .I1(\state_reg[1]_0 ),
        .I2(\state_reg[1]_1 ),
        .I3(reset_IBUF),
        .O(\codons[0][5][3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \codons[1][0][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[1][4][3]_i_2_n_0 ),
        .O(\codons[1][0][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \codons[1][1][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[1][4][3]_i_2_n_0 ),
        .O(\codons[1][1][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \codons[1][2][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[1] ),
        .I1(\codon_sub_addr_reg_n_0_[0] ),
        .I2(\codon_sub_addr_reg_n_0_[2] ),
        .I3(\codon_sub_addr_reg_n_0_[3] ),
        .I4(codon_num[2]),
        .I5(\codons[1][4][3]_i_2_n_0 ),
        .O(\codons[1][2][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \codons[1][3][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[1][4][3]_i_2_n_0 ),
        .O(\codons[1][3][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \codons[1][4][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(\codons[1][4][3]_i_2_n_0 ),
        .O(\codons[1][4][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \codons[1][4][3]_i_2 
       (.I0(\codons[0][5][3]_i_3_n_0 ),
        .I1(codon_num[1]),
        .I2(codon_num[0]),
        .O(\codons[1][4][3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \codons[1][5][3]_i_1 
       (.I0(codon_num[1]),
        .I1(codon_num[0]),
        .I2(\codons[0][5][3]_i_2_n_0 ),
        .O(\codons[1][5][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \codons[2][0][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[2][4][3]_i_2_n_0 ),
        .O(\codons[2][0][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \codons[2][1][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[2][4][3]_i_2_n_0 ),
        .O(\codons[2][1][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \codons[2][2][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[1] ),
        .I1(\codon_sub_addr_reg_n_0_[0] ),
        .I2(\codon_sub_addr_reg_n_0_[2] ),
        .I3(\codon_sub_addr_reg_n_0_[3] ),
        .I4(codon_num[2]),
        .I5(\codons[2][4][3]_i_2_n_0 ),
        .O(\codons[2][2][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \codons[2][3][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[2][4][3]_i_2_n_0 ),
        .O(\codons[2][3][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \codons[2][4][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(\codons[2][4][3]_i_2_n_0 ),
        .O(\codons[2][4][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \codons[2][4][3]_i_2 
       (.I0(\codons[0][5][3]_i_3_n_0 ),
        .I1(codon_num[0]),
        .I2(codon_num[1]),
        .O(\codons[2][4][3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \codons[2][5][3]_i_1 
       (.I0(codon_num[0]),
        .I1(codon_num[1]),
        .I2(\codons[0][5][3]_i_2_n_0 ),
        .O(\codons[2][5][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \codons[3][0][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[3][4][3]_i_2_n_0 ),
        .O(\codons[3][0][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \codons[3][1][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[3][4][3]_i_2_n_0 ),
        .O(\codons[3][1][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \codons[3][2][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[1] ),
        .I1(\codon_sub_addr_reg_n_0_[0] ),
        .I2(\codon_sub_addr_reg_n_0_[2] ),
        .I3(\codon_sub_addr_reg_n_0_[3] ),
        .I4(codon_num[2]),
        .I5(\codons[3][4][3]_i_2_n_0 ),
        .O(\codons[3][2][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \codons[3][3][3]_i_1 
       (.I0(\codon_sub_addr_reg_n_0_[2] ),
        .I1(\codon_sub_addr_reg_n_0_[3] ),
        .I2(\codon_sub_addr_reg_n_0_[1] ),
        .I3(\codon_sub_addr_reg_n_0_[0] ),
        .I4(codon_num[2]),
        .I5(\codons[3][4][3]_i_2_n_0 ),
        .O(\codons[3][3][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \codons[3][4][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codon_sub_addr_reg_n_0_[1] ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(\codons[3][4][3]_i_2_n_0 ),
        .O(\codons[3][4][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \codons[3][4][3]_i_2 
       (.I0(\codons[0][5][3]_i_3_n_0 ),
        .I1(codon_num[1]),
        .I2(codon_num[0]),
        .O(\codons[3][4][3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \codons[3][5][3]_i_1 
       (.I0(codon_num[1]),
        .I1(codon_num[0]),
        .I2(\codons[0][5][3]_i_2_n_0 ),
        .O(\codons[3][5][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \codons[4][0][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codons[0][4][3]_i_2_n_0 ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[1] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(\codon_sub_addr_reg_n_0_[2] ),
        .O(\codons[4][0][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \codons[4][1][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codons[0][4][3]_i_2_n_0 ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[1] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(\codon_sub_addr_reg_n_0_[2] ),
        .O(\codons[4][1][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \codons[4][2][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codons[0][4][3]_i_2_n_0 ),
        .I2(\codon_sub_addr_reg_n_0_[3] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[0] ),
        .I5(\codon_sub_addr_reg_n_0_[1] ),
        .O(\codons[4][2][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \codons[4][3][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codons[0][4][3]_i_2_n_0 ),
        .I2(\codon_sub_addr_reg_n_0_[0] ),
        .I3(\codon_sub_addr_reg_n_0_[1] ),
        .I4(\codon_sub_addr_reg_n_0_[3] ),
        .I5(\codon_sub_addr_reg_n_0_[2] ),
        .O(\codons[4][3][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \codons[4][4][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codons[0][4][3]_i_2_n_0 ),
        .I2(\codon_sub_addr_reg_n_0_[3] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[0] ),
        .I5(\codon_sub_addr_reg_n_0_[1] ),
        .O(\codons[4][4][3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \codons[4][5][3]_i_1 
       (.I0(codon_num[2]),
        .I1(\codons[0][4][3]_i_2_n_0 ),
        .I2(\codon_sub_addr_reg_n_0_[3] ),
        .I3(\codon_sub_addr_reg_n_0_[2] ),
        .I4(\codon_sub_addr_reg_n_0_[0] ),
        .I5(\codon_sub_addr_reg_n_0_[1] ),
        .O(\codons[4][5][3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][0][0] 
       (.C(CLK),
        .CE(\codons[0][0][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[0][0] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][0][1] 
       (.C(CLK),
        .CE(\codons[0][0][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[0][0] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][0][2] 
       (.C(CLK),
        .CE(\codons[0][0][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[0][0] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][0][3] 
       (.C(CLK),
        .CE(\codons[0][0][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[0][0] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][1][0] 
       (.C(CLK),
        .CE(\codons[0][1][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[0][1] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][1][1] 
       (.C(CLK),
        .CE(\codons[0][1][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[0][1] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][1][2] 
       (.C(CLK),
        .CE(\codons[0][1][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[0][1] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][1][3] 
       (.C(CLK),
        .CE(\codons[0][1][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[0][1] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][2][0] 
       (.C(CLK),
        .CE(\codons[0][2][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[0][2] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][2][1] 
       (.C(CLK),
        .CE(\codons[0][2][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[0][2] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][2][2] 
       (.C(CLK),
        .CE(\codons[0][2][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[0][2] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][2][3] 
       (.C(CLK),
        .CE(\codons[0][2][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[0][2] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][3][0] 
       (.C(CLK),
        .CE(\codons[0][3][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[0][3] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][3][1] 
       (.C(CLK),
        .CE(\codons[0][3][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[0][3] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][3][2] 
       (.C(CLK),
        .CE(\codons[0][3][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[0][3] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][3][3] 
       (.C(CLK),
        .CE(\codons[0][3][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[0][3] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][4][0] 
       (.C(CLK),
        .CE(\codons[0][4][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[0][4] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][4][1] 
       (.C(CLK),
        .CE(\codons[0][4][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[0][4] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][4][2] 
       (.C(CLK),
        .CE(\codons[0][4][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[0][4] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][4][3] 
       (.C(CLK),
        .CE(\codons[0][4][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[0][4] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][5][0] 
       (.C(CLK),
        .CE(\codons[0][5][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[0][5] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][5][1] 
       (.C(CLK),
        .CE(\codons[0][5][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[0][5] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][5][2] 
       (.C(CLK),
        .CE(\codons[0][5][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[0][5] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[0][5][3] 
       (.C(CLK),
        .CE(\codons[0][5][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[0][5] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][0][0] 
       (.C(CLK),
        .CE(\codons[1][0][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[1][0] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][0][1] 
       (.C(CLK),
        .CE(\codons[1][0][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[1][0] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][0][2] 
       (.C(CLK),
        .CE(\codons[1][0][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[1][0] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][0][3] 
       (.C(CLK),
        .CE(\codons[1][0][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[1][0] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][1][0] 
       (.C(CLK),
        .CE(\codons[1][1][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[1][1] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][1][1] 
       (.C(CLK),
        .CE(\codons[1][1][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[1][1] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][1][2] 
       (.C(CLK),
        .CE(\codons[1][1][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[1][1] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][1][3] 
       (.C(CLK),
        .CE(\codons[1][1][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[1][1] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][2][0] 
       (.C(CLK),
        .CE(\codons[1][2][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[1][2] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][2][1] 
       (.C(CLK),
        .CE(\codons[1][2][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[1][2] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][2][2] 
       (.C(CLK),
        .CE(\codons[1][2][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[1][2] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][2][3] 
       (.C(CLK),
        .CE(\codons[1][2][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[1][2] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][3][0] 
       (.C(CLK),
        .CE(\codons[1][3][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[1][3] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][3][1] 
       (.C(CLK),
        .CE(\codons[1][3][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[1][3] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][3][2] 
       (.C(CLK),
        .CE(\codons[1][3][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[1][3] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][3][3] 
       (.C(CLK),
        .CE(\codons[1][3][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[1][3] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][4][0] 
       (.C(CLK),
        .CE(\codons[1][4][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[1][4] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][4][1] 
       (.C(CLK),
        .CE(\codons[1][4][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[1][4] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][4][2] 
       (.C(CLK),
        .CE(\codons[1][4][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[1][4] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][4][3] 
       (.C(CLK),
        .CE(\codons[1][4][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[1][4] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][5][0] 
       (.C(CLK),
        .CE(\codons[1][5][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[1][5] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][5][1] 
       (.C(CLK),
        .CE(\codons[1][5][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[1][5] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][5][2] 
       (.C(CLK),
        .CE(\codons[1][5][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[1][5] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[1][5][3] 
       (.C(CLK),
        .CE(\codons[1][5][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[1][5] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][0][0] 
       (.C(CLK),
        .CE(\codons[2][0][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[2][0] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][0][1] 
       (.C(CLK),
        .CE(\codons[2][0][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[2][0] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][0][2] 
       (.C(CLK),
        .CE(\codons[2][0][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[2][0] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][0][3] 
       (.C(CLK),
        .CE(\codons[2][0][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[2][0] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][1][0] 
       (.C(CLK),
        .CE(\codons[2][1][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[2][1] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][1][1] 
       (.C(CLK),
        .CE(\codons[2][1][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[2][1] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][1][2] 
       (.C(CLK),
        .CE(\codons[2][1][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[2][1] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][1][3] 
       (.C(CLK),
        .CE(\codons[2][1][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[2][1] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][2][0] 
       (.C(CLK),
        .CE(\codons[2][2][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[2][2] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][2][1] 
       (.C(CLK),
        .CE(\codons[2][2][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[2][2] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][2][2] 
       (.C(CLK),
        .CE(\codons[2][2][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[2][2] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][2][3] 
       (.C(CLK),
        .CE(\codons[2][2][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[2][2] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][3][0] 
       (.C(CLK),
        .CE(\codons[2][3][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[2][3] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][3][1] 
       (.C(CLK),
        .CE(\codons[2][3][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[2][3] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][3][2] 
       (.C(CLK),
        .CE(\codons[2][3][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[2][3] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][3][3] 
       (.C(CLK),
        .CE(\codons[2][3][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[2][3] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][4][0] 
       (.C(CLK),
        .CE(\codons[2][4][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[2][4] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][4][1] 
       (.C(CLK),
        .CE(\codons[2][4][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[2][4] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][4][2] 
       (.C(CLK),
        .CE(\codons[2][4][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[2][4] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][4][3] 
       (.C(CLK),
        .CE(\codons[2][4][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[2][4] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][5][0] 
       (.C(CLK),
        .CE(\codons[2][5][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[2][5] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][5][1] 
       (.C(CLK),
        .CE(\codons[2][5][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[2][5] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][5][2] 
       (.C(CLK),
        .CE(\codons[2][5][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[2][5] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[2][5][3] 
       (.C(CLK),
        .CE(\codons[2][5][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[2][5] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][0][0] 
       (.C(CLK),
        .CE(\codons[3][0][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[3][0] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][0][1] 
       (.C(CLK),
        .CE(\codons[3][0][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[3][0] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][0][2] 
       (.C(CLK),
        .CE(\codons[3][0][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[3][0] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][0][3] 
       (.C(CLK),
        .CE(\codons[3][0][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[3][0] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][1][0] 
       (.C(CLK),
        .CE(\codons[3][1][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[3][1] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][1][1] 
       (.C(CLK),
        .CE(\codons[3][1][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[3][1] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][1][2] 
       (.C(CLK),
        .CE(\codons[3][1][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[3][1] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][1][3] 
       (.C(CLK),
        .CE(\codons[3][1][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[3][1] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][2][0] 
       (.C(CLK),
        .CE(\codons[3][2][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[3][2] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][2][1] 
       (.C(CLK),
        .CE(\codons[3][2][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[3][2] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][2][2] 
       (.C(CLK),
        .CE(\codons[3][2][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[3][2] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][2][3] 
       (.C(CLK),
        .CE(\codons[3][2][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[3][2] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][3][0] 
       (.C(CLK),
        .CE(\codons[3][3][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[3][3] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][3][1] 
       (.C(CLK),
        .CE(\codons[3][3][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[3][3] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][3][2] 
       (.C(CLK),
        .CE(\codons[3][3][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[3][3] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][3][3] 
       (.C(CLK),
        .CE(\codons[3][3][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[3][3] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][4][0] 
       (.C(CLK),
        .CE(\codons[3][4][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[3][4] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][4][1] 
       (.C(CLK),
        .CE(\codons[3][4][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[3][4] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][4][2] 
       (.C(CLK),
        .CE(\codons[3][4][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[3][4] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][4][3] 
       (.C(CLK),
        .CE(\codons[3][4][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[3][4] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][5][0] 
       (.C(CLK),
        .CE(\codons[3][5][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[3][5] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][5][1] 
       (.C(CLK),
        .CE(\codons[3][5][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[3][5] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][5][2] 
       (.C(CLK),
        .CE(\codons[3][5][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[3][5] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[3][5][3] 
       (.C(CLK),
        .CE(\codons[3][5][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[3][5] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][0][0] 
       (.C(CLK),
        .CE(\codons[4][0][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[4][0] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][0][1] 
       (.C(CLK),
        .CE(\codons[4][0][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[4][0] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][0][2] 
       (.C(CLK),
        .CE(\codons[4][0][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[4][0] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][0][3] 
       (.C(CLK),
        .CE(\codons[4][0][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[4][0] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][1][0] 
       (.C(CLK),
        .CE(\codons[4][1][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[4][1] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][1][1] 
       (.C(CLK),
        .CE(\codons[4][1][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[4][1] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][1][2] 
       (.C(CLK),
        .CE(\codons[4][1][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[4][1] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][1][3] 
       (.C(CLK),
        .CE(\codons[4][1][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[4][1] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][2][0] 
       (.C(CLK),
        .CE(\codons[4][2][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[4][2] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][2][1] 
       (.C(CLK),
        .CE(\codons[4][2][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[4][2] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][2][2] 
       (.C(CLK),
        .CE(\codons[4][2][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[4][2] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][2][3] 
       (.C(CLK),
        .CE(\codons[4][2][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[4][2] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][3][0] 
       (.C(CLK),
        .CE(\codons[4][3][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[4][3] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][3][1] 
       (.C(CLK),
        .CE(\codons[4][3][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[4][3] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][3][2] 
       (.C(CLK),
        .CE(\codons[4][3][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[4][3] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][3][3] 
       (.C(CLK),
        .CE(\codons[4][3][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[4][3] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][4][0] 
       (.C(CLK),
        .CE(\codons[4][4][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[4][4] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][4][1] 
       (.C(CLK),
        .CE(\codons[4][4][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[4][4] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][4][2] 
       (.C(CLK),
        .CE(\codons[4][4][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[4][4] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][4][3] 
       (.C(CLK),
        .CE(\codons[4][4][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[4][4] [3]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][5][0] 
       (.C(CLK),
        .CE(\codons[4][5][3]_i_1_n_0 ),
        .D(memory_out[0]),
        .Q(\codons_reg[4][5] [0]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][5][1] 
       (.C(CLK),
        .CE(\codons[4][5][3]_i_1_n_0 ),
        .D(memory_out[1]),
        .Q(\codons_reg[4][5] [1]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][5][2] 
       (.C(CLK),
        .CE(\codons[4][5][3]_i_1_n_0 ),
        .D(memory_out[2]),
        .Q(\codons_reg[4][5] [2]),
        .S(reset_IBUF));
  FDSE #(
    .INIT(1'b1)) 
    \codons_reg[4][5][3] 
       (.C(CLK),
        .CE(\codons[4][5][3]_i_1_n_0 ),
        .D(memory_out[3]),
        .Q(\codons_reg[4][5] [3]),
        .S(reset_IBUF));
  LUT6 #(
    .INIT(64'h0070007000000070)) 
    \counts[0][3]_i_3 
       (.I0(\previous_matches_reg[4]_0 [4]),
        .I1(\previous_matches_reg[3] ),
        .I2(\counts[0][3]_i_4_n_0 ),
        .I3(\counts[0][3]_i_5_n_0 ),
        .I4(\previous_matches_reg[4]_0 [2]),
        .I5(\previous_matches[2]_i_2_n_0 ),
        .O(\counts_reg[0][0] ));
  LUT6 #(
    .INIT(64'hBEFFFFBEFFFFFFFF)) 
    \counts[0][3]_i_4 
       (.I0(\previous_matches[4]_i_11_n_0 ),
        .I1(\previous_matches_reg[4]_i_10_n_0 ),
        .I2(douta[1]),
        .I3(\previous_matches_reg[4]_i_9_n_0 ),
        .I4(douta[3]),
        .I5(\previous_matches_reg[4]_0 [3]),
        .O(\counts[0][3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4040FF4040404040)) 
    \counts[0][3]_i_5 
       (.I0(\previous_matches[1]_i_3_n_0 ),
        .I1(\codon_index[2]_i_25_n_0 ),
        .I2(\previous_matches_reg[4]_0 [1]),
        .I3(\counts[0][3]_i_6_n_0 ),
        .I4(\previous_matches[0]_i_7_n_0 ),
        .I5(\previous_matches_reg[4]_0 [0]),
        .O(\counts[0][3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h7F0000FF)) 
    \counts[0][3]_i_6 
       (.I0(\previous_matches_reg[0]_i_6_n_0 ),
        .I1(\previous_matches_reg[0]_i_5_n_0 ),
        .I2(\previous_matches_reg[0]_i_4_n_0 ),
        .I3(\previous_matches_reg[0]_i_3_n_0 ),
        .I4(douta[1]),
        .O(\counts[0][3]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counts[3][3]_i_1 
       (.I0(\counts_reg[3][3] ),
        .I1(\previous_matches_reg[4] ),
        .O(E));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[3][3]_i_10 
       (.I0(\codons_reg[3][2] [2]),
        .I1(\codons_reg[3][3] [2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[3][0] [2]),
        .I5(\codons_reg[3][1] [2]),
        .O(\counts[3][3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[3][3]_i_11 
       (.I0(\codons_reg[3][2] [3]),
        .I1(\codons_reg[3][3] [3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[3][0] [3]),
        .I5(\codons_reg[3][1] [3]),
        .O(\counts[3][3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[3][3]_i_12 
       (.I0(\codons_reg[3][2] [0]),
        .I1(\codons_reg[3][3] [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[3][0] [0]),
        .I5(\codons_reg[3][1] [0]),
        .O(\counts[3][3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000004500000000)) 
    \counts[3][3]_i_3 
       (.I0(\counts[3][3]_i_5_n_0 ),
        .I1(\counts[3][3]_i_6_n_0 ),
        .I2(\counts[3][3]_i_7_n_0 ),
        .I3(\counts[3][3]_i_8_n_0 ),
        .I4(\previous_matches[4]_i_11_n_0 ),
        .I5(\previous_matches_reg[4]_0 [3]),
        .O(\counts_reg[3][3] ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \counts[3][3]_i_5 
       (.I0(\codon_index_reg[2] ),
        .I1(\counts[3][3]_i_9_n_0 ),
        .I2(\counts[3][3]_i_10_n_0 ),
        .I3(\counts[3][3]_i_11_n_0 ),
        .I4(\counts[3][3]_i_12_n_0 ),
        .O(\counts[3][3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAEAAAAAAA)) 
    \counts[3][3]_i_6 
       (.I0(\codon_index_reg[2] ),
        .I1(\codons_reg[3][5] [0]),
        .I2(\codons_reg[3][5] [3]),
        .I3(\codons_reg[3][5] [2]),
        .I4(\codons_reg[3][5] [1]),
        .I5(Q[0]),
        .O(\counts[3][3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \counts[3][3]_i_7 
       (.I0(\codons_reg[3][4] [3]),
        .I1(\codons_reg[3][4] [0]),
        .I2(Q[0]),
        .I3(\codons_reg[3][4] [2]),
        .I4(\codons_reg[3][4] [1]),
        .O(\counts[3][3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    \counts[3][3]_i_8 
       (.I0(\previous_matches_reg[4]_i_10_n_0 ),
        .I1(douta[1]),
        .I2(\previous_matches_reg[4]_i_9_n_0 ),
        .I3(douta[3]),
        .O(\counts[3][3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[3][3]_i_9 
       (.I0(\codons_reg[3][2] [1]),
        .I1(\codons_reg[3][3] [1]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[3][0] [1]),
        .I5(\codons_reg[3][1] [1]),
        .O(\counts[3][3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[4][3]_i_10 
       (.I0(\codons_reg[4][2] [1]),
        .I1(\codons_reg[4][3] [1]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[4][0] [1]),
        .I5(\codons_reg[4][1] [1]),
        .O(\counts[4][3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[4][3]_i_11 
       (.I0(\codons_reg[4][2] [3]),
        .I1(\codons_reg[4][3] [3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[4][0] [3]),
        .I5(\codons_reg[4][1] [3]),
        .O(\counts[4][3]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h335FFF5F)) 
    \counts[4][3]_i_12 
       (.I0(\codons_reg[4][5] [3]),
        .I1(\codons_reg[4][4] [3]),
        .I2(\codons_reg[4][5] [0]),
        .I3(Q[0]),
        .I4(\codons_reg[4][4] [0]),
        .O(\counts[4][3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h00000000202A0000)) 
    \counts[4][3]_i_3 
       (.I0(\previous_matches_reg[4]_0 [4]),
        .I1(\counts[4][3]_i_4_n_0 ),
        .I2(\codon_index_reg[2] ),
        .I3(\counts[4][3]_i_6_n_0 ),
        .I4(\counts[4][3]_i_7_n_0 ),
        .I5(\previous_matches[4]_i_8_n_0 ),
        .O(\counts_reg[4][0] ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counts[4][3]_i_4 
       (.I0(\counts[4][3]_i_8_n_0 ),
        .I1(\counts[4][3]_i_9_n_0 ),
        .I2(\counts[4][3]_i_10_n_0 ),
        .I3(\counts[4][3]_i_11_n_0 ),
        .O(\counts[4][3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF3FFF5F5F3FFFFFF)) 
    \counts[4][3]_i_6 
       (.I0(\codons_reg[4][5] [1]),
        .I1(\codons_reg[4][4] [1]),
        .I2(\counts[4][3]_i_12_n_0 ),
        .I3(\codons_reg[4][4] [2]),
        .I4(Q[0]),
        .I5(\codons_reg[4][5] [2]),
        .O(\counts[4][3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h7F0000FF)) 
    \counts[4][3]_i_7 
       (.I0(\previous_matches_reg[4]_i_7_n_0 ),
        .I1(\previous_matches_reg[4]_i_6_n_0 ),
        .I2(\previous_matches_reg[4]_i_5_n_0 ),
        .I3(\previous_matches_reg[4]_i_4_n_0 ),
        .I4(douta[2]),
        .O(\counts[4][3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[4][3]_i_8 
       (.I0(\codons_reg[4][2] [0]),
        .I1(\codons_reg[4][3] [0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[4][0] [0]),
        .I5(\codons_reg[4][1] [0]),
        .O(\counts[4][3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    \counts[4][3]_i_9 
       (.I0(\codons_reg[4][2] [2]),
        .I1(\codons_reg[4][3] [2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\codons_reg[4][0] [2]),
        .I5(\codons_reg[4][1] [2]),
        .O(\counts[4][3]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hFFAE)) 
    \previous_matches[0]_i_1 
       (.I0(\previous_matches[0]_i_2_n_0 ),
        .I1(\previous_matches_reg[3]_1 ),
        .I2(\previous_matches_reg[1] ),
        .I3(\previous_matches_reg[1]_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[0]_i_10 
       (.I0(\codons_reg[0][3] [2]),
        .I1(\codons_reg[0][2] [2]),
        .I2(Q[1]),
        .I3(\codons_reg[0][1] [2]),
        .I4(Q[0]),
        .I5(\codons_reg[0][0] [2]),
        .O(\previous_matches[0]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[0]_i_11 
       (.I0(\codons_reg[0][5] [2]),
        .I1(Q[0]),
        .I2(\codons_reg[0][4] [2]),
        .O(\previous_matches[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[0]_i_12 
       (.I0(\codons_reg[0][3] [3]),
        .I1(\codons_reg[0][2] [3]),
        .I2(Q[1]),
        .I3(\codons_reg[0][1] [3]),
        .I4(Q[0]),
        .I5(\codons_reg[0][0] [3]),
        .O(\previous_matches[0]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[0]_i_13 
       (.I0(\codons_reg[0][5] [3]),
        .I1(Q[0]),
        .I2(\codons_reg[0][4] [3]),
        .O(\previous_matches[0]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[0]_i_14 
       (.I0(\codons_reg[0][3] [0]),
        .I1(\codons_reg[0][2] [0]),
        .I2(Q[1]),
        .I3(\codons_reg[0][1] [0]),
        .I4(Q[0]),
        .I5(\codons_reg[0][0] [0]),
        .O(\previous_matches[0]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[0]_i_15 
       (.I0(\codons_reg[0][5] [0]),
        .I1(Q[0]),
        .I2(\codons_reg[0][4] [0]),
        .O(\previous_matches[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h0000000019999999)) 
    \previous_matches[0]_i_2 
       (.I0(douta[1]),
        .I1(\previous_matches_reg[0]_i_3_n_0 ),
        .I2(\previous_matches_reg[0]_i_4_n_0 ),
        .I3(\previous_matches_reg[0]_i_5_n_0 ),
        .I4(\previous_matches_reg[0]_i_6_n_0 ),
        .I5(\previous_matches[0]_i_7_n_0 ),
        .O(\previous_matches[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \previous_matches[0]_i_7 
       (.I0(\previous_matches_reg[0]_i_4_n_0 ),
        .I1(douta[2]),
        .I2(douta[0]),
        .I3(\previous_matches_reg[0]_i_6_n_0 ),
        .I4(douta[3]),
        .I5(\previous_matches_reg[0]_i_5_n_0 ),
        .O(\previous_matches[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[0]_i_8 
       (.I0(\codons_reg[0][3] [1]),
        .I1(\codons_reg[0][2] [1]),
        .I2(Q[1]),
        .I3(\codons_reg[0][1] [1]),
        .I4(Q[0]),
        .I5(\codons_reg[0][0] [1]),
        .O(\previous_matches[0]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[0]_i_9 
       (.I0(\codons_reg[0][5] [1]),
        .I1(Q[0]),
        .I2(\codons_reg[0][4] [1]),
        .O(\previous_matches[0]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hF2FF)) 
    \previous_matches[1]_i_1 
       (.I0(\previous_matches_reg[3]_1 ),
        .I1(\previous_matches_reg[1] ),
        .I2(\previous_matches_reg[1]_0 ),
        .I3(\previous_matches[1]_i_2_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[1]_i_10 
       (.I0(\codons_reg[1][3] [3]),
        .I1(\codons_reg[1][2] [3]),
        .I2(Q[1]),
        .I3(\codons_reg[1][1] [3]),
        .I4(Q[0]),
        .I5(\codons_reg[1][0] [3]),
        .O(\previous_matches[1]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[1]_i_11 
       (.I0(\codons_reg[1][5] [3]),
        .I1(Q[0]),
        .I2(\codons_reg[1][4] [3]),
        .O(\previous_matches[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[1]_i_12 
       (.I0(\codons_reg[1][3] [2]),
        .I1(\codons_reg[1][2] [2]),
        .I2(Q[1]),
        .I3(\codons_reg[1][1] [2]),
        .I4(Q[0]),
        .I5(\codons_reg[1][0] [2]),
        .O(\previous_matches[1]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[1]_i_13 
       (.I0(\codons_reg[1][5] [2]),
        .I1(Q[0]),
        .I2(\codons_reg[1][4] [2]),
        .O(\previous_matches[1]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[1]_i_14 
       (.I0(\codons_reg[1][3] [0]),
        .I1(\codons_reg[1][2] [0]),
        .I2(Q[1]),
        .I3(\codons_reg[1][1] [0]),
        .I4(Q[0]),
        .I5(\codons_reg[1][0] [0]),
        .O(\previous_matches[1]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[1]_i_15 
       (.I0(\codons_reg[1][5] [0]),
        .I1(Q[0]),
        .I2(\codons_reg[1][4] [0]),
        .O(\previous_matches[1]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFEBEBEBEBEBEBEBE)) 
    \previous_matches[1]_i_2 
       (.I0(\previous_matches[1]_i_3_n_0 ),
        .I1(douta[1]),
        .I2(\previous_matches_reg[1]_i_4_n_0 ),
        .I3(\previous_matches_reg[1]_i_5_n_0 ),
        .I4(\previous_matches_reg[1]_i_6_n_0 ),
        .I5(\previous_matches_reg[1]_i_7_n_0 ),
        .O(\previous_matches[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \previous_matches[1]_i_3 
       (.I0(\previous_matches_reg[1]_i_6_n_0 ),
        .I1(douta[2]),
        .I2(douta[0]),
        .I3(\previous_matches_reg[1]_i_7_n_0 ),
        .I4(douta[3]),
        .I5(\previous_matches_reg[1]_i_5_n_0 ),
        .O(\previous_matches[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[1]_i_8 
       (.I0(\codons_reg[1][3] [1]),
        .I1(\codons_reg[1][2] [1]),
        .I2(Q[1]),
        .I3(\codons_reg[1][1] [1]),
        .I4(Q[0]),
        .I5(\codons_reg[1][0] [1]),
        .O(\previous_matches[1]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[1]_i_9 
       (.I0(\codons_reg[1][5] [1]),
        .I1(Q[0]),
        .I2(\codons_reg[1][4] [1]),
        .O(\previous_matches[1]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hF2FF)) 
    \previous_matches[2]_i_1 
       (.I0(\previous_matches_reg[3]_1 ),
        .I1(\previous_matches_reg[1] ),
        .I2(\previous_matches_reg[1]_0 ),
        .I3(\previous_matches[2]_i_2_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[2]_i_10 
       (.I0(\codons_reg[2][3] [3]),
        .I1(\codons_reg[2][2] [3]),
        .I2(Q[1]),
        .I3(\codons_reg[2][1] [3]),
        .I4(Q[0]),
        .I5(\codons_reg[2][0] [3]),
        .O(\previous_matches[2]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[2]_i_11 
       (.I0(\codons_reg[2][5] [3]),
        .I1(Q[0]),
        .I2(\codons_reg[2][4] [3]),
        .O(\previous_matches[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[2]_i_12 
       (.I0(\codons_reg[2][3] [0]),
        .I1(\codons_reg[2][2] [0]),
        .I2(Q[1]),
        .I3(\codons_reg[2][1] [0]),
        .I4(Q[0]),
        .I5(\codons_reg[2][0] [0]),
        .O(\previous_matches[2]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[2]_i_13 
       (.I0(\codons_reg[2][5] [0]),
        .I1(Q[0]),
        .I2(\codons_reg[2][4] [0]),
        .O(\previous_matches[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[2]_i_14 
       (.I0(\codons_reg[2][3] [2]),
        .I1(\codons_reg[2][2] [2]),
        .I2(Q[1]),
        .I3(\codons_reg[2][1] [2]),
        .I4(Q[0]),
        .I5(\codons_reg[2][0] [2]),
        .O(\previous_matches[2]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[2]_i_15 
       (.I0(\codons_reg[2][5] [2]),
        .I1(Q[0]),
        .I2(\codons_reg[2][4] [2]),
        .O(\previous_matches[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFEBEBEBEBEBEBEBE)) 
    \previous_matches[2]_i_2 
       (.I0(\previous_matches[2]_i_3_n_0 ),
        .I1(douta[1]),
        .I2(\previous_matches_reg[2]_i_4_n_0 ),
        .I3(\previous_matches_reg[2]_i_5_n_0 ),
        .I4(\previous_matches_reg[2]_i_6_n_0 ),
        .I5(\previous_matches_reg[2]_i_7_n_0 ),
        .O(\previous_matches[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \previous_matches[2]_i_3 
       (.I0(\previous_matches_reg[2]_i_6_n_0 ),
        .I1(douta[0]),
        .I2(douta[2]),
        .I3(\previous_matches_reg[2]_i_7_n_0 ),
        .I4(douta[3]),
        .I5(\previous_matches_reg[2]_i_5_n_0 ),
        .O(\previous_matches[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[2]_i_8 
       (.I0(\codons_reg[2][3] [1]),
        .I1(\codons_reg[2][2] [1]),
        .I2(Q[1]),
        .I3(\codons_reg[2][1] [1]),
        .I4(Q[0]),
        .I5(\codons_reg[2][0] [1]),
        .O(\previous_matches[2]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[2]_i_9 
       (.I0(\codons_reg[2][5] [1]),
        .I1(Q[0]),
        .I2(\codons_reg[2][4] [1]),
        .O(\previous_matches[2]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFF07FFFF)) 
    \previous_matches[3]_i_1 
       (.I0(\previous_matches_reg[4]_0 [4]),
        .I1(\previous_matches_reg[3] ),
        .I2(\previous_matches_reg[1] ),
        .I3(\previous_matches_reg[1]_0 ),
        .I4(\previous_matches_reg[3]_0 ),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hFFFFAAEF)) 
    \previous_matches[4]_i_1 
       (.I0(\previous_matches_reg[3] ),
        .I1(\previous_matches_reg[3]_0 ),
        .I2(\previous_matches_reg[4]_0 [3]),
        .I3(\previous_matches_reg[1] ),
        .I4(\previous_matches_reg[1]_0 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h8FF0FFFFFFFF0FF0)) 
    \previous_matches[4]_i_11 
       (.I0(\previous_matches_reg[4]_i_9_n_0 ),
        .I1(\previous_matches_reg[4]_i_10_n_0 ),
        .I2(douta[2]),
        .I3(\previous_matches_reg[4]_i_24_n_0 ),
        .I4(douta[0]),
        .I5(\previous_matches_reg[4]_i_25_n_0 ),
        .O(\previous_matches[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_12 
       (.I0(\codons_reg[4][3] [2]),
        .I1(\codons_reg[4][2] [2]),
        .I2(Q[1]),
        .I3(\codons_reg[4][1] [2]),
        .I4(Q[0]),
        .I5(\codons_reg[4][0] [2]),
        .O(\previous_matches[4]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_13 
       (.I0(\codons_reg[4][5] [2]),
        .I1(Q[0]),
        .I2(\codons_reg[4][4] [2]),
        .O(\previous_matches[4]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_14 
       (.I0(\codons_reg[4][3] [0]),
        .I1(\codons_reg[4][2] [0]),
        .I2(Q[1]),
        .I3(\codons_reg[4][1] [0]),
        .I4(Q[0]),
        .I5(\codons_reg[4][0] [0]),
        .O(\previous_matches[4]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_15 
       (.I0(\codons_reg[4][5] [0]),
        .I1(Q[0]),
        .I2(\codons_reg[4][4] [0]),
        .O(\previous_matches[4]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_16 
       (.I0(\codons_reg[4][3] [1]),
        .I1(\codons_reg[4][2] [1]),
        .I2(Q[1]),
        .I3(\codons_reg[4][1] [1]),
        .I4(Q[0]),
        .I5(\codons_reg[4][0] [1]),
        .O(\previous_matches[4]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_17 
       (.I0(\codons_reg[4][5] [1]),
        .I1(Q[0]),
        .I2(\codons_reg[4][4] [1]),
        .O(\previous_matches[4]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_18 
       (.I0(\codons_reg[4][3] [3]),
        .I1(\codons_reg[4][2] [3]),
        .I2(Q[1]),
        .I3(\codons_reg[4][1] [3]),
        .I4(Q[0]),
        .I5(\codons_reg[4][0] [3]),
        .O(\previous_matches[4]_i_18_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_19 
       (.I0(\codons_reg[4][5] [3]),
        .I1(Q[0]),
        .I2(\codons_reg[4][4] [3]),
        .O(\previous_matches[4]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0000000019999999)) 
    \previous_matches[4]_i_2 
       (.I0(douta[2]),
        .I1(\previous_matches_reg[4]_i_4_n_0 ),
        .I2(\previous_matches_reg[4]_i_5_n_0 ),
        .I3(\previous_matches_reg[4]_i_6_n_0 ),
        .I4(\previous_matches_reg[4]_i_7_n_0 ),
        .I5(\previous_matches[4]_i_8_n_0 ),
        .O(\previous_matches_reg[3] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_20 
       (.I0(\codons_reg[3][3] [3]),
        .I1(\codons_reg[3][2] [3]),
        .I2(Q[1]),
        .I3(\codons_reg[3][1] [3]),
        .I4(Q[0]),
        .I5(\codons_reg[3][0] [3]),
        .O(\previous_matches[4]_i_20_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_21 
       (.I0(\codons_reg[3][5] [3]),
        .I1(Q[0]),
        .I2(\codons_reg[3][4] [3]),
        .O(\previous_matches[4]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_22 
       (.I0(\codons_reg[3][3] [1]),
        .I1(\codons_reg[3][2] [1]),
        .I2(Q[1]),
        .I3(\codons_reg[3][1] [1]),
        .I4(Q[0]),
        .I5(\codons_reg[3][0] [1]),
        .O(\previous_matches[4]_i_22_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_23 
       (.I0(\codons_reg[3][5] [1]),
        .I1(Q[0]),
        .I2(\codons_reg[3][4] [1]),
        .O(\previous_matches[4]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_26 
       (.I0(\codons_reg[3][3] [2]),
        .I1(\codons_reg[3][2] [2]),
        .I2(Q[1]),
        .I3(\codons_reg[3][1] [2]),
        .I4(Q[0]),
        .I5(\codons_reg[3][0] [2]),
        .O(\previous_matches[4]_i_26_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_27 
       (.I0(\codons_reg[3][5] [2]),
        .I1(Q[0]),
        .I2(\codons_reg[3][4] [2]),
        .O(\previous_matches[4]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \previous_matches[4]_i_28 
       (.I0(\codons_reg[3][3] [0]),
        .I1(\codons_reg[3][2] [0]),
        .I2(Q[1]),
        .I3(\codons_reg[3][1] [0]),
        .I4(Q[0]),
        .I5(\codons_reg[3][0] [0]),
        .O(\previous_matches[4]_i_28_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \previous_matches[4]_i_29 
       (.I0(\codons_reg[3][5] [0]),
        .I1(Q[0]),
        .I2(\codons_reg[3][4] [0]),
        .O(\previous_matches[4]_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hFFFF6FF6)) 
    \previous_matches[4]_i_3 
       (.I0(douta[3]),
        .I1(\previous_matches_reg[4]_i_9_n_0 ),
        .I2(douta[1]),
        .I3(\previous_matches_reg[4]_i_10_n_0 ),
        .I4(\previous_matches[4]_i_11_n_0 ),
        .O(\previous_matches_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \previous_matches[4]_i_8 
       (.I0(\previous_matches_reg[4]_i_6_n_0 ),
        .I1(douta[1]),
        .I2(douta[3]),
        .I3(\previous_matches_reg[4]_i_7_n_0 ),
        .I4(douta[0]),
        .I5(\previous_matches_reg[4]_i_5_n_0 ),
        .O(\previous_matches[4]_i_8_n_0 ));
  MUXF7 \previous_matches_reg[0]_i_3 
       (.I0(\previous_matches[0]_i_8_n_0 ),
        .I1(\previous_matches[0]_i_9_n_0 ),
        .O(\previous_matches_reg[0]_i_3_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[0]_i_4 
       (.I0(\previous_matches[0]_i_10_n_0 ),
        .I1(\previous_matches[0]_i_11_n_0 ),
        .O(\previous_matches_reg[0]_i_4_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[0]_i_5 
       (.I0(\previous_matches[0]_i_12_n_0 ),
        .I1(\previous_matches[0]_i_13_n_0 ),
        .O(\previous_matches_reg[0]_i_5_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[0]_i_6 
       (.I0(\previous_matches[0]_i_14_n_0 ),
        .I1(\previous_matches[0]_i_15_n_0 ),
        .O(\previous_matches_reg[0]_i_6_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[1]_i_4 
       (.I0(\previous_matches[1]_i_8_n_0 ),
        .I1(\previous_matches[1]_i_9_n_0 ),
        .O(\previous_matches_reg[1]_i_4_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[1]_i_5 
       (.I0(\previous_matches[1]_i_10_n_0 ),
        .I1(\previous_matches[1]_i_11_n_0 ),
        .O(\previous_matches_reg[1]_i_5_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[1]_i_6 
       (.I0(\previous_matches[1]_i_12_n_0 ),
        .I1(\previous_matches[1]_i_13_n_0 ),
        .O(\previous_matches_reg[1]_i_6_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[1]_i_7 
       (.I0(\previous_matches[1]_i_14_n_0 ),
        .I1(\previous_matches[1]_i_15_n_0 ),
        .O(\previous_matches_reg[1]_i_7_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[2]_i_4 
       (.I0(\previous_matches[2]_i_8_n_0 ),
        .I1(\previous_matches[2]_i_9_n_0 ),
        .O(\previous_matches_reg[2]_i_4_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[2]_i_5 
       (.I0(\previous_matches[2]_i_10_n_0 ),
        .I1(\previous_matches[2]_i_11_n_0 ),
        .O(\previous_matches_reg[2]_i_5_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[2]_i_6 
       (.I0(\previous_matches[2]_i_12_n_0 ),
        .I1(\previous_matches[2]_i_13_n_0 ),
        .O(\previous_matches_reg[2]_i_6_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[2]_i_7 
       (.I0(\previous_matches[2]_i_14_n_0 ),
        .I1(\previous_matches[2]_i_15_n_0 ),
        .O(\previous_matches_reg[2]_i_7_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_10 
       (.I0(\previous_matches[4]_i_22_n_0 ),
        .I1(\previous_matches[4]_i_23_n_0 ),
        .O(\previous_matches_reg[4]_i_10_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_24 
       (.I0(\previous_matches[4]_i_26_n_0 ),
        .I1(\previous_matches[4]_i_27_n_0 ),
        .O(\previous_matches_reg[4]_i_24_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_25 
       (.I0(\previous_matches[4]_i_28_n_0 ),
        .I1(\previous_matches[4]_i_29_n_0 ),
        .O(\previous_matches_reg[4]_i_25_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_4 
       (.I0(\previous_matches[4]_i_12_n_0 ),
        .I1(\previous_matches[4]_i_13_n_0 ),
        .O(\previous_matches_reg[4]_i_4_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_5 
       (.I0(\previous_matches[4]_i_14_n_0 ),
        .I1(\previous_matches[4]_i_15_n_0 ),
        .O(\previous_matches_reg[4]_i_5_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_6 
       (.I0(\previous_matches[4]_i_16_n_0 ),
        .I1(\previous_matches[4]_i_17_n_0 ),
        .O(\previous_matches_reg[4]_i_6_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_7 
       (.I0(\previous_matches[4]_i_18_n_0 ),
        .I1(\previous_matches[4]_i_19_n_0 ),
        .O(\previous_matches_reg[4]_i_7_n_0 ),
        .S(Q[2]));
  MUXF7 \previous_matches_reg[4]_i_9 
       (.I0(\previous_matches[4]_i_20_n_0 ),
        .I1(\previous_matches[4]_i_21_n_0 ),
        .O(\previous_matches_reg[4]_i_9_n_0 ),
        .S(Q[2]));
  LUT3 #(
    .INIT(8'h07)) 
    \state[0]_i_1 
       (.I0(\state_reg[1]_1 ),
        .I1(\state[0]_i_2_n_0 ),
        .I2(reset_IBUF),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \state[0]_i_2 
       (.I0(\state_reg[1]_0 ),
        .I1(memory_out[3]),
        .I2(memory_out[1]),
        .I3(memory_out[2]),
        .I4(memory_out[0]),
        .O(\state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h00D4)) 
    \state[1]_i_1 
       (.I0(\state[1]_i_2__0_n_0 ),
        .I1(\state_reg[1]_1 ),
        .I2(\state_reg[1]_0 ),
        .I3(reset_IBUF),
        .O(\state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \state[1]_i_2__0 
       (.I0(memory_out[0]),
        .I1(memory_out[2]),
        .I2(memory_out[1]),
        .I3(memory_out[3]),
        .O(\state[1]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg[1]_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg[1]_0 ),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "gene_memory,blk_mem_gen_v8_3_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *) 
module gene_memory
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [3:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
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
  wire [3:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "F" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.37365 mW" *) 
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
  (* C_INIT_FILE = "gene_memory.mem" *) 
  (* C_INIT_FILE_NAME = "gene_memory.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_WIDTH_A = "4" *) 
  (* C_READ_WIDTH_B = "4" *) 
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
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "4" *) 
  (* C_WRITE_WIDTH_B = "4" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  gene_memory_blk_mem_gen_v8_3_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[3:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[3:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0}),
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

(* NotValidForBitStream *)
module hardware_wrapper
   (clock,
    reset,
    switches,
    leds);
  input clock;
  input reset;
  input [2:0]switches;
  output [3:0]leds;

  wire clock;
  wire clock_IBUF;
  wire clock_IBUF_BUFG;
  wire codon_counter_instance_n_12;
  wire codon_counter_instance_n_13;
  wire codon_counter_instance_n_14;
  wire codon_counter_instance_n_15;
  wire codon_counter_instance_n_16;
  wire codon_counter_instance_n_17;
  wire codon_counter_instance_n_18;
  wire codon_counter_instance_n_19;
  wire codon_counter_instance_n_4;
  wire [2:0]codon_index;
  wire codon_reader_instance_n_0;
  wire codon_reader_instance_n_1;
  wire codon_reader_instance_n_10;
  wire codon_reader_instance_n_11;
  wire codon_reader_instance_n_12;
  wire codon_reader_instance_n_13;
  wire codon_reader_instance_n_14;
  wire codon_reader_instance_n_15;
  wire codon_reader_instance_n_16;
  wire codon_reader_instance_n_17;
  wire codon_reader_instance_n_2;
  wire codon_reader_instance_n_3;
  wire codon_reader_instance_n_6;
  wire codon_reader_instance_n_7;
  wire codon_reader_instance_n_9;
  wire [3:0]leds;
  wire [3:0]leds_OBUF;
  wire [3:0]memory_out;
  wire [4:0]previous_matches;
  wire reset;
  wire reset_IBUF;
  wire [2:0]switches;
  wire [2:0]switches_IBUF;

initial begin
 $sdf_annotate("testbench_time_synth.sdf",,,,"tool_control");
end
  BUFG clock_IBUF_BUFG_inst
       (.I(clock_IBUF),
        .O(clock_IBUF_BUFG));
  IBUF clock_IBUF_inst
       (.I(clock),
        .O(clock_IBUF));
  codon_counter codon_counter_instance
       (.D({previous_matches[4:3],codon_reader_instance_n_6,codon_reader_instance_n_7,previous_matches[0]}),
        .E(codon_reader_instance_n_2),
        .Q(codon_index),
        .\address_reg[0]_0 (codon_counter_instance_n_19),
        .clock_IBUF_BUFG(clock_IBUF_BUFG),
        .\codon_index_reg[2]_0 (codon_counter_instance_n_12),
        .\codon_index_reg[2]_1 (codon_reader_instance_n_14),
        .\codon_index_reg[2]_2 (codon_reader_instance_n_10),
        .\codon_index_reg[2]_3 (codon_reader_instance_n_16),
        .\codon_index_reg[2]_4 (codon_reader_instance_n_15),
        .\codons_reg[1][4][3] (codon_reader_instance_n_12),
        .\codons_reg[2][4][3] (codon_reader_instance_n_11),
        .\counts_reg[2][0]_0 (codon_counter_instance_n_4),
        .\counts_reg[4][0]_0 (codon_counter_instance_n_18),
        .douta(memory_out),
        .leds_OBUF(leds_OBUF),
        .\previous_matches_reg[2]_0 (codon_reader_instance_n_9),
        .\previous_matches_reg[3]_0 ({codon_counter_instance_n_13,codon_counter_instance_n_14,codon_counter_instance_n_15,codon_counter_instance_n_16,codon_counter_instance_n_17}),
        .\previous_matches_reg[3]_1 (codon_reader_instance_n_3),
        .\previous_matches_reg[4]_0 (codon_reader_instance_n_13),
        .\previous_matches_reg[4]_1 (codon_reader_instance_n_17),
        .reset_IBUF(reset_IBUF),
        .\state_reg[0]_0 (codon_reader_instance_n_1),
        .\state_reg[1]_0 (codon_reader_instance_n_0),
        .switches_IBUF(switches_IBUF));
  codon_reader codon_reader_instance
       (.CLK(clock_IBUF_BUFG),
        .D({previous_matches[4:3],codon_reader_instance_n_6,codon_reader_instance_n_7,previous_matches[0]}),
        .E(codon_reader_instance_n_2),
        .Q(codon_index),
        .\address_reg[0]_0 (codon_reader_instance_n_14),
        .\codon_index_reg[2] (codon_counter_instance_n_18),
        .\codon_index_reg[2]_0 (codon_counter_instance_n_19),
        .\counts_reg[0][0] (codon_reader_instance_n_17),
        .\counts_reg[3][3] (codon_reader_instance_n_3),
        .\counts_reg[4][0] (codon_reader_instance_n_13),
        .douta(memory_out),
        .\previous_matches_reg[1] (codon_reader_instance_n_9),
        .\previous_matches_reg[1]_0 (codon_reader_instance_n_10),
        .\previous_matches_reg[1]_1 (codon_reader_instance_n_11),
        .\previous_matches_reg[1]_2 (codon_reader_instance_n_12),
        .\previous_matches_reg[3] (codon_reader_instance_n_15),
        .\previous_matches_reg[3]_0 (codon_reader_instance_n_16),
        .\previous_matches_reg[3]_1 (codon_counter_instance_n_12),
        .\previous_matches_reg[4] (codon_counter_instance_n_4),
        .\previous_matches_reg[4]_0 ({codon_counter_instance_n_13,codon_counter_instance_n_14,codon_counter_instance_n_15,codon_counter_instance_n_16,codon_counter_instance_n_17}),
        .reset_IBUF(reset_IBUF),
        .\state_reg[1]_0 (codon_reader_instance_n_0),
        .\state_reg[1]_1 (codon_reader_instance_n_1));
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
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  IBUF \switches_IBUF[0]_inst 
       (.I(switches[0]),
        .O(switches_IBUF[0]));
  IBUF \switches_IBUF[1]_inst 
       (.I(switches[1]),
        .O(switches_IBUF[1]));
  IBUF \switches_IBUF[2]_inst 
       (.I(switches[2]),
        .O(switches_IBUF[2]));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module codon_memory_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  codon_memory_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module codon_memory_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  codon_memory_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module codon_memory_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_13 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_14 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_21 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_22 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_29 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_30 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_6 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9 ;
  wire [4:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0001000101010100010101010000000100000100010100000101010100000101),
    .INIT_01(256'h0100000101010101010001010001010101010101010000000001000000010100),
    .INIT_02(256'h0101010101010101010101010101010101010101010101010101010101000100),
    .INIT_03(256'h0101010101010101010101010101010101010101010101010101010101010101),
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
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,addra,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,addra,1'b1,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[1],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[3],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[2]}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_5 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_6 ,douta[1],\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_13 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_14 ,douta[0]}),
        .DOBDO({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_21 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_22 ,douta[3],\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_29 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_30 ,douta[2]}),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33 }),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35 }),
        .ENARDEN(ena),
        .ENBWREN(ena),
        .REGCEAREGCE(ena),
        .REGCEB(ena),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,wea,wea}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module codon_memory_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  codon_memory_blk_mem_gen_generic_cstr \valid.cstr 
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
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "F" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.37365 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "codon_memory.mem" *) 
(* C_INIT_FILE_NAME = "codon_memory.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "32" *) (* C_READ_DEPTH_B = "32" *) (* C_READ_WIDTH_A = "4" *) 
(* C_READ_WIDTH_B = "4" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "1" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "32" *) (* C_WRITE_DEPTH_B = "32" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "4" *) (* C_WRITE_WIDTH_B = "4" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_3_5" *) (* downgradeipidentifiedwarnings = "yes" *) 
module codon_memory_blk_mem_gen_v8_3_5
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
  input [3:0]dina;
  output [3:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [4:0]addrb;
  input [3:0]dinb;
  output [3:0]doutb;
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
  input [3:0]s_axi_wdata;
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
  output [3:0]s_axi_rdata;
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
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
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
  codon_memory_blk_mem_gen_v8_3_5_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_5_synth" *) 
module codon_memory_blk_mem_gen_v8_3_5_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [4:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [4:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  codon_memory_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module gene_memory_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [7:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [7:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  gene_memory_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module gene_memory_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [7:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [7:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  gene_memory_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module gene_memory_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [7:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_13 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_14 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_21 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_22 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_29 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_30 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_6 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9 ;
  wire [7:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
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
    .INIT_00(256'h0001000101010100010101010000000100000100010100000101010100000101),
    .INIT_01(256'h0100000101010101010001010001010101010101010000000001000000010100),
    .INIT_02(256'h0000010001010000000101010100000100000101000001010101010101000100),
    .INIT_03(256'h0101010101000000000100000001010000010001010101000101010100000001),
    .INIT_04(256'h0101010100000101010101010100010001000001010101010100010100010101),
    .INIT_05(256'h0001010000010001010101000101010100000001000001000101000001010001),
    .INIT_06(256'h0100010001000001010101010100010100010101010101010100000000010000),
    .INIT_07(256'h0101010001010101000000010000010001010000010101010000010101010101),
    .INIT_08(256'h0101010101000101000101010101010101000000000100000001010000010001),
    .INIT_09(256'h0000010001010000000000000101010100000101010101010100010001000001),
    .INIT_0A(256'h0101010101000000000100000001010000010001010101000101010100000001),
    .INIT_0B(256'h0101010100000101010101010100010001000001010101010100010100010101),
    .INIT_0C(256'h0000010001010000010100010000010001010000000000000101000101010100),
    .INIT_0D(256'h0101010101000000000001010001010000010001010101000101010100000101),
    .INIT_0E(256'h0101010101010101010101010100010001000001010101010100010100010101),
    .INIT_0F(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_10(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_11(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_12(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_13(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_14(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_15(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_16(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_17(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_18(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_19(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1A(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1B(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1C(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1D(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1E(256'h0101010101010101010101010101010101010101010101010101010101010101),
    .INIT_1F(256'h0101010101010101010101010101010101010101010101010101010101010101),
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
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({1'b0,addra,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,addra,1'b1,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[1],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[3],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[2]}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_0 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_1 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_3 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_4 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_5 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_6 ,douta[1],\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_8 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_9 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_10 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_11 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_12 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_13 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_14 ,douta[0]}),
        .DOBDO({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_16 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_17 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_18 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_19 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_20 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_21 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_22 ,douta[3],\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_24 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_25 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_26 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_27 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_28 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_29 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_30 ,douta[2]}),
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
module gene_memory_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [7:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [7:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  gene_memory_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "8" *) (* C_ADDRB_WIDTH = "8" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "F" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.37365 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "gene_memory.mem" *) 
(* C_INIT_FILE_NAME = "gene_memory.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "256" *) (* C_READ_DEPTH_B = "256" *) (* C_READ_WIDTH_A = "4" *) 
(* C_READ_WIDTH_B = "4" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "1" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "256" *) (* C_WRITE_DEPTH_B = "256" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "4" *) (* C_WRITE_WIDTH_B = "4" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_3_5" *) (* downgradeipidentifiedwarnings = "yes" *) 
module gene_memory_blk_mem_gen_v8_3_5
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
  input [7:0]addra;
  input [3:0]dina;
  output [3:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [7:0]addrb;
  input [3:0]dinb;
  output [3:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [7:0]rdaddrecc;
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
  input [3:0]s_axi_wdata;
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
  output [3:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [7:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [7:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
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
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
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
  gene_memory_blk_mem_gen_v8_3_5_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_5_synth" *) 
module gene_memory_blk_mem_gen_v8_3_5_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [3:0]douta;
  input clka;
  input ena;
  input [7:0]addra;
  input [3:0]dina;
  input [0:0]wea;

  wire [7:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
  wire ena;
  wire [0:0]wea;

  gene_memory_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
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

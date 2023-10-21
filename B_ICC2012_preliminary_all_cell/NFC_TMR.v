`timescale 1ns/100ps
`include "NFC.v"
// `include "TMR_Simplex.v"

// module NFC_TMR(clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY, A_ERROR_CTRL, B_ERROR_CTRL, C_ERROR_CTRL, TMR_ERROR);
module NFC_TMR(clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B_IN, F_IO_B_OUT, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY);

    /*===============NFC_TMR IO===============*/
    // input A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL;
    // output TMR_ERROR;


    /*===============original_NFC IO===============*/
    input clk;
    input rst;
    output done;

    inout [7:0] F_IO_A;
    wire [7:0] F_IO_A_IN;
    wire [7:0] F_IO_A_OUT;
    output F_CLE_A;
    output F_ALE_A;
    output F_REN_A;
    output F_WEN_A;
    input F_RB_A;

    inout [7:0] F_IO_B;
    wire [7:0] F_IO_B_IN;
    wire [7:0] F_IO_B_OUT;
    output F_CLE_B;
    output F_ALE_B;
    output F_REN_B;
    output F_WEN_B;
    input F_RB_B;

    wire F_IO_A_READING;
    wire F_IO_B_READING;

    input [3:0] KEY;

    /*===============original_NFC_copy_A IO===============*/
    wire OA_done;

    wire [7:0] OA_F_IO_A_IN;
    wire [7:0] OA_F_IO_A_OUT;
    wire OA_F_CLE_A;
    wire OA_F_ALE_A;
    wire OA_F_REN_A;
    wire OA_F_WEN_A;

    wire [7:0] OA_F_IO_B_IN;
    wire [7:0] OA_F_IO_B_OUT;
    wire OA_F_CLE_B;
    wire OA_F_ALE_B;
    wire OA_F_REN_B;
    wire OA_F_WEN_B;

    wire OA_F_IO_A_READING;
    wire OA_F_IO_B_READING;

    /*===============original_NFC_copy_B IO===============*/
    wire OB_done;

    wire [7:0] OB_F_IO_A_IN;
    wire [7:0] OB_F_IO_A_OUT;
    wire OB_F_CLE_A;
    wire OB_F_ALE_A;
    wire OB_F_REN_A;
    wire OB_F_WEN_A;

    wire [7:0] OB_F_IO_B_IN;
    wire [7:0] OB_F_IO_B_OUT;
    wire OB_F_CLE_B;
    wire OB_F_ALE_B;
    wire OB_F_REN_B;
    wire OB_F_WEN_B;

    wire OB_F_IO_A_READING;
    wire OB_F_IO_B_READING;

    /*===============original_NFC_copy_C IO===============*/
    wire OC_done;

    wire [7:0] OC_F_IO_A_IN;
    wire [7:0] OC_F_IO_A_OUT;
    wire OC_F_CLE_A;
    wire OC_F_ALE_A;
    wire OC_F_REN_A;
    wire OC_F_WEN_A;

    wire [7:0] OC_F_IO_B_IN;
    wire [7:0] OC_F_IO_B_OUT;
    wire OC_F_CLE_B;
    wire OC_F_ALE_B;
    wire OC_F_REN_B;
    wire OC_F_WEN_B;

    wire OC_F_IO_A_READING;
    wire OC_F_IO_B_READING;

    /*===============Inout data flow===============*/
    assign OA_F_IO_A_IN=F_IO_A_IN;
    assign OA_F_IO_B_IN=F_IO_B_IN;

    assign OB_F_IO_A_IN=F_IO_A_IN;
    assign OB_F_IO_B_IN=F_IO_B_IN;

    assign OC_F_IO_A_IN=F_IO_A_IN;
    assign OC_F_IO_B_IN=F_IO_B_IN;

    assign F_IO_A_IN=F_IO_A;
    assign F_IO_B_IN=F_IO_B;
    assign F_IO_A=(F_IO_A_READING)? 8'hzz:F_IO_A_OUT;
    assign F_IO_B=(F_IO_B_READING)? 8'hzz:F_IO_B_OUT;


    /*===============NFC_TMR IO connection===============*/
    NFC OriNFC_A(clk, rst, OA_done, OA_F_IO_A_IN, OA_F_IO_A_OUT, OA_F_CLE_A, OA_F_ALE_A, OA_F_REN_A, OA_F_WEN_A, F_RB_A, OA_F_IO_B_IN, OA_F_IO_B_OUT, OA_F_CLE_B, OA_F_ALE_B, OA_F_REN_B, OA_F_WEN_B, F_RB_B, OA_F_IO_A_READING, OA_F_IO_B_READING ,KEY);
    NFC OriNFC_B(clk, rst, OB_done, OB_F_IO_A_IN, OB_F_IO_A_OUT, OB_F_CLE_A, OB_F_ALE_A, OB_F_REN_A, OB_F_WEN_A, F_RB_A, OB_F_IO_B_IN, OB_F_IO_B_OUT, OB_F_CLE_B, OB_F_ALE_B, OB_F_REN_B, OB_F_WEN_B, F_RB_B, OB_F_IO_A_READING, OB_F_IO_B_READING ,KEY);
    NFC OriNFC_C(clk, rst, OC_done, OC_F_IO_A_IN, OC_F_IO_A_OUT, OC_F_CLE_A, OC_F_ALE_A, OC_F_REN_A, OC_F_WEN_A, F_RB_A, OC_F_IO_B_IN, OC_F_IO_B_OUT, OC_F_CLE_B, OC_F_ALE_B, OC_F_REN_B, OC_F_WEN_B, F_RB_B, OC_F_IO_A_READING, OC_F_IO_B_READING ,KEY);

    // TMR_Simplex_1bit TMR_done(_done,TMR_ERROR_0,OA_done,OB_done,OC_done,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_8bit TMR_F_IO_A_OUT(F_IO_A_OUT,TMR_ERROR_1,OA_F_IO_A_OUT,OB_F_IO_A_OUT,OC_F_IO_A_OUT,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_CLE_A(F_CLE_A,TMR_ERROR_2,OA_F_CLE_A,OB_F_CLE_A,OC_F_CLE_A,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_ALE_A(F_ALE_A,TMR_ERROR_3,OA_F_ALE_A,OB_F_ALE_A,OC_F_ALE_A,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_REN_A(F_REN_A,TMR_ERROR_4,OA_F_REN_A,OB_F_REN_A,OC_F_REN_A,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_WEN_A(F_WEN_A,TMR_ERROR_5,OA_F_WEN_A,OB_F_WEN_A,OC_F_WEN_A,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_8bit TMR_F_IO_B_OUT(F_IO_B_OUT,TMR_ERROR_6,OA_F_IO_B_OUT,OB_F_IO_B_OUT,OC_F_IO_B_OUT,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,F_WEN_B,rst);
    // TMR_Simplex_1bit TMR_F_CLE_B(F_CLE_B,TMR_ERROR_7,OA_F_CLE_B,OB_F_CLE_B,OC_F_CLE_B,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_ALE_B(F_ALE_B,TMR_ERROR_8,OA_F_ALE_B,OB_F_ALE_B,OC_F_ALE_B,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_REN_B(F_REN_B,TMR_ERROR_9,OA_F_REN_B,OB_F_REN_B,OC_F_REN_B,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_WEN_B(F_WEN_B,TMR_ERROR_10,OA_F_WEN_B,OB_F_WEN_B,OC_F_WEN_B,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_IO_A_READING(F_IO_A_READING,TMR_ERROR_11,OA_F_IO_A_READING,OB_F_IO_A_READING,OC_F_IO_A_READING,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);
    // TMR_Simplex_1bit TMR_F_IO_B_READING(F_IO_B_READING,TMR_ERROR_12,OA_F_IO_B_READING,OB_F_IO_B_READING,OC_F_IO_B_READING,A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL,clk,rst);

    TMR_1bit TMR_done(done,OA_done,OB_done,OC_done);
    TMR_8bit TMR_F_IO_A_OUT(F_IO_A_OUT,OA_F_IO_A_OUT,OB_F_IO_A_OUT,OC_F_IO_A_OUT);
    TMR_1bit TMR_F_CLE_A(F_CLE_A,OA_F_CLE_A,OB_F_CLE_A,OC_F_CLE_A);
    TMR_1bit TMR_F_ALE_A(F_ALE_A,OA_F_ALE_A,OB_F_ALE_A,OC_F_ALE_A);
    TMR_1bit TMR_F_REN_A(F_REN_A,OA_F_REN_A,OB_F_REN_A,OC_F_REN_A);
    TMR_1bit TMR_F_WEN_A(F_WEN_A,OA_F_WEN_A,OB_F_WEN_A,OC_F_WEN_A);
    TMR_8bit TMR_F_IO_B_OUT(F_IO_B_OUT,OA_F_IO_B_OUT,OB_F_IO_B_OUT,OC_F_IO_B_OUT);
    TMR_1bit TMR_F_CLE_B(F_CLE_B,OA_F_CLE_B,OB_F_CLE_B,OC_F_CLE_B);
    TMR_1bit TMR_F_ALE_B(F_ALE_B,OA_F_ALE_B,OB_F_ALE_B,OC_F_ALE_B);
    TMR_1bit TMR_F_REN_B(F_REN_B,OA_F_REN_B,OB_F_REN_B,OC_F_REN_B);
    TMR_1bit TMR_F_WEN_B(F_WEN_B,OA_F_WEN_B,OB_F_WEN_B,OC_F_WEN_B);
    TMR_1bit TMR_F_IO_A_READING(F_IO_A_READING,OA_F_IO_A_READING,OB_F_IO_A_READING,OC_F_IO_A_READING);
    TMR_1bit TMR_F_IO_B_READING(F_IO_B_READING,OA_F_IO_B_READING,OB_F_IO_B_READING,OC_F_IO_B_READING);
endmodule

module TMR_1bit(data_out,dataA_in,dataB_in,dataC_in);
    input dataA_in,dataB_in,dataC_in;
    output data_out;

    assign data_out=(dataA_in&dataB_in)|(dataB_in&dataC_in)|(dataA_in&dataC_in);
endmodule

module TMR_8bit(data_out,dataA_in,dataB_in,dataC_in);
    input [7:0] dataA_in,dataB_in,dataC_in;
    output [7:0] data_out;

    assign data_out=(dataA_in&dataB_in)|(dataB_in&dataC_in)|(dataA_in&dataC_in);
endmodule

// module TMR_Simplex_8bit(data_out,TMR_error,dataA_in,dataB_in,dataC_in,A_error_ctrl,B_error_ctrl,C_error_ctrl,clk,reset);

//     input [7:0]dataA_in,dataB_in,dataC_in;
//     input A_error_ctrl,B_error_ctrl,C_error_ctrl;
//     input clk,reset;

//     output [7:0]data_out;
//     output reg TMR_error;

//     wire [7:0]_A,_B,_C;

//     reg A_fault,B_fault,C_fault;
//     wire simplex_mode;

//     assign _A=(A_error_ctrl)? ~dataA_in : dataA_in;
//     assign _B=(B_error_ctrl)? ~dataB_in : dataB_in;
//     assign _C=(C_error_ctrl)? ~dataC_in : dataC_in;

//     assign simplex_mode=A_fault|B_fault|C_fault;

//     assign data_out=(_A&_B)|(_B&_C)|(_A&_C);

//     always@(posedge clk or posedge reset) begin
//         if(reset) begin
//             A_fault   <= 1'b0;
//             B_fault   <= 1'b0;
//             C_fault   <= 1'b0;
//             TMR_error <= 1'b0;
//         end
//         else begin
//             A_fault   <= ((_A!=_B)&&(_A != _C)) ? 1'b1 : A_fault;
//             B_fault   <= ((_A!=_B)&&(_B != _C)) ? 1'b1 : B_fault;
//             C_fault   <= ((_C!=_B)&&(_A != _C)) ? 1'b1 : C_fault;
//             TMR_error <= A_fault&(_B!=_C)|B_fault&(_A!=_C)|C_fault&(_A!=_B);
//         end
//     end
// endmodule

// module TMR_Simplex_1bit(data_out,TMR_error,dataA_in,dataB_in,dataC_in,A_error_ctrl,B_error_ctrl,C_error_ctrl,clk,reset);

//     input dataA_in,dataB_in,dataC_in;
//     input A_error_ctrl,B_error_ctrl,C_error_ctrl;
//     input clk,reset;

//     output data_out;
//     output reg TMR_error;

//     wire _A,_B,_C;

//     reg A_fault,B_fault,C_fault;
//     wire simplex_mode;

//     assign _A=(A_error_ctrl)? ~dataA_in : dataA_in;
//     assign _B=(B_error_ctrl)? ~dataB_in : dataB_in;
//     assign _C=(C_error_ctrl)? ~dataC_in : dataC_in;

//     assign simplex_mode=A_fault|B_fault|C_fault;

//     assign data_out=(_A&_B)|(_B&_C)|(_A&_C);

//     always@(posedge clk or posedge reset) begin
//         if(reset) begin
//             A_fault   <= 1'b0;
//             B_fault   <= 1'b0;
//             C_fault   <= 1'b0;
//             TMR_error <= 1'b0;
//         end
//         else begin
//             A_fault   <= ((_A!=_B)&&(_A != _C)) ? 1'b1 : A_fault;
//             B_fault   <= ((_A!=_B)&&(_B != _C)) ? 1'b1 : B_fault;
//             C_fault   <= ((_C!=_B)&&(_A != _C)) ? 1'b1 : C_fault;
//             TMR_error <= A_fault&(_B!=_C)|B_fault&(_A!=_C)|C_fault&(_A!=_B);
//         end
//     end
// endmodule

`include "/mnt4/CBDK018_UMC_Faraday_v1.1_all/CBDK018_UMC_Faraday_v1.1/CIC/Verilog/fsa0m_a_generic_core_21.lib"
`include "/mnt4/CBDK018_UMC_Faraday_v1.1_all/CBDK018_UMC_Faraday_v1.1/CIC/Verilog/fsa0m_a_t33_generic_io_21.lib"

`timescale 1ns/10ps
`define SDFFILE    "./Report_U18/CHIP.sdf"	 
 
`include "./Report_U18/CHIP_netlist.v"

`define CYCLE 20
`include "./flash_a.v"
`include "./flash_b.v"

`ifdef WARTERMARK
  `define EXPECT "./wartermark_mem_goal.dat"
`else
  `ifdef p1
    `define EXPECT "./p1_mem_goal.dat"
  `endif

  `ifdef p2
    `define EXPECT "./p2_mem_goal.dat"
  `endif
`endif


module test;

  reg  clk, rst;
  wire done;
  wire [7:0] f_io_a;
  wire f_cle_a, f_ale_a, f_ren_a, f_wen_a, f_rb_a;
  wire [7:0] f_io_b;
  wire f_cle_b, f_ale_b, f_ren_b, f_wen_b, f_rb_b;
  `ifdef TMR
  // reg a_error_ctrl, b_error_ctrl, c_error_ctrl;
  // wire tmr_error;
  `endif
  `ifdef KEY
  reg [3:0] key;
  `endif
  integer  out_mem [0:262143]; 
  
  reg [18:0] k;
  reg [8:0] x;
  integer n, i, err, y;

  parameter duty = `CYCLE / 2;

  CHIP top(
    .I_clk(clk), 
    .I_rst(rst), 
    .O_done(done), 
    .IO_F_IO_A(f_io_a), 
    .O_F_CLE_A(f_cle_a), 
    .O_F_ALE_A(f_ale_a), 
    .O_F_REN_A(f_ren_a), 
    .O_F_WEN_A(f_wen_a), 
    .I_F_RB_A(f_rb_a), 
    .IO_F_IO_B(f_io_b), 
    .O_F_CLE_B(f_cle_b), 
    .O_F_ALE_B(f_ale_b), 
    .O_F_REN_B(f_ren_b), 
    .O_F_WEN_B(f_wen_b), 
    .I_F_RB_B(f_rb_b), 
    .I_KEY(key)
  );
          
  flash_a fa(.IO7(f_io_a[7]), 
           .IO6(f_io_a[6]), 
           .IO5(f_io_a[5]), 
           .IO4(f_io_a[4]), 
           .IO3(f_io_a[3]), 
           .IO2(f_io_a[2]), 
           .IO1(f_io_a[1]), 
           .IO0(f_io_a[0]), 
           .CLE(f_cle_a), 
           .ALE(f_ale_a), 
           .CENeg(1'b0), 
           .RENeg(f_ren_a), 
           .WENeg(f_wen_a), 
           .R(f_rb_a) );
		   
  flash_b fb(.IO7(f_io_b[7]), 
           .IO6(f_io_b[6]), 
           .IO5(f_io_b[5]), 
           .IO4(f_io_b[4]), 
           .IO3(f_io_b[3]), 
           .IO2(f_io_b[2]), 
           .IO1(f_io_b[1]), 
           .IO0(f_io_b[0]), 
           .CLE(f_cle_b), 
           .ALE(f_ale_b), 
           .CENeg(1'b0), 
           .RENeg(f_ren_b), 
           .WENeg(f_wen_b), 
           .R(f_rb_b) );

		   
  initial begin
    `ifdef FSDB
      $fsdbDumpfile("NFC.fsdb");
      $fsdbDumpvars;
    `endif

    `ifdef SDF
        $sdf_annotate(`SDFFILE, top);
    `endif

    $readmemh (`EXPECT, out_mem);
  end

    /*============KEY===========*/
    localparam OFSM_KEY_0 = 4'h5;   //P
    localparam OFSM_KEY_1 = 4'h0;
    localparam OFSM_KEY_2 = 4'h5;   //Y
    localparam OFSM_KEY_3 = 4'h9;
    localparam OFSM_KEY_4 = 4'h5;   //P
    localparam OFSM_KEY_5 = 4'h0;
    localparam OFSM_KEY_6 = 4'h4;   //D
    localparam OFSM_KEY_7 = 4'h4;
    localparam WTMK_KEY = 4'b1111;

  initial begin
    clk = 1'b0;
    rst = 1'b0;
    `ifdef KEY
    key = 4'b0;
    `endif
    `ifdef TMR
    // a_error_ctrl = 1'b0;
    // b_error_ctrl = 1'b0;
    // c_error_ctrl = 1'b0;
    `endif
    n = 0;
    err = 0;
    #3
      rst = 1'b1;
    #15
      rst = 1'b0;
    `ifdef KEY
    #2
    key = OFSM_KEY_0;
    #20
    key = OFSM_KEY_1;
    #20
    key = OFSM_KEY_2;
    #20
    key = OFSM_KEY_3;
    #20
    key = OFSM_KEY_4;
    #20
    key = OFSM_KEY_5;
    #20
    key = OFSM_KEY_6;
    `ifdef WARTERMARK
    #20
    key = WTMK_KEY;
    #20
    key = OFSM_KEY_0;
    #20
    key = OFSM_KEY_1;
    #20
    key = OFSM_KEY_2;
    #20
    key = OFSM_KEY_3;
    #20
    key = OFSM_KEY_4;
    #20
    key = OFSM_KEY_5;
    #20
    key = OFSM_KEY_6;
    `endif
    #20
    key = OFSM_KEY_7;
    `endif
	
	//#500000 a_error_ctrl=1'b1;
	//#500000 b_error_ctrl=1'b1;
	//#500000 c_error_ctrl=1'b1;
	
  end

  always #duty clk = ~clk;

always @(posedge done) 
begin
   for(k=0;k<262144;k=k+1)
    if( fb.Mem[k] !== out_mem[k]) 
		begin
			x=k/512;
         	$display("ERROR at page %d  address %h   :   output %h != expect %h",x , k, fb.Mem[k], out_mem[k]);
         	err = err + 1 ;
		end 
      else
			begin
			y=k%512;
			x=k/512;
			if( y == 0)
				begin
					$display("page %d data have been generated successfully!", x);
					err=err; 
				end
			else
					err=err;
			end
        begin
	if (err == 0)  begin
	            $display("All data have been generated successfully!\n");
	            $display("-------------------PASS-------------------\n");
		          $finish;
	         end
	         else begin
	            $display("There are %d errors!\n", err);
	            $display("---------------------------------------------\n");
		          $finish;
         	      end
	
	end
end

endmodule

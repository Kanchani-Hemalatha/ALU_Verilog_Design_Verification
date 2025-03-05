//================================================================================================
//					TESTBENCH																	  
//================================================================================================
//Signal Description : 
//						clock  -> 100MHZ
//						reset  -> active low
//						in1 -> input1 is of 4bits width 
//						in2 -> input2 is of 4bits width
//						opcode -> opcode is of 3bits width
//						out -> out is output which is 8bits width
//						expected_out -> expected_out which is of 8bits width
//						count -> it will count the number of errors
//Reference_model : reference model is a task which will generate the expected output with respected to the input sinals. Which will be further compared with the design output
//Based on that 
//================================================================================================


`timescale 1ns/1ns
module testbench;
  reg[3:0] in1,in2;
  reg[2:0]opcode;
  reg clock=0,reset; 
  wire[7:0]out;
  reg[7:0]expected_out;
  integer count=0; //no.of errors
  
  topmodule dut(.in1(in1),.in2(in2),.opcode(opcode),.clock(clock),.reset(reset),.out(out)); //design instance
  always #5clock=~clock; //clock genration
  
  //reference_model 
  task reference_model(input[3:0]in1,input[3:0]in2,input[2:0]opcode,input reset,output [7:0] expected_out);
    if(!reset) begin
      expected_out = 8'b0;
    end else begin
     expected_out = (opcode == 3'b000) ? (in1 + in2) :
               		(opcode == 3'b001) ? (in1 - in2) :
               		(opcode == 3'b010) ? (in1 * in2) :
               		(opcode == 3'b011) ? (in1 / in2) :
               		(opcode == 3'b100) ? (in1 | in2) :
               		(opcode == 3'b101) ? (in1 & in2) :
               		(opcode == 3'b110) ? ~(in1 & in2) :
               		(opcode == 3'b111) ? ~(in1 | in2) :
               		8'bx;     
    end
  endtask: reference_model
  //reset generation
  initial begin
     reset = 1'b0;
    #10;
    reset = 1'b1;
  end
  //input generation
  initial begin
   repeat(20)begin
    in1=$random; 
    in2=$random; 
    opcode=$urandom_range(0,7); 
     @(posedge clock); //waiting for posedge clock 
       if(expected_out == out) begin
        count = count;
       end else begin
       count = count+1;
       end
   end
  end
  //calculating the expected output on the clock edge
  initial begin
    forever begin
      @(posedge clock or negedge reset) reference_model(in1,in2,opcode,reset,expected_out); 
    end
  end
  //waveform dumping
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  //printing Test success and failure
  final begin
    if(count == 0) begin
      $display("================================================");
      $display("\tTEST PASSED successfully");
      $display("================================================");
    end else begin
      $display("================================================");
      $display("\tTEST FAILED with error count = %0d",count);
      $display("================================================");
    end
  end
  //calling $finish after 250ns
  initial begin
    #250 $finish;
  end
  
endmodule:testbench

//================================================================================================
//                                  ARITHMETIC MODULE DEFINITION								  
//================================================================================================

module arithmetic(input [3:0] in1, in2, input [2:0] opcode, input clock, input reset, output reg [7:0] out_arithmetic);
  
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      out_arithmetic <= 0;
    end else begin
      case (opcode)
        3'b000: out_arithmetic <= in1 + in2; // Addition of operands
        3'b001: out_arithmetic <= in1 - in2; // Subtraction of operands
        3'b010: out_arithmetic <= in1 * in2; // Multiplication of operands
        3'b011: out_arithmetic <= (in2 != 0) ? (in1 / in2) : 8'bx; // Division with zero check
        default: out_arithmetic <= 8'bx; // Default value
      endcase
    end
  end
  
endmodule // arithmetic

//================================================================================================
//                                  LOGIC MODULE DEFINITION										  
//================================================================================================

module logic_unit(input [3:0] in1, in2, input [2:0] opcode, input clock, input reset, output reg [7:0] out_logic);
  
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      out_logic <= 0;
    end else begin
      case (opcode)
        3'b100: out_logic <= in1 | in2; // OR of operands
        3'b101: out_logic <= in1 & in2; // AND of operands
        3'b110: out_logic <= ~(in1 & in2); // NAND of operands
        3'b111: out_logic <= ~(in1 | in2); // NOR of operands
        default: out_logic <= 8'bx; // Default value
      endcase
    end
  end
  
endmodule // logic_unit

//================================================================================================
//                                  TOP MODULE DEFINITION										  
//================================================================================================

module topmodule(input [3:0] in1, in2, input [2:0] opcode, input clock, input reset, output reg [7:0] out);
  
  wire [7:0] out_arithmetic, out_logic;
  
  arithmetic arith_top(
    .in1(in1),
    .in2(in2),
    .opcode(opcode),
    .clock(clock),
    .reset(reset),
    .out_arithmetic(out_arithmetic)
  );
  
  logic_unit logic_top(
    .in1(in1),
    .in2(in2),
    .opcode(opcode),
    .clock(clock),
    .reset(reset),
    .out_logic(out_logic)
  );
  
  always @(*) begin
    out = (opcode <= 3) ? out_arithmetic : out_logic;
  end
  
endmodule // topmodule

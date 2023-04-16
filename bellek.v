module dual_port_ram (
  input clk,
  input [3:0] write_addr_a,
  input [3:0] write_addr_b,
  input [15:0] write_data_a,
  input [15:0] write_data_b,
  input we_a,
  input we_b,
  input [3:0] read_addr_a,
  input [3:0] read_addr_b,
  output reg [15:0] read_data_a,
  output reg [15:0] read_data_b,
  inout io_a,
  inout io_b
);

reg [15:0] ram [0:15];

always @(posedge clk) begin
  if (we_a) begin
    ram[write_addr_a] <= write_data_a;
  end
  if (we_b) begin
    ram[write_addr_b] <= write_data_b;
  end
end

always @(negedge clk) begin
  read_data_a <= ram[read_addr_a];
  read_data_b <= ram[read_addr_b];
end

endmodule

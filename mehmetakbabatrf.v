module odev_trafik(
  input clk,
  output reg red,
  output reg blue,
  output reg green
);

reg [23:0] counter;

always @(posedge clk) begin
  counter <= counter + 1;
  if (counter >= 100000000) begin // 10 saniye
    red <= 1;
    blue <= 0;
    green <= 0;
  end else if (counter >= 80000000) begin // 2 saniye
    red <= 0;
    blue <= 1;
    green <= 0;
  end else if (counter >= 30000000) begin // 5 saniye
    red <= 0;
    blue <= 0;
    green <= 1;
  end
end

endmodule

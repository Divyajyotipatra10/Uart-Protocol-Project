module uarttest;
reg send,p_s,clk,rst;
reg [6:0] din;
wire busy;
wire dout;
uart dp(load,shift,increment,rstcounter,p_s,din,dout,count,clk);
statemachine cp(send,busy,load,shift,increment,rstcounter,count,clk,rst);

initial
begin
    rst<=1'b1;
    #1 clk <=1'b0;
    forever #5 clk=~clk;
end
initial 
begin 

    #12 send<=1'b1;rst<=1'b0;
    #10 p_s<=1'b0;  din<=7'b0011011;
    #20 send<=1'b0;
end
initial
begin
    //$monitor($stime,,, "busy=%b Dout=%b increment=%b dpcount=%b cpcount=%b state=%d ",busy,dout,dp.increment,dp.count,cp.count, cp.state);
end
initial begin
	#6 $display("dout=%b",dout);
	forever #20 $display("dout=%b",dout);
end
initial begin
#1000 $stop;
end
endmodule

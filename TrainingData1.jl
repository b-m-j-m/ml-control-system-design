using ControlSystems;
using Plots;
gr();

include("TestSignals.jl");

G = ss([0 1;-1 -2],[-1;-1],[0 1],0);
t = LinRange(0,50,5000);
sig = StepSig(t, 5);
plot(t,sig);
y1,t1,x1 = lsim(G,sig,t);
plot!(t,y1);

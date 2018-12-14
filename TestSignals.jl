function δSig(t,T0)
    #Return an approximation of the Dirac-Impulse at T0
    return [abs(T0-i) > abs(t[1]-t[2])/2 ? 0 : 1 / abs(t[1]-t[2]) for i in t];
end

function StepSig(t, T0=0)
    #Return a step starting at T0
    return 0.5.*(sign.(t.-T0).+1);
end

function SineSig(f::Float64, t, T0=0)
    #Return a sine wave of frequency f starting at T0
    return sin.(2*pi*f*(t.-T0)).*StepSig(t, T0);
end

function SawtoothSig(f::Float64, t, T0=0)
    #Return a sawtooth wave of frequency f starting at T0
    return (-1 .+ 2 .* (t .- T0) .* f .- 2 .* floor.((t .- T0) .* f)) .* StepSig(t, T0);
end

function PulseSig(f::Float64, t, T0=0)
    #Return a pulseof frequency f starting at T0
    return (-1).^(mod.(floor.((t.-T0).*f),2)).* StepSig(t, T0);
end

function TriangleSig(f::Float64, t, T0=0)
    #Return a symmetrical triangle wave of frequency f starting at T0
    return -PulseSig(2*f,t,T0) .* (1 .+2 .*floor.(2 .*(t.-T0).*f).-4 .*t.*f) .* StepSig(t, T0);
end

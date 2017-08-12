%% U-Delaware
function [e_eff] = U_Delaware(ei,em)
ei = 10; 
em = 1.25;
%% 3D printer specs

%find fractional volume
%a volume fraction of 1 should correspond to our maximum permitivity

%% trace dimensions
        h_trace = .0001;
        w_trace1 = .0004;
        w_trace2 = .0008;
        A_cross = h_trace*(w_trace1-h_trace)+pi*(h_trace/2)^2;
      
%% Unit-cell dimensions
    A = 0.00887;
    M = 1:1:30; %number of turns
    total_length = (M+1)*A;
    Vf = A_cross*total_length/(A.^2*h_trace);
    
    %Vf = 0:.01:1;
    
    %Vf = ((w_trace1-(1-pi/4)*h_trace)*(M+1))/A;
    
    e_eff = em*((Vf.*2*(ei-em)+ei+2*em)./(Vf.*(em-ei)+ei+2*em));
end
    
 

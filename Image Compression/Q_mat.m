function Qn = Q_mat(qualityLevel)
% This function generates the Quantization matrix for the required quality
% level
    Q50 = load("QuntiMtrx.mat").x; % Quantizatioin Matrix of qualityLevel, 50.
    % compute tau
    if (qualityLevel >= 50)
        tau = (100 - qualityLevel)/50;
    else
        tau = 50/qualityLevel;
    end

    disp(tau);

    Qn_unclipped = tau*Q50;
    Qn = round(Qn_unclipped);
    Qn(Qn > 255) = 255;
    Qn(Qn < 0) = 0;
end
function [AngleAvg] = aver(InA)
    theNumerator = sum(sin(InA));
    theDenominator = sum(cos(InA));
    if(theDenominator ==0)
        AngleAvg = sign(theNumerator)*pi/2;
    else
        AngleAvg = atan2(theNumerator,theDenominator);
    end
    
end
function [fc, f_psp] = Type_GNSS(Type)

switch Type
    case 'GPS'
        fc    = 1575.42e6;
        f_psp = 1.023e6;
    case 'GLONASS'
        fc    = 1602e6;
        f_psp = .511e6;
    case 'BEIDOU'
        fc    = 1561.098e6;
        f_psp = 2.046e6;
    otherwise
        disp('Error type of GNSS');
        fc    = 0;
        f_psp = 0;
    
end
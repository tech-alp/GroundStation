function res = make8b(num)
    val = uint16(num);
    res = flip(typecast(val,'uint8'));
    res(end) = res(end) + 3;
end
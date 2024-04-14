switch (uname)
    case Darwin
        abbr where "whereis -a"
    case '*'
        abbr where whereis
end

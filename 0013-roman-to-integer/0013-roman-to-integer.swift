class Solution {
    func romanToInt(_ s: String) -> Int {
        let str = Array(s)
        var res = 0
        var pass = false
        for i in 0..<s.count {
            if pass { pass = false; continue }
            switch str[i] {
                case "I":
                if i + 1 < s.count {
                    switch str[i+1] {
                        case "V": 
                        res += 4
                        pass = true
                        case "X": 
                        res += 9
                        pass = true
                        default: 
                        res += 1
                    }
                } else {
                    res += 1
                }
                case "V":
                res += 5
                case "X":
                if i + 1 < str.count {
                    switch str[i+1] {
                        case "L": 
                        res += 40
                        pass = true
                        case "C": 
                        res += 90
                        pass = true
                        default: 
                        res += 10
                    }
                } else {
                    res += 10
                }
                case "L":
                res += 50
                case "C":
                if i + 1 < str.count {
                    switch str[i+1] {
                        case "D": 
                        res += 400
                        pass = true
                        case "M": 
                        res += 900
                        pass = true
                        default: 
                        res += 100
                    }
                } else {
                    res += 100
                }
                case "D":
                res += 500
                default: 
                res += 1000
            }
        }
        return res
    }
}

// IV IX 5-1 10-1
// XL XC 50-10 100-10
// CD CM 500-100 1000-100
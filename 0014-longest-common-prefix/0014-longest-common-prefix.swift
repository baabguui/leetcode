class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 1 { return strs[0] } else {
            let strs = strs.map { Array($0) }
            var pf = ""
            outer: for i in 0..<strs[0].count {
                let c = strs[0][i]
                for j in strs {
                    if j.count > i && j[i] == c { continue } else {
                        break outer
                    }
                }
                pf += String(c)
            }
            return pf
        }
    }
}
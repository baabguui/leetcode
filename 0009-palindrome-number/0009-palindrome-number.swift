class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x >= 0 {
            let x = Array(String(x))
            let count = x.count
            let center = count / 2

            for i in 0..<center {
                if x[i] != x[count-1-i] {
                    return false
                }
            }
            return true
        } else { 
            return false 
        }
    }
}
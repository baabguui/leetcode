class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let str = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
        for i in 0..<str.count/2 {
            let sideIdx = str.count - 1 - i
            if str[i] != str[sideIdx] { return false }
        }
        return true
    }
}
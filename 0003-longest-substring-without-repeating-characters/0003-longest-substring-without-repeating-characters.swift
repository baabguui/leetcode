class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var result = 0

        for i in 0..<s.count {
            var dict = [Character: Bool]()
            dict[s[i]] = true
            var maxL = 1
            for j in i+1..<s.count {
                if let _ = dict[s[j]] {
                    maxL = max(maxL, j-i)
                    break
                }
                dict[s[j]] = true
                maxL += 1
            }
            result = max(result, maxL)
        }

        return result
    }
}
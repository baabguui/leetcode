class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()
        for c in s {
            dict[c, default: 0] += 1
        }

        for c in t {
            if let _ = dict[c] {
                if dict[c]! > 0 {
                    dict[c]! -= 1
                    continue
                }
            }
            return false
        }

        for i in dict.values {
            if i > 0 { return false }
        }

        return true
    }
}
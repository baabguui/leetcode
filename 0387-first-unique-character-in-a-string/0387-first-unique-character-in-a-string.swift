class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        var idx = Int.max
        for c in s {
            dict[c, default: 0] += 1
        }

        for (key, value) in dict {
            if value == 1, let i = s.firstIndex(of: key) {
                let n = s.distance(from: s.startIndex, to: i)
                if n < idx { idx = n }
            }
        }
        return idx > s.count ? -1 : idx
    }
}
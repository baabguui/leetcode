class Solution {
    func reverseString(_ s: inout [Character]) {
        for i in 0..<s.count/2 {
            let sideIdx = s.count - 1 - i
            s.swapAt(i, sideIdx)
        }
    }
}
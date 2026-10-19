class Solution {
    func jump(_ nums: [Int]) -> Int {
        var memos = Array(repeating: Int.max, count: nums.count)
        memos[0] = 0

        for i in 0..<nums.count {
            if i == nums.count - 1 { return memos[i] }

            for j in 0...nums[i] {
                if j == 0 { continue }
                if i+j < nums.count {
                    memos[i+j] = min(memos[i] + 1, memos[i+j])
                }
            }
        }

        return -1
    }
}
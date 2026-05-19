class Solution {
    func isGood(_ nums: [Int]) -> Bool {
        let nums = nums.sorted()
        let count = nums.count

        for i in 0..<count - 1 {
            if nums[i] != i + 1 {
                return false
            } else {
                continue
            }
        }

        if nums[count - 1] != count - 1 {
            return false
        } else {
            return true
        }
        
        return false
    }
}
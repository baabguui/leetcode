class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var pointer = nums.count/2
        var right = nums[pointer] < target

        while pointer >= 0 && pointer < nums.count {
            if nums[pointer] == target {
                break
            } else if nums[pointer] > target {
                if right { break }
                pointer -= 1
            } else {
                if !right { pointer += 1; break }
                pointer += 1
            }
        }
        
        return pointer < 0 ? 0 : pointer
    }
}
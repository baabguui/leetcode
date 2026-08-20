class Solution {
    func resultArray(_ nums: [Int]) -> [Int] {
        var arrs: [[Int]] = [[nums[0]], [nums[1]]]
        
        for i in 2..<nums.count {
            if arrs[0].last ?? 1 >= arrs[1].last ?? 1 {
                arrs[0].append(nums[i])
            } else {
                arrs[1].append(nums[i])
            }
        }

        return arrs.flatMap {$0}
    }
}
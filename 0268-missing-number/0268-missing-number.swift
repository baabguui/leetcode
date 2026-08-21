class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var start = 1, end = nums.count
        var mid = ((end/2) + 1) * (end%2)
        let sum = (start + end) * (end/2) + mid
        return sum - nums.reduce(0, +)
    }
}
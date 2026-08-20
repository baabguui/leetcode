class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count

        while start < end {
            let mid = (start + end)/2
            nums[mid] < target ? (start = mid + 1) : (end = mid)
        }
        
        return start
    }
}
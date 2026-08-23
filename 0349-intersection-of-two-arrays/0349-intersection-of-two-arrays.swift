class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums = nums1.sorted()
        var res = Set<Int>()

        for i in nums2 {
            var left = 0, right = nums1.count
            while left < right {
                let mid = (left+right)/2
                if nums[mid] == i { res.insert(i); break }
                nums[mid] > i ? (right = mid) : (left = mid + 1)
            }
        }

        return res.map { $0 }
    }
}
class Solution {
    func separateDigits(_ nums: [Int]) -> [Int] {
        return Array(nums.map { String($0) }.reduce("", +)).compactMap { Int(String($0))}
    }
}
class Solution {
        func plusOne(_ digits: [Int]) -> [Int] {
            var nums = digits
            var needToUp = false
            var added = false
            for i in (0..<digits.count).reversed() {
                let idx = added ? i + 1 : i
                if digits[i] == 9 {
                    if i == 0 {
                        nums.insert(1, at: 0)
                        added = true
                        nums[i+1] = 0
                    } else {
                        nums[idx] = 0
                        needToUp = true
                    }
                } else {
                    nums[idx] += 1
                    needToUp = false
                    break
                }
            }
            return nums
    }
}
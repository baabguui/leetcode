class Solution {
    func rotatedDigits(_ n: Int) -> Int {
        let valid = [0, 1, 2, 5, 6, 8, 9]
        let same = [0, 1, 8]
        
        return countLessOrEqual(n, using: valid) - countLessOrEqual(n, using: same)
    }
    
    private func countLessOrEqual(_ n: Int, using digits: [Int]) -> Int {
        let nums = String(n).map { Int(String($0))! }
        let length = nums.count
        let base = digits.count
        let hasZero = digits.contains(0)
        
        var result = 0
        
        // 1. n보다 자릿수가 짧은 수 개수
        if length > 1 {
            for len in 1..<length {
                let firstCount = hasZero ? base - 1 : base
                result += firstCount * powInt(base, len - 1)
            }
        }
        
        // 2. n과 자릿수가 같은 수 개수
        for i in 0..<length {
            let current = nums[i]
            let remaining = length - i - 1
            
            var smallerCount = 0
            
            for d in digits {
                if i == 0 && d == 0 { continue } // 맨 앞 0 방지
                if d < current {
                    smallerCount += 1
                }
            }
            
            result += smallerCount * powInt(base, remaining)
            
            // 현재 자리 숫자를 만들 수 없으면 여기서 종료
            if !digits.contains(current) {
                return result
            }
        }
        
        // n 자기 자신도 만들 수 있는 경우
        return result + 1
    }
    
    private func powInt(_ base: Int, _ exp: Int) -> Int {
        if exp == 0 { return 1 }
        
        var result = 1
        for _ in 0..<exp {
            result *= base
        }
        return result
    }
}
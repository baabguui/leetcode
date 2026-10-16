class Solution {
    func climbStairs(_ n: Int) -> Int {
        var memo = [Int: Int]()
        func dp(_ n: Int) -> Int {
            if let res = memo[n] {
                 return res 
            } else {
                if n < 4 { memo[n] = n; return n }
                var res = dp(n-1) + dp(n-2)
                memo[n] = res
                return res
            }
        }

        return dp(n)
    }
}
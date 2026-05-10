class Solution {
  func maximumJumps(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    var dp = Array(repeating: -1, count: n)
    dp[0] = 0
    
    for i in 0..<n {
      if dp[i] == -1 {
        continue
      }
      
      for j in i+1..<n {
        let diff = nums[j] - nums[i]
        if -target <= diff && diff <= target {
          dp[j] = max(dp[j], dp[i] + 1)
        }
      }
    }
    return dp[n - 1]
  }
}
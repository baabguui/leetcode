// 다시 풀기 (내가 푼거 아님)
class Solution {
    func maxPathScore(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid[0].count
        let neg = -1_000_000_000
        
        var dp = Array(
            repeating: Array(
                repeating: Array(repeating: neg, count: k + 1),
                count: n
            ),
            count: m
        )
        
        let startScore = grid[0][0]
        let startCost = grid[0][0] == 0 ? 0 : 1
        
        if startCost > k { return -1 }
        dp[0][0][startCost] = startScore
        
        for y in 0..<m {
            for x in 0..<n {
                for cost in 0...k {
                    if dp[y][x][cost] == neg { continue }
                    
                    let currentScore = dp[y][x][cost]
                    
                    if y + 1 < m {
                        let value = grid[y + 1][x]
                        let nextCost = cost + (value == 0 ? 0 : 1)
                        
                        if nextCost <= k {
                            dp[y + 1][x][nextCost] = max(
                                dp[y + 1][x][nextCost],
                                currentScore + value
                            )
                        }
                    }
                    
                    if x + 1 < n {
                        let value = grid[y][x + 1]
                        let nextCost = cost + (value == 0 ? 0 : 1)
                        
                        if nextCost <= k {
                            dp[y][x + 1][nextCost] = max(
                                dp[y][x + 1][nextCost],
                                currentScore + value
                            )
                        }
                    }
                }
            }
        }
        
        return dp[m - 1][n - 1].max() == neg ? -1 : dp[m - 1][n - 1].max()!
    }
}
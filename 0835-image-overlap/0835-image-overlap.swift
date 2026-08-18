class Solution {
    func largestOverlap(_ img1: [[Int]], _ img2: [[Int]]) -> Int {
        let n = img1.count
        var res = 0

        for dx in -n+1..<n {
            for dy in -n+1..<n {
                var count = 0
                for i in 0..<n {
                    for j in 0..<n {
                        let row = i + dx
                        let col = j + dy
                        if row >= 0 && row < n && col >= 0 && col < n {
                            if img2[i][j] == 1 && img1[row][col] == 1 {
                                count += 1
                            }
                        }
                    }
                }
                res = max(res, count)
            } 
        }
        return res
    }
}
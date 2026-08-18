class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let m = matrix.count, n = matrix[0].count
        for i in 0..<n {
            let num = matrix[0][i]
            var idx = i + 1
            for row in 1..<m {
                if idx < n {
                    if matrix[row][idx] != num {
                        return false 
                    }
                    idx += 1
                }
            }
        }

        for i in 1..<m {
            let num = matrix[i][0]
            if i == m - 1 { break }
            var idx = 1
            for row in i+1..<m {
                if idx < n {
                    if matrix[row][idx] != num { return false }
                    idx += 1
                }
            }
        }

        return true
    }
}
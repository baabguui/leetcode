class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let m = mat.count, n = mat[0].count
        if m * n != r * c { return mat }
        var res = Array(repeating: Array(repeating: 0, count: c), count: r)
        let matrix = mat.flatMap {$0}

        for i in 0..<matrix.count {
            let row = i / c
            let col = i % c
            
            res[row][col] = matrix[i]
        }
        return res
    }
}
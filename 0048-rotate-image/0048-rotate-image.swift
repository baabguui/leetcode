class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count

        // 1 2 3.         1 4 7
        // 4 5 6          2 5 8
        // 7 8 9   -->.   3 6 9 
        for i in 0..<count {
            for j in i..<count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }

        // 1 4 7         7 4 1
        // 2 5 8         8 5 2
        // 3 6 9   -->.  9 6 3
        for i in 0..<count {
            matrix[i] = matrix[i].reversed()
        }
    }
}
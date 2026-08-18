class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let m = mat.count, n = mat[0].count
        var up = true
        var res = [Int]()

        func move(_ i: Int, _ j: Int) {
            res.append(mat[i][j])
            let dl = j - 1 >= 0
            let dr = j + 1 < n
            let du = i - 1 >= 0
            let dd = i + 1 < m
            
            if up {
                if du && dr {
                    move(i-1, j+1)
                } else if dr {
                    up.toggle()
                    move(i, j+1)
                } else if dd {
                    up.toggle()
                    move(i+1, j)
                }
            } else {
                if dl && dd {
                    move(i+1, j-1)
                } else if dd {
                    up.toggle()
                    move(i+1, j)
                } else if dr {
                    up.toggle()
                    move(i, j+1)
                }
            }
        }

        move(0, 0)
        return res
    }
}

// +1 +1 -> 0 +1 -> -1 -1 -> +1 0 -> +1 +1 ...
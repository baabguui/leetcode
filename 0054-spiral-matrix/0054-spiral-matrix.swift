class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count, n = matrix[0].count
        var d = 0
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var res = [Int]()
    
        func spider(_ i: Int, _ j: Int) {
            if visited[i][j] {
                changeDirection()
                return
            } else {
                visited[i][j] = true
                res.append(matrix[i][j])
                switch d {
                    case 0:
                    if j + 1 < n && !visited[i][j+1] {
                        spider(i, j+1)
                    } else if i + 1 < m {
                        changeDirection()
                        spider(i+1, j)
                    }
                    case 1:
                    if i + 1 < m && !visited[i+1][j]{
                        spider(i+1, j)
                    } else if j - 1 >= 0 {
                        changeDirection()
                        spider(i, j-1)
                    }
                    case 2:
                    if j - 1 >= 0 && !visited[i][j-1]{
                        spider(i, j-1)
                    } else if i - 1 >= 0 {
                        changeDirection()
                        spider(i-1, j)
                    }
                    case 3:
                    if i - 1 >= 0 && !visited[i-1][j] {
                        spider(i-1, j)
                    } else if j + 1 < n {
                        changeDirection()
                        spider(i, j+1)
                    }

                    default: break
                }
            }
        }

        func changeDirection() {
            d = (d + 1) % 4
        }

        spider(0, 0)
        return res
    }
}

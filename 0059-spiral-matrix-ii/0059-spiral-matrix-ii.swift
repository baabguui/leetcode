class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
    var d = 0
    
    var r = 0
    var c = -1
    
    for i in 0 ..< n * n {
      switch d {
      case 0:
        if c + 1 < n && matrix[r][c+1] == 0 {
          matrix[r][c+1] = i + 1
          c += 1
        } else if r + 1 < n {
          matrix[r+1][c] = i + 1
          d = (d + 1) % 4
          r += 1
        }
      case 1:
        if r + 1 < n && matrix[r+1][c] == 0 {
          matrix[r+1][c] = i + 1
          r += 1
        } else if c - 1 >= 0 {
          matrix[r][c-1] = i + 1
          d = (d + 1) % 4
          c -= 1
        }
      case 2:
        if c - 1 >= 0 && matrix[r][c-1] == 0 {
          matrix[r][c-1] = i + 1
          c -= 1
        } else if r - 1 >= 0 {
          matrix[r-1][c] = i + 1
          d = (d + 1) % 4
          r -= 1
        }
      case 3:
        if r - 1 >= 0 && matrix[r-1][c] == 0 {
          matrix[r-1][c] = i + 1
          r -= 1
        } else if c + 1 < n {
          matrix[r][c+1] = i + 1
          d = (d + 1) % 4
          c += 1
        }
      default: continue
      }
    }
    
    matrix[0][0] = 1
    return matrix
  }
}
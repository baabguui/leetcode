class Solution {
    func solve(_ board: inout [[Character]]) {
      let m = board.count
      let n = board[0].count
      
      for i in 0..<m {
        for j in 0..<n {
          if board[i][j] == "O" && (i == 0 || j == 0 || i == m - 1 || j == n - 1) { // 가장자리
            var stack = [(Int, Int)]()
            stack.append((i, j))
            
            while !stack.isEmpty {
              let (y, x) = stack.popLast()!
              board[y][x] = "A"
              
              if y - 1 >= 0 && board[y-1][x] == "O" {
                stack.append((y-1, x))
              }
              
              if y + 1 < m && board[y+1][x] == "O" {
                stack.append((y+1, x))
              }
              
              if x - 1 >= 0 && board[y][x-1] == "O" {
                stack.append((y, x-1))
              }
              
              if x + 1 < n && board[y][x+1] == "O" {
                stack.append((y, x+1))
              }
            }
          }
        }
      }
      
      for i in 0..<m {
        for j in 0..<n {
          if board[i][j] == "O" { board[i][j] = "X" } else if board[i][j] == "A" { board[i][j] = "O" }
        }
      }
    }
}
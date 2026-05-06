class Solution {
  func rotateTheBox(_ boxGrid: [[Character]]) -> [[Character]] {
    let m = boxGrid.count
    let n = boxGrid[0].count
    
    var boxGrid = boxGrid
    for i in 0..<m {
      var row = boxGrid[i]
      var empty = n - 1
      
      for j in (0..<n).reversed() {
        if row[j] == "*" {
          empty = j - 1
        } else if row[j] == "#" {
          row[j] = "."
          row[empty] = "#"
          empty -= 1
        }
      }
      boxGrid[i] = row
    }
    
    var arr = Array(repeating: Array(repeating: Character("a"), count: m), count: n)
    var row = 0
    
    for i in (0..<m).reversed() {
      for j in 0..<n {
        arr[j][row] = boxGrid[i][j]
      }
      row += 1
    }
    return arr
  }
}
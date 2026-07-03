class Solution {
  func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
    let row = grid[0].count, col = grid.count
    if row < 3 || col < 3 {
      return 0
    }
    
    let c = row / 3
    let nm = row % 3 != 0
    var grids = [[[Int]]]()
    
    for i in 0..<col-2 {
      for j in 0..<row-2 {
        var gr = [[Int]]()
        
        for tempR in i..<i+3 {
          var rrow = [Int]()
          for tempC in j...j+2 {
            rrow.append(grid[tempR][tempC])
          }
          gr.append(rrow)
        }
        
        if isMagic(gr) { grids.append(gr) }
        gr = []
        
        if j + 1 > row && nm {
          for tempR in i..<i+3 {
            var rrow = [Int]()
            for tempC in row-3...row-1 {
              rrow.append(grid[tempR][tempC])
            }
            gr.append(rrow)
          }
          if isMagic(gr) { grids.append(gr) }
        }
      }
      
    }
    return grids.count
  }
  
  private func inRange(_ nums: [Int]) -> Bool {
    for n in nums {
      if !(1...9).contains(n) { return false }
    }
    return true
  }
  
  private func isMagic(_ grid: [[Int]]) -> Bool {
    print(grid)
    let f = grid[0][0], s = grid[0][1], t = grid[0][2]
    
    if !inRange([f,s,t]) {
      return false
    }
    
    let sum = f + s + t
    
    let ff = grid[1][0], fs = grid[1][1], ft = grid[1][2]
    
    if !inRange([ff, fs, ft]) || ff + fs + ft != sum {
      return false
    }
    
    let sf = grid[2][0], ss = grid[2][1], st = grid[2][2]
    
    if !inRange([sf, ss, st]) || sf + ss + st != sum {
      return false
    }
    
    if f + fs + st != sum || t + fs + sf != sum {
      return false
    }
    
    if f + ff + sf != sum || s + fs + ss != sum || t + ft + st != sum {
      return false
    }
    
    if Set([f, s, t, ff, fs, ft, sf, ss, st]).count != 9 {
      return false
    }
    return true
  }
}
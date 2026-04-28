class Solution {
  func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
    let arr = grid.flatMap { $0 }
    let r = arr[0] % x
    
    for i in arr {
      if i % x != r { return -1 }
    }
    
    let sorted = arr.sorted()
    let target = sorted[sorted.count / 2]
    return sorted.reduce(0) { partialResult, i in
      partialResult + abs(i - target) / x
    }
  }
}
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
    if numRows <= 1 {
      return s
    }
    let arr = Array(s)
    var result:[[Character]] = Array(repeating: [], count: numRows)
    
    var cur = 0
    var reversed = false
    
    result[0].append(arr[0])
    
    for i in 1..<arr.count {
      if reversed {
        cur -= 1
      } else {
        cur += 1
      }
      result[cur].append(arr[i])
      if cur == numRows - 1 {
        reversed = true
      } else if cur == 0 {
        reversed = false
      }
    }
    return result.map { $0.map { String($0) }.joined() }.joined()
  }
}
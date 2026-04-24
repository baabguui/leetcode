class Solution {
    func furthestDistanceFromOrigin(_ moves: String) -> Int {
    var diff = 0
    let count = moves.count
    let arr = Array(moves.replacingOccurrences(of: "_", with: ""))
    let directCount = arr.count
    for m in arr {
      if m == "R" {
        diff += 1
      } else {
        diff -= 1
      }
    }
    return abs(diff) + count - directCount
  }
}
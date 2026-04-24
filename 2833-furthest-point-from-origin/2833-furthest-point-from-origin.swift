class Solution {
    func furthestDistanceFromOrigin(_ moves: String) -> Int {
    var diff = 0
    var count = 0
    for m in Array(moves) {
      if m == "R" {
        diff += 1
      } else if m == "L" {
        diff -= 1
      } else {
        count += 1
      }
    }
    return abs(diff) + count
  }
}
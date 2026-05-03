class Solution {
  func rotateString(_ s: String, _ goal: String) -> Bool {
    if s.count != goal.count { return false }
    let s = Array(s)
    let goal = Array(goal)
    let indices = s.enumerated()
        .filter { $0.element == goal[0] }
        .map { $0.offset }
    
    for idx in indices {
      for i in 0..<goal.count {
        let p = (idx + i) % goal.count
        if s[p] == goal[i] {
          if i == goal.count - 1 {
            return true
          } else {
            continue
          }
        } else {
          break
        }
      }
    }
    return false
  }
}
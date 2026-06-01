class Solution {
    func minimumCost(_ cost: [Int]) -> Int {
      var cost = cost.sorted(by: >)
      if cost.count < 3 { return cost.reduce(0, +) }
      for i in stride(from: 2, through: cost.count - 1, by: 3) {
        cost[i] = 0
      }
      return cost.reduce(0, +)
    }
}
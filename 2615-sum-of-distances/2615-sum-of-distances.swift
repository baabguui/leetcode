class Solution {
  func distance(_ nums: [Int]) -> [Int] {
    var groups = [Int: [Int]]()
    
    for (i, num) in nums.enumerated() {
      groups[num, default: []].append(i)
    }
    
    var result = Array(repeating: 0, count: nums.count)
    
    for (_, indices) in groups {
      if indices.count <= 1 { continue }
      
      var acc = 0
      
      for i in 1..<indices.count {
        let diff = indices[i] - indices[i - 1]
        acc += diff * i
        result[indices[i]] += acc
      }
      
      acc = 0
      
      for i in stride(from: indices.count - 2, through: 0, by: -1) {
        let diff = indices[i + 1] - indices[i]
        acc += diff * (indices.count - 1 - i)
        result[indices[i]] += acc
      }
    }
    
    return result
  }
}
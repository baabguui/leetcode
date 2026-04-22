class Solution {
    func twoEditWords(_ queries: [String], _ dictionary: [String]) -> [String] {
      var result = [String]()
      
      queries.forEach { query in
        let q = Array(query)
        outer: for word in dictionary {
          var c = 0
          let w = Array(word)
          inner: for i in 0..<w.count {
            if q[i] != w[i] {
              c += 1
              if c > 2 { break inner }
            }
          }
          if c <= 2 { result.append(query); break outer }
        }
      }
      
      return result
    }
}
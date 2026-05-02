class Solution {
    func rotatedDigits(_ n: Int) -> Int {
      var count = 0
      
      for i in 0...n {
        var num = i
        var isValid = false
        
        outer: while num > 0 {
          let k = num % 10
          
          switch k {
          case 3, 4, 7:
            isValid = false; break outer
          case 2, 5, 6, 9:
            isValid = true; fallthrough
          default:
            num = num / 10
          }
        }
        
        if isValid { count += 1 }
      }
      
      return count
    }
}
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var res = [String]()
        for i in 0..<n {
            let idx = i + 1
            if idx % 3 == 0 {
                if idx % 5 == 0 {
                    res.append("FizzBuzz")
                } else {
                    res.append("Fizz")
                }
            } else if idx % 5 == 0 {
                res.append("Buzz")
            } else { 
                res.append(String(idx))
            }
        }
        return res
    }
}
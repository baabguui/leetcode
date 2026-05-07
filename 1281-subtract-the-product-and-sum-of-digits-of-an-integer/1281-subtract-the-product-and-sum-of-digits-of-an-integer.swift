class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        let n = Array(String(n)).compactMap { Int(String($0)) }
        return n.reduce(1, *) - n.reduce(0, +)
    }
}
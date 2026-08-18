class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max() ?? 0
        return candies.map { (max - $0) <= extraCandies }
    }
}
//엑스트라보다 넘게 차이나면 false
final class Solution {
    func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
        let n = source.count
        var parent = Array(0..<n)
        var rank = Array(repeating: 0, count: n)
        
        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        
        func union(_ a: Int, _ b: Int) {
            let pa = find(a)
            let pb = find(b)
            
            if pa == pb { return }
            
            if rank[pa] < rank[pb] {
                parent[pa] = pb
            } else if rank[pa] > rank[pb] {
                parent[pb] = pa
            } else {
                parent[pb] = pa
                rank[pa] += 1
            }
        }
        
        for swap in allowedSwaps {
            union(swap[0], swap[1])
        }
        
        var groups: [Int: [Int]] = [:]
        for i in 0..<n {
            let root = find(i)
            groups[root, default: []].append(i)
        }
        
        var answer = 0
        
        for indices in groups.values {
            var count: [Int: Int] = [:]
            
            for idx in indices {
                count[source[idx], default: 0] += 1
            }
            
            for idx in indices {
                count[target[idx], default: 0] -= 1
            }
            
            for value in count.values {
                if value > 0 {
                    answer += value
                }
            }
        }
        
        return answer
    }
}
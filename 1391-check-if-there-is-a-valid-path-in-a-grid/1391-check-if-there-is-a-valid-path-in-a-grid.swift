final class Solution {
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let m = grid.count
        let n = grid[0].count
        
        // 각 타일에서 갈 수 있는 방향 (상,하,좌,우)
        let dirs: [Int: [(Int, Int)]] = [
            1: [(0, -1), (0, 1)],     // 좌, 우
            2: [(-1, 0), (1, 0)],     // 상, 하
            3: [(0, -1), (1, 0)],     // 좌, 하
            4: [(0, 1), (1, 0)],      // 우, 하
            5: [(0, -1), (-1, 0)],    // 좌, 상
            6: [(0, 1), (-1, 0)]      // 우, 상
        ]
        
        // 반대 방향
        func opposite(_ d: (Int, Int)) -> (Int, Int) {
            return (-d.0, -d.1)
        }
        
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var queue = [(0, 0)]
        visited[0][0] = true
        
        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            
            if r == m - 1 && c == n - 1 {
                return true
            }
            
            for d in dirs[grid[r][c]]! {
                let nr = r + d.0
                let nc = c + d.1
                
                if nr < 0 || nr >= m || nc < 0 || nc >= n {
                    continue
                }
                
                if visited[nr][nc] {
                    continue
                }
                
                // 다음 칸이 현재 방향의 반대 방향을 받아줄 수 있어야 함
                if dirs[grid[nr][nc]]!.contains(where: { $0 == opposite(d) }) {
                    visited[nr][nc] = true
                    queue.append((nr, nc))
                }
            }
        }
        
        return false
    }
}
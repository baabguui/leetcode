final class Solution {
    func containsCycle(_ grid: [[Character]]) -> Bool {
        let m = grid.count
        let n = grid[0].count
        
        var visited = Array(
            repeating: Array(repeating: false, count: n),
            count: m
        )
        
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        
        func dfs(_ row: Int, _ col: Int, _ parentRow: Int, _ parentCol: Int) -> Bool {
            visited[row][col] = true
            
            for (dr, dc) in directions {
                let nr = row + dr
                let nc = col + dc
                
                if nr < 0 || nr >= m || nc < 0 || nc >= n {
                    continue
                }
                
                if grid[nr][nc] != grid[row][col] {
                    continue
                }
                
                // 바로 직전에 온 칸으로 되돌아가는 건 사이클이 아님
                if nr == parentRow && nc == parentCol {
                    continue
                }
                
                // 부모가 아닌데 이미 방문한 같은 문자 칸이면 사이클
                if visited[nr][nc] {
                    return true
                }
                
                if dfs(nr, nc, row, col) {
                    return true
                }
            }
            
            return false
        }
        
        for r in 0..<m {
            for c in 0..<n {
                if !visited[r][c] {
                    if dfs(r, c, -1, -1) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if let p, let q {
            return bfs(p, q)
        } else if p == nil && q == nil {
            return true
        } else { return false }
    }
    func bfs(_ p: TreeNode, _ q: TreeNode) -> Bool {
        if p.val != q.val { return false }
        if let p = p.left, let q = q.left {
            if !bfs(p, q) {
                return false
            }
        } else if (p.left == nil && q.left != nil) || (p.left != nil && q.left == nil) {
            return false
        }

        if let p = p.right, let q = q.right {
            if !bfs(p, q) {
                return false
            }
        } else if (p.right == nil && q.right != nil) || (p.right != nil && q.right == nil) {
            return false
        }
        
        return true
    }
}
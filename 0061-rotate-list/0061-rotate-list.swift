/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
  
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
      var dict = [Int: Int]()
      var arr = [Int]()
      
      var cur: ListNode? = head
      var pointer = 0
      
      while true {
        if let c = cur {
          arr.append(c.val)
          pointer += 1
          if let next = c.next {
            cur = next
          } else { break }
        } else { break }
      }
      
      var sorted = arr
      
      for (i, val) in arr.enumerated() {
        let index = (i + k) % arr.count
        sorted[index] = val
      }
      
      cur = head
      pointer = 0
      
      while true {
        if let c = cur {
          c.val = sorted[pointer]
          pointer += 1
          if let next = c.next {
            cur = next
          } else { break }
        } else { break }
      }
      
      
      return head
    }
}
import UIKit

class ListNode {
    public var val: Int = 0
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    
    //第一种方法，使用dic判重，时间复杂度O（N），空间复杂度O（N）
//    func hasCycle(_ head: ListNode?)-> Bool {
//        var dic: Dictionary = [Int : Int]()
//        var rhead = head
//        while let h = rhead {
//            if let _ = dic[h.val] {
//                return true
//            }
//            dic[h.val] = 0
//            rhead = rhead?.next
//        }
//        return false
//    }
    
    //第二种方法，快慢指针
    func hasCycle(_ head: ListNode?)-> Bool {
        var slow = head
        var fast = head?.next
        while let f = fast,let s = slow {
            if f.val == s.val  {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }

    
    func run() {
        var headNode: ListNode = ListNode(1)
        let head = headNode
        for index in 2...10 {
            let temp = ListNode(index)
            headNode.next = temp
            headNode = temp
        }
//        headNode.next = head
//        wprint(head: head)
        let b = hasCycle(head)
        print("是否有环:\(b)")
        
    }
    func wprint(head: ListNode?)  {
        var temp = head
        while temp != nil {
            print("\(temp!.val)>>>>")
            temp = temp?.next
        }
    }
}
let solution: Solution = Solution()
solution.run()



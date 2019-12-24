import UIKit

var str = "Hello, playground"


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    /* 使用多个变量进行记录，容易理解
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        var rhead: ListNode? = nil
        var uhead = head
        var prehead: ListNode? = nil
        while uhead?.next != nil  {
            let next = uhead?.next
            prehead?.next = next
            prehead = uhead
            if rhead == nil {
                rhead = next
            }
            let nnext = next?.next
            next?.next = uhead
            uhead?.next = nnext
            uhead = nnext
        }
        
        return rhead
    }
 */
    /* 这道题三个节点的时候比较好处理，所以第一种解法需要更多的变量
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let emptyHead = ListNode(-1) //
        emptyHead.next = head
        var c: ListNode? = emptyHead
        while c?.next?.next != nil  {
            let a = c?.next
            let b = c?.next?.next
            a?.next = b?.next
            b?.next = a
            c?.next = b
            c = a
            
        }
        return emptyHead.next
    }
 */
    //递归
    func swapPairs(_ head: ListNode?) -> ListNode? {
        //1、第一步 终止条件
        if head == nil || head?.next == nil {
            return head
        }
        //2、找返回值: 返回的应该链表
        //3、把问题简化为 单次， 只有 head ， next , swapPairs(next.next) ，这三个节点 进行交换
        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next
    }
    
    func run() {
        var headNode: ListNode = ListNode(1)
        let head = headNode
        for index in 2...10 {
            let temp = ListNode(index)
            headNode.next = temp
            headNode = temp
        }
        wprint(head: head)
        let reusltHead = swapPairs(head)
        wprint(head: reusltHead)
        
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

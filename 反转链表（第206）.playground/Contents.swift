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
    

    /*往后赋值
    func reverseList(_ head: ListNode?) -> ListNode? {
        var rHead = head
        while (true) {
            let temp = head?.next
            if temp == nil {
                break
            }
            head?.next = temp?.next
            temp?.next = rHead
            rHead = temp
            
        }
        return rHead
    }
 */
    /*往前赋值
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var curr: ListNode? = head
        while (curr != nil) {
            let temp = curr?.next
            curr?.next = pre
            pre = curr
            curr = temp
        }
        return pre
    }
 */
    
    /*
     递归
     1.假设链表为 1->2->3->4>5
     2.假定最后的5已经是翻转过的
     3.当翻转4的时候，只需要4->next->next = 4，也就是 5->4<-3<-2<-1
     4.这个手3后边的已经完成了翻转，当翻转3时，3->next->next = 3 也就是5->4->3<-2<-1
     依次类推
     5.那个temp变量其实就是最后一个值5，变成了头结点
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        let temp = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return temp
    }
    
    
    func run() {
        var headNode: ListNode = ListNode(1)
        let head = headNode
        for index in 2...5 {
            let temp = ListNode(index)
            headNode.next = temp
            headNode = temp
        }
        wprint(head: head)
        let reusltHead = reverseList(head)
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
var solution: Solution = Solution()
solution.run()

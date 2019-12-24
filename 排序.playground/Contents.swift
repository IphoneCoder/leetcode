import UIKit

var str = "Hello, playground"

func sortPart(array: [Int], l: Int, r: Int) {

    let v = array[l]
    var i = l, j = r
    while i<j {
        if array[j] > v {
            j-=1
        } else {
            array[i] = array[j]
        }

    }
}

func quickSort(array: [Int], l: Int, r: Int) {
    
}

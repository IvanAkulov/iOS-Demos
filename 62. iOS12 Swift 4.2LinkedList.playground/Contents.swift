//                head    <-             <-             <-   end/tail
//linkedList: [element 1] -> [element 2] -> [element 3] -> [element 4] -> nil

//index            0          1          2          3          4          5
//array:      [element 1][element 2][element 3][element 4][element 5][element 6]...

//Algorithm           ArrayList   LinkedList
//seek front            O(1)         O(1)
//seek back             O(1)         O(1)
//seek to index         O(1)         O(N)
//insert at front       O(N)         O(1)
//insert at back        O(1)         O(1)
//insert after an item  O(N)         O(1)


struct LinkedList<T> {
    var head: LinkedListNode<T>
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
}


let element4 = LinkedListNode.value(element: "D", next: .end)
let element3 = LinkedListNode.value(element: "C", next: element4)
let element2 = LinkedListNode.value(element: "B", next: element3)
let element1 = LinkedListNode.value(element: "A", next: element2)
let list = LinkedList(head: element1)


extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end: return nil
        }
    }
}

list.contains("R")

for element in list {
    print(element)
}

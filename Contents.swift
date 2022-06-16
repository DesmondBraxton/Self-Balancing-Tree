import UIKit
// Missing pieces to make a binary search tree into a self balancing binary tree
// create a balance factor
// Rotation functions

class AVLNode {
    var value: Int
    var leftChild: AVLNode?
    var rightChild: AVLNode?
    public var height = 0
    
    public var balanceFactor: Int {
        leftHeight - rightHeight
    }
    
    public var leftHeight: Int {
        leftChild?.height ?? -1
    }
    
    public var rightHeight: Int {
        rightChild?.height ?? -1
    }
    
    init(_ value: Int) {
        self.value = value
        }
    ]
    
    extension AVLNode {
        private func insert(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element> {
            guard let node = node else {
                return AVLNode(value: value)}
            if value < node.value {
                node.leftChild = insert(from: node.leftChild, value: value)
            } else {
                node.rightChild = insert(from: node.rightChild, value: value)
            }
            let balancedNode = balanced(node)
            balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
            return balancedNode
            }
        }
        private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
            let pivot = node.rightChild!
            node.rightChild = pivot.leftChild
            pivol.leftChild = node
            node.height = max(node.leftHeight, node.right height)
            pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
            return pivot
        } // Nearly identical to the left rotate, the references are just swapped
        private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
            let pivot = node.leftChild!
            node.leftChild = pivot.rightChild
            pivot.rightChild = node
            node.height = max(node.leftHeight) + 1
            pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
            return pivot
        }
        private func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
            guard let rightChild = node.rightChild else {
                return node
            }
            node.rightChild = rightRotate(rightChild)
            return leftRotate(node)
        }
        private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
            guard let leftChild = node.leftChild else {
                return node
            }
            node.leftChild = leftRotate(leftChild)
            return rightRotate(node)
        }
        private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
            switch node.balanceFactor{
            case 2:
                if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
                } else {
                return rightRotate(node)
                }
            case -2:
                if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
                }
            default:
                return node
            }
        }
        
    

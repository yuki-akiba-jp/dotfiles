class BinaryTree:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

binaryTree = BinaryTree(1)
node2 = BinaryTree(2)
node3 = BinaryTree(3)

binaryTree.left = node2
binaryTree.right = node3

print("Root: " + str(binaryTree.data))
print("Left: " + str(binaryTree.left.data))
print("Right: " + str(binaryTree.right.data))

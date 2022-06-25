# 3 metodos de varredura 
def preorderTrav(subtree):
    if subtree is not None:
        print(subtree.data)
        preorderTrav(subtree.left)
        preorderTrav(subtree.right)
    
def inorderTrav(subtree):
    
    inorderTrav(subtree.left)
    print(subtree.data)
    inorderTrav(subtree.right)

def postorderTrav(subtree):
    if subtree is not None:
        postorderTrav(subtree.left)
        postorderTrav(subtree.right)

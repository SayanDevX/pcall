#include <stdio.h>
#include <stdlib.h>

typedef struct BST
{
    int key;
    struct BST *left;
    struct BST *right;
} node;

node *createNode(int data)
{
    node *ptr = (node *)malloc(sizeof(node));
    ptr->key = data;
    ptr->left = ptr->right = NULL;
    return ptr;
}

void insert(node **root, int data)
{
    if (*root == NULL)
    {
        *root = createNode(data);
        return;
    }
    else if (data < (*root)->key)
    {
        insert(&(*root)->left, data);
    }
    else if (data > (*root)->key)
    {
        insert(&(*root)->right, data);
    }
}

node *minval(node *root)
{
    node *min = root;
    while (min && min->left != NULL)
    {
        min = min->left;
    }
    return min;
}

node *search(node *root, int data)
{
    if (root == NULL)
    {
        printf("Tree is empty.\n");
    }
    if (root->key == data)
    {
        return root;
    }
    else if (data < root->key)
    {
        return search(root->left, data);
    }
    else if (data > root->key)
    {
        return search(root->right, data);
    }
}

void deleteNode(node **root, int data)
{
    if (*root == NULL)
    {
        printf("Tree is empty.\n");
    }
    if (data < (*root)->key)
    {
        deleteNode(&(*root)->left, data);
    }
    else if (data > (*root)->key)
    {
        deleteNode(&(*root)->right, data);
    }
    else
    {
        if ((*root)->left == NULL && (*root)->right == NULL)
        {
            free(*root);
            *root = NULL;
        }
        else if ((*root)->left == NULL)
        {
            node *ptr = *root;
            *root = (*root)->right;
            free(ptr);
        }
        else if ((*root)->right == NULL)
        {
            node *ptr = *root;
            *root = (*root)->left;
            free(ptr);
        }
        else
        {
            node *ptr = minval((*root)->right);
            (*root)->key = ptr->key;
            deleteNode(&(*root)->right, ptr->key);
        }
    }
}

void inorder(node *root)
{
    if (root != NULL)
    {
        inorder(root->left);
        printf("%d ", root->key);
        inorder(root->right);
    }
}

void preorder(node *root)
{
    if (root != NULL)
    {
        printf("%d ", root->key);
        preorder(root->left);
        preorder(root->right);
    }
}

void postorder(node *root)
{
    if (root != NULL)
    {
        postorder(root->left);
        postorder(root->right);
        printf("%d ", root->key);
    }
}

int main()
{
    node *root = NULL;
    int choice = 0, data;
    while (choice != 7)
    {
        printf("1. Insert Element\n2. Delete Element\n3. Search Element\n4. Inorder Traversal\n5. Preorder Traversal\n6. Postorder Traversal\n7. Exit\nEnter Your Choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("Enter value to insert: ");
            scanf("%d", &data);
            insert(&root, data);
            break;
        case 2:
            printf("Enter value to delete: ");
            scanf("%d", &data);
            deleteNode(&root, data);
            break;
        case 3:
            printf("Enter data to search: ");
            scanf("%d", &data);
            if (search(root, data))
            {
                printf("%d found in BST.\n", data);
            }
            else
            {
                printf("%d not found in BST.\n", data);
            }
            break;
        case 4:
            inorder(root);
            break;
        case 5:
            preorder(root);
            break;
        case 6:
            postorder(root);
            break;
        case 7:
            printf("Exited\n");
            break;
        default:
            printf("Invalid Choice, Try Again.\n");
        }
        if (choice != 7)
            printf("\n");
    }
    return 0;
}
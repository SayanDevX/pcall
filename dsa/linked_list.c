#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int data;
    struct node *next;
} Node;

Node *createNode(int data)
{
    Node *newnode = (Node *)malloc(sizeof(Node));
    newnode->data = data;
    newnode->next = NULL;
    return newnode;
}

void insert_beg(Node **head, int data)
{
    Node *newnode = createNode(data);
    newnode->next = *head;
    *head = newnode;
}

void insert_end(Node **head, int data)
{
    Node *newnode = createNode(data);
    if (*head == NULL)
    {
        *head = newnode;
        return;
    }
    Node *temp = *head;
    while (temp->next != NULL)
    {
        temp = temp->next;
    }
    temp->next = newnode;
}

void insert_pos(Node **head, int pos, int data)
{
    Node *newnode = createNode(data);
    if (pos == 0)
    {
        insert_beg(head, data);
        return;
    }
    Node *temp = *head;
    int count = 0;
    while (temp != NULL && count != pos - 1)
    {
        temp = temp->next;
        count++;
    }
    if (temp == NULL)
    {
        printf("Invalid Position\n");
        return;
    }
    newnode->next = temp->next;
    temp->next = newnode;
}

void delete_beg(Node **head)
{
    if (*head == NULL)
    {
        printf("List is empty, nothing to delete.\n");
        return;
    }
    Node *temp = *head;
    *head = (*head)->next;
    free(temp);
    printf("Deleted node at beginning.\n");
}

void delete_end(Node **head)
{
    if (*head == NULL)
    {
        printf("List is empty, nothing to delete.\n");
    }
    if ((*head)->next == NULL)
    {
        free(*head);
        *head = NULL;
        printf("Deleted last remaining node.\n");
        return;
    }
    Node *temp = *head;
    Node *prev = NULL;
    while (temp->next != NULL)
    {
        prev = temp;
        temp = temp->next;
    }
    prev->next = NULL;
    free(temp);
    printf("Deleted node at the end.\n");
}

void delete_pos(Node **head, int pos)
{
    if (*head == NULL)
    {
        printf("List is empty.\n");
        return;
    }
    if (pos == 0)
    {
        delete_beg(head);
        return;
    }
    Node *curr = *head;
    Node *prev = NULL;
    int count = 0;
    while (curr != NULL && count < pos)
    {
        prev = curr;
        curr = curr->next;
        count++;
    }
    if (curr == NULL)
    {
        printf("Invalid position.\n");
        return;
    }
    prev->next = curr->next;
    free(curr);
    printf("Deleted node at position %d\n", pos);
}

void display(Node *head)
{
    if (head == NULL)
    {
        printf("List is empty.\n");
        return;
    }
    Node *temp = head;
    printf("List: ");
    while (temp != NULL)
    {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int check(Node **head, int var)
{
    Node *temp = *head;
    if (*head == NULL)
    {
        printf("List is empty.\n");
        return 0;
    }
    while (temp != NULL)
    {
        if (temp->data == var)
            return 1;
        temp = temp->next;
    }
    return 0;
}

int main()
{
    Node *head = NULL;
    int choice = 0, data, pos;
    while (choice != 9)
    {
        printf("1. Insert at Beginning\n2. Insert at End\n3. Insert at Position\n4. Delete at Beginning\n5. Delete at End\n6. Delete at Position\n7. Display List\n8. Check Element\n9. Exit\nEnter Your Choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("Enter data to insert: ");
            scanf("%d", &data);
            insert_beg(&head, data);
            break;
        case 2:
            printf("Enter data to insert at end: ");
            scanf("%d", &data);
            insert_end(&head, data);
            break;
        case 3:
            printf("Enter position to insert at: ");
            scanf("%d", &pos);
            printf("Enter data to insert: ");
            scanf("%d", &data);
            insert_pos(&head, pos, data);
        case 4:
            delete_beg(&head);
            break;
        case 5:
            delete_end(&head);
            break;
        case 6:
            printf("Enter position to delete at: ");
            scanf("%d", &pos);
            delete_pos(&head, pos);
            break;
        case 7:
            display(head);
            break;
        case 8:
            if (head == NULL)
            {
                printf("List is empty.\n");
            }
            else
            {
                printf("Enter number to check: ");
                scanf("%d", &data);
                if (check(&head, data))
                    printf("%d is present in the list.\n");
                else
                    printf("%d is not present in the list.\n");
            }
            break;
        case 9:
            printf("Exited\n");
            break;
        default:
            printf("Invalid choice, try again\n");
        }
    }
    return 0;
}
#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int data;
    struct node *next;
    struct node *prev;
} node;

typedef struct doubly_ll
{
    node *head;
    node *tail;
} doubly_ll;

node *head = NULL;
node *tail = NULL;

node *createNode(int data)
{
    node *newnode = (node *)malloc(sizeof(node));
    if (!newnode)
    {
        printf("Memory Allocation Failed.\n");
        return NULL;
    }
    newnode->data = data;
    newnode->next = newnode->prev = NULL;
    return newnode;
}

void push_front(int data)
{
    node *newnode = createNode(data);
    if (newnode == NULL)
    {
        printf("List is empty.\n");
        return;
    }
    if (head == NULL)
    {
        head = tail = newnode;
    }
    else
    {
        newnode->next = head;
        head->prev = newnode;
        head = newnode;
    }
}

void push_back(int data)
{
    node *newnode = createNode(data);
    if (newnode == NULL)
    {
        printf("List is empty.\n");
        return;
    }
    if (tail == NULL)
    {
        head = tail = newnode;
    }
    else
    {
        newnode->prev = tail;
        tail->next = newnode;
        tail = newnode;
    }
}

void pop_front()
{
    if (head == NULL)
    {
        printf("List is empty. Cannot pop from front.\n");
        return;
    }
    node *temp = head;
    head = head->next;
    if (head != NULL)
    {
        head->prev = NULL;
    }
    else
    {
        tail = NULL;
    }
    free(temp);
    printf("Item deleted from the head.\n");
}

void pop_back()
{
    if (tail == NULL)
    {
        printf("List is empty. Cannot pop from back.\n");
        return;
    }
    node *temp = tail;
    tail = tail->prev;
    if (tail != NULL)
    {
        tail->next = NULL;
    }
    else
    {
        head = NULL;
    }
    free(temp);
    printf("Item delted from the tail.\n");
}

void print_list()
{
    if (head == NULL)
    {
        printf("List is empty.\n");
        return;
    }
    node *temp = head;
    while (temp != NULL)
    {
        printf("%d <-> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int check(int data)
{
    node *temp = head;
    while (temp != NULL)
    {
        if (temp->data == data)
        {
            return 1;
        }
        temp = temp->next;
    }
    return 0;
}

int main()
{
    int choice = 0, data;
    while (choice != 7)
    {
        printf("1. Insert at head\n2. Insert at tail\n3. Delete from head\n4. Delete from tail\n5. Display list\n6. Check item\n7. Exit\nEnter Your Choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("Enter value to insert at head: ");
            scanf("%d", &data);
            push_front(data);
            break;
        case 2:
            printf("Enter value to insert at tail: ");
            scanf("%d", &data);
            push_back(data);
            break;
        case 3:
            pop_front();
            break;
        case 4:
            pop_back();
            break;
        case 5:
            print_list();
            break;
        case 6:
            if (head == NULL)
            {
                printf("List is empty.\n");
            }
            else
            {
                printf("Enter element to check: ");
                scanf("%d", &data);
                if (check(data))
                    printf("%d is present in the list.\n", data);
                else
                    printf("%d is not present in the list.\n", data);
            }
            break;
        case 7:
            printf("Exited.\n");
            break;
        default:
            printf("Invalid Choice, Try Again.\n");
            break;
        }
        if (choice != 7)
            printf("\n");
    }
}

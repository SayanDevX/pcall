#include <stdio.h>
#define MAX 10

typedef struct stack
{
    int a[MAX];
    int top;
} stack;

void createstack(stack *s)
{
    s->top = -1;
}

int isFull(stack *s)
{
    return s->top == MAX - 1;
}

int isEmpty(stack *s)
{
    return s->top == -1;
}

int push(stack *s, int item)
{
    if (isFull(s))
    {
        printf("Stack Overflow.\n");
        return 1;
    }
    s->a[++(s->top)] = item;
}

int pop(stack *s)
{
    if (isEmpty(s))
    {
        printf("Stack Underflow.\n");
        return 1;
    }
    return s->a[(s->top)--];
}

int peek(stack *s)
{
    if (isEmpty(s))
    {
        printf("Stack Underflow.\n");
        return 1;
    }
    return s->a[(s->top)];
}

int display(stack *s)
{
    if (isEmpty(s))
    {
        printf("Stack Underflow.\n");
        return 1;
    }
    for (int i = 0; i <= s->top; i++)
    {
        printf("%d <- ", s->a[i]);
    }
    printf("NULL\n");
    return 1;
}

int main()
{
    stack s;
    createstack(&s);
    int choice, item;
    while (choice != 5)
    {
        printf("\n1.Push Element\n2.Pop Element\n3.Peek Top Element\n4.Display Stack\n5.Exit\nEnter Your Choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("Enter the element to be pushed: ");
            scanf("%d", &item);
            push(&s, item);
            break;
        case 2:
            printf("Popped Element is: %d\n", pop(&s));
            break;
        case 3:
            printf("Top Element is: %d\n", peek(&s));
            break;
        case 4:
            display(&s);
            break;
        case 5:
            printf("Exited.\n");
            break;
        default:
            printf("Invalid Choice.\n");
        }
    }
    return 0;
}
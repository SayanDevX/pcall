#include <stdio.h>
#include <stdlib.h>

#define MAX 5

typedef struct queue
{
    int a[MAX];
    int rear;
    int front;
} queue;

void createqueue(queue *q)
{
    q->front = -1;
    q->rear = -1;
}

int isFull(queue *q)
{
    return (q->rear == MAX - 1);
}

int isEmpty(queue *q)
{
    return (q->front == -1);
}

int enqueue(queue *q, int item)
{
    if (isFull(q))
    {
        printf("Queue Overflow.\n");
        return 1;
    }
    if (isEmpty(q))
    {
        q->front = q->rear = 0;
    }
    else
        q->rear++;
    return (q->a[q->rear] = item);
}

int dequeue(queue *q)
{
    if (isEmpty(q))
    {
        printf("Queue Underflow.\n");
        return -1;
    }
    int val = q->a[(q->front)];
    if (q->front == q->rear)
        q->front = q->rear = -1;
    else
        q->front++;
    return val;
}

void peek(queue *q)
{
    if (isEmpty(q))
    {
        printf("Queue Underflow.\n");
        return;
    }
    printf("Front Element is: %d\n", q->a[q->front]);
}

void display(queue *q)
{
    if (isEmpty(q))
    {
        printf("Queue Underflow.\n");
        return;
    }
    for (int i = q->front; i <= q->rear; i++)
        printf("%d <- ", q->a[i]);
    printf("NULL\n");
}

int main()
{
    queue q;
    createqueue(&q);
    int choice = 0, item, check;
    while (choice != 5)
    {
        printf("\n1.Enqueue\n2.Dequeue\n3.Peek Front Element\n4.Display\n5.Exit\nEnter Your Choice: ");
        scanf("%d", &choice);
        switch (choice)
        {
        case 1:
            printf("Enter The Number To Enque: ");
            scanf("%d", &item);
            enqueue(&q, item);
            break;
        case 2:
            check = dequeue(&q);
            if (check != -1)
                printf("Dequeued Item is: %d\n", check);
            break;
        case 3:
            peek(&q);
            break;
        case 4:
            display(&q);
            break;
        case 5:
            printf("Exited\n");
            break;
        default:
            printf("Invalid Choice.\n");
            break;
        }
    }
    return 0;
}
#include <stdio.h>
#define MAX 5

typedef struct queue
{
    int a[MAX];
    int rear;
    int front;
} queue;

void createqueue(queue *q)
{
    q->front = q->rear = -1;
}

int isFull(queue *q)
{
    return ((q->front == 0 && q->rear == MAX - 1) || (q->front == q->rear + 1));
}

int isEmpty(queue *q)
{
    return ()
}
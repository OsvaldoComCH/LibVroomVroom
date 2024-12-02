#ifndef QUICKERSORT_H
#define QUICKERSORT_H

void QuickerSort(int * A, int Size)
{
    int Pivot;
    int * x = A;
    int * y = A + 1;
    
    if(Size <= 65)
    {
        for(; y < &A[Size]; x = y, ++y)
        {
            Pivot = *y;
            while(x >= A && *x > Pivot)
            {
                *(x + 1) = *x;
                --x;
            }
            *(x + 1) = Pivot;
        }
        return;
    }
    
    if(y < &A[Size])
    {
        Pivot = *x;
        do
        {
            if(*y < Pivot)
            {
                ++x;
                int Temp = *x;
                *x = *y;
                *y = Temp;
            }
            ++y;
        }while(y < &A[Size]);
        *A = *x;
        *x = Pivot;
    }
    QuickerSort(A, (x - A));
    QuickerSort(x + 1, (&A[Size] - x - 1));
}

#endif

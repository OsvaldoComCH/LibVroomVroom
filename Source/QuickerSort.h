#ifndef QUICKERSORT_H
#define QUICKERSORT_H

void QuickerSort(int * A, int Start, int End)
{
    int Pivot;
    int x = Start;
    int y = Start + 1;
    
    if(End - Start <= 65)
    {
        for(; y < End; x = y, ++y)
        {
            Pivot = A[y];
            while(x >= 0 && A[x] > Pivot)
            {
                A[x+1] = A[x];
                --x;
            }
            A[x+1] = Pivot;
        }
        return;
    }
    
    Pivot = A[x];
    for(; y <= End; ++y)
    {
        if(A[y]<Pivot)
        {
            ++x;
            int Temp = A[x];
            A[x] = A[y];
            A[y] = Temp;
        }
    }
    A[Start] = A[x];
    A[x] = Pivot;
    QuickerSort(A, Start, x - 1);
    QuickerSort(A, x + 1, End);
}

#endif

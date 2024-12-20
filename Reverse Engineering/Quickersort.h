#ifndef QUICKERSORT_H
#define QUICKERSORT_H

void QuickerSort(int * A, int Size)
{
    int * ecx = A;
    int * eax = (int *)((long long)Size);
    int * esi = &ecx[1];
    int * edi;
    int * ebx;

    if((long long)eax <= 65)
    {

    }
    do
    {
        ebx = &ecx[(long long)eax];
        edi = ecx;
        eax = 0;

        if(esi < ebx)
        {

        }

        ebx = (int *) (ebx - edi);
        esi = edi + 2;
        ebx = (int *) ((long long)ebx >> 2);
        QuickerSort(ecx, (long long)eax);

        eax = (int *)((long long) ebx - 1);
        ecx = edi + 1;
    }while((long long)eax > 65);

    edi = &ecx[(long long)eax];
    eax = ecx;
    if(esi >= edi)
    {
        return;
    }
    ebx = (int *)((long long)*(esi));
}

#endif
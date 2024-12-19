#ifndef QUICKERSORT_H
#define QUICKERSORT_H

void QuickerSort(int * A, int Size)
{
    int * ecx = A;
    int * eax = (int *) Size;
    int * esi = &ecx[1]; //y

    if((int)eax <= 65)
    {

    }
    do
    {
        int * ebx = &ecx[(int)eax];
        int * edi = ecx;
        eax = 0;

        if(esi < ebx)
        {

        }

        ebx = (int *) (ebx - edi);
        esi = edi + 2;
        ebx = (int *) ((long long)ebx >> 2);
        QuickerSort(ecx, (int)eax);

        eax = (int *)((long long) ebx - 1);
        ecx = edi + 1;
    }while((int)eax > 65);
}

#endif
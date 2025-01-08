#ifndef QUICKERSORT_H
#define QUICKERSORT_H

void QuickerSort(int * A, int Size)
{
    int * ecx = A;
    int * eax = (int *)((long long)Size);
    int * esi = &ecx[1];
    int * edi;
    int * ebx;
    int * edx;
    int * ebp;

    //L2
    while((long long)eax > 65)
    {
        ebx = &ecx[(long long)eax];
        edi = ecx;
        eax = 0;

        if(esi < ebx)
        {
            //L21
            edx = (int *)((long long)*ecx);
            //L10
            do
            {
                eax = (int *)((long long)*(esi));
                if(eax < edx)
                {
                    ebp = (int *)(edi + 1);
                    *(edi + 1) = (long long)eax;
                    edi = (int *)((long long)edi + 4);
                    *esi = (long long)ebp;
                }
                //L9
                esi = (int *)((long long)esi + 4);
            }while(esi < ebx);
            eax = (int *)*edi;
            *ecx = (long long)eax;
            eax = edi;
            eax = (int *)(eax - ecx);
            *edi = (long long)edx;
            eax = (int *)((long long)eax >> 2);
        }
        //L8
        ebx = (int *)(ebx - edi);
        esi = (int *)((long long)edi + 8);
        ebx = (int *)((long long)ebx >> 2);
        QuickerSort(ecx, (long long)eax);

        eax = (int *)((long long)ebx - 1);
        ecx = (int *)((long long)edi + 4);
    }

    //L11
    edi = &ecx[(long long)eax];
    eax = ecx;
    if(esi >= edi)
    {
        return;
    }
    ebx = (int *)((long long)*(esi));
}

#endif
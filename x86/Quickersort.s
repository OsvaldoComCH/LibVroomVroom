_Z11QuickerSortPii:
    pushl   %ebp
    pushl   %edi
    pushl   %esi
    pushl   %ebx
    subl    $12, %esp
    movl    32(%esp), %ebx  ## %ebx = A
    movl    36(%esp), %eax  ## %eax = Size
    leal    4(%ebx), %ecx   ## %ecx = &A[1]
    cmpl    $65, %eax   ## if(Size <= 65)
    jle     .L11
.L2:
    leal    (%ebx,%eax,4), %edi ## %edi = &A[Size]
    movl    (%ebx), %edx    ## %edx = A[0]
    cmpl    %edi, %ecx  ## if(%ecx < &A[Size])
    jnb     .L14
    movl    %ebx, %esi
    
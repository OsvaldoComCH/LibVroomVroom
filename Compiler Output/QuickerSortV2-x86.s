_Z13QuickerSortV2Pii:
    pushl   %ebp
    pushl   %edi
    pushl   %esi
    pushl   %ebx
    subl    $12, %esp
    movl    32(%esp), %ecx
    movl    36(%esp), %eax
    leal    4(%ecx), %esi
    cmpl    $65, %eax
    jle     .L11
.L2:
    leal    (%ecx,%eax,4), %ebx
    movl    %ecx, %edi
    xorl    %eax, %eax
    cmpl    %ebx, %esi
    jb      .L21
.L8:
    subl    $8, %esp
    subl    %edi, %ebx
    leal    8(%edi), %esi
    pushl   %eax
    sarl    $2, %ebx
    pushl   %ecx
    call    _Z13QuickerSortV2Pii
    leal    -1(%ebx), %eax
    leal    4(%edi), %ecx
    addl    $16, %esp
    cmpl    $65, %eax
    jg      .L2
.L11:
    leal    (%ecx,%eax,4), %edi
    movl    %ecx, %eax
    cmpl    %edi, %esi
    jnb     .L1
.L3:
    movl    (%esi), %ebx
    cmpl    %ecx, %eax
    jnb     .L4
    jmp     .L5
.L6:
    movl    %edx, 4(%eax)
    subl    $4, %eax
    cmpl    %ecx, %eax
    jb      .L5
.L4:
    movl    (%eax), %edx
    cmpl    %ebx, %edx
    jg      .L6
.L5:
    leal    4(%esi), %edx
    movl    %ebx, 4(%eax)
    movl    %esi, %eax
    cmpl    %edi, %edx
    jnb     .L1
    movl    %edx, %esi
    jmp     .L3
.L1:
    addl    $12, %esp
    popl    %ebx
    popl    %esi
    popl    %edi
    popl    %ebp
    ret
.L21:
    movl    (%ecx), %edx
.L10:
    movl    (%esi), %eax
    cmpl    %edx, %eax
    jge     .L9
    movl    4(%edi), %ebp
    movl    %eax, 4(%edi)
    addl    $4, %edi
    movl    %ebp, (%esi)
.L9:
    addl    $4, %esi
    cmpl    %ebx, %esi
    jb      .L10
    movl    (%edi), %eax
    movl    %eax, (%ecx)
    movl    %edi, %eax
    subl    %ecx, %eax
    movl    %edx, (%edi)
    sarl    $2, %eax
    jmp     .L8
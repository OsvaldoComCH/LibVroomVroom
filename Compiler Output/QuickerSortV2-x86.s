_Z13QuickerSortV2Pii:
    pushl   %ebp
    pushl   %edi
    pushl   %esi
    pushl   %ebx
    subl    $12, %esp
    movl    32(%esp), %ebx
    movl    36(%esp), %eax
    leal    4(%ebx), %ecx
    cmpl    $65, %eax
    jle     .L11
.L2:
    leal    (%ebx,%eax,4), %edi
    movl    (%ebx), %edx
    cmpl    %edi, %ecx
    jnb     .L14
    movl    %ebx, %esi
.L10:
    movl    (%ecx), %eax
    cmpl    %edx, %eax
    jge     .L9
    movl    4(%esi), %ebp
    movl    %eax, 4(%esi)
    addl    $4, %esi
    movl    %ebp, (%ecx)
.L9:
    addl    $4, %ecx
    cmpl    %edi, %ecx
    jb      .L10
    movl    %esi, %eax
    movl    (%esi), %ecx
    subl    %ebx, %eax
    sarl    $2, %eax
.L8:
    subl    $8, %esp
    movl    %ecx, (%ebx)
    subl    %esi, %edi
    movl    %edx, (%esi)
    sarl    $2, %edi
    pushl   %eax
    pushl   %ebx
    leal    4(%esi), %ebx
    call    _Z13QuickerSortV2Pii
    leal    -1(%edi), %eax
    leal    8(%esi), %ecx
    addl    $16, %esp
    cmpl    $65, %eax
    jg      .L2
.L11:
    leal    (%ebx,%eax,4), %edi
    movl    %ebx, %eax
    cmpl    %edi, %ecx
    jnb     .L1
.L3:
    movl    (%ecx), %esi
    cmpl    %ebx, %eax
    jnb     .L4
    jmp     .L5
.L6:
    movl    %edx, 4(%eax)
    subl    $4, %eax
    cmpl    %ebx, %eax
    jb      .L5
.L4:
    movl    (%eax), %edx
    cmpl    %esi, %edx
    jg      .L6
.L5:
    leal    4(%ecx), %edx
    movl    %esi, 4(%eax)
    movl    %ecx, %eax
    cmpl    %edi, %edx
    jnb     .L1
    movl    %edx, %ecx
    jmp     .L3
.L1:
    addl    $12, %esp
    popl    %ebx
    popl    %esi
    popl    %edi
    popl    %ebp
    ret
.L14:
    movl    %edx, %ecx
    movl    %ebx, %esi
    xorl    %eax, %eax
    jmp     .L8
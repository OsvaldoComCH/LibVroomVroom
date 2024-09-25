_Z11QuickerSortPiii:
    pushl   %ebp
    pushl   %edi
    pushl   %esi
    pushl   %ebx
    subl    $28, %esp
    movl    52(%esp), %edi
    movl    48(%esp), %ebp
    movl    56(%esp), %eax
    movl    56(%esp), %esi
    leal    1(%edi), %ebx
    leal    4(%ebp,%esi,4), %esi
    subl    %edi, %eax
    movl    %esi, 8(%esp)
    cmpl    $65, %eax
    jle     .L11
.L12:
    leal    0(%ebp,%edi,4), %ecx
    movl    (%ecx), %esi
    cmpl    %ebx, 56(%esp)
    jl      .L15
    movl    %ecx, 12(%esp)
    leal    0(%ebp,%ebx,4), %eax
    movl    %edi, %ebx
    movl    %edi, 52(%esp)
.L10:
    movl    (%eax), %edx
    cmpl    %esi, %edx
    jge     .L9
    addl    $1, %ebx
    leal    0(%ebp,%ebx,4), %ecx
    movl    (%ecx), %edi
    movl    %edx, (%ecx)
    movl    %edi, (%eax)
.L9:
    addl    $4, %eax
    cmpl    %eax, 8(%esp)
    jne     .L10
    leal    0(%ebp,%ebx,4), %eax
    movl    12(%esp), %ecx
    movl    52(%esp), %edi
    movl    (%eax), %edx
.L8:
    subl    $4, %esp
    movl    %edx, (%ecx)
    movl    %esi, (%eax)
    leal    -1(%ebx), %eax
    pushl   %eax
    pushl   %edi
    leal    1(%ebx), %edi
    addl    $2, %ebx
    pushl   %ebp
    call    _Z11QuickerSortPiii
    movl    72(%esp), %eax
    addl    $16, %esp
    subl    %edi, %eax
    cmpl    $65, %eax
    jg      .L12
.L11:
    movl    56(%esp), %esi
    cmpl    %ebx, 56(%esp)
    jle     .L1
.L3:
    movl    0(%ebp,%ebx,4), %ecx
    movl    %edi, %eax
    testl   %edi, %edi
    jns     .L4
    jmp     .L5
.L6:
    movl    %edx, 4(%ebp,%edi,4)
    leal    -1(%eax), %edi
    testl   %eax, %eax
    je      .L13
.L4:
    movl    0(%ebp,%edi,4), %edx
    movl    %edi, %eax
    cmpl    %ecx, %edx
    jg      .L6
.L5:
    movl    %ecx, 4(%ebp,%eax,4)
    leal    1(%ebx), %eax
    movl    %ebx, %edi
    cmpl    %eax, %esi
    je      .L1
.L14:
    movl    %eax, %ebx
    jmp     .L3
.L13:
    movl    $-1, %eax
    movl    %ebx, %edi
    movl    %ecx, 4(%ebp,%eax,4)
    leal    1(%ebx), %eax
    cmpl    %eax, %esi
    jne     .L14
.L1:
    addl    $28, %esp
    popl    %ebx
    popl    %esi
    popl    %edi
    popl    %ebp
    ret
.L15:
    movl    %esi, %edx
    movl    %ecx, %eax
    movl    %edi, %ebx
    jmp     .L8
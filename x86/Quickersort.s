_Z11QuickerSortPii:
    pushl   %ebp
    pushl   %edi
    pushl   %esi
    pushl   %ebx
    subl    $12, %esp
    movl    32(%esp), %ecx  ## %ecx = A
    movl    36(%esp), %eax  ## %eax = Size
    leal    4(%ecx), %esi   ## %esi = &A[1] (y)
    cmpl    $65, %eax   ## if(%eax <= 65)
    jle     .L11
.L2:
    leal    (%ecx,%eax,4), %ebx ## %ebx = &A[Size]
    movl    %ecx, %edi  ## %edi = %ecx (x)
    xorl    %eax, %eax  ## %eax = 0
    cmpl    %ebx, %esi  ## if(%esi < %ebx)
    jb      .L21
.L8:
    subl    $8, %esp
    subl    %edi, %ebx  ## %ebx -= %edi (&A[Size] - x)
    leal    8(%edi), %esi   ## %esi = %edi + 8
    pushl   %eax    ## push %eax
    sarl    $2, %ebx    ## %ebx >>= 2
    pushl   %ecx    ## push %ecx
    call    _Z11QuickerSortPii
    leal    -1(%ebx), %eax  ## %eax = %ebx - 1
    leal    4(%edi), %ecx   ## %ecx = x + 1
    addl    $16, %esp
    cmpl    $65, %eax   ## if(%eax > 65)
    jg      .L2
.L11:
    leal    (%ecx,%eax,4), %edi ## %edi = &A[%eax]
    movl    %ecx, %eax  ## %eax = A
    cmpl    %edi, %esi  ## if(%esi >= %edi)
    jnb     .L1
.L3:
    movl    (%esi), %ebx    ## %ebx = *%esi
    cmpl    %ecx, %eax  ## if(%eax >= %ecx)
    jnb     .L4
    jmp     .L5
.L6:
    movl    %edx, 4(%eax)   ## *(%eax + 4) = %edx
    subl    $4, %eax    ## %eax -= 4
    cmpl    %ecx, %eax  ## if(%eax < %ecx)
    jb      .L5
.L4:
    movl    (%eax), %edx    ## %edx = *%eax
    cmpl    %ebx, %edx  ## if(%edx > %ebx)
    jg      .L6
.L5:
    leal    4(%esi), %edx   ## %edx = %esi + 4
    movl    %ebx, 4(%eax)   ## *(%eax + 4) = %ebx
    movl    %esi, %eax  ## %eax = %esi
    cmpl    %edi, %edx  ## if(%edx > %edi)
    jnb     .L1
    movl    %edx, %esi  ## %esi = %edx
    jmp     .L3
.L1:
    addl    $12, %esp
    popl    %ebx
    popl    %esi
    popl    %edi
    popl    %ebp
    ret
.L21:
    movl    (%ecx), %edx    ## %edx = *%ecx
.L10:
    movl    (%esi), %eax    ## %eax = *%esi
    cmpl    %edx, %eax  ## if(%eax >= %edx)
    jge     .L9
    movl    4(%edi), %ebp   ## %ebp = *(%edi + 4)
    movl    %eax, 4(%edi)   ## *(%edi + 4) = %eax
    addl    $4, %edi    ## %edi += 4
    movl    %ebp, (%esi)    ## *%esi = %ebp
.L9:
    addl    $4, %esi    ## %esi += 4
    cmpl    %ebx, %esi  ## if(%esi < %ebx)
    jb      .L10
    movl    (%edi), %eax    ## %eax = *%edi
    movl    %eax, (%ecx)    ## *%ecx = %eax
    movl    %edi, %eax  ## %eax = %edi
    subl    %ecx, %eax  ## %eax -= %eax
    movl    %edx, (%edi)    ## *%edi = %edx
    sarl    $2, %eax    ## %eax >>= 2
    jmp     .L8

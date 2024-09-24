_QuickerSort:
    pushl   %ebp
    pushl   %edi
    pushl   %esi
    pushl   %ebx        ## Saving registers
    subl    $44, %esp   ## Reserving 44 bytes on the stack
    movl    68(%esp), %edi  ## %edi = Start
    movl    64(%esp), %ebp  ## %ebp = A
    movl    72(%esp), %eax  ## %eax = End
    movl    72(%esp), %esi  ## %esi = End
    leal    1(%edi), %ebx   ## %ebx = %edi + 1
    leal    4(%ebp,%esi,4), %esi    ## %esi = %ebp[%esi + 1]
    subl    %edi, %eax  ## %eax -= %edi
    movl    %esi, 24(%esp)  ## 24(%esp) = %esi
    cmpl    $65, %eax   ## if(%eax <= 65)
    jle     L11
L12:
    leal    0(%ebp,%edi,4), %ecx    ## %ecx = &%ebp[%edi]
    movl    (%ecx), %esi    ## %esi = *%ecx
    cmpl    %ebx, 72(%esp)  ## if(End < %ebx)
    jl      L15
    movl    %ecx, 28(%esp)  ## 28(%esp) = %ecx
    leal    0(%ebp,%ebx,4), %eax    ## %eax = &%ebp[%ebx]
    movl    %edi, %ebx  ## %ebx = %edi
    movl    %edi, 68(%esp)  ## Start = %edi
L10:
    movl    (%eax), %edx    ## %edx = *%eax
    cmpl    %esi, %edx  ## if(%edx >= %esi)
    jge     L9
    addl    $1, %ebx    ## ++%ebx
    leal    0(%ebp,%ebx,4), %ecx    ## %ecx = &%ebp[%ebx]
    movl    (%ecx), %edi    ## %edi = *%ecx
    movl    %edx, (%ecx)    ## *%ecx = %edx
    movl    %edi, (%eax)    ## *%eax = %edi
L9:
    addl    $4, %eax    ## %eax += 4
    cmpl    %eax, 24(%esp)  ## if(24(%esp) != %eax)
    jne     L10
    leal    0(%ebp,%ebx,4), %eax    ## %eax = &%ebp[%ebx]
    movl    28(%esp), %ecx  ## %ecx = 28(%esp)
    movl    68(%esp), %edi  ## %edi = Start
    movl    (%eax), %edx    ## %edx = *%eax
L8:
    movl    %edx, (%ecx)    ## *%ecx = %edx
    movl    %esi, (%eax)    ## *%eax = %esi
    leal    -1(%ebx), %eax  ## %eax = %ebx - 1
    movl    %eax, 8(%esp)   ## 8(%esp) = %eax
    movl    %edi, 4(%esp)   ## 4(%esp) = %edi
    leal    1(%ebx), %edi   ## %edi = %ebx + 1
    addl    $2, %ebx    ## %ebx += 2
    movl    %ebp, (%esp)    ## (%esp) = %ebp
    call    _QuickerSort
    movl    72(%esp), %eax  ## %eax = End
    subl    %edi, %eax      ## %eax -= %edi
    cmpl    $65, %eax   ## if(%eax > 65)
    jg      L12
L11:
    movl    72(%esp), %esi  ## %esi = End
    cmpl    %ebx, 72(%esp)  ## if(End <= %ebx)
    jle     L1
L3:
    movl    0(%ebp,%ebx,4), %ecx    ## %ecx = %ebp[%ebx]
    movl    %edi, %eax  ## %eax = %edi
    testl   %edi, %edi  ## if(%edi >= 0)
    jns     L4
    jmp     L5
L6:
    movl    %edx, 4(%ebp,%edi,4)    ## %ebp[%edi + 1] = %edx
    leal    -1(%eax), %edi  ## %edi = %eax - 1
    testl   %eax, %eax  ## if(%eax == 0)
    je      L13
L4:
    movl    0(%ebp,%edi,4), %edx    ## %edx = %ebp[%edi]
    movl    %edi, %eax  ## %eax = %edi
    cmpl    %ecx, %edx  ## if(%edx > %ecx)
    jg      L6
L5:
    movl    %ecx, 4(%ebp,%eax,4)    ## %ebp[%eax + 1] = %ecx
    leal    1(%ebx), %eax   ## %eax = %ebx + 1
    movl    %ebx, %edi  ## %edi = %ebx
    cmpl    %eax, %esi  ## if(%esi == %eax)
    je      L1
L14:
    movl    %eax, %ebx  ## %ebx = %eax
    jmp     L3
L13:
    movl    $-1, %eax   ## %eax = -1
    movl    %ebx, %edi  ## %edi = %ebx
    movl    %ecx, 4(%ebp,%eax,4)    ## %ebp[%eax + 1] = %ecx
    leal    1(%ebx), %eax   ## %eax = %ebx + 1
    cmpl    %eax, %esi  ## if(%esi != %eax)
    jne     L14
L1:
    addl    $44, %esp   ## Clear Stack
    popl    %ebx
    popl    %esi
    popl    %edi
    popl    %ebp    ## Restore Registers
    ret
L15:
    movl    %esi, %edx
    movl    %ecx, %eax
    movl    %edi, %ebx
    jmp     L8

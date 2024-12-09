_Z11QuickerSortPii:
    leaq    4(%rdi), %r8
    cmpl    $65, %esi
    jle     .L32
    pushq   %rbp
    pushq   %rbx
    subq    $8, %rsp
.L2:
    movslq  %esi, %rsi
    movq    %rdi, %rbp
    leaq    (%rdi,%rsi,4), %rbx
    xorl    %esi, %esi
    cmpq    %rbx, %r8
    jb      .L33
.L8:
    call    _Z11QuickerSortPii
    subq    %rbp, %rbx
    leaq    4(%rbp), %rdi
    leaq    8(%rbp), %r8
    sarq    $2, %rbx
    leal    -1(%rbx), %esi
    cmpl    $65, %esi
    jg      .L2
    movslq  %esi, %rsi
    movq    %rdi, %rax
    leaq    (%rdi,%rsi,4), %rsi
    cmpq    %rsi, %r8
    jnb     .L1
.L3:
    movl    (%r8), %ecx
    cmpq    %rdi, %rax
    jnb     .L4
    jmp     .L5
.L6:
    movl    %edx, 4(%rax)
    subq    $4, %rax
    cmpq    %rdi, %rax
    jb      .L5
.L4:
    movl    (%rax), %edx
    cmpl    %ecx, %edx
    jg      .L6
.L5:
    leaq    4(%r8), %rdx
    movl    %ecx, 4(%rax)
    movq    %r8, %rax
    cmpq    %rsi, %rdx
    jnb     .L1
    movq    %rdx, %r8
    jmp     .L3
.L33:
    movl    (%rdi), %edx
.L10:
    movl    (%r8), %eax
    cmpl    %edx, %eax
    jge     .L9
    movl    4(%rbp), %ecx
    movl    %eax, 4(%rbp)
    addq    $4, %rbp
    movl    %ecx, (%r8)
.L9:
    addq    $4, %r8
    cmpq    %rbx, %r8
    jb      .L10
    movl    0(%rbp), %eax
    movq    %rbp, %rsi
    subq    %rdi, %rsi
    movl    %eax, (%rdi)
    sarq    $2, %rsi
    movl    %edx, 0(%rbp)
    jmp     .L8
.L1:
    addq    $8, %rsp
    popq    %rbx
    popq    %rbp
    ret
.L32:
    movslq  %esi, %rsi
    movq    %rdi, %rax
    leaq    (%rdi,%rsi,4), %rsi
    cmpq    %rsi, %r8
    jnb     .L34
.L21:
    movl    (%r8), %ecx
    cmpq    %rdi, %rax
    jnb     .L24
    jmp     .L26
.L27:
    movl    %edx, 4(%rax)
    subq    $4, %rax
    cmpq    %rdi, %rax
    jb      .L26
.L24:
    movl    (%rax), %edx
    cmpl    %ecx, %edx
    jg      .L27
.L26:
    leaq    4(%r8), %rdx
    movl    %ecx, 4(%rax)
    movq    %r8, %rax
    cmpq    %rsi, %rdx
    jnb     .L35
    movq    %rdx, %r8
    jmp     .L21
.L35:
    ret
.L34:
    ret

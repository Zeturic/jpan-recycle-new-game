// change these constants as needed

rom equ "firered.gba"
.definelabel free_space, 0x08800000

.definelabel jpan_block, 0x0203C000

// -----------------------------------------------------------------------------

JPAN_BLOCK_SIZE equ 0xEC4

.definelabel memset, 0x081E5ED8
.definelabel sub_815EE0C, 0x0815EE0C
.definelabel new_game_hook, 0x08054B3E

// -----------------------------------------------------------------------------

.gba
.thumb

.open rom, 0x08000000

// -----------------------------------------------------------------------------

.org free_space

.area 48
    .align 2
    
    new_game_extension:
    
    @@main:
        ldr r0, =jpan_block
        mov r1, #0
        ldr r2, =JPAN_BLOCK_SIZE
        ldr r3, =memset |1
        bl @@call

        ldr r3, =sub_815EE0C |1
        bl @@call

        add sp, sp, #8
        pop {r3}
        mov r8, r3
        pop {r4-r6}
        pop {r3}
    
    @@call:
        bx r3

    .pool
.endarea

// -----------------------------------------------------------------------------

.org new_game_hook

.area 0x12, 0xFF
    ldr r0, =new_game_extension |1
    bx r0
    .pool
.endarea

// -----------------------------------------------------------------------------

.close

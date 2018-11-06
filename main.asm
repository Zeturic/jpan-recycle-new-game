.gba
.arm
.include "constants.s"

.thumb
.include "functions.s"

.open "test.gba", 0x08000000

// -----------------------------------------------------------------------------

.org allocation

.area allocation_size
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
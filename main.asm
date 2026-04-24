INCLUDE "include/hardware.inc"

SECTION "Header", ROM0[$100]
    jp MainLoop
    ds $150 - @, 0

MainLoop:
    ldh A, [rLY]
    cp 144
    jp nz, MainLoop
    xor A
    ld [$FF40], A

    ld A, %11100100
    ld [$FF47], A

    ld HL, $8000
    ld BC, .TileData
    ld D, 16

.copyLoop
    ld a, [BC]
    inc BC
    ld [hli], a
    dec D
    jp nz, .copyLoop

    ld A, %10010001
    ld [$FF40], A

.infloop
    jp .infloop

.TileData
    dw 0xFFFF
    dw 0x0FFF
    dw 0x00FF
    dw 0x000F
    dw 0x0000
    dw 0xF000
    dw 0xFF00
    dw 0xFFF0

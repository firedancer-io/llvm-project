# RUN: llvm-mc %s -triple=sbf-solana-solana --mcpu=sbfv2 --show-encoding \
# RUN:     | FileCheck %s --check-prefix=CHECK-ASM-NEW
# RUN: llvm-mc %s -triple=sbf-solana-solana --mcpu=sbfv2 -filetype=obj \
# RUN:     | llvm-objdump -d -r --mattr=+alu32 - \
# RUN:     | FileCheck --check-prefix=CHECK-OBJ-NEW %s


# TODO: Test immediate field ranges and some hex immediates.

# CHECK-OBJ-NEW: add64 r0, r9
# CHECK-ASM-NEW: encoding: [0x0f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
add64 r0, r9

# CHECK-OBJ-NEW: add64 r3, r2
# CHECK-ASM-NEW: encoding: [0x0f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
add64 r3, r2

# CHECK-OBJ-NEW: add64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x07,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
add64 r3, 123

# CHECK-OBJ-NEW: add64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x07,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
add64 r5, -123

# CHECK-OBJ-NEW: add32 w6, w2
# CHECK-ASM-NEW: encoding: [0x0c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
add32 w6, w2

# CHECK-OBJ-NEW: add32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x04,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
add32 w5, -123



# CHECK-OBJ-NEW: sub64 r0, r9
# CHECK-ASM-NEW: encoding: [0x1f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
sub64 r0, r9

# CHECK-OBJ-NEW: sub64 r3, r2
# CHECK-ASM-NEW: encoding: [0x1f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
sub64 r3, r2

# CHECK-OBJ-NEW: sub64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x17,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
sub64 r3, 123

# CHECK-OBJ-NEW: sub64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x17,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
sub64 r5, -123

# CHECK-OBJ-NEW: sub32 w6, w2
# CHECK-ASM-NEW: encoding: [0x1c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
sub32 w6, w2

# CHECK-OBJ-NEW: sub32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x14,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
sub32 w5, -123



# CHECK-OBJ-NEW: mul64 r0, r9
# CHECK-ASM-NEW: encoding: [0x2f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
mul64 r0, r9

# CHECK-OBJ-NEW: mul64 r3, r2
# CHECK-ASM-NEW: encoding: [0x2f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
mul64 r3, r2

# CHECK-OBJ-NEW: mul64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x27,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
mul64 r3, 123

# CHECK-OBJ-NEW: mul64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x27,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
mul64 r5, -123

# CHECK-OBJ-NEW: mul32 w6, w2
# CHECK-ASM-NEW: encoding: [0x2c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
mul32 w6, w2

# CHECK-OBJ-NEW: mul32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x24,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
mul32 w5, -123



# CHECK-OBJ-NEW: div64 r0, r9
# CHECK-ASM-NEW: encoding: [0x3f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
div64 r0, r9

# CHECK-OBJ-NEW: div64 r3, r2
# CHECK-ASM-NEW: encoding: [0x3f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
div64 r3, r2

# CHECK-OBJ-NEW: div64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x37,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
div64 r3, 123

# CHECK-OBJ-NEW: div64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x37,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
div64 r5, -123

# CHECK-OBJ-NEW: div32 w6, w2
# CHECK-ASM-NEW: encoding: [0x3c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
div32 w6, w2

# CHECK-OBJ-NEW: div32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x34,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
div32 w5, -123



# CHECK-OBJ-NEW: hor64 r0, 0x2c4
# CHECK-ASM-NEW: encoding: [0xf7,0x00,0x00,0x00,0xc4,0x02,0x00,0x00]
hor64 r0, 708


# CHECK-OBJ-NEW: or64 r0, r9
# CHECK-ASM-NEW: encoding: [0x4f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
or64 r0, r9

# CHECK-OBJ-NEW: or64 r3, r2
# CHECK-ASM-NEW: encoding: [0x4f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
or64 r3, r2

# CHECK-OBJ-NEW: or64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x47,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
or64 r3, 123

# CHECK-OBJ-NEW: or64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x47,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
or64 r5, -123

# CHECK-OBJ-NEW: or32 w6, w2
# CHECK-ASM-NEW: encoding: [0x4c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
or32 w6, w2

# CHECK-OBJ-NEW: or32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x44,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
or32 w5, -123



# CHECK-OBJ-NEW: and64 r0, r9
# CHECK-ASM-NEW: encoding: [0x5f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
and64 r0, r9

# CHECK-OBJ-NEW: and64 r3, r2
# CHECK-ASM-NEW: encoding: [0x5f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
and64 r3, r2

# CHECK-OBJ-NEW: and64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x57,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
and64 r3, 123

# CHECK-OBJ-NEW: and64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x57,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
and64 r5, -123

# CHECK-OBJ-NEW: and32 w6, w2
# CHECK-ASM-NEW: encoding: [0x5c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
and32 w6, w2

# CHECK-OBJ-NEW: and32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x54,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
and32 w5, -123



# CHECK-OBJ-NEW: xor64 r0, r9
# CHECK-ASM-NEW: encoding: [0xaf,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
xor64 r0, r9

# CHECK-OBJ-NEW: xor64 r3, r2
# CHECK-ASM-NEW: encoding: [0xaf,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
xor64 r3, r2

# CHECK-OBJ-NEW: xor64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0xa7,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
xor64 r3, 123

# CHECK-OBJ-NEW: xor64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0xa7,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
xor64 r5, -123

# CHECK-OBJ-NEW: xor32 w6, w2
# CHECK-ASM-NEW: encoding: [0xac,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
xor32 w6, w2

# CHECK-OBJ-NEW: xor32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0xa4,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
xor32 w5, -123



# CHECK-OBJ-NEW: lsh64 r0, r9
# CHECK-ASM-NEW: encoding: [0x6f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
lsh64 r0, r9

# CHECK-OBJ-NEW: lsh64 r3, r2
# CHECK-ASM-NEW: encoding: [0x6f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
lsh64 r3, r2

# CHECK-OBJ-NEW: lsh64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x67,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
lsh64 r3, 123

# CHECK-OBJ-NEW: lsh64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x67,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
lsh64 r5, -123

# CHECK-OBJ-NEW: lsh32 w6, w2
# CHECK-ASM-NEW: encoding: [0x6c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
lsh32 w6, w2

# CHECK-OBJ-NEW: lsh32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x64,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
lsh32 w5, -123



# CHECK-OBJ-NEW: rsh64 r0, r9
# CHECK-ASM-NEW: encoding: [0x7f,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
rsh64 r0, r9

# CHECK-OBJ-NEW: rsh64 r3, r2
# CHECK-ASM-NEW: encoding: [0x7f,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
rsh64 r3, r2

# CHECK-OBJ-NEW: rsh64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x77,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
rsh64 r3, 123

# CHECK-OBJ-NEW: rsh64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0x77,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
rsh64 r5, -123

# CHECK-OBJ-NEW: rsh32 w6, w2
# CHECK-ASM-NEW: encoding: [0x7c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
rsh32 w6, w2

# CHECK-OBJ-NEW: rsh32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x74,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
rsh32 w5, -123




# CHECK-OBJ-NEW: arsh64 r0, r9
# CHECK-ASM-NEW: encoding: [0xcf,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
arsh64 r0, r9

# CHECK-OBJ-NEW: arsh64 r3, r2
# CHECK-ASM-NEW: encoding: [0xcf,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
arsh64 r3, r2

# CHECK-OBJ-NEW: arsh64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0xc7,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
arsh64 r3, 123

# CHECK-OBJ-NEW: arsh64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0xc7,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
arsh64 r5, -123

# CHECK-OBJ-NEW: arsh32 w6, w2
# CHECK-ASM-NEW: encoding: [0xcc,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
arsh32 w6, w2

# CHECK-OBJ-NEW: arsh32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0xc4,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
arsh32 w5, -123



# CHECK-OBJ-NEW: neg64 r9
# CHECK-ASM-NEW: encoding: [0x87,0x09,0x00,0x00,0x00,0x00,0x00,0x00]
neg64 r9

# CHECK-OBJ-NEW: neg32 w6
# CHECK-ASM-NEW: encoding: [0x84,0x06,0x00,0x00,0x00,0x00,0x00,0x00]
neg32 w6



# CHECK-OBJ-NEW: mov64 r0, r9
# CHECK-ASM-NEW: encoding: [0xbf,0x90,0x00,0x00,0x00,0x00,0x00,0x00]
mov64 r0, r9

# CHECK-OBJ-NEW: mov64 r3, r2
# CHECK-ASM-NEW: encoding: [0xbf,0x23,0x00,0x00,0x00,0x00,0x00,0x00]
mov64 r3, r2

# CHECK-OBJ-NEW: mov64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0xb7,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
mov64 r3, 123

# CHECK-OBJ-NEW: mov64 r5, -0x7b
# CHECK-ASM-NEW: encoding: [0xb7,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
mov64 r5, -123

# CHECK-OBJ-NEW: mov32 w6, w2
# CHECK-ASM-NEW: encoding: [0xbc,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
mov32 w6, w2

# CHECK-OBJ-NEW: mov32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0xb4,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
mov32 w5, -123



# CHECK-OBJ-NEW: be16 r0
# CHECK-OBJ-NEW: be32 r1
# CHECK-OBJ-NEW: be64 r2
# CHECK-ASM-NEW: encoding: [0xdc,0x00,0x00,0x00,0x10,0x00,0x00,0x00]
# CHECK-ASM-NEW: encoding: [0xdc,0x01,0x00,0x00,0x20,0x00,0x00,0x00]
# CHECK-ASM-NEW: encoding: [0xdc,0x02,0x00,0x00,0x40,0x00,0x00,0x00]
be16 r0
be32 r1
be64 r2


# CHECK-OBJ-NEW: mod64 r3, r1
# CHECK-ASM-NEW: encoding: [0x9f,0x13,0x00,0x00,0x00,0x00,0x00,0x00]
mod64 r3, r1

# CHECK-OBJ-NEW: mod64 r3, 0x7b
# CHECK-ASM-NEW: encoding: [0x97,0x03,0x00,0x00,0x7b,0x00,0x00,0x00]
mod64 r3, 123

# CHECK-OBJ-NEW: mod32 w6, w2
# CHECK-ASM-NEW: encoding: [0x9c,0x26,0x00,0x00,0x00,0x00,0x00,0x00]
mod32 w6, w2

# CHECK-OBJ-NEW: mod32 w5, -0x7b
# CHECK-ASM-NEW: encoding: [0x94,0x05,0x00,0x00,0x85,0xff,0xff,0xff]
mod32 w5, -123
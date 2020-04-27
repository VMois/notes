# 3rd HW, Vladyslav Moisieienkov, AJLMUB

Initial content of registers:

| Register | value |
| -------- |:-----:|
| A        | 99H   |
| B        | 88H   |
| C        | 77H   |
| D        | 66H   |
| E        | 55H   |
| H        | 44H   |
| L        | 33H   |
| PC       | 1200H |
| SP       | 6758H |

All flags from F register are **1**.

## 1st step

| Address  | Symbol  | Command        | Size    | opcode          |
| -------- |:-------:|:--------------:|:-------:|:---------------:|
| 1200H    | ELSO:   | LXI SP, STACK  | 3 bytes | 0011 0001 = 31H |
| 1203H    |         | LXI HL, STACK+1| 3 bytes | 0010 0001 = 21H |
| 1206H    | MAS:    | INR A          | 1 byte  | 0011 1100 = 3CH |
| 1207H    |         | PUSH DE        | 1 byte  | 1101 0101 = D5H |
| 1208H    |         | CALL S1R       | 3 bytes | 1100 1101 = CDH |
| 120BH    |         | POP BC         | 1 byte  | 1100 0001 = C1H |
| 120CH    |         | NOP            | 1 byte  | 0000 0000 = 00H |
| 120DH    |         | NOP            | 1 byte  | 0000 0000 = 00H |
| 120EH    | VEGE:   | HLT            | 1 byte  | 0111 0110 = 76H |
| 120FH    | S1R:    | PUSH BC        | 1 byte  | 1100 0101 = C5H |
| 1210H    |         | DCX HL         | 1 byte  | 0010 1011 = 2BH |
| 1211H    |         | DCX HL         | 1 byte  | 0010 1011 = 2BH |
| 1212H    |         | DCX HL         | 1 byte  | 0010 1011 = 2BH |
| 1213H    |         | INR M          | 1 byte  | 0011 0100 = 34H |
| 1214H    | S2R:    | POP HL         | 1 byte  | 1110 0001 = E1H |
| 1215H    |         | RET            | 1 byte  | 1100 1001 = C9H |

| Symbol   | Value  |
| -------- |:------:|
| STACK    | 9700H  |
| FIRST    | 1200H  |
| CONST    | ABH    |
| ELSO     | 1200H  |
| MAS      | 1206H  |
| VEGE     | 120EH  |
| S1R      | 120FH  |
| S2R      | 1214H  |

## 2nd step

- incr PC: (PC) = (PC) + 1
- incr SP: (SP) = (SP) + 1
- dcr SP: (SP) = (SP) - 1

| Command        | MC   | Addr. bus | Src of addr. | Direct. | Data bus | note                      |
|:--------------:|:----:|:---------:|:------------:|:-------:|:--------:|:-------------------------:|
| LXI SP, STACK  | 1/1  | 1200H     | PC           | /RD     | 31H      | reads opcode, incr PC |
|                | 2/2  | 1201H     | PC           | /RD     | 00H      | incr PC                   |
|                | 3/3  | 1202H     | PC           | /RD     | 97H      | incr PC, (SP) = 9700H     |
| LXI HL, 9701H  | 4/1  | 1203H     | PC           | /RD     | 21H      | reads opcode, incr PC     |
|                | 5/2  | 1204H     | PC           | /RD     | 01H      | incr PC |
|                | 6/3  | 1205H     | PC           | /RD     | 97H      | incr PC, (HL) = 9701H |
| INR A          | 7/1  | 1206H     | PC           | /RD     | 3CH      | incr PC, (A) = (A) + 1 = 9AH|
| PUSH DE        | 8/1  | 1207H     | PC           | /RD     | D5H      | incr PC|
|                | 9/2  | 96FFH     | SP           | /WR     | 66H      | dcr SP, (96FFH) = 66H|
|                | 10/3 | 96FEH     | SP           | /WR     | 55H      | dcr SP, (96FEH) = 55H, (SP) = 96FEH
| CALL S1R       | 11/1 | 1208H     | PC           | /RD     | CDH      | incr PC |
|                | 12/2 | 1209H     | PC           | /RD     | 0FH      | incr PC |
|                | 13/3 | 120AH     | PC           | /RD     | 12H      | incr PC, (PC) = 120FH |
|                | 14/4 | 96FDH     | SP           | /WR     | 12H      | dcr SP, (96FDH) = 12H |
|                | 15/5 | 96FCH     | SP           | /WR     | 0BH      | dcr SP, (96FCH) = 0BH, (SP) = 96FCH, (PC) = 120FH |
| PUSH BC        | 16/1 | 120FH     | PC           | /RD     | C5H      | incr PC |
|                | 17/2 | 96FBH     | SP           | /WR     | 88H      | dcr SP, (96FBH) = 88H |
|                | 18/3 | 96FAH     | SP           | /WR     | 77H      | dcr SP, (96FAH) = 77H, (SP) = 96FAH |
| DCX HL         | 19/1 | 1210H     | PC           | /RD     | 2BH      | incr PC, (HL) = (HL) - 1 = 9700H |
| DCX HL         | 20/1 | 1211H     | PC           | /RD     | 2BH      | incr PC, (HL) = (HL) - 1 = 96FFH |
| DCX HL         | 21/1 | 1212H     | PC           | /RD     | 2BH      | incr PC, (HL) = (HL) - 1 = 96FEH |
| INR M          | 22/1 | 1213H     | PC           | /RD     | 34H      | incr PC, reads opcode |
|                | 23/2 | 96FEH     | HL           | /RD     | 55H      | 55H + 1 = 56H |
|                | 24/3 | 96FEH     | HL           | /WR     | 56H      | (96FEH) = 56H |
| POP HL         | 25/1 | 1214H     | PC           | /RD     | E1H      | incr PC, reads opcode |
|                | 26/2 | 96FAH     | SP           | /RD     | 77H      | (L) = 77H, incr SP |
|                | 27/3 | 96FBH     | SP           | /RD     | 88H      | (H) = 88H, incr SP, (SP) = 96FCH |
| RET            | 28/1 | 1215H     | PC           | /RD     | C9H      | incr PC |
|                | 29/2 | 96FCH     | SP           | /RD     | 0BH      | (PC, low) = 0BH, incr SP |
|                | 30/3 | 96FDH     | SP           | /RD     | 12H      | (PC, high) = 12H, incr SP, (SP) = 96FEH |
| POP BC         | 31/1 | 120BH     | PC           | /RD     | C1H      | incr PC |
|                | 32/2 | 96FEH     | SP           | /RD     | 55H      | (C) = 56H, incr SP |
|                | 33/3 | 96FFH     | SP           | /RD     | 66H      | (B) = 66H, incr SP, (SP) = 9700H |
| NOP            | 34/1 | 120CH     | PC           | /RD     | 00H      | incr PC |
| NOP            | 35/1 | 120DH     | PC           | /RD     | 00H      | incr PC |
| HLT            | 36/1 | 120EH     | PC           | /RD     | 76H      | incr PC, CPU is stopped |

## 3rd step

Content of registers after the execution:

| Reg. | value |
| ---- |:-----:|
| A    | CDH   |
| B    | 66H   |
| C    | 56H   |
| D    | 66H   |
| E    | 55H   |
| H    | 88H   |
| L    | 77H   |
| PC   | 120FH |
| SP   | 9700H |

**Note!** register A (Acc) is modified during the execution by a lot of instrucitons. So, value of A was determined by using simulator software for 8085 processor (https://www.sim8085.com).

Content of memory after the execution:

| Addr. | value |
| ----- |:-----:|
| 96FAH | 77H   |
| 96FBH | 88H   |
| 96FCH | 0BH   |
| 96FDH | 12H   |
| 96FEH | 56H   |
| 96FFH | 66H   |

**End! Thank you**
# 3rd HW, Vladyslav Moisieienkov, AJLMUB

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
| SR2      | 1214H  |

## 2nd step

| Command        | MC   | Addr. bus | Src of addr. | Direct. | Data bus | note                      |
|:--------------:|:----:|:---------:|:------------:|:-------:|:--------:|:-------------------------:|
| LXI SP, STACK  | 1/1  | 1200H     | PC           | /RD     | 31H      | reads opcode, incr PC (n4)|
|                | 2/2  | 1201H     | PC           | /RD     | 00H      | incr PC                   |
|                | 3/3  | 1202H     | PC           | /RD     | 97H      | incr PC, (SP) = 9700H     |
| LXI HL, 9701H  | 4/1  | 1203H     | PC           | /RD     | 21H      | reads opcode, incr PC     |
|                | 5/2  | 1204H     | PC           | /RD     | 01H      | incr PC |
|                | 6/3  | 1205H     | PC           | /RD     | 97H      | incr PC, (HL) = 9701H |
| INR A          | 7/1  | 1206H     | PC           | /RD     | 3CH      | incr PC, (A) = (A) + 1|
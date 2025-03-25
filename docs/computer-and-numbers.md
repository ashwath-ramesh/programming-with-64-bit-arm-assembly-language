# Computers and numbers

## Types

- Decimal (base-10)
- Binary (base-2)
- Octal (base-8)
- Hexadecimal (base-16)

## Why different systems exist

Understanding different number systems starts with our familiar decimal (base-10) system. We use base-10 naturally because humans have ten fingers, making it intuitive to count in groups of ten.

### Understanding Base Systems

In any base system, when we run out of unique symbols, we move to a new position and start over. Let's see how this works:

#### Decimal (Base-10)

- Uses 10 symbols: 0-9
- When counting past 9, we use a new position: 10 (one group of ten, zero ones)
- Example: 254 breaks down as:
  - 2 in hundreds place (2 × 10² = 200)
  - 5 in tens place (5 × 10¹ = 50)
  - 4 in ones place (4 × 10⁰ = 4)
  - Total: 200 + 50 + 4 = 254

#### Binary (Base-2)

- Uses 2 symbols: 0 and 1
- When counting past 1, we use a new position: 10 (one group of two, zero ones)
- Example: 101 breaks down as:
  - 1 in fours place (1 × 2² = 4)
  - 0 in twos place (0 × 2¹ = 0)
  - 1 in ones place (1 × 2⁰ = 1)
  - Total: 4 + 0 + 1 = 5
- Fundamental to computer operations because:
  - Electronic circuits have two states (on/off)
  - All data in computers is ultimately stored and processed as binary
  - Forms the basis for digital logic and computer arithmetic

#### Octal (Base-8)

- Uses 8 symbols: 0-7
- When counting past 7, we use a new position: 10 (one group of eight, zero ones)
- Useful in computing where three binary digits can represent one octal digit

#### Hexadecimal (Base-16)

- Uses 16 symbols: 0-9 and A-F
- A represents 10, B is 11, up to F representing 15
- After F, we use 10 (one group of sixteen, zero ones)
- Particularly useful in computing because:
  - Four binary digits can represent one hexadecimal digit
  - Makes binary data more readable for humans
  - Commonly used in memory addresses and color codes

These different number systems exist primarily because they serve different purposes. While decimal is natural for human counting, binary is fundamental to computer operations, and hexadecimal provides a more concise way to represent binary data. Octal and hexadecimal act as convenient "shortcuts" for representing binary numbers in a more human-readable format.

## Representation

| Type        | Description                      |
| ----------- | -------------------------------- |
| Decimal     | Base-10 number system (0-9)      |
| Binary      | Base-2 number system (0-1)       |
| Octal       | Base-8 number system (0-7)       |
| Hexadecimal | Base-16 number system (0-9, A-F) |

## Efficiency

| Aspect        | Decimal                 | Binary               | Octal          | Hexadecimal                                                         |
| ------------- | ----------------------- | -------------------- | -------------- | ------------------------------------------------------------------- |
| Example (255) | 255 (3 digits)          | 1111 1111 (8 digits) | 377 (3 digits) | FF (2 digits)                                                       |
| Bits Required | No fixed representation | 1 bit (2^1)          | 3 bits (2^3)   | 4 bits (2^4)                                                        |
| Notes         | -                       | For 0,1 only         | For 0-7        | For 0-9,A-F. Good medium between human readability and binary logic |

## Conversion to and from

### Decimal to Binary

1. Divide the decimal number by 2 repeatedly
2. Keep track of remainders in reverse order
3. Example: 13 to binary
   - 13 ÷ 2 = 6 remainder 1
   - 6 ÷ 2 = 3 remainder 0
   - 3 ÷ 2 = 1 remainder 1
   - 1 ÷ 2 = 0 remainder 1
   - Result: 1101

### Decimal to Octal

1. Divide the decimal number by 8 repeatedly
2. Keep track of remainders in reverse order
3. Example: 78 to octal
   - 78 ÷ 8 = 9 remainder 6
   - 9 ÷ 8 = 1 remainder 1
   - 1 ÷ 8 = 0 remainder 1
   - Result: 116

### Decimal to Hexadecimal

1. Divide the decimal number by 16 repeatedly
2. Convert remainders 10-15 to A-F
3. Keep track of remainders in reverse order
4. Example: 255 to hex
   - 255 ÷ 16 = 15 remainder 15 (F)
   - 15 ÷ 16 = 0 remainder 15 (F)
   - Result: FF

### Binary to Decimal

1. Multiply each digit by its position value (powers of 2)
2. Add all values together
3. Example: 1101 to decimal
   - 1 × 2³ = 1 × 8 = 8
   - 1 × 2² = 1 × 4 = 4
   - 0 × 2¹ = 0 × 2 = 0
   - 1 × 2⁰ = 1 × 1 = 1
   - Result: 8 + 4 + 0 + 1 = 13

### Octal to Decimal

1. Multiply each digit by its position value (powers of 8)
2. Add all values together
3. Example: 116 to decimal
   - 1 × 8² = 1 × 64 = 64
   - 1 × 8¹ = 1 × 8 = 8
   - 6 × 8⁰ = 6 × 1 = 6
   - Result: 64 + 8 + 6 = 78

### Hexadecimal to Decimal

1. Convert A-F to values 10-15
2. Multiply each digit by its position value (powers of 16)
3. Add all values together
4. Example: FF to decimal
   - F × 16¹ = 15 × 16 = 240
   - F × 16⁰ = 15 × 1 = 15
   - Result: 240 + 15 = 255

#!/bin/python3

def lz77_decompress(data):
    # GBA LZ77 compressed data starts with an 0x10 identifier byte, we skip it
    if data[0] != 0x10:
        raise ValueError("Not a valid GBA LZ77 compressed stream.")

    # Get decompressed size (next 3 bytes)
    decompressed_size = (data[1] | (data[2] << 8) | (data[3] << 16))

    data = data[4:]  # Skip the header
    decompressed_data = bytearray()
    src_index = 0

    while len(decompressed_data) < decompressed_size:
        # Read a flag byte (8 bits)
        flags = data[src_index]
        src_index += 1

        for i in range(8):
            if len(decompressed_data) >= decompressed_size:
                break

            if flags & (0x80 >> i):  # If the bit is 1, we have a compressed block
                # Get the 2-byte length/offset pair
                byte1 = data[src_index]
                byte2 = data[src_index + 1]
                src_index += 2

                length = ((byte1 >> 4) & 0xF) + 3  # Length is 4 bits + 3
                offset = ((byte1 & 0xF) << 8) | byte2  # Offset is the remaining 12 bits

                # Copy 'length' bytes from 'offset' back in the decompressed data
                for j in range(length):
                    decompressed_data.append(decompressed_data[-offset])
            else:  # If the bit is 0, we have a raw byte
                decompressed_data.append(data[src_index])
                src_index += 1

    return bytes(decompressed_data)

def string_to_felt_array(s, chunk_size):
    """Convert a string into an array of felt values."""
    felt_array = []

    # Split the string into chunks
    chunks = [s[i:i + chunk_size] for i in range(0, len(s), chunk_size)]

    # Convert each chunk into a felt value
    for chunk in chunks:
        felt_value = 0
        for i, char in enumerate(chunk):
            felt_value += ord(char) * (256 ** i)
        felt_array.append(felt_value)

    return felt_array



def felt_array_to_string(felt_array):
    """Convert an array of felt values back to the original string."""
    reconstructed_string = ""
    for felt_value in felt_array:
        while felt_value > 0:
            # Extract the least significant byte (character in ASCII)
            ascii_value = felt_value % 256
            reconstructed_string += chr(ascii_value)
            # Move to the next byte
            felt_value //= 256
    return reconstructed_string


# Example usage
string = 'data:,{"p":"stark-20","op":"mint","tick":"STRK","amt":"1000"}'
encoded_data = string_to_felt_array(string, 31)
# Convert the felt array back to the original string
decoded_data = felt_array_to_string(encoded_data)
# Print the original string
print(decoded_data)

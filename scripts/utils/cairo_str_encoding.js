function stringToFeltArray(s, chunkSize) {
    let feltArray = [];
    
    // Function to convert a character to its ASCII value
    function charToAscii(char) {
        return char.charCodeAt(0);
    }

    // Split the string into chunks and convert each chunk to a felt value
    for (let i = 0; i < s.length; i += chunkSize) {
        let chunk = s.substring(i, Math.min(i + chunkSize, s.length));
        let feltValue = BigInt(0);
        for (let j = 0; j < chunk.length; j++) {
            feltValue += BigInt(charToAscii(chunk[j])) * (BigInt(256) ** BigInt(j));
        }
        feltArray.push(feltValue);
    }

    return feltArray;
}

function feltArrayToString(feltArray) {
    let reconstructedString = "";

    // Convert each felt value back to a string chunk
    feltArray.forEach(feltValue => {
        while (feltValue > BigInt(0)) {
            let asciiValue = feltValue % BigInt(256);
            reconstructedString += String.fromCharCode(Number(asciiValue));
            feltValue /= BigInt(256);
        }
    });

    return reconstructedString;
}

// Example usage
let string = 'data:,{"p":"stark-20","op":"mint","tick":"STRK","amt":"1000"}';
console.log(`DATA TO ENCODE: ${string}`); // Prints the original string
let encodedData = stringToFeltArray(string, 31);
console.log(`ENCODED DATA: ${encodedData}`); // Prints the encoded felt array
let decodedData = feltArrayToString(encodedData);

console.log(`DECODED DATA: ${decodedData}`); // Prints the decoded string
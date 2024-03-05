function validatePan(pan) {
    // Regular expression pattern to match PAN numbers
    const panPattern = /^[A-Z]{5}\d{4}[A-Z]$/i; 

    // Check if input is a string
    if (typeof pan !== 'string') {
        console.error("Input is not a string.");
        return false;
    }

    // Check if the length of input is valid
    if (pan.length !== 10) {
        console.error("Invalid PAN length.");
        return false;
    }

    // Check if the input matches the pattern
    return panPattern.test(pan);
}


const panToValidate = 'ABCDE1234A';
const isValid = validatePan(panToValidate);

if (isValid) {
    console.log(`The PAN '${panToValidate}' is valid.`);
} else {
    console.log(`The PAN '${panToValidate}' is not valid.`);
}
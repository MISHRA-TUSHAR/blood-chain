function isValidVoterId(voterId) {
    // Regular expression pattern to match voter IDs
    const voterIdPattern = /^[A-Z]{3}\d{7}$/; 

    // Check if input is a string
    if (typeof voterId !== 'string') {
        console.error("Input is not a string.");
        return false;
    }

    // Check if the length of input is valid
    if (voterId.length !== 10) {
        console.error("Invalid voter ID length.");
        return false;
    }

    // Check if the input matches the pattern
    return voterIdPattern.test(voterId);
}

const voterIdToCheck = "NB03064888";
if (isValidVoterId(voterIdToCheck)) {
    console.log("Valid voter ID");
} else {
    console.log("Invalid voter ID");
}
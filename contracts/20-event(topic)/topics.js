const { keccak256 } = require("ethereum-cryptography/keccak");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

// other erc20 events can be found here: https://eips.ethereum.org/EIPS/eip-20#events


function firstTopic() {
    const eventSignature = "Transfer(address,address,uint256)"; // <-- TODO #1: fill in the event signature!
    const bytes = utf8ToBytes(eventSignature);
    const digest = keccak256(bytes);
    return toHex(digest);
}

function secondTopic() {
    // TODO #2: add the address and left-pad it with zeroes to 32 bytes
    // then return the value
    const address = "0x28c6c06298d514db089934071355e5743bf21d60";  // a active address for DAI
    // strip the 0x prefix
    const strippedAddress = address.slice(2);
    // left-pad the address with zeroes to 32 bytes (64 hex characters)
    const paddedAddress = strippedAddress.padStart(64, "0");
    return paddedAddress;
}

module.exports = { firstTopic, secondTopic }
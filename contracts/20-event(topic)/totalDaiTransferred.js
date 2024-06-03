require("dotenv").config();
const { Alchemy, Network } = require("alchemy-sdk");
const { firstTopic, secondTopic } = require('./topics');
// prefix both the topics with 0x
const topics = [firstTopic(), secondTopic()].map((x) => '0x' + x);

const config = {
    apiKey: process.env.ALCHEMY_API_KEY,
    network: Network.ETH_MAINNET,
};

const alchemy = new Alchemy(config);

async function totalDaiTransferred(fromBlock, toBlock) {
    const logs = await alchemy.core.getLogs({
        address: "0x6B175474E89094C44Da98b954EedeAC495271d0F", // <-- TODO #1: fill in the dai address here
        fromBlock,
        toBlock,
        topics
    });

    // take a look at the first log in the response
    console.log(logs);

    // <-- TODO #2: return the total dai transferred during this timeframe
    // Sum the values transferred, parsed from the 'data' field of the log entries
    const totalTransferred = logs.reduce((acc, log) => {
        // Convert the hex encoded data to a number and add to accumulator
        return acc + BigInt(log.data);
    }, BigInt(0));

    return totalTransferred.toString(); // Return as string to handle large numbers safely
}

totalDaiTransferred(20002707, "safe").then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });

module.exports = totalDaiTransferred;
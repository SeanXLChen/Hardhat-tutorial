require("dotenv").config();
const { Alchemy, Network } = require("alchemy-sdk");

const config = {
    apiKey: process.env.ALCHEMY_API_KEY,
    network: Network.ETH_MAINNET,
};

const alchemy = new Alchemy(config);

async function totalErc20Transfers(fromBlock, toBlock) {
    const res = await alchemy.core.getAssetTransfers({
        fromBlock,
        toBlock,
        fromAddress: "0x28c6c06298d514db089934071355e5743bf21d60", // <-- TODO: fill this in
        category: ["erc20"], // <-- TODO: fill this in 
    });

    // inspect the response to see all the transfers
    console.log(res); 

    // TODO: return the total number of ERC20 transfers
    const totalTransferNum = res.length;
    return totalTransferNum;
}

totalErc20Transfers(19000000, "latest").then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });

module.exports = totalErc20Transfers;
async function main() {
    const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
    const Contract = await ethers.getContractFactory("ModifyVariable");
    const contract = Contract.attach(contractAddress);

    // Interact with the contract
    const oldName = await contract.name();
    console.log("Name:", oldName);

    contract.modifyName("Sean's contract");
    const newName = await contract.name();
    console.log("New Name:", newName);

    const oldX = await contract.x();
    console.log("X:", oldX);

    await contract.modifyToLeet();
    const newX = await contract.x();
    console.log("New X:", newX);
}

main().then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
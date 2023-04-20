const hre =  require("hardhat");

async function main() {
    // Get the contract to deploy & deploy

    const BuyMeACoffee = await hre.ethers.getContractFactory("BuyMeACoffee");
    const buyMeACoffee = await BuyMeACoffee.deploy();
    await buyMeACoffee.deployed();

    console.log("BuyMeACaffee deployed to ", buyMeACoffee.address);
}

//

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });


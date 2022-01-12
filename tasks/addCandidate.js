task("get-totalCandidate", "Print the total number of registered candidate")
    .addParam("contract", "The contract address")
    .setAction(async (taskArgs) => {
        const mycontractAddress = taskArgs.contract;
        const ElectionContract = await ethers.getContractFactory("Election");

        const accounts = await ethers.getSigners();
        const signer = accounts[0];
        const electionContract = await new ethers.Contract(mycontractAddress, ElectionContract.interface, signer);

        let result = BigInt(await electionContract.getNumberOfCandidate()).toString();


        console.log("The current stored value is: " + result);
    });


task("add-candidate", "Set the value of my number")
    .addParam("contract", "The contract address")
    .addParam("name", "Add candidate name")
    .addParam("party", "Add candidate party")
    .addParam("age", "Add candidate age")
    .setAction(async (taskArgs) => {
        const mycontractAddress = taskArgs.contract;
        const name = taskArgs.name;
        const party = taskArgs.party;
        const age = taskArgs.age
        const ElectionContract = await ethers.getContractFactory("Election");

        const accounts = await ethers.getSigners();
        const signer = accounts[0];
        const electionContract = await new ethers.Contract(mycontractAddress, ElectionContract.interface, signer);

        let result = await electionContract.addCandidate(name, party, age);


        console.log("New candiate added with name: " + name);
        console.log("belongs to: " + party);
        console.log("and is: " + age);

    });

task("register-voter", "Set the value of my number")
    .addParam("contract", "The contract address")
    .addParam("address", "Add the voters address")
    .setAction(async (taskArgs) => {
        const mycontractAddress = taskArgs.contract;
        const voter = taskArgs.address;
        const ElectionContract = await ethers.getContractFactory("Election");

        const accounts = await ethers.getSigners();
        const signer = accounts[0];
        const electionContract = await new ethers.Contract(mycontractAddress, ElectionContract.interface, signer);

        let value = await electionContract.registerVoter(voter);

        let result = JSON.stringify(value);


        console.log("New voter with the address: " + result + " has been registered");

    });


module.exports = {};
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;


//  DEployed to Goerli at 0xA4B7F0C00F0f4ab5486BbF8186447C047BDCB2fE

 
contract BuyMeACoffee {

    // Event to emit when aMemo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message

    );

    // Memo struct

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    // List of all memo recived from friends.
    Memo[] memos;


    // Address of contract deployer.
    address payable owner;

    constructor() {
        owner = payable(msg.sender);

    }

    /**
     * @dev  buy a coffee for contract owner
     * @param _name name of the coffee buyer
     * @param _message a nice message from the coffee buyer

     */

    function buyCoffee(string memory _name, string memory _message) public payable {

        require(msg.value > 0, "can't buy coffee with 0 eth");
        // Add the memo to storage
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));


        // Emit a log event when a new memo is created!
        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }


    /**
     * @dev  send the entire balance stored in this contract to the owner.
     */

    function withdrawTips() public {

        require(owner.send(address(this).balance));

    }

    /**
     * @dev retrieve all the memos received and stored on the blockchain.
     */

    function getMemos() public view returns(Memo[] memory) {

        return memos;

    }


 
}

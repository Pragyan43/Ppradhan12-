# EnergyToken Smart Contract

## Description

EnergyToken is an Ethereum smart contract written in Solidity that implements the ERC20 token standard with additional functionalities for minting, burning, and ownership management. This contract is designed to serve as a utility token within decentralized applications (dApps) or platforms where energy-related services or assets are traded or managed.

## Features
1. ERC20 Compliance: Implements standard ERC20 token functionalities.
2. Minting: Allows the contract owner to create new tokens.
3. Burning: Allows token holders to destroy their tokens.
4. Ownership: Utilizes the Ownable contract from OpenZeppelin to manage ownership and access control.
   
## Getting Started
These instructions will help you deploy the EnergyToken contract and interact with its functionalities on the Ethereum blockchain.
   
### Prerequisites
Remix IDE or any other Solidity development environment.

### Interacting with the Contract
You can interact with the deployed contract using Remix IDE and MetaMask:

1. Mint Tokens: Only the contract owner can mint new tokens.
2. Burn Tokens: Any token holder can burn their own tokens.
3. Transfer Tokens: Token holders can transfer tokens to other addresses.
4. Approve and TransferFrom: Token holders can approve another address to transfer tokens on their behalf.

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., EnergyToken.sol). Copy and paste the following code into the file:

```javascript

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import the OpenZeppelin ERC20 and Ownable contracts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EnergyToken is ERC20, Ownable {
    // Constructor to set the token name, symbol and initial owner
    constructor(address initialOwner) ERC20("EnergyToken", "ENG") Ownable(initialOwner) {}

    // Event to log minting of new tokens
    event MintedTokens(address indexed to, uint256 amount);

    // Event to log burning of tokens
    event BurnedTokens(address indexed from, uint256 amount);

    // Function to mint new tokens, only the owner can call this function
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit MintedTokens(to, amount);
    }

    // Function to burn tokens from the caller's account
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit BurnedTokens(msg.sender, amount);
    }

    // Function to transfer tokens, inherited from ERC20 and can be used by any user
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile EnergyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Then extend the deploy button and give the address of the owner and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mint function that allows the contract owner to create new tokens and assign them to a specified address. Click on the "EnergyToken" contract in the left-hand sidebar, and then extend the mint function, give the address of the owner and the amount you want to mint(e.g., 500) and click on "transact". You can check the minted amount by clicking on the "totalSupply" button.

Then call the burn function allows any token holder to destroy tokens from their own account. Extend the burn function, write the amount you want to burn(e.g., 100) and click on "transact" button. You can check on totalSupply, amount is 100 less(e.g. 400) as we have burnt 100 tokens.

You can interact with transfer by calling transfer function that allows any token holder to send tokens to another Ethereum address. Extend transfer function, write the address of recipient and the amount you want to transfer(e.g., 100) and then click on "transact" button. You can check the balance of the recipient by extending balanceOf function and write the recipient's address and click on "call" button. Then you will get the amount that has been transfered to the recipient(i.e., 100).

## Development
.Solidity Version: 0.8.20
.Dependencies: OpenZeppelin contracts (ERC20.sol, Ownable.sol)

## Authors

Metacrafter Chris  
[@metacraftersio](https://twitter.com/metacraftersio)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

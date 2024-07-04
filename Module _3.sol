/*
Assessment Requirements
1. you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix.
2. From your chosen tool, the contract owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.
Functionality:
Only contract owner should be able to mint tokens
Any user can transfer tokens
Any user can burn tokens
*/

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

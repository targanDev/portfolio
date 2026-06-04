// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Targan Token
 * @dev Secure ERC20 token with minting capabilities restricted to the owner.
 */
contract TarganToken is ERC20, Ownable {

    constructor() ERC20("Targan Token", "TARGAN") Ownable(msg.sender) {
        // Minting 1,000,000 tokens to the deployer on creation
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }

    /**
     * @notice Mints new tokens to a specific address.
     * @dev Restricted to the contract owner via onlyOwner modifier.
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint (will be automatically adjusted for decimals).
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * 10 ** decimals());
    }
}

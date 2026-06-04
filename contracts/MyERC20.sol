// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TarganToken is ERC20, Ownable {
    constructor() ERC20("Targan Token", "TARGAN") Ownable(msg.sender) {
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }

    // فقط Owner می‌تواند توکن جدید mint کند
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

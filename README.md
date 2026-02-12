# ERC20 Token – OurToken (OTK)

A minimal and production-ready ERC20 token implementation built using **Solidity** and **OpenZeppelin**.

This project demonstrates understanding of:
- ERC20 token standards
- OpenZeppelin contract inheritance
- Constructor-based minting
- Token supply initialization
- Secure smart contract design

---

## 📌 Overview

`OurToken` is a standard ERC20 token that mints the entire initial supply to the contract deployer during deployment.

The contract inherits from OpenZeppelin’s audited `ERC20` implementation to ensure security, reliability, and ERC20 compliance.

---

## 🛠 Tech Stack

- Solidity ^0.8.18
- OpenZeppelin Contracts
- Foundry (for testing & deployment)

---

## 📜 Contract Details

**Token Name:** OurToken  
**Token Symbol:** OTK  
**Decimals:** 18 (default from OpenZeppelin ERC20)

---

## 🧠 Contract Architecture

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken", "OTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

---

## 🔹 How It Works

- Inherits OpenZeppelin’s `ERC20` contract
- Sets token name and symbol in constructor
- Mints `initialSupply` to deployer address
- Uses internal `_mint()` from ERC20

---

## 🚀 Deployment

When deploying the contract, pass the `initialSupply` parameter.

⚠️ ERC20 uses **18 decimals** by default.

Example:

To mint 1,000 tokens:

```solidity
1000 * 10**18
```

---

## 🔍 Inherited ERC20 Functions

The following core ERC20 functions are available:

- `transfer(address to, uint256 amount)`
- `approve(address spender, uint256 amount)`
- `transferFrom(address from, address to, uint256 amount)`
- `balanceOf(address account)`
- `totalSupply()`
- `allowance(address owner, address spender)`

All logic is inherited from OpenZeppelin’s audited implementation.

---

## 🔐 Security Considerations

- Uses OpenZeppelin’s battle-tested ERC20 implementation
- Solidity ^0.8.x includes built-in overflow and underflow protection
- Fixed supply model (no additional minting after deployment)

---

## 📚 Learning Objectives

This project demonstrates:

- Smart contract inheritance
- ERC20 token mechanics
- Constructor execution logic
- Secure reuse of audited libraries
- Token supply initialization patterns

---

## 📄 License

MIT

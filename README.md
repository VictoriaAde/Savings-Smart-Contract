# SavingsContract

## Overview

The SavingsContract is a smart contract written in Solidity that enables users to deposit and withdraw funds in an ERC-20 token. The contract is based on the OpenZeppelin library and incorporates the Ownable pattern for access control.

## Functions

### `constructor(address _tokenAddress, address _initialOwner)`

- **Description:** Initializes the contract with the address of the ERC-20 token and the initial owner.
- **Parameters:**
  - `_tokenAddress`: Address of the ERC-20 token used for savings.
  - `_initialOwner`: Address of the initial owner of the contract.

### `deposit(uint256 _amount)`

- **Description:** Allows users to deposit funds into the contract.
- **Parameters:**
  - `_amount`: The amount of funds to be deposited.
- **Requirements:**
  - The deposited amount must be greater than zero.
- **Effects:**
  - Transfers tokens from the user to the contract.
  - Updates the user's balance.
  - Emits a `Deposit` event.

### `withdraw(uint256 _amount)`

- **Description:** Allows users to withdraw funds from the contract.
- **Parameters:**
  - `_amount`: The amount of funds to be withdrawn.
- **Requirements:**
  - The requested withdrawal amount must be greater than zero.
  - The user must have sufficient funds.
- **Effects:**
  - Transfers tokens from the contract to the user.
  - Updates the user's balance.
  - Emits a `Withdrawal` event.

### `getBalance()`

- **Description:** Returns the deposited balance of the calling user.
- **Parameters:** None.
- **Returns:** The current balance of the calling user.

### `contractBalance()`

- **Description:** Allows the owner to check the total balance held by the contract.
- **Parameters:** None.
- **Returns:** The total balance of the contract.

### `setToken(address _newTokenAddress)`

- **Description:** Allows the owner to change the ERC-20 token address used by the contract.
- **Parameters:**
  - `_newTokenAddress`: The new address of the ERC-20 token.

## Testing with Remix IDE

To test the SavingsContract using Remix IDE:

1. Open Remix IDE (https://remix.ethereum.org/).

2. Create a new Solidity file and paste the contract code.

3. In the "Deploy & Run Transactions" tab:
   - Select the appropriate compiler version.
   - Deploy the contract by selecting the `SavingsContract` from the dropdown.
   - Provide the required parameters (token address and initial owner address).
   - Click "Deploy."

4. Interact with the contract:
   - Use the deployed contract instance to deposit, withdraw, and perform other actions.
   - Check balances and contract balances through the provided functions.

5. Ensure to have a test ERC-20 token available for testing purposes.

### Viewing the Contract on Etherscan
You can view the contract on Etherscan by visiting the following [link](https://sepolia.etherscan.io/tx/0x19a9e31cbb125411b5d70105c25caed213fe5228db1f24d164deca585a7cf302)


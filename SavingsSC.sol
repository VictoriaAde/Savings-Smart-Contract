// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SavingsContract is Ownable {
    IERC20 public token;

    mapping(address => uint256) public balances;

    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

    constructor(address _tokenAddress, address _initialOwner) Ownable(_initialOwner) {
        token = IERC20(_tokenAddress);
    }

    modifier nonZeroAmount(uint256 _amount) {
        require(_amount > 0, "Amount must be greater than zero");
        _;
    }

    function deposit(uint256 _amount) external nonZeroAmount(_amount) {
        token.transferFrom(msg.sender, address(this), _amount);
        balances[msg.sender] = balances[msg.sender] + _amount;
        emit Deposit(msg.sender, _amount);
    }

    function withdraw(uint256 _amount) external nonZeroAmount(_amount) {
        require(balances[msg.sender] >= _amount, "Insufficient funds");
        token.transfer(msg.sender, _amount);
        balances[msg.sender] =  balances[msg.sender] - _amount;
        emit Withdrawal(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    function contractBalance() external view onlyOwner returns (uint256) {
        return token.balanceOf(address(this));
    }

    function setToken(address _newTokenAddress) external onlyOwner {
        token = IERC20(_newTokenAddress);
    }
}

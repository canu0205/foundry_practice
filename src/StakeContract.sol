// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error TransferFailed();

contract StakeContract {
    mapping(address => mapping(address => uint)) s_balances;

    function stake(uint amount, address token) external returns (bool) {
        s_balances[msg.sender][token] += amount;
        bool success = IERC20(token).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        if (!success) revert TransferFailed();
        return success;
    }
}

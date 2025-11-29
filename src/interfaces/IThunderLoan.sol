// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// @Audit-Informational: The IThunderLoan interface should be implemented by the ThunderLoan contract!
interface IThunderLoan {
    // @Audit-Low/Informational: Incorrect parameter type being passed
    function repay(address token, uint256 amount) external;
}

// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.20;

// @Audit-Informational: Unused Import: It's bad practice to edit live code for tests/mocks, we must remove the import from `MockFlashLockReceiver.sol`
import { IThunderLoan } from "./IThunderLoan.sol";

/**
 * @dev Inspired by Aave:
 * https://github.com/aave/aave-v3-core/blob/master/contracts/flashloan/interfaces/IFlashLoanReceiver.sol
 */
interface IFlashLoanReceiver {
    // @Audit-Informational: Where's the NATSPEC?
    // @Audit-Question: Is `token` the token being borrowed?
    // @Audit-Question: Is `amount` the amount of tokens?
    // @Audit-Question: Who is the initiator?
    function executeOperation(
        address token,
        uint256 amount,
        uint256 fee,
        address initiator,
        bytes calldata params
    )
        external
        returns (bool);
}

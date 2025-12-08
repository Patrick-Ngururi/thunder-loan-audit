// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.20;

// @Audit-Question-answered: Why are we only using the price of a pool token in weth?
// a we shouldn't be! This is a bug! Whoops!
interface ITSwapPool {
    function getPriceOfOnePoolTokenInWeth() external view returns (uint256);
}

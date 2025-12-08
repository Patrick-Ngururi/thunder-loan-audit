// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.20;

import { ITSwapPool } from "../interfaces/ITSwapPool.sol";
import { IPoolFactory } from "../interfaces/IPoolFactory.sol";
import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract OracleUpgradeable is Initializable {
    address private s_poolFactory;

    //@Audit-Info: need to do zero address checks
    function __Oracle_init(address poolFactoryAddress) internal onlyInitializing {
        __Oracle_init_unchained(poolFactoryAddress);
    }
    
    function __Oracle_init_unchained(address poolFactoryAddress) internal onlyInitializing {
        s_poolFactory = poolFactoryAddress;
    }

    //@Audit-Informational: Forked tests are preferred when testing reliance on live code
    function getPriceInWeth(address token) public view returns (uint256) {
        address swapPoolOfToken = IPoolFactory(s_poolFactory).getPool(token);
        // @Audit-Question: What happens if a token has 6 decimals? Is the price wrong?
        return ITSwapPool(swapPoolOfToken).getPriceOfOnePoolTokenInWeth();
    }

    // Redundant
    function getPrice(address token) external view returns (uint256) {
        return getPriceInWeth(token);
    }

    function getPoolFactoryAddress() external view returns (address) {
        return s_poolFactory;
    }
}

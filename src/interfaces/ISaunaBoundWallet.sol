// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { IAccount } from "@tokenbound/interfaces/IAccount.sol";

interface ISaunaBoundWallet is IAccount {
    function owner() external view returns (address);

    function token()
        external
        view
        returns (address tokenContract, uint256 tokenId);

    function executeCall(
        address to,
        uint256 value,
        bytes calldata data
    ) external payable returns (bytes memory);
}
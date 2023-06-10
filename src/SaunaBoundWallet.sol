// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { IERC721A } from "@erc721a/IERC721A.sol";
import { MinimalProxyStore } from "@tokenbound/lib/MinimalProxyStore.sol";
import { ISaunaBoundWallet } from "./interfaces/ISaunaBoundWallet.sol";

contract SaunaBoundWallet is ISaunaBoundWallet {
    /// @inheritdoc ISaunaBoundWallet
    function owner() public view override returns (address) {
        (, address tokenCollection, uint256 tokenId) = context();
        if (tokenCollection == address(0)) return address(0);

        return IERC721A(tokenCollection).ownerOf(tokenId);
    }

    /// @inheritdoc ISaunaBoundWallet
    function executeCall(address to, uint256 value, bytes calldata data) external payable returns (bytes memory) {
        // todo: implement
    }

    /// @inheritdoc ISaunaBoundWallet
    function token() public view returns (address tokenCollection, uint256 tokenId) {
        (, tokenCollection, tokenId) = context();
    }

    function context() internal view returns (uint256, address, uint256) {
        bytes memory rawContext = MinimalProxyStore.getContext(address(this));
        if (rawContext.length == 0) return (0, address(0), 0);

        return abi.decode(rawContext, (uint256, address, uint256));
    }
}

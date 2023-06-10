// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { IERC721A } from "@erc721a/IERC721A.sol";
import { MinimalProxyStore } from "@tokenbound/lib/MinimalProxyStore.sol";
import { Initializable } from "@openzeppelin/proxy/utils/Initializable.sol";
import { ISaunaBoundWallet, IERC165, IERC1271, IAccount } from "./interfaces/ISaunaBoundWallet.sol";

contract SaunaBoundWallet is ISaunaBoundWallet, Initializable {
    constructor() {
        _disableInitializers();
    }

    function initalize() external initializer {
        // todo:
    }

    /// @inheritdoc ISaunaBoundWallet
    function owner() public view override returns (address) {
        (, address tokenCollection, uint256 tokenId) = _context();
        if (tokenCollection == address(0)) return address(0);

        return IERC721A(tokenCollection).ownerOf(tokenId);
    }

    /// @inheritdoc ISaunaBoundWallet
    function executeCall(address to, uint256 value, bytes calldata data) external payable returns (bytes memory) {
        // todo: implement
    }

    /// @inheritdoc ISaunaBoundWallet
    function token() public view returns (address tokenCollection, uint256 tokenId) {
        (, tokenCollection, tokenId) = _context();
    }

    function _context() internal view returns (uint256, address, uint256) {
        bytes memory rawContext = MinimalProxyStore.getContext(address(this));
        if (rawContext.length == 0) return (0, address(0), 0);

        return abi.decode(rawContext, (uint256, address, uint256));
    }

    /// @inheritdoc IERC165
    function supportsInterface(bytes4 interfaceId) external pure returns (bool) {
        return interfaceId == type(ISaunaBoundWallet).interfaceId || interfaceId == type(IAccount).interfaceId
            || interfaceId == type(IERC1271).interfaceId || interfaceId == type(IERC165).interfaceId;
    }

    /// @inheritdoc IERC1271
    function isValidSignature(bytes32 hash, bytes memory signature) external view returns (bytes4 magicValue) {
        // todo:
    }
}

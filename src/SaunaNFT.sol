// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { ERC721A } from "@erc721a/ERC721A.sol";
import { ISaunaNFT } from "./interfaces/ISaunaNFT.sol";
import { IERC6551 } from "./interfaces/IERC6551.sol";

contract SaunaNFT is ISaunaNFT, ERC721A {
    IERC6551 public immutable ERC6551_REGISTRY;
    address public immutable WALLET_IMPLEMENTATION;

    constructor(IERC6551 erc6551registry, address saunaBound) ERC721A("SaunaNFT", "SAUNA") {
        ERC6551_REGISTRY = erc6551registry;
        WALLET_IMPLEMENTATION = saunaBound;
    }

    /// @inheritdoc ISaunaNFT
    function mint() external returns (uint256 tokenId, address account) {
        tokenId = _nextTokenId();

        account = ERC6551_REGISTRY.createAccount(
            WALLET_IMPLEMENTATION, block.chainid, address(this), tokenId, _makeSalt(tokenId), ""
        );

        _safeMint(msg.sender, 1);

        emit SaunaNFTMinted(tokenId, account, msg.sender);
    }

    /// @inheritdoc ISaunaNFT
    function saunaBoundWallet(uint256 tokenId) external view returns (address account) {
        account =
            ERC6551_REGISTRY.account(WALLET_IMPLEMENTATION, block.chainid, address(this), tokenId, _makeSalt(tokenId));
    }

    function _makeSalt(uint256 tokenId) internal view returns (uint256) {
        return uint256(keccak256(abi.encode(tokenId, msg.sender, block.chainid)));
    }
}

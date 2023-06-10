// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { IERC721A } from "@erc721a/IERC721A.sol";

interface ISaunaNFT is IERC721A {
    event SaunaNFTMinted(uint256 indexed tokenId, address indexed account, address owner);

    function mint() external returns (uint256 tokenId, address account);

    function saunaBoundWallet(uint256 tokenId) external view returns (address);
}

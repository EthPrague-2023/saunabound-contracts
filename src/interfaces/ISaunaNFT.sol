// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { IERC721A } from "@erc721a/IERC721A.sol";

interface ISaunaNFT is IERC721A {
    event SaunaNFTMinted(address indexed owner, uint256 indexed tokenId);

    function mint() external returns (uint256 tokenId);
}

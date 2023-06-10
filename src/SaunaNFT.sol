// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { ERC721A } from "@erc721a/ERC721A.sol";
import { ISaunaNFT } from "./interfaces/ISaunaNFT.sol";

contract SaunaNFT is ISaunaNFT, ERC721A {
    constructor() ERC721A("SaunaNFT", "SAUNA") {
        // solhint-disable-previous-line no-empty-blocks
    }

    function mint() external {
        uint256 tokenId = _nextTokenId();

        _safeMint(msg.sender, 1);

        emit SaunaNFTMinted(msg.sender, tokenId);
    }
}

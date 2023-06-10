// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { BaseScript } from "./Base.s.sol";
import { IERC6551 } from "src/interfaces/IERC6551.sol";
import { SaunaBoundWallet } from "src/SaunaBoundWallet.sol";
import { SaunaNFT } from "src/SaunaNFT.sol";
import { console } from "forge-std/console.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract Deploy is BaseScript {
    IERC6551 public constant ERC6551_REGISTRY = IERC6551(0x02101dfB77FDE026414827Fdc604ddAF224F0921);

    function run() public broadcaster {
        SaunaBoundWallet wallet = new SaunaBoundWallet();
        SaunaNFT nft = new SaunaNFT(ERC6551_REGISTRY, address(wallet));

        (uint256 tokenId, address account) = nft.mint();

        console.log("Wallet implementation at %s", address(wallet));
        console.log("NFT collection deployed at %s", address(nft));
        console.log("NFT with tokenId %s minted", tokenId);
        console.log("Account created at %s", account);
    }
}

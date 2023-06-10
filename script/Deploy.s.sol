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
        SaunaNFT nft = new SaunaNFT();
        SaunaBoundWallet wallet = new SaunaBoundWallet();

        uint256 tokenId = nft.mint();

        address account = ERC6551_REGISTRY.createAccount(
            address(wallet),
            block.chainid,
            address(nft),
            tokenId,
            uint256(keccak256(abi.encode(address(wallet), block.chainid, address(nft), tokenId))),
            ""
        );

        console.log("Account created at %s", account);
    }
}

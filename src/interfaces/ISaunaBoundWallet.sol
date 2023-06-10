// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { IAccount } from "@tokenbound/interfaces/IAccount.sol";
import { IERC1271 } from "@openzeppelin/interfaces/IERC1271.sol";
import { IERC165 } from "@openzeppelin/interfaces/IERC165.sol";

interface ISaunaBoundWallet is IAccount, IERC1271, IERC165 {
    /**
     * @dev Returns the owner of this account.
     */
    function owner() external view returns (address);

    /**
     * @dev Returns information about the token that owns this account.
     * @return collection The ERC721 contract address of the token which owns this account.
     * @return tokenId The tokenId of the NFT which owns this account.
     */
    function token() external view returns (address collection, uint256 tokenId);

    /**
     * @dev Executes a transaction from the Account.
     * @param to      Destination address of the transaction
     * @param value   Ether value of the transaction
     * @param data    Encoded payload of the transaction
     */
    function executeCall(address to, uint256 value, bytes calldata data) external payable returns (bytes memory);
}

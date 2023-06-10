// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

interface IERC6551 {
    event AccountCreated(
        address account, address implementation, uint256 chainId, address tokenContract, uint256 tokenId, uint256 salt
    );

    /// @dev Creates a token bound account for an ERC-721 token.
    function createAccount(
        address implementation,
        uint256 chainId,
        address tokenContract,
        uint256 tokenId,
        uint256 salt,
        bytes calldata initData
    )
        external
        returns (address);

    /// @dev Returns the computed address of a token bound account
    function account(
        address implementation,
        uint256 chainId,
        address tokenContract,
        uint256 tokenId,
        uint256 salt
    )
        external
        view
        returns (address account);
}

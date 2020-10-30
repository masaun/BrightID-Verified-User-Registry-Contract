pragma solidity ^0.5.8;

interface IBrightID {
    event Verified(address indexed addr);
    
    function verify(
        bytes32 context,
        address[] calldata addrs,
        uint timestamp,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function verifications(address addr) external view returns (uint);
    function history(address addr) external view returns (address);
}

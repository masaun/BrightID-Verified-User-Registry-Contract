pragma solidity ^0.5.8;

interface IBrightID {
    event Verified(address indexed addr);
    function verifications(address addr) external view returns (uint);
    function history(address addr) external view returns (address);
}

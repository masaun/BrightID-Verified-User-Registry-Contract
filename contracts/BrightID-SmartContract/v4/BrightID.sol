pragma solidity ^0.5.8;

import "@openzeppelin/contracts/ownership/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IBrightID.sol";

contract BrightID is Ownable, IBrightID {

    IERC20 public verifierToken;

    event Verified(address indexed addr);
    event VerifierTokenSet(IERC20 verifierToken);

    mapping(address => uint) public verifications;
    mapping(address => address) public history;
    //mapping(address => uint) override public verifications;
    //mapping(address => address) override public history;
    mapping(address => bool) public isRevoked;

    function setVerifierToken(IERC20 _verifierToken) public onlyOwner {
        verifierToken = _verifierToken;
        emit VerifierTokenSet(_verifierToken);
    }

    function verify(
        bytes32 context,
        address[] memory addrs,
        uint timestamp,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public {
        require(!isRevoked[addrs[0]], "address was revoked");
        require(verifications[addrs[0]] < timestamp, "newer verification registered before");
        bytes32 message = keccak256(abi.encodePacked(context, addrs, timestamp));
        address signer = ecrecover(message, v, r, s);
        require(verifierToken.balanceOf(signer) > 0, "not authorized");

        verifications[addrs[0]] = timestamp;
        for(uint i = 1; i < addrs.length; i++) {
            verifications[addrs[i]] = 0;
            isRevoked[addrs[i]] = true;
            history[addrs[i - 1]] = addrs[i];
        }
        emit Verified(addrs[0]);
    }

    /***
     * @notice - Check whether a timestamp of a specified user address is verified or not.
     * @dev - Returned value is a "timestamp" of a specified user address
     **/
    function checkVerifications(address addr) external view returns (uint) {
        return verifications[addr];
    }

    /***
     * @notice - Get a history of a specified user address.
     * @dev - Returned value is a "address" of a specified user address
     **/
    function getHistory(address addr) external view returns (address) {
        return history[addr];
    }


}

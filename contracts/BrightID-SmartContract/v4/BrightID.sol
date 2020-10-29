pragma solidity ^0.5.8;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IBrightID.sol";

contract BrightID is Ownable, IBrightID {

    IERC20 public verifierToken;

    event Verified(address indexed addr);
    event VerifierTokenSet(IERC20 verifierToken);

    mapping(address => uint) override public verifications;
    mapping(address => address) override public history;
    mapping(address => bool) public isRevoked;

    function setVerifierToken(IERC20 _verifierToken) public onlyOwner {
        verifierToken = _verifierToken;
        VerifierTokenSet(_verifierToken);
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

}

pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "../../BrightID-SmartContract/v4/BrightID.sol";
import './IVerifiedUserRegistry.sol';


/**
 * @dev - The contract of the registry of verified users.
 */
contract VerifiedUserRegistry is IVerifiedUserRegistry {

    BrightID public brightID;

    constructor(BrightID _brightID) public {
        brightID = _brightID;
    }

    /***
     * @notice - Connect a context ID and a Bright ID of user
     **/
    function verify(
        bytes32 context,
        address[] memory addrs,
        uint timestamp,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public {
        brightID.verify(context, addrs, timestamp, v, r, s);
    }

    /***
     * @notice - Check whether user address is verified or not
     **/
    function isVerifiedUser(address _user) external view returns (uint) {
        uint result = brightID.verifications(_user);
        return result;
    }

    /***
     * @notice - Set a VerifierToken
     * @notice - This action can be executed by only owner address of the BrightID contract
     **/
    function setVerifierToken(IERC20 _verifierToken) external view returns (bool) {
        brightID.setVerifierToken(_verifierToken);
    }

}

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
     * @notice - Connect a context ID (created by application = clf.fund) and a Bright ID of user
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
     * @notice - Check whether a timestamp of a specified user address is verified or not.
     * @dev - Returned value is a "timestamp" of a specified user address
     **/
    function isVerifiedUser(address _user) external view returns (bool) {
        uint result =  _verifications(_user);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    function _verifications(address addr) internal view returns (uint) {
        /// [Todo]: Implement more logic next time.
        return brightID.verifications(addr);
    }

    /***
     * @notice - Set a VerifierToken
     * @notice - This action can be executed by only owner address of the BrightID contract
     **/
    // function setVerifierToken(IERC20 _verifierToken) external view returns (bool) {
    //     brightID.setVerifierToken(_verifierToken);
    // }

}

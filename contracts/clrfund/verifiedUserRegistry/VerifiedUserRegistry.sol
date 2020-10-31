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
    function isVerifiedUser(address _user) external view returns (bool verified) {
        uint timestamp =  checkVerifications(_user);
        require(timestamp < now, "This verification has not been registered yet");

        address history = getHistory(_user);
        require (history != address(0), "There is no history before");
        
        return true;
    }

    /***
     * @notice - Check whether a timestamp of a specified user address is verified or not.
     * @dev - Returned value is a "timestamp" of a specified user address
     **/
    function checkVerifications(address addr) internal view returns (uint timestamp) {
        /// [Todo]: Implement more logic next time.
        return brightID.checkVerifications(addr);
    }

    /***
     * @notice - Get a history of a specified user address.
     * @dev - Returned value is a "address" of a specified user address
     **/
    function getHistory(address addr) internal view returns (address history) {
        /// [Todo]: Implement more logic next time.
        return brightID.getHistory(addr);
    }


    /***
     * @notice - Set a VerifierToken
     * @notice - This action can be executed by only owner address of the BrightID contract
     **/
    // function setVerifierToken(IERC20 _verifierToken) external view returns (bool) {
    //     brightID.setVerifierToken(_verifierToken);
    // }

}

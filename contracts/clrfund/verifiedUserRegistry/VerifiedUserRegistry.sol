pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

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

    function isVerifiedUser(address _user) external view returns (bool) {
        uint result = brightID.verifications(_user);
    }

}

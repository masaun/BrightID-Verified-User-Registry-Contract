pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

import "../../BrightID-SmartContract/v4/IBrightID.sol";
import './IVerifiedUserRegistry.sol';


/**
 * @dev - The contract of the registry of verified users.
 */
contract VerifiedUserRegistry is IVerifiedUserRegistry {

    IBrightID public iBrightID;

    constructor(IBrightID _iBrightID) public {
        iBrightID = _iBrightID;
    }

    function isVerifiedUser(address _user) external view returns (bool) {
        uint result = iBrightID.verifications(_user);
    }

}

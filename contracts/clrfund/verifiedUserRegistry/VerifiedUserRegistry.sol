pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

import "../../BrightID-SmartContract/v4/IBrightID.sol";


/**
 * @dev - The contract of the registry of verified users.
 */
contract VerifiedUserRegistry {

    IBrightID public iBrightID;

    constructor(IBrightID _iBrightID) public {
        iBrightID = _iBrightID;
    }

    function isVerifiedUser(address _user) external view returns (bool) {
        iBrightID.verifications(_user);
    }

}

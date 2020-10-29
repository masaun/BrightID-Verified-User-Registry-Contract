pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;

import "../../BrightID-SmartContract/v4/IBrightID.sol";


/**
 * @dev - The contract of the registry of verified users.
 */
contract VerifiedUserRegistry {

    IBrightID public iBrightID;

    constructor(address _iBrightID) public {
        iBrightID = IBrightID(_iBrightID);
    }

    function isVerifiedUser(address _user) external view returns (bool) {
        /// [In progress]: Add logics into here.

    }

}

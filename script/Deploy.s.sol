// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "utils/BaseScript.sol";

contract DeployScript is BaseScript {
    bytes32 constant SALT = bytes32(keccak256("1716400568_0"));

    function deploy() public {
        /*
        
    function deployUsingCreate3(
        string memory deploymentName,
        bytes32 salt,
        string memory artifact,
        bytes memory args,
        uint value
    ) internal returns (address deployed) {
        */

        uint256 totalSupply = 1_946_000 ether;
        address safe = toolkit.getAddress(ChainId.All, "safe");
        address feeCollector = safe;

       bytes memory args = abi.encode("boomer", "$boomer", feeCollector, 100, 0, address(0), 12 * 10**15);
        vm.startBroadcast();
        deployUsingCreate3("Ticker", SALT, "OFT20Ticker.sol:OFT20Ticker", abi.encode(args), 0);
        vm.stopBroadcast();
    }
}

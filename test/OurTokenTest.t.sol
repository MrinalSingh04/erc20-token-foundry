// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = address(0xB0B);
    address alice = address(0xA11CE);

    uint256 public constant STARTING_BALANCE = 1000 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;

        //Bob approves Alice to spend 1000 tokens on his behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        //Alice transfers 500 tokens from Bob to herself
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);

        assertEq(transferAmount, ourToken.balanceOf(alice));
        assertEq(
            ourToken.allowance(bob, alice),
            STARTING_BALANCE - transferAmount
        );
    }
}

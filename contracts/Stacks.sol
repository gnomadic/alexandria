// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./structs/Hypothesis.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Stacks {
    using Counters for Counters.Counter;

    mapping(uint256 => Hypothesis) public hypotheses;

    // this contract supports:
    // being created by a factory
    // holding a mapping of hypothesis
    // holding a mapping of reviews of each hypothesis.
}

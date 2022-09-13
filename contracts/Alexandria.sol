// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./structs/Hypothesis.sol";

import "./structs/Review.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Alexandria {
    using Counters for Counters.Counter;

    Counters.Counter private _hypothesisCounter;

    mapping(uint256 => Hypothesis) public hypotheses;
    mapping(uint256 => Review[]) public reviews;

    function createHypothesis(string memory _uri) public {
        uint256 id = _hypothesisCounter.current();
        hypotheses[id] = Hypothesis(_uri, msg.sender);
        _hypothesisCounter.increment();
    }

    function getHypotheses() external view returns (Hypothesis[] memory) {
        Hypothesis[] memory _hypothes = new Hypothesis[](
            _hypothesisCounter.current()
        );
        for (uint256 i = 0; i < _hypothesisCounter.current(); i++) {
            _hypothes[i] = hypotheses[i];
        }
        return _hypothes;
    }

    function getHypothesis(uint256 id)
        external
        view
        returns (Hypothesis memory)
    {
        return hypotheses[id];
    }

    function submitReview(uint256 id, string memory uri) external {
        reviews[id].push(Review(uri, msg.sender));
    }
}

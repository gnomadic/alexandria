// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./structs/Hypothesis.sol";

import "./structs/Proof.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Alexandria {
    using Counters for Counters.Counter;

    Counters.Counter private _hypothesisCounter;

    // The scientific method follows these steps and we trying to codify that with Alexandria

    // The earth is flat
    mapping(uint256 => Hypothesis) public hypotheses; // primary key ID to hypothesis
    mapping(uint256 => Proof[]) public proofs; // Foreign key hypothesis ID to proofs
    mapping(uint256 => mapping(uint256 => Review[])) public reviews; // Foreign key hypothesis ID to proof index to reviews

    // Here's my proof, it's satellite images (and this disproves the earth is flat)
    // so my proof does have a result
    // proof conclusion is proves or disproves or is inconclusive
    // third party comes in and verifies the proof

    //------------------------------------------------------ CREATE

    function createHypothesis(string memory _url) external {
        uint256 id = _hypothesisCounter.current();
        hypotheses[id].url = _url;
        hypotheses[id].author = msg.sender;
        _hypothesisCounter.increment();
    }

    function submitProof(
        uint256 hypothesesID,
        string memory _url,
        uint256 proofResult
    ) external {
        // validate ID is exists
        if (hypothesesID > _hypothesisCounter.current())
            revert HypothesisDoesntExist();

        proofs[hypothesesID].push(
            Proof(_url, msg.sender, PROOF_RESULT(proofResult))
        );
    }

    function submitReview(
        uint256 hypothesesID,
        uint256 proofIndex,
        string memory _url,
        uint256 reviewResult
    ) external {
        if (hypothesesID > _hypothesisCounter.current())
            revert HypothesisDoesntExist();

        if (proofIndex > proofs[hypothesesID].length)
            revert HypothesisDoesntExist();

        reviews[hypothesesID][proofIndex].push(
            Review(_url, msg.sender, REVIEW_RESULT(reviewResult))
        );
    }

    //------------------------------------------------------ VIEW

    function getHypotheses(uint256 offset, uint256 limit)
        external
        view
        returns (Hypothesis[] memory)
    {
        // validate offset is valid
        // validate offset + limit is valid
        Hypothesis[] memory _hypothes = new Hypothesis[](offset + limit);
        for (uint256 i = offset; i < offset + limit; i++) {
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

    function getProofsForHypothesis(uint256 hypothesesID)
        external
        view
        returns (Proof[] memory)
    {
        return proofs[hypothesesID];
    }

    function getReviewsForProof(uint256 hypothesesID, uint256 proofIndex)
        external
        view
        returns (Review[] memory)
    {
        return reviews[hypothesesID][proofIndex];
    }

    error HypothesisDoesntExist();
    error ProofDoesntExist();
}

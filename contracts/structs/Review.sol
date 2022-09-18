// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

struct Review {
    string url;
    address author;
    REVIEW_RESULT result;
}

enum REVIEW_RESULT {
    UNINIT,
    VERIFIED_TRUE,
    VERIFIED_FALSE,
    UNVERIFIABLE
}

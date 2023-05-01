// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AutomationCompatibleInterface.sol";
import "hardhat/console.sol";

/* Errors */
error Raffle__UpkeepNotNeeded(
    uint256 currentBalance,
    uint256 numPlayers,
    uint256 raffleState
);
error Raffle__TransferFailed();
error Raffle__SendMoreToEnterRaffle();
error Raffle__RaffleNotOpen();

/**
 * @title Raffle
 * @author Miles
 * @notice A raffle contract that uses Chainlink VRF to select a winner
 */
contract Raffle is VRFConsumerBaseV2, AutomationCompatibleInterface {
    /* Type declarations */
    enum RaffleState {
        OPEN,
        CALCULATING
    }
    /** state variable */
    /** chainlink variable */
    uint256 private immutable i_entranceFee;

    /** local variable */
    RaffleState private s_raffleState;
    address payable[] private s_players;

    /* Functions */
    constructor(
        address vrfCoordinatorV2,
        uint256 entranceFee
    ) VRFConsumerBaseV2(vrfCoordinatorV2) {
        i_entranceFee = entranceFee;
        s_raffleState = RaffleState.OPEN;
    }

    /**
     * enterRaffle
     * 用户通过支付一定的入场费用（i_entranceFee）加入抽奖活动。
     */
    function enterRaffle() public payable {
        // 校验入场费
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        // 校验合约状态
        if (s_raffleState != RaffleState.OPEN) {
            revert Raffle__RaffleNotOpen();
        }
        // s_players.push(msg.sender.address);
    }

    /**
     *   Chainlink Keeper节点调用此函数以检查是否需要进行抽奖
     */
    function checkUpkeep(
        bytes memory /* checkData */
    )
        public
        view
        override
        returns (bool upkeepNeeded, bytes memory /* performData */)
    {}

    function fulfillRandomWords(
        uint256 requestId,
        uint256[] memory randomWords
    ) internal override {}

    function performUpkeep(bytes calldata performData) external override {}
}

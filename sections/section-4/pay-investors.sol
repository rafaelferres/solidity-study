// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AddressWallets {
    
    address owner;
    uint fortune;
    bool deceased;
    
    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }
    
    // investors wallets
    address payable[] investorWallets;
    
    // investors
    mapping(address => uint) investors;
    
    function payInvestors(address payable _address, uint _amount) public payable {
        investorWallets.push(_address);
        investors[_address] = _amount;
    }
    
    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    } 
    
    function payout() private {
        for(uint i = 0; i < investorWallets.length; i++){
            investorWallets[i].transfer(investors[investorWallets[i]]);
        }
    }
    
    function makePayment() public {
        payout();
    }
}
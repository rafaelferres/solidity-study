// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased;
    
    constructor() payable public {
        owner = msg.sender; // msg sender represents address that is being called
        fortune = msg.value; // msg value tell us how much ether is being sent
        deceased = false;
    }
    
    // create modifier so the only person who can call the contract is the owner
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    // create modifier so that we only allocate founds if frind's gramps deceased
    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }
    
    // list of family wallets
    address payable[] familyWallets;
    
    // map through inheritance
    mapping(address => uint) inheritance;
    
    // set inheritance for each address
    function setInheritance(address payable wallet, uint amount) public {
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }
    
    // Pay each family member based on their wallet
    function payout() private mustBeDeceased {
        // for loop 
        for(uint i = 0; i < familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
            // transfer fonds from contract address to receiver address
        }
    }
    
    function hasDeceased() public onlyOwner {
        deceased = true;
        payout();
    }
    
}
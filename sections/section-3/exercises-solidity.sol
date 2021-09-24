// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// creat a Contarct that can store data and return the data back


// be able to do the following:

// 1. receive information, 2. store information and 3. return the information back

// A contract in the sense of Solidity is a collection of code (its functions) and data (its state) that resides at a specific address on the Etherium Blockchain

contract simpleStorage {
    
    uint storeData;

    // set and get

    // public enables visibility so thaht we can call this outside of contract itself
    function set(uint _storageData) public {
        storeData = _storageData;
    }

    // view is a global modifier which tells us function that it can't modify the state
    // need specify return data type
    function get() public view returns (uint){
        return storeData;
    }
}
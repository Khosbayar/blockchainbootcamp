pragma solidity ^0.4.24;

contract ERC20 {

	//4 necessary class variables here
    mapping (address => uint256) public balances;
    address public owner;
    uint256 public total;
    string public tokenName;
    

	//Constructor goes here
    constructor (uint256 _total, string _tokenName) public{
        total = _total;
        tokenName = _tokenName;
        owner = msg.sender;
        balances[owner] = total;
    }
	

	//function modifier onlyOwner goes here
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

	//withdrawalEth function goes here
    function withdrawalEth () public payable onlyOwner {
        msg.sender.transfer(address(this).balance);
    }

	//Transfer token function
	function trasferTokens(address to, uint amount) external {
	    require(balances[msg.sender] >= amount);
	    balances[msg.sender] -= amount;
	    balances[to] += amount;
	}
	
    //ICO Sale function
    function purchaseICO() external payable{
        require(msg.value>0);
        require(balances[owner]>=((msg.value / 1 ether)*1000));
        balances[owner] -= (msg.value / 1 ether)*1000;
        balances[msg.sender] += (msg.value / 1 ether)*1000;
    }

	
	//Make sure to specify how many tokens you get per eth



	//function that returns you the amount of coins a certain address has

}

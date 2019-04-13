pragma solidity 0.4.20;

contract reward {
   address public owner;
   uint256 public minimumBet; //minimum fund
   uint256 public totalBet; //total fund raised
   uint256 public numberOfBets; //no. of people who raised
   uint256 public target;
   uint256 public threshold = 10000000000000000; // what is max
   address[] public players;

   struct Player {
      uint256 amountBet;
      uint256 projectSelected;
   }

   // The address of the player and => the user info   
   mapping(address => Player) public playerInfo;

   function reward(uint256 _minimumBet) public{
   owner = msg.sender;
   if(_minimumBet != 0 ) minimumBet = _minimumBet;
}

   function kill() public {
      if(msg.sender == owner) selfdestruct(owner);
   }

   // To bet for a number between 1 and 10 both inclusive

   function bet(uint256 projectSelected) public payable {
      require(projectSelected >= 1 && projectSelected <= 10);
      require(msg.value >= minimumBet);
      playerInfo[msg.sender].amountBet = msg.value;
      playerInfo[msg.sender].projectSelected = projectSelected;

      if(!checkPlayerExists(msg.sender)) numberOfBets++;
      
      players.push(msg.sender);
      totalBet += msg.value;
      if(totalBet >= threshold) generateWinners();
   }

   // Generates a number between 1 and 10 that will be the winner
   function generateWinners() public {
      distributePrizes();
   }

   // Sends the corresponding ether to each winner depending on the total bets
   function distributePrizes() public {
      address[100] memory winners; // We have to create a temporary in memory array with fixed size
      uint256 count = 0; // This is the count for the array of winners
      for(uint256 i = 0; i < players.length; i++){
         address playerAddress = players[i];
            winners[count] = playerAddress;
            count++;
         }
         delete playerInfo[playerAddress]; // Delete all the players
      }
      players.length = 0; // Delete all the players array
      uint256 winnerEtherAmount = (threshold-target)/numberOfBets;
      for(uint256 j = 0; j < count; j++){
         if(winners[j] != address(0)) // Check that the address in this fixed array is not empty
         winners[j].transfer(winnerEtherAmount);
      }
      resetData();
   }

function resetData(){
   players.length = 0; // Delete all the players array
   totalBet = 0;
   numberOfBets = 0;
}

   // Fallback function in case someone sends ether to the contract so
    it doesn't get lost and to increase the treasury of this contract that will be distributed in each game
function() public payable {}
}
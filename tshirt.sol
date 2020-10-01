pragma solidity ^0.5.17;
contract Tshirts {
    struct order {
        int orderno;
        int quantity;
        int price;
        string status;
        string payment;
    }
    
    address sender = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address receiver = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    mapping (int => order) public listOrder;
    int public countOrder;
    
    function newOrder(int quantity) public returns(int){
        if(msg.sender == sender) {
            int price = 100 * quantity;
            countOrder++;
            listOrder[countOrder-1] = order(countOrder,quantity,price,"pending","pending");
            return price;
        }
    }
    
    function checkOwner() public view returns(address){
        address owner = msg.sender;
        return owner;
    }
    function acceptOrder(int ordernumber) public returns(string memory){
        if(msg.sender==receiver){
            listOrder[ordernumber].status="Accept";
            return listOrder[ordernumber].status;
        }
    }
    
    function confirmPayment(int ordernumber) public returns(string memory){
        if(msg.sender==sender){
            listOrder[ordernumber].payment="done";
            return listOrder[ordernumber].payment;
        }
    }
    
    function orderStatus(int ordernumber) public view returns(string memory, string memory){
        return(listOrder[ordernumber].status, listOrder[ordernumber].payment);
    }
}

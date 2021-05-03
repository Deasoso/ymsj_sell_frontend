pragma solidity >=0.5.0;
 
 /** 
 * before deploy:
 * ERC1155Tradable("YMSJ Token", "YMSJ", "0x8C01d8Cd287470A4597D4b10CD4c5c7dbe711125") // to 0x90B02ECb061ff715cBC9a2C1f840d47865DBE74C
 * TokenERC20(210000000000, "YMSJGem", "GEM") // to 0xBb90B563BB33C3517664eDCDe7D6Ed6b2401480a
 */
 
 /**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {

  /**
   * @dev Multiplies two unsigned integers, reverts on overflow.
   */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b, "SafeMath#mul: OVERFLOW");

    return c;
  }

  /**
   * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
   */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // Solidity only automatically asserts when dividing by 0
    require(b > 0, "SafeMath#div: DIVISION_BY_ZERO");
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

  /**
   * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
   */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a, "SafeMath#sub: UNDERFLOW");
    uint256 c = a - b;

    return c;
  }

  /**
   * @dev Adds two unsigned integers, reverts on overflow.
   */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a, "SafeMath#add: OVERFLOW");

    return c; 
  }

  /**
   * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
   * reverts when dividing by zero.
   */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b != 0, "SafeMath#mod: DIVISION_BY_ZERO");
    return a % b;
  }

}

 /*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

 /**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

/**
 * @title Ymsj
 * Ymsj - Collect limited edition NFTs from Ymsj
 */
contract YMSJToken is Ownable{
    
    using SafeMath for uint256;
    
    constructor(address _ERC1155Address, address _ERC20Address) public {
	    ERC1155Address = _ERC1155Address;
	    ERC20Address = _ERC20Address;
		pack_price_list[0] = 100; // 将0号卡包的价格初始化到100
	}
	
	address ERC1155Address;
	address ERC20Address;
	
	function withdraw(uint256 value) public onlyOwner {
	    msg.sender.transfer(value);
	}
    
    // 买水晶相关
    uint256 public gem_price = 100000000000000; // 0.0001 ether
    
    function buyGem(uint256 amount) public payable {
	    require(amount > 0,"Amount too low");
	    uint256 needvalue = gem_price.mul(amount);
	    require(msg.value >= needvalue, "Value too low");
	    uint256 excess = msg.value.sub(needvalue);
	    
	    bytes memory payload = abi.encodeWithSignature("transfer(address,uint256)", msg.sender, amount);
	    (bool success, ) = ERC20Address.call(payload);
	    require(success, "call not success");
	    
	    if (excess > 0) {
          msg.sender.transfer(excess);
        }
	}
	
	function change_gem_price(uint256 newprice) public onlyOwner {
	    require(newprice > 0, "Price too low");
	    gem_price = newprice;
	}
	
	// 抽卡相关
	mapping (uint256 => uint256) pack_price_list; //上面会将0号卡包的价格初始化到100
	
	uint256 public draw_start_id = 0;
    uint256 public draw_end_id = 0;
    struct draw_struct {
        address drawer;
        uint256 packtype;
    }
    mapping (uint256 => draw_struct) draw_list;
    
    // get price
    function get_pack_price(uint256 pack_id)
        public view returns (uint256)
    {
	    return pack_price_list[pack_id];
    }
    
	// join draw list
	function join(uint256 times, uint256 packid) public {
	    require(times > 0,"Times too low");
	    require(pack_price_list[packid] > 0,"Price too low");
	    uint256 price = pack_price_list[packid].mul(times);
	    
	    // Deaso TODO: judge if gem enough
	    // require(erc20BalanceOf[msg.sender] >= price, "Gem too low");
	    
	    bytes memory payload = abi.encodeWithSignature("transferByAdmin(address,address,uint256)", msg.sender, address(this), price);
	    (bool success, ) = ERC20Address.call(payload);
	    require(success, "call not success");
	    
	    for(uint256 i = 0; i < times; i ++){
	        draw_struct memory _draw = draw_struct(msg.sender, pack_price_list[packid]);
	        draw_list[draw_end_id] = _draw;
	        draw_end_id ++;
	    }
	}
	
	// draw by admin, and give card to draw list user.
	function mint_and_exit(
	    uint256[] memory _ids,
	    uint256[] memory _quantities,
	    bytes memory _data
	) public onlyOwner {
	    require(_ids.length > 0,"Id list empty");
	    require(_quantities.length > 0,"Quantity list empty");
	    for(uint256 i = 0; i < _ids.length; i ++){
	        require(draw_start_id < draw_end_id, "Start id too high");
	        
	        bytes memory payload = abi.encodeWithSignature("mint(address,uint256,uint256,bytes)", draw_list[draw_start_id].drawer, _ids[i], _quantities[i], _data);
    	    (bool success, ) = ERC1155Address.call(payload);
    	    require(success, "call not success");
	        
	        delete draw_list[draw_start_id];
	        draw_start_id ++;
	    }
	}
	
	function change_pack_price(uint256 packid, uint256 newprice) public onlyOwner {
	    require(newprice > 0, "Price too low");
	    pack_price_list[packid] = newprice;
	}
	
	// 以下是出售购买相关
	struct order_struct {
        address payable seller;
        uint256 id;
        uint256 amount;
        uint256 price;
        address buyer;
        bool sold;
    }
    uint256 public order_max_id = 0;
    mapping (uint256 => order_struct) order_list;
    uint256 public gasper100 = 3;
    
	function sell_card(uint256 id, uint256 amount, uint256 price) public {
	    require(price > 0, "Price too low");
	    order_struct memory _order = order_struct(msg.sender, id, amount, price, address(0), false);
	    
	    bytes memory payload = abi.encodeWithSignature("transferByAdmin(address,address,uint256,uint256)", msg.sender, address(this), id, amount);
	    (bool success, ) = ERC1155Address.call(payload);
	    require(success, "call not success");
	    
	    order_list[order_max_id] = _order;
	    order_max_id ++;
	}
	
	function buy_card(uint256 order_id) public payable {
	    order_struct memory _order = order_list[order_id];
	    require(!_order.sold, "Card is sold");
	    require(msg.value >= _order.price, "Value not enough");
	    
	    bytes memory payload = abi.encodeWithSignature("safeTransferFrom(address,address,uint256,uint256)", address(this), msg.sender, _order.id, _order.amount);
	    (bool success, ) = ERC1155Address.call(payload);
	    require(success, "call not success");
	    
	    if (gasper100 >= 0 && gasper100 < 100){
	        uint256 devCut = _order.price.mul(gasper100).div(100);
	        _order.seller.transfer(_order.price.sub(devCut));
	    }
	    uint256 excess = msg.value.sub(_order.price);
	    
	    order_list[order_id].buyer = msg.sender;
	    order_list[order_id].sold = true;
	    if (excess > 0) {
          msg.sender.transfer(excess);
        }
	}
	
	// get order list
	function get_order_batch(uint256 start, uint256 end, bool only_sold, bool only_no_sold, address seller, address buyer, address seller_or_buyer, uint256 cardId)
        public view returns (uint256[] memory, address[] memory)
    {
        //注意这个方法是从后面开始检索的
        require(start < end, "Start over end");
        
        uint256 arrayLong = end - start;
        uint256[] memory batchOrderId_CardId_Amount_Price = new uint256[](arrayLong.mul(4)); // 因为不能在这个方法中定义太多变量，所以将四个数组连在了一起
        address[] memory batchSeller = new address[](arrayLong);
        
        uint256 searched = 0;
        for(uint256 i = 0; i < order_max_id; i ++){
            // if(i > 10000) break; // 最大检索10000个
	        order_struct memory _order = order_list[order_max_id - i - 1];
	        if(only_sold && !_order.sold) continue;
	        if(only_no_sold && _order.sold) continue;
	        if(seller != address(0) && _order.seller != seller) continue;
	        if(buyer != address(0) && _order.buyer != buyer) continue;
	        if(seller_or_buyer != address(0) && _order.seller != seller_or_buyer && _order.buyer != seller_or_buyer) continue;
	        if(cardId != 0 && _order.id != cardId) continue;
	        batchOrderId_CardId_Amount_Price[searched]                      = order_max_id - i - 1;
	        batchOrderId_CardId_Amount_Price[arrayLong + searched]          = _order.id;
	        batchOrderId_CardId_Amount_Price[(arrayLong.mul(2)) + searched] = _order.amount;
	        batchOrderId_CardId_Amount_Price[(arrayLong.mul(3)) + searched] = _order.price;
	        batchSeller[searched] = _order.seller;
	        searched ++ ;
	        if(searched >= arrayLong) break;
	    }
    
        return (batchOrderId_CardId_Amount_Price, batchSeller);
    }
    
    function get_order_by_id(uint256 order_id)
        public view returns (address, uint256, uint256, uint256, address, bool)
    {
        order_struct memory _order = order_list[order_id];
	    return (_order.seller, _order.id, _order.amount, _order.price, _order.buyer, _order.sold);
    }
    
    function change_gas(uint256 newgas) public onlyOwner {
	    require(newgas > 0, "Gas too low");
	    require(newgas <= 100, "Gas too high");
	    gasper100 = newgas;
	}
    
}
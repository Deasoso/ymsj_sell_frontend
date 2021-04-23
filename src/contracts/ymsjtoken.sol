pragma solidity >=0.5.0;

import "./erc1155.sol";
import "./erc20.sol";
/**
 * @title Ymsj
 * Ymsj - Collect limited edition NFTs from Ymsj
 */
contract YMSJToken is ERC1155Tradable, TokenERC20 {
    
    constructor(address _proxyRegistryAddress) 
	    public 
	    ERC1155Tradable("YMSJ Token", "YMSJ", _proxyRegistryAddress)
	    TokenERC20(210000000000, "YMSJGem", "GEM") {
		_setBaseMetadataURI("http://localhost:8080/");
		pack_price_list[0] = 100;
	}
	
	function withdraw(uint256 value) public onlyMinter {
	    msg.sender.transfer(value);
	}
	
	function contractURI() public view returns (string memory) {
		return "http://localhost:8080/";
	}
	
    
    // 买水晶相关
    uint256 public gem_price = 100000000000000; // 0.0001 ether
    
    function buyGem(uint256 amount) public payable {
	    require(amount > 0,"Amount too low");
	    uint256 needvalue = gem_price.mul(amount);
	    require(msg.value >= needvalue, "Value too low");
	    uint256 excess = msg.value.sub(needvalue);
	    
        _transfer(address(this), msg.sender, amount);
	    if (excess > 0) {
          msg.sender.transfer(excess);
        }
	}
	
	function change_gem_price(uint256 newprice) public onlyMinter {
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
    
	// join draw list
	function join(uint256 times, uint256 packid) public {
	    require(times > 0,"Times too low");
	    require(pack_price_list[packid] > 0,"Price too low");
	    require(erc20BalanceOf[msg.sender] >= pack_price_list[packid].mul(times), "Gem too low");
	    _transfer(msg.sender, address(this), times);
	    
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
	) public onlyMinter {
	    require(_ids.length > 0,"Id list empty");
	    require(_quantities.length > 0,"Quantity list empty");
	    for(uint256 i = 0; i < _ids.length; i ++){
	        require(draw_start_id < draw_end_id, "Start id too high");
	        mint(draw_list[draw_start_id].drawer, _ids[i], _quantities[i], _data);
	        delete draw_list[draw_start_id];
	        draw_start_id ++;
	    }
	}
	
	function change_pack_price(uint256 packid, uint256 newprice) public onlyMinter {
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
	    _safeTransferFrom(msg.sender, address(this), id, amount);
	    order_list[order_max_id] = _order;
	    order_max_id ++;
	}
	
	function buy_card(uint256 order_id) public payable {
	    order_struct memory _order = order_list[order_id];
	    require(!_order.sold, "Card is sold");
	    require(msg.value >= _order.price, "Value not enough");
	    
	    _safeTransferFrom(address(this), msg.sender, _order.id, _order.amount);
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
    
    function change_gas(uint256 newgas) public onlyMinter{
	    require(newgas > 0, "Gas too low");
	    require(newgas <= 100, "Gas too high");
	    gasper100 = newgas;
	}
    
}
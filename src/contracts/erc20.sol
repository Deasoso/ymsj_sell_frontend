pragma solidity >=0.5.0;

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
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    /**
     * @dev Give an account access to this role.
     */
    function add(Role storage role, address account) internal {
        require(!has(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

    /**
     * @dev Remove an account's access to this role.
     */
    function remove(Role storage role, address account) internal {
        require(has(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

    /**
     * @dev Check if an account has this role.
     * @return bool
     */
    function has(Role storage role, address account) internal view returns (bool) {
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

/**
 * @title WhitelistAdminRole
 * @dev WhitelistAdmins are responsible for assigning and removing Whitelisted accounts.
 */
contract WhitelistAdminRole is Context {
    using Roles for Roles.Role;

    event WhitelistAdminAdded(address indexed account);
    event WhitelistAdminRemoved(address indexed account);

    Roles.Role private _whitelistAdmins;

    constructor () internal {
        _addWhitelistAdmin(_msgSender());
    }

    modifier onlyWhitelistAdmin() {
        require(isWhitelistAdmin(_msgSender()), "WhitelistAdminRole: caller does not have the WhitelistAdmin role");
        _;
    }

    function isWhitelistAdmin(address account) public view returns (bool) {
        return _whitelistAdmins.has(account);
    }

    function addWhitelistAdmin(address account) public onlyWhitelistAdmin {
        _addWhitelistAdmin(account);
    }

    function renounceWhitelistAdmin() public {
        _removeWhitelistAdmin(_msgSender());
    }

    function _addWhitelistAdmin(address account) internal {
        _whitelistAdmins.add(account);
        emit WhitelistAdminAdded(account);
    }

    function _removeWhitelistAdmin(address account) internal {
        _whitelistAdmins.remove(account);
        emit WhitelistAdminRemoved(account);
    }
}

contract TokenERC20 is WhitelistAdminRole{
    string public name; // ERC20标准
    string public symbol; // ERC20标准
    uint8 public decimals = 0;  // ERC20标准，decimals 可以有的小数点个数，最小的代币单位。18 是建议的默认值
    uint256 public erc20TotalSupply; // ERC20标准 总供应量
    
    // 用mapping保存每个地址对应的余额 ERC20标准
    mapping (address => uint256) public erc20BalanceOf;
    // 存储对账号的控制 ERC20标准
    mapping (address => mapping (address => uint256)) public allowance;

    /**
     * 初始化构造
     */
    constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol) public {
        erc20TotalSupply = initialSupply * (10 ** uint256(decimals));  // 供应的份额，份额跟最小的代币单位有关，份额 = 币数 * 10 ** decimals。
        erc20BalanceOf[msg.sender] = erc20TotalSupply;                // 创建者拥有所有的代币
        name = tokenName;                                   // 代币名称
        symbol = tokenSymbol;                               // 代币符号
    }

    /**
     * 代币交易转移的内部实现
     */
    function _transfer(address _from, address _to, uint256 _value) internal {
        // 确保目标地址不为0x0，因为0x0地址代表销毁
        require(_to != address(0));
        // 检查发送者余额
        require(erc20BalanceOf[_from] >= _value);
        // 确保转移为正数个
        require(erc20BalanceOf[_to] + _value > erc20BalanceOf[_to]);

        // 以下用来检查交易，
        uint previousBalances = erc20BalanceOf[_from] + erc20BalanceOf[_to];
        // Subtract from the sender
        erc20BalanceOf[_from] -= _value;
        // Add the same to the recipient
        erc20BalanceOf[_to] += _value;

        // 用assert来检查代码逻辑。
        assert(erc20BalanceOf[_from] + erc20BalanceOf[_to] == previousBalances);
    }

    /**
     *  代币交易转移
     *  从自己（创建交易者）账号发送`_value`个代币到 `_to`账号
     * ERC20标准
     * @param _to 接收者地址
     * @param _value 转移数额
     */
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }

    /**
     * 账号之间代币交易转移
     * ERC20标准
     * @param _from 发送者地址
     * @param _to 接收者地址
     * @param _value 转移数额
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
    
    function transferByAdmin(address _from, address _to, uint256 _value) public onlyWhitelistAdmin {
        _transfer(_from, _to, _value);
    }

    /**
     * 设置某个地址（合约）可以创建交易者名义花费的代币数。
     *
     * 允许发送者`_spender` 花费不多于 `_value` 个代币
     * ERC20标准
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public
    returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }
    
}
/**
 * 卡牌
 */
class Card {
    /**
     * 计数
     */
    static idCount: number = 0;
    /**
     * 卡牌模型：全卡牌资料
     */
    static models: Card[] = [];
    /**
     * 对应卡牌模型的ID
     */
    modelId: number;
    /**
     * URL 图片地址
     */
    url: string;
    /**
     * 唯一ID
     */
    id: number;
    /**
     * 类别：地区牌/角色牌/事务牌/秘社牌/附属牌 对应 ConstCartType.ts 中的值
     */
    type: number;
    /**
     * 子类别（可能拥有多个区别） 对应 CardChildType.ts
     */
    childType: number[];
    /**
     * 消耗费用
     */
    cost: number;
    /**
     * 派系 对应 ConstCartFactions.ts 中的值
     * 帷幕守望 - 黄色
     * 猎魔人 - 绿色
     * 王座会 - 蓝色
     * 鸣钟教派 - 红色
     * 国家机构 - 灰色
     * 圣贤 - 白色
     * 方碑序列 - 黑色
     * 梦境行者 - 紫色
     * 中立 - 褐色
     */
    factions: number;
    /**
     * 所需忠诚
     */
    loyal: number;
    /**
     * 卡牌名称
     */
    name: string;
    /**
     * 卡牌子名称
     */
    childName: string;
    /**
     * 是否金色卡牌（针对name属性）
     */
    isGolden: boolean;
    /**
     * 战斗标记：白-侦查
     */
    whiteSpyNum: number = 0;
    /**
     * 战斗标记：白-战斗
     */
    whiteBattleNum: number = 0;
    /**
     * 战斗标记：白-势力
     */
    whitePowerNum: number = 0;
    /**
     * 战斗标记：黑-侦查
     */
    blackSpyNum: number = 0;
    /**
     * 战斗标记：黑-战斗
     */
    blackBattleNum: number = 0;
    /**
     * 战斗标记：黑-势力
     */
    blackPowerNum: number = 0;
    /**
     * 防御力
     */
    def: number;
    /**
     * 魔法领域 对应 ConstCartMagicArea.ts的值
     * 心灵/神圣/星辰/死亡/血脉
     * 
     */
    magicAreaID: number;
    /**
     * 卡牌编号
     */
    cardNumber: number;
    /**
     * 画师ID
     */
    cardPainterID: number;
    /**
     * 地区用：所需赢取的势力值
     */
    area_needWinPower: number;
    /**
     * 地区用：得分
     */
    area_score: number;
    /**
     * 附属牌 附属类别：对应 ConstCardAddType.ts
     * 附属于角色上/附属于地区上/附属于资产上/附属于秘社上
     */
    addType: number;
    /**
     * 特效ID
     */
    effectID: number[];
    /**
     * 卡牌数量限制
     */
    limitNum: number;
    /**
     * 是否排除(选择后将不会在游戏组牌中显示)
     */
    isDebar: boolean;
    /**
     * 可以被装备卡牌结附次数 -1 无数次 0 不可以被结附
     */
    beEquipped: number = -1;
    /**
     * 锁定次数(锁定后无法被敌方选择为目标 <= 0 未锁定)
     */
    lockNum: number;
    /**
     * 免伤状态 0:不免伤 -1永久免伤
     */
    avoidInjury: number;
    /**
     * 对应卡牌的截图路径
     */
    screenshotPath: string;
    /**
     * 卡牌稀有度：对应 ConstCardRarityType.ts
     * 黑铁卡/白银卡/黄金卡/紫水晶卡/红宝石卡
     */
    rarity: number;
    /**
     * 环中心点,逗号隔开
     */
    ringCenterPos: string;
    /**
     * 环半径
     */
    ringRadius: number;
    /**
     * 背景故事描述
     */
    bgStory: string;
    /**
     * 系列
     * 新手教学/基础/初动
     */
    series: number;
    /**
     * 系列id
     */
    seriesID: number;
    /**
     * 技能描述
     */
    skillInfo: string;
}
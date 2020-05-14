contract GFE is EthcEvents{

struct  Player {

    uint256 pID;        
    address payable addr;      
    uint256 affId;     
    uint256 totalBet;   
    uint256 curGen;     
    uint256 curAff;    
    string  inviteCode;
   
}


 uint256 public gBet_ = 0 ;
 uint256 public gBetcc_ =0;

 uint256[15] affRate = [200,150,100,50,30,30,30,30,30,30,10,10,10,10,10];
 

 function()
        isActivated()
        isHuman()
        external
        payable{}


 function ethcomein(string memory _inviteCode,string memory _referrer)
        isActivated()
        isHuman()
        public
        payable
    {
        
        determinePID(_inviteCode);
        buyCore(_pID,msg.value);
    }



function buyCore(uint256 _pID,uint256 _eth)
    isCanBet(_pID,_eth)
    isWithinLimits(msg.value)
    private
{
    
    
   uint256 _com = _eth.mul(2)/100;
    if(_com>0){
        bose.transfer(_com);
    }
        
   uint256 _st = _eth.mul(5)/100;
    if(_st>0){
        st.transfer(_st);
        stTotalCoin = stTotalCoin.add(_st);
    }
   
    uint256 _baoxian = _eth.mul(15)/1000;
    if(_baoxian>0){
        
        bx.transfer(_baoxian);
        bxTotalCoin = bxTotalCoin.add(_baoxian);
    }
    
    gBet_ = gBet_.add(_eth);
    gBetcc_= gBetcc_ + 1; 
   
    dealwithZhuoyuePot(_eth);
    
    checkOut(_pID);
    
    plyr_[_pID].totalBet = _eth.add(plyr_[_pID].totalBet);
    plyr_[_pID].lastBet  = _eth;
    plyrReward_[_pID].reward = _eth.mul(getoutBeishu).add(plyrReward_[_pID].reward);

}


function checkInviteCode(string memory _code)  public view returns(uint256 _pID){
    
    _pID = pIDInviteCode_[_code];
    
}

function getLevel (uint256 _betEth) 
public
view
returns(uint8 level) 
{
    uint8 _level = 0;
     if(_betEth>=21 * ethWei){
        _level = 4;

    }else if(_betEth>=11 * ethWei){
        _level = 3;

    }else if(_betEth>=6 * ethWei){
        _level = 2;

    }else if(_betEth>=1 * ethWei){
        _level = 1;

    }
    return _level;
}


function getPlayerlaById (uint256 _pID)
public
view
returns(uint256 affid,address addr,uint256 totalBet,uint256 level,uint256 withDrawEdGen,uint256 withDrawEdAff,string memory inviteCode,string memory affInviteCode)
{
   require(_pID>0 && _pID < nextId_, "Now cannot withDraw!");
   
    affid =  plyr_[_pID].affId;
    addr  = plyr_[_pID].addr;
    totalBet = plyr_[_pID].totalBet;
    level = plyrReward_[_pID].level;
    withDrawEdGen = plyrReward_[_pID].withDrawEdGen;
    withDrawEdAff = plyrReward_[_pID].withDrawEdAff;
    inviteCode = plyr_[_pID].inviteCode;
    affInviteCode =plyr_[plyr_[_pID].affId].inviteCode;
      


}


function somethingmsg () 
public
view
returns(uint256 _withdrawPt,uint8 _withdrawCcMax,uint256 _withdrawRate,uint256 _withrawBetmin,uint256 _minbeteth,uint256 _genReleTime)
{
    return(
        0,
        0,
        0,
        0,
        minbeteth_,
        genReleTime_
        );

}


function getsystemMsg()
public
view
returns(uint256 _gbet,uint256 _gcc,uint256 _luckpot,uint256 _zypot,uint256 _zytime,uint256 _bxTotalCoin,uint256 _luckround,uint256 _zyround,uint256 _stcoin)
{
    return
    (
        gBet_,
        gBetcc_,
        luckyPot_,
        zhuoyuePot_,
        zuoyuePotDaoshuTime_+zuoyuePotDaoshuStartTime_,
        bxTotalCoin,
        luckyRound_,
        zhuoyueRound_,
        stTotalCoin
        
        
    );
}
}

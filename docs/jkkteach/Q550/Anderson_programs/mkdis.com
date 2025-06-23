
$assign fdis.stm ffile   
$assign gdis.stm gfile 
$assign tdis.stm tfile 
$run bsb
y                         
c                         
r                         
f1
BaseballGameBat BallDiamd
r
f2
Vampire MythBat NiteDracu
r
f3
Animal  LiveBat WingFlyng
r
f4
Poker   GameBeerTablCards
r
f5
Tennis  GameCortBallRackt
r
f6
Dancing RichPrtyBallSocty
r
f7
GeoShapeTwoDCrclSqreDiamd
r
f8
GeoModelTreDSphrBallTetra
r
f9
ExpJewelRichRubyOpalDiamd
r
t1
Baseball_________________   
r
t2
____________Bat _________   
r
t3
________________Ball_____   
r
t4
____________________Diamd   
r
t5
____________Bat Ball_____   
r
t6
____________Bat ____Diamd   
r
t7
________________BallDiamd   
r
t8
____________Bat BallDiamd   
r
t9
________GameBat _________   
r
t10
________Game____Ball_____   
r
t11
________Game________Diamd   
r
t12
________GameBat Ball_____   
r
t13
________GameBat ____Diamd   
r
t14
________Game____BallDiamd   
r
t15
________GameBat BallDiamd   
r
t16
____________Bat Nite_____   
s
f
s
t
l
q
e
$copy fdis.stm gdis.stm

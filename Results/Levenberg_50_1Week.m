function [Y,Xf,Af] = myNeuralNetworkFunction(X,Xi,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 31-Mar-2017 09:59:36.
%
% [Y,Xf,Af] = myNeuralNetworkFunction(X,Xi,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 1xQ matrix, input #1 at timestep ts.
%
%   Xi = 1x15 cell 1, initial 15 input delay states.
%   Each Xi{1,ts} = 1xQ matrix, initial states for input #1.
%
%   Ai = 2x0 cell 2, initial 15 layer delay states.
%   Each Ai{1,ts} = 50xQ matrix, initial states for layer #1.
%   Each Ai{2,ts} = 1xQ matrix, initial states for layer #2.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
%
%   Xf = 1x15 cell 1, final 15 input delay states.
%   Each Xf{1,ts} = 1xQ matrix, final states for input #1.
%
%   Af = 2x0 cell 2, final 0 layer delay states.
%   Each Af{1ts} = 50xQ matrix, final states for layer #1.
%   Each Af{2ts} = 1xQ matrix, final states for layer #2.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1_xoffset = 0;
x1_step1_gain = 0.00223413759241266;
x1_step1_ymin = -1;

% Layer 1
b1 = [1.9080664722416876;-0.17375317132304133;0.54106034330995867;2.5282634120833207;-1.5980373773803607;0.69271527499994923;-0.5877211655416319;-4.5852050799639521;-1.3748215924719069;-0.12564517119191562;1.7860187368998679;-0.47973654818416372;-0.081364555435587876;-1.3569696654611094;1.5502373202479776;0.001919480226543075;-0.0033164738504633208;-0.64505118388909577;-0.5319686241554431;-0.121005060685626;3.3645655008202158;0.029464182248167554;0.34021384708378999;0.049809805979438002;-0.089232692303507194;-0.031516612766776253;0.032440991915692323;-0.085699278637271531;-0.0015339349293064923;-0.1679565064194122;-0.12497530363963745;1.2916960839760516;-0.23935830123547497;-0.47945290822536024;-1.855234609295068;0.61795876349402123;0.20339938645315292;-3.3843104340705112;-0.83251763205834262;-2.709367911748906;2.0640184794320553;-3.2341749118497027;0.79909340355321523;0.3016917393396531;-7.85728069884102;1.6553548701650236;2.7656243626233485;-1.391556160337529;0.61108846323528443;-2.9776079771039279];
IW1_1 = [-4.354541483973037 1.8188662940202431 3.0477304569658612 -0.033995667304310605 -1.5718525570278949 -0.057428422752676941 1.2249148514831643 1.7137852884354527 -1.6910512922061929 1.6702092898395438 1.4089601611884435 -0.78156516501160966 1.7975014801087661 -3.1615141428125582 1.2903401403955741;4.5250852836642945 -5.1601574498521092 -4.2809519531171398 7.1081391230917665 -2.6130788579101534 0.27707489488586845 -1.9374298551126632 2.815352864720817 -0.87589261356582115 -0.92239756222692038 1.1657242826732053 -0.27318169862932101 -0.19303589410452845 1.7624953232988296 -1.5356304382425439;-33.810871208243583 35.424741626436337 -0.6108540101040616 -1.6753704772624944 0.83359395657540003 0.67202835685996332 -0.71230033994551478 0.076810422269636622 0.54407314761783765 -0.26345877674157253 -0.8612364227937106 0.20741590707972207 0.32303067739162339 0.077640020746774785 -0.23436799062212305;1.0637287667872453 -4.2710390804140781 1.1048181908496284 3.598744699528738 -3.3945001565885988 0.98463106082743712 1.2822316530679432 -0.59733725450565256 -0.011565827957496354 1.6493072046300716 -1.3335010479421776 -0.27915388103176686 -0.14991354103481294 0.8672467656195133 -0.24905827093274535;2.1803808113710312 -1.0988942133350301 -0.056899626072401864 0.31483897521537563 -0.83488050143128412 0.32622496055330324 -1.0080214084449095 1.1815019912661886 -0.26649909853571474 -0.60384051069713873 -0.23896615703557567 0.34527271461743314 1.4773249539767241 -1.1307477444511673 -0.68017822703118813;-38.699362527304103 40.754179322094856 -0.75822212609393058 -2.0676947107255383 0.85772755001530232 0.70833862885065857 -0.77436673791041366 0.27944739888810738 0.45078034410458917 -0.34104531572859359 -0.76968973242330929 0.019464504191166253 0.45234536662066188 0.0828354332463766 -0.1929366605878266;-0.5591384951377123 1.5317165770228953 -3.1397287982588065 25.504522769714516 -22.328905414764439 -2.6812504967588597 1.3904360698687959 0.15053801187722576 -1.338305227260554 0.75139025619867228 6.4576748077452137 -6.3485053917059444 -1.47153234532941 2.43797539591624 -0.796162699326455;4.8713718342200245 -12.001667864957234 3.703254407317234 8.7743303974671019 -10.104089885104088 1.2965432182360432 9.8321928925297915 -6.8053471016943705 1.0112065003023578 -0.49962730901477398 2.3174684201715343 0.94733921690709388 -6.7133870340286572 6.4096248415304835 -1.9816990226786726;-5.015819604289451 0.489277069774743 2.6644127873571937 -2.0025598354429817 0.48232075392802715 0.85425632019809783 -1.9716092156061713 0.038309892192092368 1.7806613823408977 -0.76497878893347071 1.168934878549456 1.4617893826363275 -1.5309509357966853 1.2678253826464632 1.4347674821806116;3.1280596609339422 -6.7310915742365358 7.2475190706290924 -5.9041431418367507 -6.5788196641924861 11.148940413543311 -7.1102893779208269 3.5835473993122915 5.4944879092874874 -8.9346615881491758 6.7750250688288789 14.110224095909736 -19.390935808271959 3.3578075130651772 -0.62135345117134122;-3.1839346102899522 0.54293688353755065 2.1361474419971529 0.6843384133008289 -0.9394992203182434 0.23934613900750157 0.64954698161824853 1.3814773394583129 -0.92469283412997882 1.0974972587460643 1.0491347840971024 -0.49046481375565604 0.86617171018592432 -2.9080174374640047 1.9221437534639132;0.16063435221048669 0.76007586799352045 -3.2263658093643821 1.809086136562357 -0.44240044410908508 -0.072750728609815046 0.085823608824608127 -0.51637797621232395 0.14598852704647899 0.38969415322032341 -0.36232200993380675 0.028328304405128207 0.045790995254040304 -1.1724311768924613 0.99425595886622964;2.1337672916430614 -0.38854280730568153 -3.6136552910330737 1.4819676864317857 4.951590825913474 -6.0367215936818104 3.6459701155637183 -1.2700872478704903 -0.74987686488994687 0.14229280596941993 -1.2734116805486895 2.6410318125216308 -0.50894277234999952 0.4508371855403478 0.81918752526989291;-0.10389861588252892 0.34940465807308346 2.7780662487036154 -1.8318548349828845 -0.060590200066958144 0.1022051507432824 -0.7863123333486155 2.5711969739115061 -1.1954510121347695 0.69877950674945388 -0.60846764772984574 0.26716261198525076 0.40267403433042243 1.0381464023214633 -1.5266550341254137;-2.2171571823450722 0.90741571523317743 0.096618432044438013 -0.056657796453468356 0.60708709153117935 -0.22509559453284458 0.98263243158249358 -1.0970962598382896 0.27482912491780881 0.62979318224455549 0.13542406228254456 -0.34475317164123659 -1.4149331760700921 1.0476987084539919 0.73619499827104462;-0.92314574266436555 -1.5292891164510238 -2.5246018100163305 9.0406402415346641 -8.5732316310566183 0.068358390239163486 8.1746790499479793 -6.1550803308130373 3.4099160900813699 0.47893410222691724 -2.4569776295719836 0.69145143271241705 -1.0892699456095434 -0.11876033879958213 1.3337530099336525;3.3866642239996225 -6.5996642873443117 1.8459112727702085 3.2111542652737661 -2.0714511117546333 0.70300333264017778 1.1529633523186735 -1.3655134213205755 0.11991917074033118 -0.12303336680704124 0.81233608439432403 -0.45675913459545459 0.2854046970382994 -0.2407874652128727 -0.093665658850163216;1.9574617034236184 -2.8187617189574157 1.091452458397927 1.2162562637293612 -1.5858284678875041 0.5471239647431545 0.6759913122191501 -1.9980981001659006 3.3179417373682987 1.3459277440283797 -5.1689468746275269 1.7279739563107184 -0.12994546293493503 -0.091890053755352613 -0.13002996695509564;-0.36783953282466569 1.445367024871183 -3.1599278895884253 24.941195468205759 -21.745685906826942 -2.6155049902175525 1.263984336258807 0.17491530391667132 -1.2468848096945946 0.73022001869101127 6.1680082886959662 -6.1128605984525155 -1.3833702048082919 2.4411394261273092 -0.94860281332615104;1.8982571641739108 -0.60462031571078245 -0.72137210805434204 0.12276049900373245 -2.064053316405452 0.84471017026355721 -1.5492961909379268 1.1907332776491071 -1.8766633547469225 2.6484430612838823 -2.712627796089818 0.49695033588989296 -0.43422441084379437 -0.59671081470774312 1.2560168266145169;-6.5588693648769567 3.0387873571752033 -2.7886973823724395 3.7839460021829416 0.29119063066817319 -4.1645981121076217 3.4470242425558908 -4.6777274990471733 3.7661779859233304 -1.941837482734345 -1.2216658314081497 0.77819994690195615 -1.6461057442273757 -2.329512525005403 2.7400959327219656;-57.84431856335555 53.718702500022616 6.5225455541756627 -2.7686764516313382 -0.75554639032284243 1.4102433392738656 -0.87593196016226804 1.2604882640108228 -0.65728072622919242 0.077653012120419584 -0.24407274571631471 -0.67356036978291967 0.31030183007548062 -0.056905868365820074 0.47460906390366148;6.7459359761440405 -14.072777462441008 17.561730510873591 -22.018280619328479 4.6806643085738253 13.704515983128468 -9.6475993757885234 2.9025895337120056 1.6363403252325872 -2.3599693656947531 1.7155861334663343 3.0107767524326099 -3.918171198026561 0.84142314420486286 -0.29518105501873948;19.615831174400689 -22.010153948062644 53.290947112564538 -53.186371550463221 1.9140200863999586 0.50144184700444727 0.60211200155347178 -1.3487272458309223 1.020109713145646 0.38700170219815033 -1.0311074691857021 2.0847102512163995 -1.3195997423627561 -0.30958908860096535 0.024220090096325121;3.4805954013632121 -7.7104482018148097 -3.3731576916507846 12.38930702897664 3.9298829811428608 -11.233175582278637 7.2372222075680641 -4.1449739451994212 -3.1386375198327117 5.6854797225703493 -5.6312523181788876 -8.3099322155472137 14.248107234740957 -3.2947345899794049 -0.057064495952220656;-7.2147238388366031 1.6083751760320915 7.0838907519193643 -4.6381433165348875 4.2045726024587866 -2.5804125501956707 -74.49052580623129 76.129136379201952 -0.55613202952383434 0.53531065915370191 -1.7533649564549809 1.0560472251646329 -0.10594666199541257 0.36581673606385873 0.083181867194836057;-1.4342289453003014 0.85286162085571471 0.65644621598103847 -1.6271998290512866 1.8675098050606849 -0.27416108959287511 -1.3290461417228741 2.5644170592692794 -3.7054778000807054 -1.6917103145161763 5.6342857371680672 -1.4593353294483769 -0.11067765650808965 -0.094177364314088963 0.25118264330909423;-20.659033914247345 14.004944045204324 -47.765010343879524 53.980587596432372 0.38170544544664858 0.61417705451333271 -0.92436477451831922 0.59866546539375787 -0.59595892039892295 0.29274466828050472 -0.1508865092810055 -0.60372161290240811 0.79316434612847353 -0.47302133194512958 0.46161362787009491;0.90859679892808176 -2.9014614821425062 -2.0733277839943156 1.0433983727460385 3.4249207000264184 -3.3260902350091444 -68.749372217131665 71.349268375432445 -0.8299652192909065 -0.033229278758791989 -0.35872229522083626 0.1924692923643615 0.12921812292115542 0.51006075327017353 0.30612176564794968;4.0293041087343333 -2.3019002066517218 -11.37063739870397 8.4720939343218795 -6.324299307415604 2.6450762266454571 0.18556334788052195 -3.6531778926389542 4.666133183450798 0.11703231745040674 0.73741291683737586 3.9508701322077049 -5.5380219132156911 36.491465957170561 -32.742188717332908;1.8481088109316548 -0.6210138235908591 -0.66086853965961934 0.11355841600132104 -2.0764164908256775 0.86316869448718359 -1.5994337506845799 1.2474111099844725 -1.9007200448131762 2.6851770898624463 -2.7778393690033774 0.53578426918748845 -0.45007755565730245 -0.60581577981501367 1.2869631646254505;-0.68266060942753581 -2.7969880004072949 0.36091433567258169 1.4132466472615133 -0.98915012483543829 0.62738899150364158 1.094985220315688 -2.4614983375636559 1.887825596244127 -1.0049693952784604 0.19780898233858341 0.38068548405110764 -0.73811099476796094 -0.03667208941039457 0.65711044092696336;-8.7743997830635561 -1.5091950240722791 10.698737365778561 -1.9200713716149078 0.44323276344890494 0.07267114155691444 -0.24241758241331207 0.57513337536122655 -0.65048960063874861 0.43152090776750052 -0.5280433960426788 0.0005199865341714606 0.93011230158868252 -1.1455436487438801 0.80580149826493086;-0.15688570928830811 1.3400425568950085 -3.2123411110803222 24.502526791467623 -21.252291229608158 -2.5656605554453891 1.1450452876642012 0.19599639142034456 -1.1590000073713516 0.71103889914326635 5.9116125184032411 -5.8987149160157335 -1.3045217435011085 2.4412373892968824 -1.0929475864096747;2.4609647718118328 -4.5212471706134343 -0.6597881002057614 0.70291707779684509 3.0965903490731108 -2.5742260056454653 7.5205580608393756 -1.422096053671223 0.97921931691966868 -1.7542699187538164 7.516388776093323 -8.5806846253500808 -0.80847898892855752 -0.39790759549328308 -0.16869547084600239;-1.9382301846886909 2.7659689605082152 -1.0567976149610534 -1.2043857869559562 1.5701006698981581 -0.52641173929293894 -0.68350368940305528 1.9842684734760043 -3.282713227794205 -1.3317469715404318 5.1049676398512993 -1.7085361809685622 0.13401300728347623 0.079323823874509591 0.13290555475652929;-0.29799130555964087 -0.4991767637912487 0.85290470169037103 -0.3681934119867652 -0.41814432246177446 0.25433871222499799 -0.48154316503549194 -0.022296449711431063 0.24583451759149116 -0.73871896917605462 0.51109704884851082 -0.2081961381604317 0.07263870055489037 1.2169501761766164 -1.9080371150671511;6.6073940357409917 -3.018824367654839 2.7853765784394522 -3.8652888983366127 -0.2698498992650829 4.2513841241746606 -3.5325477626424062 4.7613093853167054 -3.8679171601930431 1.9845112117238946 1.2904509879418189 -0.8653412332622602 1.7324999687907667 2.3548086165235569 -2.8075206050260091;-2.6076211533472797 5.1441465929338097 1.6225680014626185 -7.9540537955760486 8.2690165284738484 -0.2522123883598158 -7.715601327014328 5.5006061508794941 -2.6508091822302058 -1.1513221434878373 2.5241412803662424 -0.45918467892785664 0.26911950108306926 -0.33843299554877787 -0.13323966142907151;-0.20339180802869253 -1.7900361693921454 6.4707074538921416 -5.323723003225636 -3.038939650262813 3.131580686001695 4.5774179932780852 -6.1027779490822942 -4.9828893265241936 6.786628283919991 -1.2899208251428864 4.120069347240725 -0.27754490162745643 -1.2998851891682794 0.67371484331135545;-2.5621307104608073 8.6148847202531407 -1.1711251589376197 -5.8157953483186544 3.1756176753099119 -0.50223034581066661 -0.59182825843474685 -1.3686451717419266 2.842481059293704 0.808433878456148 -3.9976636747415792 3.0981110881749627 -1.19481539736527 -0.33036095208876592 0.24877999893555752;0.40947831889769704 -0.19380429041227829 0.08204225337696161 0.21948446714843267 0.5826263644941998 0.30365133563505398 -1.0077793404556086 0.59127437776146108 0.80093280516238063 -0.040375878303126382 -1.3272504163683718 0.73824313726966673 -0.15229659206199303 0.71862311816374558 -1.9803657362600577;2.5083669138701317 -4.9912484879721886 -1.5808240824375894 7.7803372365611656 -8.0966820747869512 0.2502013539113207 7.5528805688193081 -5.3916040222939099 2.6150839261457839 1.1112556884567293 -2.4699722749531747 0.45697479803128177 -0.27998072211415187 0.32943199187660921 0.1397813798522323;0.56883242781696475 0.18309887614987613 0.21624779927043961 -0.3782088684615475 0.21606072624523534 -0.049207297956675181 -0.10089838616853664 0.083072806985492395 -0.096937937008831548 -0.063019059248631382 0.067550016699446852 -0.017197313694592164 0.078412264974425341 0.086109773367258446 -0.10120370456951246;0.18898657699849186 -1.0937326664512526 -5.9090124407704652 4.6732041346976176 -4.110257008458384 4.3204013909974774 -3.9303875808604083 7.9327803163832753 -5.9267034859255823 9.9363481641919904 -1.0719756340660767 9.0036233497500522 -3.1655983858839276 1.3347668844721921 -2.1184046578379694;-2.1636682978800597 1.3082322072202694 -0.014425665845797282 -0.54473316842178321 1.0604590617890692 -0.44086675070691217 1.0485573716574736 -1.271553333395161 0.24649274220660863 0.58967657364685933 0.35400868808897995 -0.35776665075669922 -1.5416673869014788 1.2058680815803613 0.64203697014267747;-0.50092610919368619 -1.5744639376865497 -1.0969950600599445 0.79351636525483671 0.1530472444768019 -0.25947702835605291 0.3385400947779682 -0.45876271169189869 0.37334386130917013 -0.38996912727777761 0.4037580154149476 -0.080140798537597216 -0.26242172427186566 0.67512188578152565 -0.75206201030120801;-5.0776778602395201 0.48546605787873975 2.7106344083488034 -2.0210053885480992 0.50260078506850692 0.85935018675280539 -1.9800523227076927 0.017549088225586342 1.8015891873591141 -0.76395501442803382 1.1600799349412483 1.4788426983880512 -1.5387691695843524 1.2738782723508595 1.4425814819504703;-36.268574792918663 38.103508482134728 -0.6859756393540215 -1.8713923449792669 0.8397147983071972 0.68711713921075712 -0.7402162978714546 0.19427931570568147 0.47581581373584392 -0.29863690712363167 -0.79818349777644892 0.097170633135257867 0.38862677934190915 0.080311850199064436 -0.20829405187733402;0.012257280881864721 0.061173375730298782 0.060884939275099068 0.27042910265581765 0.28759039449733864 0.18438597630458559 -0.59284391497531308 0.37841586413926226 0.63259685693292789 5.9434464774220114e-05 -0.95527060528838026 0.49951357851999439 -0.22743532357469753 0.55117620309685222 -1.1571763805001041];

% Layer 2
b2 = 4.7588690251053327;
LW2_1 = [-0.069542353396479059 0.043303084219638466 -3.0004715734029377 0.16619895792687181 -15.397484256353446 -3.2888528764519078 -2.7662906633166533 0.031236467964168357 2.5569620272308375 -0.018519297055532586 0.11263347132848554 0.14935701713957386 -0.020589438089193869 -0.11205674401998514 -7.4692173359257179 -0.058090261759750253 0.091938772909246222 -4.5853224232962102 5.7041266101915706 -1.5236994757914597 -1.3262761097009126 -0.06527150417296794 -0.016804453226041814 0.027038823154819477 -0.022176560570681795 0.033622124052791004 0.14805704624850352 0.026605058403170331 -0.033657775781449475 -0.0075529126873037505 1.4994646982828976 -0.096590747099569704 -0.040663822973202597 -2.940689556647992 0.014438053668936381 -4.749900514968024 -0.086789908220250817 -1.3023945163871637 2.4430696964476675 -0.016153744419837208 0.038265303049316877 -3.4924441672448889 2.5450199103520568 1.3609191605482829 0.012527064107916987 -7.9563430490607834 -0.17041790063645265 -2.5414143255462833 6.3482887086291315 8.6059229359176346];

% Output 1
y1_step1_ymin = -1;
y1_step1_gain = 0.00223413759241266;
y1_step1_xoffset = 0;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX, X = {X}; end;
if (nargin < 2), error('Initial input states Xi argument needed.'); end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
elseif ~isempty(Xi)
    Q = size(Xi{1},2);
else
    Q = 0;
end

% Input 1 Delay States
Xd1 = cell(1,16);
for ts=1:15
    Xd1{ts} = mapminmax_apply(Xi{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+14,16)+1;
    
    % Input 1
    Xd1{xdts} = mapminmax_apply(X{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
    
    % Layer 1
    tapdelay1 = cat(1,Xd1{mod(xdts-[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]-1,16)+1});
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*tapdelay1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1_gain,y1_step1_xoffset,y1_step1_ymin);
end

% Final Delay States
finalxts = TS+(1: 15);
xits = finalxts(finalxts<=15);
xts = finalxts(finalxts>15)-15;
Xf = [Xi(:,xits) X(:,xts)];
Af = cell(2,0);

% Format Output Arguments
if ~isCellX, Y = cell2mat(Y); end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
y = bsxfun(@minus,x,settings_xoffset);
y = bsxfun(@times,y,settings_gain);
y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings_gain,settings_xoffset,settings_ymin)
x = bsxfun(@minus,y,settings_ymin);
x = bsxfun(@rdivide,x,settings_gain);
x = bsxfun(@plus,x,settings_xoffset);
end

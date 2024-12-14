require 'minitest/autorun'
require_relative '../lib/processor'

class TestProcessor < Minitest::Test

  def test_scan_mul_2_by_4
    input = "mul(2,4)"
    Processor.scan(input)
    assert !Processor.instructions.empty?
    assert_equal ["mul(2,4)"], Processor.instructions
  end

  def test_scan_mul_5_by_5
    input = "mul(5,5)"
    Processor.scan(input)
    assert !Processor.instructions.empty?
    assert_equal ["mul(5,5)"], Processor.instructions
  end

  def test_scan_test_data
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    Processor.scan(input)
    assert !Processor.instructions.empty?
    assert_equal ["mul(2,4)", "mul(5,5)", "mul(11,8)", "mul(8,5)"], Processor.instructions
  end

  def test_process_test_data_part_one
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    Processor.scan(input)
    assert_equal 161, Processor.process
  end

  def test_process_test_data_part_two
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    Processor.scan_extended(input)
    assert_equal 48, Processor.process_extended
  end

  def test_process_calculates_input_part
    input = "}mul(620,236)where()*@}!&[mul(589,126)]&^]mul(260,42)when() when()$ ?{/^*mul(335,250)>,@!<{when()+-$don't()*'^?+>>/%:mul(422,738),mul(694,717);~;%<[why()>@-mul(417,219)?&who(474,989){select()-{#mul(366,638)mul(773,126)/*{mul(757,799)]when()mul(778,467)^mul(487,365)]*'{where(952,954){?who()who()when()mul(172,666)#<do()why()~&why())'< {mul(33,475)}mul(916,60)what()?when()>?$,-mul(250,228)(]when()}<mul(817,274)'{})mul(836,930):@how()]!@'select()~?mul(514,457)from()&what()what()when()mul(872,884)select()<select()from()'!who()mul(11,966)/from()(~}#,(*from()mul(941,908)#>mul(760,139)mul(892,161)!'@[%when()<(mul(775,872)+~#)//$select()mul(946,63)how()??select()?from(277,915)~'mul(637,565)~mul(881,294)who()what()}mul(995,866)?mul(952,57)who()mul(387,599)mul(46,724)who()[how()select()mul(992,19)'~mul(909,687)where()mul(953,804)from()/;where(474,270)from()}mul(907,410)&(&what()%{mul(192,898)who()-,mul(196,400)#--{%]how()mul(144,141)~@[when()!%:[mul(377,942)^*mul(89,46)who()<}when()?!'%mul(172,448){]@mul(351,18)~]&!$mul(490,127)/]] }}mul(851,465)when()*-why()what()))@+<mul(465,978):*>^<-select()do()%#+;%:mul(549,307)<where(154,242)(;< /who()mul(426,943)mul(477,782)*?do() mul(745,445)@  (how()$where()mul(118,902)when()when()}!how()don't();mul(523,781)mul(350,886)!}from()>#mul(968,958)mul(125,903)what()who()$where()%who()how()mul(139,859)<&/+how()mul(339,100)@(<?select()+))~mul(548,608)select(166,582) }where()$how(),mul(21,567)from()mul(798,591)+-;][)from()mul(398,197):<why()when()why()[mul(296,785)where()%^(how()select()&:mul(833,729) <# ,mul(858,55)}(~{<;how()^mul(789,160)^where()'mul(320,473)#&mul(281,366)?mul(415,485):::[mul(550,20)[don't()what(){who(197,721)when()!how(748,315)&-{mul(109,947)?^]({mul(915,217)what(),],what()<don't()<-/^<:<mul(264,899)}^from()%mul(137,563)?select(478,659)why(857,355)(%*]~mul(563,802)$&when()mul(121,341)from();~what(495,238)'from()mul(533,553)from())<!+{'&]mul(605,211)}why()select()(mul(607,201)</&how()%-what()?<;mul(592,310)$^(:;%where(873,478)~mul(565,816)mul(52,983)select()who()>:mul(306,909)?)--what()who()/)*mul(724,497)'how()from()mul(489,24)${/%/:how()>(mul(397,282)}?from()who()$/'mul(86,511)mul(463,903);(^@mul(302,904)-,who()what()from(892,368)where()-mul(707,359)/who()/';;++;mul(687,987)^:select()select():mul(915,123)<]!:'/[select()mul(809,835)why()when())* mul(139,828))why()who() ,mul(807,713)where()><?select(42,854)what()*don't()%~%&mul(363,160)%$~don't()}+^#+,what(296,891)+when()mul(672,112)/}/*?/,mul(185,994)from()]-?mul(233+mul(234,464)((,how()* mul(647,845):^$?$#&~mul(994,732);(from();+how()mul(581,905)mul(458,49)from()mul(539,976)@mul(28,592)$ where(777,812)>:mul(350,287)where()-where()+:~{who() mul(437,102) %when()select(),mul(813,883)]when()>(from()don't()]where()@/:how())'#mul(337,905)*>>*!don't()>(+}:mul(488,283)<~<what(),>>mul(703,476),what()@(} mul(487,921)from()select()why()mul(761,203)who()how()mul(32,930)[how()do())/}where()mul(778,306))mul(593,810)mul(629,319)';$mul(122,109){ ^^-mul(720,536)?!+mul(519,541)$'/@who()!~where()$mul(461,98)"
    Processor.scan_extended(input)
    assert_equal 12532907, Processor.process_extended
  end

  def test_process_first_line_of_test_input
    input = "mul(620,236)mul(589,126)mul(260,42)mul(335,250)mul(422,738)mul(694,717)mul(417,219)mul(366,638)mul(773,126)mul(757,799)mul(778,467)mul(487,365)mul(172,666)do()mul(33,475)mul(916,60)mul(250,228)mul(817,274)mul(836,930)mul(514,457)mul(872,884)mul(11,966)mul(941,908)mul(760,139)mul(892,161)mul(775,872)mul(946,63)mul(637,565)mul(881,294)mul(995,866)mul(952,57)mul(387,599)mul(46,724)mul(992,19)mul(909,687)mul(953,804)mul(907,410)mul(192,898)mul(196,400)mul(144,141)mul(377,942)mul(89,46)mul(172,448)mul(351,18)mul(490,127)mul(851,465)mul(465,978)do()mul(549,307)mul(426,943)mul(477,782)do()mul(745,445)mul(118,902)don't()mul(523,781)mul(350,886)mul(968,958)mul(125,903)mul(139,859)mul(339,100)mul(548,608)mul(21,567)mul(798,591)mul(398,197)mul(296,785)mul(833,729)mul(858,55)mul(789,160)mul(320,473)mul(281,366)mul(415,485)mul(550,20)don't()mul(109,947)mul(915,217)don't()mul(264,899)mul(137,563)mul(563,802)mul(121,341)mul(533,553)mul(605,211)mul(607,201)mul(592,310)mul(565,816)mul(52,983)mul(306,909)mul(724,497)mul(489,24)mul(397,282)mul(86,511)mul(463,903)mul(302,904)mul(707,359)mul(687,987)mul(915,123)mul(809,835)mul(139,828)mul(807,713)don't()mul(363,160)don't()mul(672,112)mul(185,994)mul(234,464)mul(647,845)mul(994,732)mul(581,905)mul(458,49)mul(539,976)mul(28,592)mul(350,287)mul(437,102)mul(813,883)don't()mul(337,905)don't()mul(488,283)mul(703,476)mul(487,921)mul(761,203)mul(32,930)do()mul(778,306)mul(593,810)mul(629,319)mul(122,109)mul(720,536)mul(519,541)mul(461,98)"
    input = "mul(620,236)mul(589,126)mul(260,42)mul(335,250)mul(422,738)mul(694,717)mul(417,219)mul(366,638)mul(773,126)mul(757,799)mul(778,467)mul(487,365)mul(172,666)do()mul(33,475)mul(916,60)mul(250,228)mul(817,274)mul(836,930)mul(514,457)mul(872,884)mul(11,966)mul(941,908)mul(760,139)mul(892,161)mul(775,872)mul(946,63)mul(637,565)mul(881,294)mul(995,866)mul(952,57)mul(387,599)mul(46,724)mul(992,19)mul(909,687)mul(953,804)mul(907,410)mul(192,898)mul(196,400)mul(144,141)mul(377,942)mul(89,46)mul(172,448)mul(351,18)mul(490,127)mul(851,465)mul(465,978)do()mul(549,307)mul(426,943)mul(477,782)do()mul(745,445)mul(118,902)don't()mul(523,781)mul(350,886)mul(968,958)mul(125,903)mul(139,859)mul(339,100)mul(548,608)mul(21,567)mul(798,591)mul(398,197)mul(296,785)mul(833,729)mul(858,55)mul(789,160)mul(320,473)mul(281,366)mul(415,485)mul(550,20)don't()mul(109,947)mul(915,217)don't()mul(264,899)mul(137,563)mul(563,802)mul(121,341)mul(533,553)mul(605,211)mul(607,201)mul(592,310)mul(565,816)mul(52,983)mul(306,909)mul(724,497)mul(489,24)mul(397,282)mul(86,511)mul(463,903)mul(302,904)mul(707,359)mul(687,987)mul(915,123)mul(809,835)mul(139,828)mul(807,713)don't()mul(363,160)don't()mul(672,112)mul(185,994)mul(234,464)mul(647,845)mul(994,732)mul(581,905)mul(458,49)mul(539,976)mul(28,592)mul(350,287)mul(437,102)mul(813,883)don't()mul(337,905)do()mul(778,306)mul(593,810)mul(629,319)mul(122,109)mul(720,536)mul(519,541)mul(461,98)"
    Processor.scan(input)
    #assert_equal 30632041, Processor.process
    assert_equal 12532907, Processor.process
  end

  def test_process_extended_first_line_of_test_input
    input = "mul(620,236)mul(589,126)mul(260,42)mul(335,250)mul(422,738)mul(694,717)mul(417,219)mul(366,638)mul(773,126)mul(757,799)mul(778,467)mul(487,365)mul(172,666)do()mul(33,475)mul(916,60)mul(250,228)mul(817,274)mul(836,930)mul(514,457)mul(872,884)mul(11,966)mul(941,908)mul(760,139)mul(892,161)mul(775,872)mul(946,63)mul(637,565)mul(881,294)mul(995,866)mul(952,57)mul(387,599)mul(46,724)mul(992,19)mul(909,687)mul(953,804)mul(907,410)mul(192,898)mul(196,400)mul(144,141)mul(377,942)mul(89,46)mul(172,448)mul(351,18)mul(490,127)mul(851,465)mul(465,978)do()mul(549,307)mul(426,943)mul(477,782)do()mul(745,445)mul(118,902)don't()mul(523,781)mul(350,886)mul(968,958)mul(125,903)mul(139,859)mul(339,100)mul(548,608)mul(21,567)mul(798,591)mul(398,197)mul(296,785)mul(833,729)mul(858,55)mul(789,160)mul(320,473)mul(281,366)mul(415,485)mul(550,20)don't()mul(109,947)mul(915,217)don't()mul(264,899)mul(137,563)mul(563,802)mul(121,341)mul(533,553)mul(605,211)mul(607,201)mul(592,310)mul(565,816)mul(52,983)mul(306,909)mul(724,497)mul(489,24)mul(397,282)mul(86,511)mul(463,903)mul(302,904)mul(707,359)mul(687,987)mul(915,123)mul(809,835)mul(139,828)mul(807,713)don't()mul(363,160)don't()mul(672,112)mul(185,994)mul(234,464)mul(647,845)mul(994,732)mul(581,905)mul(458,49)mul(539,976)mul(28,592)mul(350,287)mul(437,102)mul(813,883)don't()mul(337,905)don't()mul(488,283)mul(703,476)mul(487,921)mul(761,203)mul(32,930)do()mul(778,306)mul(593,810)mul(629,319)mul(122,109)mul(720,536)mul(519,541)mul(461,98)"
    Processor.scan_extended(input)
    assert_equal 12532907, Processor.process_extended
  end

end

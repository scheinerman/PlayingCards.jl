using Test
using PlayingCards52

@test true

for k = 1:52
    C = Card(k)
    kk = index(C)
    @test k == kk
end

ace_high(false)
x = deck()
sort!(x)
@test index(x[1]) == 1

AC = Card(:clubs, 1)
twoD = Card(:diamonds, 2)

ace_high(true)
@test twoD < AC
ace_high(false)
@test twoD > AC

@test color(Card(:clubs, 5)) == color(Card(:spades, 2))
@test color(Card(:clubs, 5)) != color(Card(:diamonds, 2))
@test color(Suit(1)) == color(♠)

@test Char(Card(:clubs, 5)) == '🃕'


d = collect(1:10)
cut!(d, 4)
cut!(d, 6)
@test d == collect(1:10)

riffle!(d)
@test sort(d) == collect(1:10)

# test alternative notation

@test A♣ == Card(:clubs, 1)
@test K♣ == 13♣
@test 7♠ == Card(:spades, 7)

@test 5♢ == 5♦
@test A♡ == A♥

@test Suit(:clubs) == ♣
@test ♡ == ♥

@test name(Card(:clubs, 13)) == "king of clubs"

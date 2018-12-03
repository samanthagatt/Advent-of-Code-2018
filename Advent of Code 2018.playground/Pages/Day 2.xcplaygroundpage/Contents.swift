//: [Previous](@previous)

/*
 --- Day 2: Inventory Management System ---
 
 You stop falling through time, catch your breath, and check the screen on the device. "Destination reached. Current Year: 1518. Current Location: North Pole Utility Closet 83N10." You made it! Now, to find those anomalies.
 
 Outside the utility closet, you hear footsteps and a voice. "...I'm not sure either. But now that so many people have chimneys, maybe he could sneak in that way?" Another voice responds, "Actually, we've been working on a new kind of suit that would let him fit through tight spaces like that. But, I heard that a few days ago, they lost the prototype fabric, the design plans, everything! Nobody on the team can even seem to remember important details of the project!"
 
 "Wouldn't they have had enough fabric to fill several boxes in the warehouse? They'd be stored together, so the box IDs should be similar. Too bad it would take forever to search the warehouse for two similar box IDs..." They walk too far away to hear any more.
 
 Late at night, you sneak to the warehouse - who knows what kinds of paradoxes you could cause if you were discovered - and use your fancy wrist device to quickly scan every box and produce a list of the likely candidates (your puzzle input).
 
 To make sure you didn't miss any, you scan the likely candidate boxes again, counting the number that have an ID containing exactly two of any letter and then separately counting those with exactly three of any letter. You can multiply those two counts together to get a rudimentary checksum and compare it to what your device predicts.
 
 For example, if you see the following box IDs:
 
 abcdef contains no letters that appear exactly two or three times.
 bababc contains two a and three b, so it counts for both.
 abbcde contains two b, but no letter appears exactly three times.
 abcccd contains three c, but no letter appears exactly two times.
 aabcdd contains two a and two d, but it only counts once.
 abcdee contains two e.
 ababab contains three a and three b, but it only counts once.
 Of these box IDs, four of them contain a letter which appears exactly twice, and three of them contain a letter which appears exactly three times. Multiplying these together produces a checksum of 4 * 3 = 12.
 */

let strings = """
rmyxgdlihczskunpfwbgqoeybv
rmyxgdlksczskunpfwbjqkeatv
rmybgdxibczskunpfwbjqoeatv
rmyxgdlirczskuopfwbjqzeatv
rmyxedlrhczskunpfwbyqoeatv
rmyxfdlicczskunpfwbxqoeatv
rmyxgvlihkzskunpfwbsqoeatv
rmyxgdaihczvkunpfwblqoeatv
nmyxgolihczskunpfwbjqieatv
rhyxgdcihczskunifwbjqoeatv
rmfxgdlihczskunpfwbvqgeatv
smyxgdlihczskunsiwbjqoeatv
rmyxgdcihcxskunpfwbrqoeatv
rmyxgdlihczckuiqfwbjqoeatv
rmyxxdwihczskunifwbjqoeatv
rkzxgdlihczskunpfwhjqoeatv
rmypgdlihczskunpfwbrqoeafv
rmyxgplihczvkunpkwbjqoeatv
rqyxgdlihdzskjnpfwbjqoeatv
rmyxgdlihczskqnpswbjqoeaov
mcyxgdlihczmkunpfwbjqoeatv
rmyxgdlohczspunpowbjqoeatv
tmyxgdlihczskunpfwbeqoeltv
rmyxgdlibccskunpfwbjqoegtv
rmyxgdlehczsaunpfwboqoeatv
rmaxgdlihczseunpfwbjqojatv
rmyxgdlijczskynpfwbjboeatv
kmlxgdlilczskunpfwbjqoeatv
rmsxgdlshczskenpfwbjqoeatv
rmbxgdlihcmskgnpfwbjqoeatv
rayxgdlihczskunpfwbjqoeaef
umyxgdlisczskunpfdbjqoeatv
rmyxgdlihczskunsfwbjqieatg
rmbxgdlihczhkunpfwbjqoeamv
rmyxgdlihczskeypfwbjqxeatv
rmyxgkrihczskunptwbjqoeatv
rmyxgdlihczskunpawbjqoexiv
rmyxgdlihcrskqnpfwbjqceatv
rmyxgblihczskjnpfwbjqieatv
rmyggdlidczskunofwbjqoeatv
rmyxgdlghczskunphwbjqomatv
rmqxgdbihczskunpfnbjqoeatv
rvyxgdlihczsgunpfwbjqoeanv
royxgdlnhczskqnpfwbjqoeatv
rmyxgdlihczskugpfwbkqreatv
rmyxfdlihczskunppwejqoeatv
rqyxgdlipczskunpfwbjqoeqtv
rmyxgdlicczskunpnwbjqotatv
rmyxodlihczskxnpfwijqoeatv
rmyxrdyihczskunpftbjqoeatv
rmtxgdyihwzskunpfwbjqoeatv
tmyxcdliiczskunpfwbjqoeatv
rmyxgdlihczskmnpfwbjjoeadv
rmyxgdnihczskunpqwbjqojatv
bmyxgdlihczskcnpfwboqoeatv
rmysgdlihcyskudpfwbjqoeatv
rmyxgdtihczsmuupfwbjqoeatv
rmyxgdlihczssunpffbjqolatv
rmyogdlihczsklnpfwbjqoxatv
rmyxgjlihczskunpfwsjqoyatv
rmyxgalshczskunpfwbuqoeatv
rmyfgdlihczskunqfwbiqoeatv
tmyxgdlihczskunotwbjqoeatv
rmyxpdzihczskuopfwbjqoeatv
rmyfgdlihczskunpfrbgqoeatv
rmyxgdlwhczskhnofwbjqoeatv
rmyxgdlihczsmudpfrbjqoeatv
rmyxgdlihczokanpfwbjqooatv
rmyxrdlihczskunppwjjqoeatv
rmyxgdjihczskwnpowbjqoeatv
mmyxgdlihczikunpfwbjqoeamv
rmyxgflihczshunpwwbjqoeatv
rmytghlihczskunpfwbjqoeatk
rmyxgdlipczmbunpfwbjqoeatv
rmyxgdlihczkkonpfwbjqomatv
rmfxgslihczskunpfwujqoeatv
dmyxgdlihczykunqfwbjqoeatv
rmyxgalihcbskunpgwbjqoeatv
rmyxgdlinczqkunpfwbjqopatv
rmyxgdlihwzslunplwbjqoeatv
rmypgdlihczskdtpfwbjqoeatv
rmsxgdxieczskunpfwbjqoeatv
rmyxgdlihczskwnpfxrjqoeatv
rmyxgdlihzzskunpflbjpoeatv
rslxgdlihczsnunpfwbjqoeatv
rmyxgdlmcczskunpfwbjqoealv
fmkxgdbihczskunpfwbjqoeatv
rmyxgdiigczxkunpfwbjqoeatv
rjyxgnlqhczskunpfwbjqoeatv
ymyxgolihczskunpfmbjqoeatv
hmyxgdlihczskuncfwbjqoejtv
rmyxgqlihczzkunpfwbjqojatv
rmgfgdlihczskunpfwbjgoeatv
rmyxgdlfhczskunpfwbjqweaxv
rmoxtdlihczskunpfwdjqoeatv
ruyxgdlihczskunpfmbjnoeatv
rmnxgflehczskunpfwbjqoeatv
rmyugdlihczskunpfwfjroeatv
rmyxddbihczskunpfwbjqoeutv
rmyxgdlipczskunofbbjqoeatv
gmyxgdlihczskunpfkbjroeatv
rmyxgdllhcpskunpfwbjqqeatv
rmyxgdlihchskunpfwbjqoelcv
mmyxldlihczskuncfwbjqoeatv
ryyxgdlxhczskcnpfwbjqoeatv
rmyxpdlihczskyntfwbjqoeatv
rmhxgdlibczskwnpfwbjqoeatv
rmyxgdlihczskunpfwojbkeatv
qmyxgdlihczskunpfwbjqoyatm
rmyxgdlzhczskunpfwbjqoealr
rmyegdliqczskunpfgbjqoeatv
umyxgdlihczsvunpfwbfqoeatv
rmyxgdoihfzskunpfmbjqoeatv
rmyxgdlihcdskanpmwbjqoeatv
rmyxgdyihczskunpfrbjqoeaov
rcyxgdlihczskuegfwbjqoeatv
rmyxgdlihgwskunpfwbjkoeatv
rpyxgdlihmzskunpfwbjqoeatp
rmyxgdlihhzskunpfwbjaoeapv
rmyxgdsrhczskunpflbjqoeatv
rmrxgdlihczskunpvwbjqoeabv
rmcxgylihczskunpfwbjyoeatv
rmkxgdlyhczsounpfwbjqoeatv
rmyxgdqihczskunmfwbjqoratv
rmyxgdlihczskunpfibjqofath
rmyxgdliqczskunpqwbjqoeaev
rmhxgdlizcjskunpfwbjqoeatv
rmyxgdlfhcwskunpfwbjqoeaqv
rmyxgdlchclskunpfwbdqoeatv
rmyxgdluhczswunpfwbjqoeatt
rmyxgdlzqczskunpfwbjqoeatq
rmdxgdlihszskunpfwbwqoeatv
rmyxgdlihszsvunpfwbjqueatv
rmyxgdlhhczskunpffbjaoeatv
rmrxgdlphczskunpfwbjqreatv
hmyngdxihczskunpfwbjqoeatv
rmyxgdlizczpkunpfwbyqoeatv
rmyxbdlihyzskunlfwbjqoeatv
rmyxgdlipczsqunnfwbjqoeatv
rmyxgdlihcsskunpfxbjqoaatv
rmyxgdljhcznkunpfwbjqfeatv
rmaxgdlihczspunpfwbjqoqatv
rsyxgdlihczskunpfwbjqoehcv
rmyxgjlicczskunpfwbjqoeitv
rwymgvlihczskunpfwbjqoeatv
rmyxgdlipfzskunpfwbjqweatv
rmyxgglihczskunpgwbjqoealv
royxgdlihczskhnpfwbyqoeatv
rmyxgdlihczskvnpfabkqoeatv
rmyxgdlihczskunpfwhjwzeatv
jlyxgdlihczskunpfwbjqzeatv
rmyxgdlihccskunpfwwjqopatv
rmyxgxlihczskuupfwbjqoeahv
rmyxgdcihcbskungfwbjqoeatv
tmyxgdlihczskunpfwbjmoeftv
rkyxgdlioczskmnpfwbjqoeatv
rmyxgdlrhczskulpfwbjaoeatv
rmysgdlihczikunphwbjqoeatv
rmyxgdlihczskuvpfwbjqoeyty
fmyxgdlihczscunpfqbjqoeatv
rfyxgdlihzzrkunpfwbjqoeatv
rmyxgdlikczskunpfwbjqolath
rmyxqdlihjzskunpfwbjqoeamv
rmuxodiihczskunpfwbjqoeatv
rmyygdliucuskunpfwbjqoeatv
rmyxgdliwczskuppawbjqoeatv
rmyxgdlihczskunprwbjqgehtv
imyvgdlihczskunpfwbjqouatv
rgyxgdluhczskunpflbjqoeatv
rmgxgdlihczsdunpfwwjqoeatv
gdyxgdlihczskunpfwbjqoeavv
rmyxgdlihczskunpfwljjoektv
rmexgdlihczskunpfwxjqoeytv
rmyxqdlihcyskuwpfwbjqoeatv
rmyxgdlihczskunpfiyjqcebtv
amyngdlihczskunpfwbjqseatv
rmzxgdlihczykubpfwbjqoeatv
rmyxgdlihczhkuopfwbjsoeatv
rmyxgdlihczskunpfwbaqowztv
rmgxgdlihczslunpfwbjeoeatv
rmytgdlzhczskunrfwbjqoeatv
rmyxgdtihczskunafobjqoeatv
rmyxgdlihczskuflfbbjqoeatv
rmdxgdlihczskunpfwbjqoealj
rbyxgdlihczskuppdwbjqoeatv
rmyxhdiihcwskunpfwbjqoeatv
rmmggdlfhczskunpfwbjqoeatv
rmbxgblihczskuypfwbjqoeatv
rmyxgslihczsjunpjwbjqoeatv
rmyxgdlohczsaunpfwbjboeatv
rmaxgdhihczskunpfwbjooeatv
rmyxidlihczskunpfgbuqoeatv
rmyxgdlihfzckznpfwbjqoeatv
rmaqgdpihczskunpfwbjqoeatv
rmyvgdlirczskunpfobjqoeatv
rmdxgdlihczlkunpxwbjqoeatv
rmyxgdlihczseunpfwbjvdeatv
rmyxgdlihczskuhpfwbjqneath
rmyxrdlihciskunpfwbjqoratv
rmyxgdmihczsqunpftbjqoeatv
rmyxgdlbhczskulpfbbjqoeatv
rmoxgdlihczskunpfwbjqoeesv
rmyxgdlihczskuijfwejqoeatv
rmyxgdlihczskunpfwnkqoxatv
rmyxgdvihmzskuupfwbjqoeatv
rkyxedlihczskunpfcbjqoeatv
rmyxgdjihczskunprwbjqieatv
omyxgqgihczskunpfwbjqoeatv
rmyxydlihczskunpfwkjqoentv
rmbxgdlicczskunpfwbjqteatv
emyxgdlihczskugpfwbjqneatv
dmyxgflihczskunpfwbjqjeatv
umyxgdlihczskunpfwbjloextv
rmyxgdlihczsbunpfwbyqpeatv
rmyxgdrihczsvunpcwbjqoeatv
qmyxgdlihcwsknnpfwbjqoeatv
ymyxgdlihczskunpfsbjqowatv
rmyxgdlbhczskunpnvbjqoeatv
rmyxfdlixczskunpfwbjqoertv
rmyygdlihszrkunpfwbjqoeatv
rmyxgxlihcpskunpfwbjqoeanv
rmyxgdlihczskjnpfwbjqoprtv
rmyxgdlisczfkunpfwbjqoeath
rmyxgdlihczskunpfkbjqoeaji
rmyxgylihczskunpfwbfqoeatl
rmsxgdbihczskunpfwtjqoeatv
smyxgdlihczskunpfwbjqcwatv
rmyxgdlihczskunppjljqoeatv
rmyxgdlihczskulpfdbjooeatv
rmyxgdlihczskunpfibjqcebtv
rmyxadlihczskunpgwbjyoeatv
rmyxgdlihczdkunpvwbjqoeytv
rmyxgdlihcvskunpfwbjxohatv
rmyxgplihczskunpfgbjqoeauv
rmyxgdlihcysrunmfwbjqoeatv
rmyygdlihczskunpfwbjqvewtv
rmyxgdlihczsmunpfwdjnoeatv
rmyxgdbibczskunpfwbjuoeatv
rmyfgdlihczskubpfwbjqoeatp
rmyxgdlihczskuopfzijqoeatv
rmyqgdlihczskunpwwbjqoeanv
imyxgdlihczskunpfwbjqoqytv
rmyxgdlixcoskbnpfwbjqoeatv
rmyxgrlihccskunpfwbjqteatv
rdyxgdlihcpskunpfwbjqoratv
rmyxgdlihkzskunpfwbjmoeatj
rmyxgslihczskcnpfjbjqoeatv
rmyxgdlihczsqunqfwdjqoeatv
rjyxgdlyhczbkunpfwbjqoeatv
rmyxudlihczjkunpfwbjqzeatv
"""

func checkSum(of array: [String.SubSequence]) -> Int {
    var twoCount = 0
    var threeCount = 0
    for string in array {
        var dict: [Character : Int] = [:]
        for char in string {
            if let charCount = dict[char] {
                dict[char] = charCount + 1
            } else {
                dict[char] = 1
            }
        }
        var hasTwo = false
        var hasThree = false
        for (_, value) in dict {
            if value == 2 {
                hasTwo = true
            } else if value == 3 {
                hasThree = true
            }
        }
        if hasTwo {
            twoCount += 1
        }
        if hasThree {
            threeCount += 1
        }
    }
    return twoCount * threeCount
}

let thisString = """
abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab
"""

checkSum(of: thisString.split(separator: "\n"))
checkSum(of: strings.split(separator: "\n"))


/*
 --- Part Two ---
 
 Confident that your list of box IDs is complete, you're ready to find the boxes full of prototype fabric.
 
 The boxes will have IDs which differ by exactly one character at the same position in both strings. For example, given the following box IDs:
 
 abcde
 fghij
 klmno
 pqrst
 fguij
 axcye
 wvxyz
 The IDs abcde and axcye are close, but they differ by two characters (the second and fourth). However, the IDs fghij and fguij differ by exactly one character, the third (h and u). Those must be the correct boxes.
 
 What letters are common between the two correct box IDs? (In the example above, this is found by removing the differing character from either ID, producing fgij.)
 */

let example = """
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
"""

func findIDs(from array: [String.SubSequence]) -> (String.SubSequence, String.SubSequence) {
    var dict: [[Int : Character] : Int] = [:]
    for (majorIndex, subSeq) in array.enumerated() {
        var subSeqsDict: [Int : Character] = [:]
        for (index, char) in subSeq.enumerated() {
            subSeqsDict[index] = char
        }
        for (intCharDict, _) in dict {
            var hasOneChange = false
            var hasMoreThanOne = false
            for (index, char) in intCharDict {
                if subSeqsDict[index] == char {
                    continue
                } else {
                    if hasOneChange {
                        hasMoreThanOne = true
                    } else {
                        hasOneChange = true
                    }
                }
            }
            if hasOneChange && !hasMoreThanOne {
                guard let thisIndex = dict[intCharDict] else { return (String.SubSequence(), String.SubSequence()) }
                return (subSeq, array[thisIndex])
            }
        }
        dict[subSeqsDict] = majorIndex
    }
    return (String.SubSequence(), String.SubSequence())
}

findIDs(from: strings.split(separator: "\n"))

//: [Next](@next)

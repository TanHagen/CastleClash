//
//  App.swift
//  CastleClash Heroes Chests
//
//  Created by Антон Зайцев on 21.12.2018.
//  Copyright © 2018 Антон Зайцев. All rights reserved.
//

import Foundation

final class App {
    
    static let shared = App()
    
    private init () {}
    
    var greenHeroesArray = [HeroesBase(name: "Slime", image: "001.png"),
                            HeroesBase(name: "Angel", image: "101.png"),
                            HeroesBase(name: "Marauder", image: "102.png"),
                            HeroesBase(name: "Hill Giant", image: "103.png"),
                            HeroesBase(name: "Engineer", image: "104.png"),
                            HeroesBase(name: "Frost Witch", image: "105.png"),
                            HeroesBase(name: "Dryad", image: "106.png"),
                            HeroesBase(name: "Alchemist", image: "107.png"),
                            HeroesBase(name: "Marksman", image: "108.png")]
    
    var blueHeroesArray = [HeroesBase(name: "Crystal Ooze", image: "002.png"),
                           HeroesBase(name: "Executioner", image: "201.png"),
                           HeroesBase(name: "Assassin", image: "202.png"),
                           HeroesBase(name: "Werewolf", image: "203.png"),
                           HeroesBase(name: "Cyclops", image: "204.png"),
                           HeroesBase(name: "Shaman", image: "205.png"),
                           HeroesBase(name: "Pain-Da", image: "206.png"),
                           HeroesBase(name: "Serpent Queen", image: "207.png"),
                           HeroesBase(name: "Ice Demon", image: "208.png")]
    
    var legendaryHeroesArray = [HeroesBase(name: "Gelatinous Champion", image: "003.png"),
                                HeroesBase(name: "Paladin", image: "301.png"),
                                HeroesBase(name: "Ninja", image: "302.png"),
                                HeroesBase(name: "Succubus", image: "303.png"),
                                HeroesBase(name: "Champion", image: "304.png"),
                                HeroesBase(name: "Druid", image: "305.png"),
                                HeroesBase(name: "Thunder God", image: "306.png"),
                                HeroesBase(name: "Pumpkin Duke", image: "307.png"),
                                HeroesBase(name: "Grizzly Reaper", image: "308.png"),
                                HeroesBase(name: "Atlanticore", image: "309.png"),
                                HeroesBase(name: "Snowzilla", image: "310.png"),
                                HeroesBase(name: "Cupid", image: "311.png"),
                                HeroesBase(name: "Immortep", image: "312.png"),
                                HeroesBase(name: "Aries", image: "313.png"),
                                HeroesBase(name: "Vlad Dracula", image: "314.png"),
                                HeroesBase(name: "Death Knight", image: "315.png"),
                                HeroesBase(name: "Orksbane", image: "316.png"),
                                HeroesBase(name: "Santa Boom", image: "317.png"),
                                HeroesBase(name: "Pixie", image: "318.png"),
                                HeroesBase(name: "Siren", image: "319.png"),
                                HeroesBase(name: "Warlock", image: "320.png"),
                                HeroesBase(name: "Treantaur", image: "321.png"),
                                HeroesBase(name: "Harpy Queen", image: "322.png"),
                                HeroesBase(name: "Skull Knight", image: "323.png"),
                                HeroesBase(name: "Dread Drake", image: "324.png"),
                                HeroesBase(name: "Ghoulem", image: "325.png"),
                                HeroesBase(name: "Candy Kane", image: "326.png"),
                                HeroesBase(name: "Valentina", image: "327.png"),
                                HeroesBase(name: "Phantom King", image: "328.png"),
                                HeroesBase(name: "Beast Tamer", image: "329.png"),
                                HeroesBase(name: "Lady Leo", image: "330.png"),
                                HeroesBase(name: "Grimfiend", image: "331.png"),
                                HeroesBase(name: "Dracax", image: "332.png"),
                                HeroesBase(name: "Medusa", image: "333.png"),
                                HeroesBase(name: "Trixie Treat", image: "334.png"),
                                HeroesBase(name: "Revenant", image: "335.png"),
                                HeroesBase(name: "Lil' Nick", image: "336.png"),
                                HeroesBase(name: "Michael", image: "337.png"),
                                HeroesBase(name: "Heartbreaker", image: "338.png"),
                                HeroesBase(name: "Anubis", image: "339.png"),
                                HeroesBase(name: "Ronin", image: "340.png"),
                                HeroesBase(name: "Gunslinger", image: "341.png"),
                                HeroesBase(name: "Rockno", image: "342.png"),
                                HeroesBase(name: "Mechtessa", image: "343.png"),
                                HeroesBase(name: "Wallawalla", image: "344.png"),
                                HeroesBase(name: "Creation-01", image: "345.png"),
                                HeroesBase(name: "Athene", image: "346.png"),
                                HeroesBase(name: "Sasquatch", image: "347.png"),
                                HeroesBase(name: "Espirita", image: "348.png"),
                                HeroesBase(name: "Dove Keeper", image: "349.png"),
                                HeroesBase(name: "Cirrina", image: "350.png"),
                                HeroesBase(name: "Storm Eater", image: "351.png"),
                                HeroesBase(name: "Professor Ribbit", image: "352.png"),
                                HeroesBase(name: "Asura", image: "353.png"),
                                HeroesBase(name: "Ma Hatma", image: "354.png"),
                                HeroesBase(name: "Rowdy Rascals", image: "355.png"),
                                HeroesBase(name: "Bogeyman", image: "356.png"),
                                HeroesBase(name: "Commodora", image: "357.png"),
                                HeroesBase(name: "Lazulix", image: "358.png")]
    
    var donateHeroesArray = [HeroesBase(name: "Spirit Mage", image: "401.png"),
                             HeroesBase(name: "Minotaur Chieftain", image: "402.png"),
                             HeroesBase(name: "Moltanica", image: "403.png"),
                             HeroesBase(name: "Destroyer", image: "404.png"),
                             HeroesBase(name: "Arctica", image: "405.png"),
                             HeroesBase(name: "Demogorgon", image: "406.png"),
                             HeroesBase(name: "Skeletica", image: "407.png"),
                             HeroesBase(name: "Lavanica", image: "408.png")]
    
    var allHeroesArray = [Heroes(name: "Slime", image: "001.png", alpha: 0.5),
                          Heroes(name: "Crystal Ooze", image: "002.png", alpha: 0.5),
                          Heroes(name: "Gelatinous Champion", image: "003.png", alpha: 0.5),
                          Heroes(name: "Angel", image: "101.png", alpha: 0.5),
                          Heroes(name: "Marauder", image: "102.png", alpha: 0.5),
                          Heroes(name: "Hill Giant", image: "103.png", alpha: 0.5),
                          Heroes(name: "Engineer", image: "104.png", alpha: 0.5),
                          Heroes(name: "Frost Witch", image: "105.png", alpha: 0.5),
                          Heroes(name: "Dryad", image: "106.png", alpha: 0.5),
                          Heroes(name: "Alchemist", image: "107.png", alpha: 0.5),
                          Heroes(name: "Marksman", image: "108.png", alpha: 0.5),
                          Heroes(name: "Executioner", image: "201.png", alpha: 0.5),
                          Heroes(name: "Assassin", image: "202.png", alpha: 0.5),
                          Heroes(name: "Werewolf", image: "203.png", alpha: 0.5),
                          Heroes(name: "Cyclops", image: "204.png", alpha: 0.5),
                          Heroes(name: "Shaman", image: "205.png", alpha: 0.5),
                          Heroes(name: "Pain-Da", image: "206.png", alpha: 0.5),
                          Heroes(name: "Serpent Queen", image: "207.png", alpha: 0.5),
                          Heroes(name: "Ice Demon", image: "208.png", alpha: 0.5),
                          Heroes(name: "Paladin", image: "301.png", alpha: 0.5),
                          Heroes(name: "Spirit Mage", image: "401.png", alpha: 0.5),
                          Heroes(name: "Ninja", image: "302.png", alpha: 0.5),
                          Heroes(name: "Succubus", image: "303.png", alpha: 0.5),
                          Heroes(name: "Champion", image: "304.png", alpha: 0.5),
                          Heroes(name: "Druid", image: "305.png", alpha: 0.5),
                          Heroes(name: "Thunder God", image: "306.png", alpha: 0.5),
                          Heroes(name: "Pumpkin Duke", image: "307.png", alpha: 0.5),
                          Heroes(name: "Minotaur Chieftain", image: "402.png", alpha: 0.5),
                          Heroes(name: "Grizzly Reaper", image: "308.png", alpha: 0.5),
                          Heroes(name: "Atlanticore", image: "309.png", alpha: 0.5),
                          Heroes(name: "Snowzilla", image: "310.png", alpha: 0.5),
                          Heroes(name: "Cupid", image: "311.png", alpha: 0.5),
                          Heroes(name: "Immortep", image: "312.png", alpha: 0.5),
                          Heroes(name: "Moltanica", image: "403.png", alpha: 0.5),
                          Heroes(name: "Aries", image: "313.png", alpha: 0.5),
                          Heroes(name: "Vlad Dracula", image: "314.png", alpha: 0.5),
                          Heroes(name: "Death Knight", image: "315.png", alpha: 0.5),
                          Heroes(name: "Orksbane", image: "316.png", alpha: 0.5),
                          Heroes(name: "Santa Boom", image: "317.png", alpha: 0.5),
                          Heroes(name: "Pixie", image: "318.png", alpha: 0.5),
                          Heroes(name: "Siren", image: "319.png", alpha: 0.5),
                          Heroes(name: "Destroyer", image: "404.png", alpha: 0.5),
                          Heroes(name: "Warlock", image: "320.png", alpha: 0.5),
                          Heroes(name: "Treantaur", image: "321.png", alpha: 0.5),
                          Heroes(name: "Harpy Queen", image: "322.png", alpha: 0.5),
                          Heroes(name: "Skull Knight", image: "323.png", alpha: 0.5),
                          Heroes(name: "Dread Drake", image: "324.png", alpha: 0.5),
                          Heroes(name: "Ghoulem", image: "325.png", alpha: 0.5),
                          Heroes(name: "Candy Kane", image: "326.png", alpha: 0.5),
                          Heroes(name: "Arctica", image: "405.png", alpha: 0.5),
                          Heroes(name: "Valentina", image: "327.png", alpha: 0.5),
                          Heroes(name: "Phantom King", image: "328.png", alpha: 0.5),
                          Heroes(name: "Beast Tamer", image: "329.png", alpha: 0.5),
                          Heroes(name: "Lady Leo", image: "330.png", alpha: 0.5),
                          Heroes(name: "Grimfiend", image: "331.png", alpha: 0.5),
                          Heroes(name: "Dracax", image: "332.png", alpha: 0.5),
                          Heroes(name: "Medusa", image: "333.png", alpha: 0.5),
                          Heroes(name: "Demogorgon", image: "406.png", alpha: 0.5),
                          Heroes(name: "Trixie Treat", image: "334.png", alpha: 0.5),
                          Heroes(name: "Revenant", image: "335.png", alpha: 0.5),
                          Heroes(name: "Lil' Nick", image: "336.png", alpha: 0.5),
                          Heroes(name: "Michael", image: "337.png", alpha: 0.5),
                          Heroes(name: "Heartbreaker", image: "338.png", alpha: 0.5),
                          Heroes(name: "Anubis", image: "339.png", alpha: 0.5),
                          Heroes(name: "Ronin", image: "340.png", alpha: 0.5),
                          Heroes(name: "Gunslinger", image: "341.png", alpha: 0.5),
                          Heroes(name: "Rockno", image: "342.png", alpha: 0.5),
                          Heroes(name: "Mechtessa", image: "343.png", alpha: 0.5),
                          Heroes(name: "Skeletica", image: "407.png", alpha: 0.5),
                          Heroes(name: "Wallawalla", image: "344.png", alpha: 0.5),
                          Heroes(name: "Creation-01", image: "345.png", alpha: 0.5),
                          Heroes(name: "Athene", image: "346.png", alpha: 0.5),
                          Heroes(name: "Sasquatch", image: "347.png", alpha: 0.5),
                          Heroes(name: "Espirita", image: "348.png", alpha: 0.5),
                          Heroes(name: "Dove Keeper", image: "349.png", alpha: 0.5),
                          Heroes(name: "Cirrina", image: "350.png", alpha: 0.5),
                          Heroes(name: "Storm Eater", image: "351.png", alpha: 0.5),
                          Heroes(name: "Professor Ribbit", image: "352.png", alpha: 0.5),
                          Heroes(name: "Lavanica", image: "408.png", alpha: 0.5),
                          Heroes(name: "Asura", image: "353.png", alpha: 0.5),
                          Heroes(name: "Ma Hatma", image: "354.png", alpha: 0.5),
                          Heroes(name: "Rowdy Rascals", image: "355.png", alpha: 0.5),
                          Heroes(name: "Bogeyman", image: "356.png", alpha: 0.5),
                          Heroes(name: "Commodora", image: "357.png", alpha: 0.5),
                          Heroes(name: "Lazulix", image: "358.png", alpha: 0.5)]
}

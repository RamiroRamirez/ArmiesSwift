//
//  ARSkateCreator.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 15/11/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import Foundation

class ARSkateCreator: NSObject {
    
    static var skaters     : [ARSkater]? = []
    
    class func createSkaters() {
        
        // create Rene
        let reneSkater = ARSkateCreator.createSkater("Rene de la Fuente", occupation: "Editor y Camarógrafo", birthplace: "Monterrey, Nuevo León", favoriteMovie: "Yeah Right", favoriteFood: "Tacos de bistec", videos: ["z8_LRIrnwTI", "uRKiM-pwJqQ", "DLVDPrKuXKI", "NC3TX2s-7DY", "Rcn6tue26PQ", "Uf-O5X4IV4U"], profileImage: "rene2.png", images: ["rene1.png", "rene3.jpg", "rene4.jpg"])
        
        // create Selim
        let selimSkater = ARSkateCreator.createSkater("Selim Lopez", occupation: "Editor y Camarógrafo", birthplace: "Monterrey, Nuevo León", favoriteMovie: "Pretty Sweet​​", favoriteFood: "Arabe", videos: ["vP4W6AoiMLk", "XMxozXQ_rc4", "XQCSi-StZoo", "ryvm5aszSc0", "hy_jCsNxz0U", "AeOfeLRNSR8"], profileImage: "selim1.png", images: ["selim2.jpg", "selim3.jpg", "selim4.png"])
        
        // create Martin
        let martinSkater = ARSkateCreator.createSkater("Martin Serrano", occupation: "Editor y Camarógrafo", birthplace: "Monterrey, Nuevo León", favoriteMovie: "Made", favoriteFood: "Pizza", videos: ["1M-XALIGJss", "v6OJjQfEN28", "m5b9EGE4dVk", "uYfb8DtW8no", "ftVQgsyrYT8"], profileImage: "martin1.jpg", images: ["martin2.jpg", "martin3.jpg", "martin4.jpg"])
        if let
            _rene = reneSkater,
            _selim = selimSkater,
            _martin = martinSkater {
                self.skaters?.append(_rene)
                self.skaters?.append(_selim)
                self.skaters?.append(_martin)
        }
    }
    
    class func createSkater(name: String?, occupation: String?, birthplace: String?, favoriteMovie: String?, favoriteFood: String?, videos: [String]?, profileImage: String?, images: [String]?) -> ARSkater? {
        
        let skater = ARSkater()
        skater.name = name
        skater.occupation = occupation
        skater.city = birthplace
        skater.favoriteMovie = favoriteMovie
        skater.favoriteFood = favoriteFood
        skater.videos = videos
        skater.profileImage = profileImage
        skater.images = images
        
        return skater
    }
}
//
//  PiecesClass.swift
//  ChessBoi
//
//  Created by  on 1/10/17.
//  Copyright © 2017 BenApps. All rights reserved.
//

import Foundation
import UIKit

class pieces : UIImage {
    var moves = 1
    var colorBlack = Bool()
    var type = ""
}

class Tile {
    var imageView = UIImageView()
    var piece = UIImage()
    var occupied = Bool()
    var identifier = 0
    var colum = 0
    var row = 0
    var isHighlited = false
    var x = Double()
    var y = Double()
    var width = Double()
    var height = Double()
    
    convenience init(x: Double, y: Double, width: Double, height: Double) {
    self.init()
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    }
        }
   

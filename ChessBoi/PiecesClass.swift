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
    var oddEven = 0
    
    convenience init(x: Double, y: Double, width: Double, height: Double) {
    self.init()
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    }
}
   
//knight +6 -6, +10 -10, +15 -15, +17 -17
//bishop % 7 == 3 or % 9 == 2
//king +1 -1, +7 -7, +8 -8, +9 -9
//queen bishop + rook
//rook =
//pawn if statement for first move is +-2 or +-1, else, +-1, else occupied by other color = +9 -7, -9 +7

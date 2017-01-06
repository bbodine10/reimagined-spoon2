//
//  ViewController.swift
//  ChessBoi
//
//  Created by  on 1/3/17.
//  Copyright © 2017 BenApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tiles: [UIView] = []
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        // Do any additional setup loading the view, typically from a nib.
    
    let screenWidth = Double(UIScreen.main.bounds.width)
    let tileWidth = (screenWidth/8)
   
    for x in 0...7 {
        counter += 1
        
        for y in 0...7 {
            counter += 1
            var images = UIImageView(frame: CGRect(x: tileWidth * Double(CGFloat(x)), y: 50 * Double(CGFloat(y)) + 100, width: tileWidth, height: tileWidth))
            if counter % 2 == 0 {
            images.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                images.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }
            self.view.addSubview(images)
            tiles.append(images)
            images.tag = counter
            
            if counter == 3 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 12 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 21 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 30 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 39 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 48 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 57 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 66 {images.image = #imageLiteral(resourceName: "WhitePawn")}
            if counter == 2 {images.image = #imageLiteral(resourceName: "WhiteRook")}
            if counter == 11 {images.image = #imageLiteral(resourceName: "WhiteKnight")}
            if counter == 20 {images.image = #imageLiteral(resourceName: "WhiteBishop")}
            if counter == 29 {images.image = #imageLiteral(resourceName: "WhiteKing")}
            if counter == 38 {images.image = #imageLiteral(resourceName: "WhiteQueen")}
            if counter == 47 {images.image = #imageLiteral(resourceName: "WhiteBishop")}
            if counter == 56 {images.image = #imageLiteral(resourceName: "WhiteKnight")}
            if counter == 65 {images.image = #imageLiteral(resourceName: "WhiteRook")}
    
            if counter == 8 { images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 17 {images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 26 {images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 35 {images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 44 {images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 53 {images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 62 {images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 71 {images.image = #imageLiteral(resourceName: "BlackPawn")}
            if counter == 9 {images.image = #imageLiteral(resourceName: "BlackRook")}
            if counter == 18 {images.image = #imageLiteral(resourceName: "BlackKnight")}
            if counter == 27 {images.image = #imageLiteral(resourceName: "BlackBishop")}
            if counter == 36 {images.image = #imageLiteral(resourceName: "BlackKing")}
            if counter == 45 {images.image = #imageLiteral(resourceName: "BlackQueen")}
            if counter == 54 {images.image = #imageLiteral(resourceName: "BlackBishop")}
            if counter == 63 {images.image = #imageLiteral(resourceName: "BlackKnight")}
            if counter == 72 {images.image = #imageLiteral(resourceName: "BlackRook")}
            
                
        }
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


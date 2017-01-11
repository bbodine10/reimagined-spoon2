//
//  ViewController.swift
//  ChessBoi
//
//  Created by  on 1/3/17.
//  Copyright © 2017 BenApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    
    var tiles: [Tile] = []
    var counter = 0
//    var newTile = Tile.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        // Do any additional setup loading the view, typically from a nib.
        CreateBoard()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        
        for newTile in tiles {
            newTile.imageView.layer.borderWidth = 0
        }
        let imageView = sender.view as! UIImageView
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.yellow.cgColor

    }
    func handleDoubleTap(_sender: UITapGestureRecognizer) {
        print("double Tapped")
        let imageView = _sender.view as! UIImageView
        for newTile in tiles {
            if newTile.imageView.layer.borderWidth == 2 {
                imageView.image = newTile.imageView.image
                newTile.imageView.image = nil
                imageView.layer.borderWidth = 0
            }
            
        }
        checkLoss()
       
    }
    
    func CreateBoard() {
        let screenWidth = Double(UIScreen.main.bounds.width)
        let tileWidth = (screenWidth/8)
        
        for x in 0...7 {
            counter += 1
            
            for y in 0...7 {
                counter += 1
                var newTile = Tile(x: tileWidth * Double(CGFloat(x)), y:  50 * Double(CGFloat(y)) + 100, width: tileWidth, height: tileWidth)
                
                newTile.imageView = UIImageView(frame: CGRect(x: newTile.x, y: newTile.y, width: newTile.width, height: newTile.height))
                
                if counter % 2 == 0 {
                    newTile.imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    newTile.imageView.tag = 1
                }
                else {
                    newTile.imageView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                    newTile.imageView.tag = -1
                }
                self.view.addSubview(newTile.imageView)
                tiles.append(newTile)
                //                newTile.imageView.identifier = counter
                
                let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.handleDoubleTap(_sender:)))
                doubleTap.numberOfTapsRequired = 2
                doubleTap.requiresExclusiveTouchType = true
                doubleTap.cancelsTouchesInView = true
                doubleTap.delegate = self
                newTile.imageView.addGestureRecognizer(doubleTap)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
                tap.delegate = self
                tap.requiresExclusiveTouchType = true
                newTile.imageView.addGestureRecognizer(tap)
                tap.require(toFail: doubleTap)
                newTile.imageView.isUserInteractionEnabled = true
                
                
                if counter == 3  {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 12 {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 21 {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 30 {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 39 {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 48 {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 57 {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 66 {newTile.imageView.image = #imageLiteral(resourceName: "WhitePawn")}
                if counter == 2  {newTile.imageView.image = #imageLiteral(resourceName: "WhiteRook")}
                if counter == 11 {newTile.imageView.image = #imageLiteral(resourceName: "WhiteKnight")}
                if counter == 20 {newTile.imageView.image = #imageLiteral(resourceName: "WhiteBishop")}
                if counter == 29 {newTile.imageView.image = #imageLiteral(resourceName: "WhiteKing")}
                if counter == 38 {newTile.imageView.image = #imageLiteral(resourceName: "WhiteQueen")}
                if counter == 47 {newTile.imageView.image = #imageLiteral(resourceName: "WhiteBishop")}
                if counter == 56 {newTile.imageView.image = #imageLiteral(resourceName: "WhiteKnight")}
                if counter == 65 {newTile.imageView.image = #imageLiteral(resourceName: "WhiteRook")}
                
                if counter == 8  {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 17 {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 26 {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 35 {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 44 {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 53 {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 62 {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 71 {newTile.imageView.image = #imageLiteral(resourceName: "BlackPawn")}
                if counter == 9  {newTile.imageView.image = #imageLiteral(resourceName: "BlackRook")}
                if counter == 18 {newTile.imageView.image = #imageLiteral(resourceName: "BlackKnight")}
                if counter == 27 {newTile.imageView.image = #imageLiteral(resourceName: "BlackBishop")}
                if counter == 36 {newTile.imageView.image = #imageLiteral(resourceName: "BlackKing")}
                if counter == 45 {newTile.imageView.image = #imageLiteral(resourceName: "BlackQueen")}
                if counter == 54 {newTile.imageView.image = #imageLiteral(resourceName: "BlackBishop")}
                if counter == 63 {newTile.imageView.image = #imageLiteral(resourceName: "BlackKnight")}
                if counter == 72 {newTile.imageView.image = #imageLiteral(resourceName: "BlackRook")}
                
            }
        }
    }
    func checkLoss() {
        //check for loss
        var BKing = 0
        var WKing = 0
        for newTile in tiles {
            if newTile.imageView.image == #imageLiteral(resourceName: "BlackKing") {
                BKing += 1
            }
            if newTile.imageView.image == #imageLiteral(resourceName: "WhiteKing") {
                WKing += 1
            }
        }
        if BKing == 0 {
            let alert = UIAlertController(title: "Black Has Lost!", message: nil, preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(OK)
        }
        if WKing == 0 {
            let alert = UIAlertController(title: "White Has Lost!", message: nil, preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(OK)        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        for newTile in tiles {
            newTile.imageView.removeFromSuperview()
            view.reloadInputViews()
        }
        for a in 0...72 {
            if counter == a {
                counter = 0
            }
        }
        print("New Game")
        CreateBoard()
    }
}


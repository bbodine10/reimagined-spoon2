//
//  ViewController.swift
//  ChessBoi
//
//  Created by  on 1/3/17.
//  Copyright © 2017 BenApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    
    var tiles: [UIImageView] = []
    var counter = 0
    var images = UIImageView()
    
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
        
        for images in tiles {
            images.layer.borderWidth = 0
        }
        let imageView = sender.view as! UIImageView
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.yellow.cgColor
        
    }
    func handleDoubleTap(_sender: UITapGestureRecognizer) {
        print("double Tapped")
        let imageView = _sender.view as! UIImageView
        for images in tiles {
            if images.layer.borderWidth == 2 {
                imageView.image = images.image
                images.image = nil
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
                var images = UIImageView(frame: CGRect(x: tileWidth * Double(CGFloat(x)), y: 50 * Double(CGFloat(y)) + 100, width: tileWidth, height: tileWidth))
                if counter % 2 == 0 {
                    images.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
                else {
                    images.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
                self.view.addSubview(images)
                tiles.append(images)
                //                images.identifier = counter
                
                let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.handleDoubleTap(_sender:)))
                doubleTap.numberOfTapsRequired = 2
                doubleTap.requiresExclusiveTouchType = true
                doubleTap.cancelsTouchesInView = true
                doubleTap.delegate = self
                images.addGestureRecognizer(doubleTap)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
                tap.delegate = self
                tap.requiresExclusiveTouchType = true
                images.addGestureRecognizer(tap)
                tap.require(toFail: doubleTap)
                images.isUserInteractionEnabled = true
                
                
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
    func checkLoss() {
        //check for loss
        var BKing = 0
        var WKing = 0
        for images in tiles {
            if images.image == #imageLiteral(resourceName: "BlackKing") {
                BKing += 1
            }
            if images.image == #imageLiteral(resourceName: "WhiteKing") {
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
        for image in tiles {
            image.removeFromSuperview()
            view.reloadInputViews()
            
        }
        for a in 0...63 {
            tiles.remove(at: a)
        }
        
        CreateBoard()
    }
}


//
//  GameHub.swift
//  SKTest
//
//  Created by Justin Zhai on 1/22/23.
//

import SpriteKit

class GameHub: SKScene {
    
    var logoLabel: SKLabelNode?
    var tapToPlayLabel : SKLabelNode?
    var pointsLabel: SKLabelNode?
    
    init(with size: CGSize, menu: Bool) {
        super.init(size: size)
        
        if menu {
            addMenuLabel()
        } else {
            addPointsLabel()
        }
    }
    
    func addMenuLabel() {
        logoLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold" )
        tapToPlayLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        
        guard let logoLabel = logoLabel, let tapToPlayLabel = tapToPlayLabel else {
            return
        }
        
        logoLabel.text = "Going to School"
        logoLabel.fontSize = 32.5
        logoLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(logoLabel)
        
        tapToPlayLabel.text = "Tap to Play"
        tapToPlayLabel.fontSize = 25
        tapToPlayLabel.position = CGPoint(x: frame.midX, y: frame.midY - logoLabel.frame.size.height)
        addChild(tapToPlayLabel)
    }
    
    func addPointsLabel() {
        pointsLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        guard let pointsLabel = pointsLabel else {
            return
        }
        
        pointsLabel.text = "0"
        pointsLabel.fontSize = 40
        pointsLabel.position = CGPoint(x: frame.minX + pointsLabel.frame.size.width, y: frame.maxY - pointsLabel.frame.size.height*2)
        addChild(pointsLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

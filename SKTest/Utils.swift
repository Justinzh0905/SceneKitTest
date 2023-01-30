//
//  Utils.swift
//  SKTest
//
//  Created by Justin Zhai on 1/20/23.
//

import Foundation
import SceneKit

let degressPerRadians = Float(Double.pi/180)
let radiansPerDegrees = Float(180/Double.pi)


func toRadians(angle: Float) -> Float {
    return angle * degressPerRadians
}

func toRadians(angle: CGFloat) -> CGFloat {
    return angle * CGFloat(degressPerRadians)
}

func randomBool(_ numerator: Int, _ denominator: Int) -> Bool {
    
    if Int.random(in: 0..<denominator) < numerator {
        return true
    } else {
        return false
    }
}

struct Models {
    private static let bushScene = SCNScene(named: "art.scnassets/bush.scn")!
    static let bush = bushScene.rootNode.childNode(withName: "bush", recursively: true)!
    
    private static let busScene = SCNScene(named: "art.scnassets/bus.scn")!
    static let bus = busScene.rootNode.childNode(withName: "bus", recursively: true)!
}

struct PhysicsCategory {
    static let sheep = 1
    static let vehicle = 2
    static let vegetation = 4
    
    static let collisionTestFront = 8
    static let collisionTestRight = 16
    static let collisionTestLeft = 32
}

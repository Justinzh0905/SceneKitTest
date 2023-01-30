//
//  LaneNode.swift
//  SKTest
//
//  Created by Justin Zhai on 1/20/23.
//

import SceneKit

enum LaneType {
    case grass, road
}

class TrafficNode: SCNNode {
    let type: Int
    let directionRight: Bool
    
    init(type: Int, directionRight: Bool) {
        self.type = type
        self.directionRight = directionRight
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LaneNode: SCNNode {

    let type: LaneType
    var trafficNode: TrafficNode?
    
    init(type: LaneType, width: CGFloat) {
        self.type = type
        super.init()
        
        switch type {
        case .grass:
            guard let texture = UIImage(named: "art.scnassets/darkgrass.jpg") else {
                break
            }
            createLane(width: width, height: 0.4, image: texture)
        case .road:
            guard let texture = UIImage(named: "art.scnassets/asphalt.jpg") else {
                break
            }
            trafficNode = TrafficNode(type: Int.random(in: 0...2), directionRight: randomBool(1, 2))
            addChildNode(trafficNode!)
            
            createLane(width: width, height: 0.05, image: texture)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLane(width: CGFloat, height: CGFloat, image: UIImage) {
        let laneGeometry = SCNBox(width: width, height: height, length: 1, chamferRadius: 0)
        
        laneGeometry.firstMaterial?.diffuse.contents = image
        laneGeometry.firstMaterial?.diffuse.wrapS = .repeat
        laneGeometry.firstMaterial?.diffuse.wrapT = .repeat
        laneGeometry.firstMaterial?.diffuse.contentsTransform = SCNMatrix4MakeScale(Float(width), 1, 1)
        
        let laneNode = SCNNode(geometry: laneGeometry)
        
        addChildNode(laneNode)
        addElements(width, laneNode)
    }
    
    func addElements(_ width: CGFloat, _ laneNode: SCNNode) {
        var carGap = 0
        
        for index in 0..<Int(width) {
            if type == .grass {
                if randomBool(1, 7) {
                    let vegetation = getVegetation()
                    vegetation.position = SCNVector3(x: 10 - Float(index), y: 0, z: 0)
                    laneNode.addChildNode(vegetation)
                }
            } else {
                carGap+=1
                if carGap > 3 {
                    guard let trafficNode = trafficNode else {
                        continue
                    }
                    if randomBool(1, 4) {
                        carGap = 0
                        let vehicle = getVehicle()
                        vehicle.position = SCNVector3(x: 10 - Float(index), y: 0, z: 0)
                        vehicle.eulerAngles = trafficNode.directionRight ? SCNVector3Zero : SCNVector3(x: 0, y: toRadians(angle: 180), z: 0)
                        trafficNode.addChildNode(vehicle)
                    }
                }
            }
        }
    }
    
    func getVehicle() -> SCNNode {
        Models.bus.clone()
    }
    
    func getVegetation() -> SCNNode {
        Models.bush.clone()
    }
}

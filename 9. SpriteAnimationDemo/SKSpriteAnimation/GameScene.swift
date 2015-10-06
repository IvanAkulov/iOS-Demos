//
//  GameScene.swift
//  SKSpriteAnimation
//
//  Created by p1us on 04.10.15.
//  Copyright (c) 2015 Ivan Akulov. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  var textureAtlas = SKTextureAtlas()
  var textureArray = [SKTexture]()
  
  var mystique: SKSpriteNode!
  
  override func didMoveToView(view: SKView) {
    
    textureAtlas = SKTextureAtlas(named: "mystique")
    
    for i in 1...textureAtlas.textureNames.count {
      let name = "mystique_run_00\(i).png"
    
      textureArray.append(SKTexture(imageNamed: name))
    }
    
    mystique = SKSpriteNode(imageNamed: textureAtlas.textureNames[0])
    mystique.size = CGSize(width: 300, height: 300)
    mystique.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    
    addChild(mystique)
    
    let animationWithTextures = SKAction.animateWithTextures(textureArray, timePerFrame: 0.1)
    let repeatActionForever = SKAction.repeatActionForever(animationWithTextures)
    
    mystique.runAction(repeatActionForever)
    

    
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    /* Called when a touch begins */
    
    for touch in touches {
      let location = touch.locationInNode(self)
      
      let sprite = SKSpriteNode(imageNamed:"Spaceship")
      
      sprite.xScale = 0.5
      sprite.yScale = 0.5
      sprite.position = location
      
      let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
      
      sprite.runAction(SKAction.repeatActionForever(action))
      
      self.addChild(sprite)
    }
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
}

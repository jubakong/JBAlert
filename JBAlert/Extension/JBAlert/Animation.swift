//
//  Animation.swift
//  JBAlert
//
//  Created by Jeongbae Kong on 2020/04/15.
//  Copyright © 2020 Jeongbae Kong. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Animation: UIView {
  
  enum AnimationType {
    case check
    case remove
  }
  
  // MARK: Public variables
  var animatedLayerColor: UIColor = .black {
    didSet {
      animatedLayer?.strokeColor = animatedLayerColor.cgColor
    }
  }
  var strokeWidth: CGFloat = 4 {
    didSet {
      animatedLayer?.lineWidth = strokeWidth
    }
  }
  
  // MARK: Private variables
  private var animatedLayer: CAShapeLayer?
  
  // MARK: Overriding methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
  }
  
  // MARK: Public methods
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    configureView()
  }
  
  public func animate(duration: TimeInterval = 0.5, animationType: UIViewController.AlertType) {
    if animatedLayer == nil {
      animatedLayer = createCheckmarkLayer(strokeColor: animatedLayerColor, strokeEnd: 0, animationType)
      layer.addSublayer(animatedLayer!)
    }
    
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0
    animation.toValue = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.duration = duration
    
    animatedLayer?.strokeEnd = 1
    animatedLayer?.add(animation, forKey: "animateCheckmark")
  }
  
  public func animate(duration: TimeInterval = 0.2, animationType: AnimationType) {
    switch animationType {
    case .check:
      animatedLayer?.removeFromSuperlayer()
      animatedLayer = nil
      animatedLayer = createCheckmarkLayer(strokeColor: animatedLayerColor, strokeEnd: 0, .check)
      layer.addSublayer(animatedLayer!)
    case .remove:
      animatedLayer?.removeFromSuperlayer()
      animatedLayer = nil
    }
    
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0
    animation.toValue = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.duration = duration
    
    animatedLayer?.strokeEnd = 1
    animatedLayer?.add(animation, forKey: "animateCheckmark")
  }
  
  // MARK: Private methods
  private func configureView() {
    backgroundColor = UIColor.clear
    strokeWidth = 4
  }
  
  private func createCheckmarkLayer(
    strokeColor: UIColor,
    strokeEnd: CGFloat,
    _ type: UIViewController.AlertType
  ) -> CAShapeLayer {
    let scale = frame.width / 100
    let centerX = frame.size.width / 2
    let centerY = frame.size.height / 2
    let startAngle = -CGFloat(Double.pi / 2)
    
    let checkmarkPath = UIBezierPath(
      arcCenter: CGPoint(x: centerX, y: centerY),
      radius: centerX,
      startAngle:  startAngle,
      endAngle: startAngle * 5,
      clockwise: false
    )
    
    switch type {
    case .success:
      checkmarkPath.move(to: CGPoint(x: centerX - 23 * scale, y: centerY - 1 * scale))
      checkmarkPath.addLine(to: CGPoint(x: centerX - 6 * scale, y: centerY + 15.9 * scale))
      checkmarkPath.addLine(to: CGPoint(x: centerX + 22.8 * scale, y: centerY - 13.4 * scale))
    case .fail:
      checkmarkPath.move(to: CGPoint(x: centerX - 18 * scale, y: centerY - 18 * scale))
      checkmarkPath.addLine(to: CGPoint(x: centerX + 18 * scale, y: centerY + 18 * scale))
      checkmarkPath.move(to: CGPoint(x: centerX + 18 * scale, y: centerY - 18 * scale))
      checkmarkPath.addLine(to: CGPoint(x: centerX - 18 * scale, y: centerY + 18 * scale))
      
    case .alert: ()
    }
    
    let checkmarkLayer = CAShapeLayer()
    checkmarkLayer.fillColor = UIColor.clear.cgColor
    checkmarkLayer.lineWidth = strokeWidth
    checkmarkLayer.path = checkmarkPath.cgPath
    checkmarkLayer.strokeEnd = strokeEnd
    checkmarkLayer.strokeColor = strokeColor.cgColor
    checkmarkLayer.lineCap = CAShapeLayerLineCap.round
    checkmarkLayer.lineJoin = CAShapeLayerLineJoin.round
    
    return checkmarkLayer
  }
  
  private func createCheckmarkLayer(
    strokeColor: UIColor,
    strokeEnd: CGFloat,
    _ type: AnimationType
  ) -> CAShapeLayer {
    let scale = frame.width / 100
    let centerX = frame.size.width / 2
    let centerY = frame.size.height / 2
    
    let checkmarkPath = UIBezierPath()
    
    switch type {
    case .check:
      checkmarkPath.move(to: CGPoint(x: centerX - 23 * scale, y: centerY - 1 * scale))
      checkmarkPath.addLine(to: CGPoint(x: centerX - 6 * scale, y: centerY + 15.9 * scale))
      checkmarkPath.addLine(to: CGPoint(x: centerX + 22.8 * scale, y: centerY - 13.4 * scale))
    case .remove: ()
    }
    
    let checkmarkLayer = CAShapeLayer()
    checkmarkLayer.fillColor = UIColor.clear.cgColor
    checkmarkLayer.lineWidth = strokeWidth
    checkmarkLayer.path = checkmarkPath.cgPath
    checkmarkLayer.strokeEnd = strokeEnd
    checkmarkLayer.strokeColor = strokeColor.cgColor
    checkmarkLayer.lineCap = CAShapeLayerLineCap.round
    checkmarkLayer.lineJoin = CAShapeLayerLineJoin.round
    
    return checkmarkLayer
  }
}



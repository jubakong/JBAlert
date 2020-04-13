//
//  JBAlertViewController.swift
//  JBAlert
//
//  Created by Jeongbae Kong on 2020/04/12.
//  Copyright © 2020 Jeongbae Kong. All rights reserved.
//

import UIKit

class JBAlertViewController: UIViewController {
  
  // MARK: Properties
  private var rightButtonAction: (() -> Void)?
  private var leftButtonAction: (() -> Void)?
  
  private var titleText: String?
  private var messageText: String?
  private var rightButtonTitle: String?
  private var leftButtonTitle: String?
  
  private var type: AlertType = .alert
  
  // MARK: IBOutlet
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var leftButton: UIButton!
  @IBOutlet weak var rightButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  init(type: AlertType = .alert,
       title:String? = "Alert",
       message:String? = nil,
       rightButtonTitle: String? = nil,
       leftButtonTitle: String? = nil,
       rightButtonAction: (() -> Void)? = nil,
       leftButtonAction: (() -> Void)? = nil
  ) {
    super.init(nibName: "JBAlertViewController", bundle: nil)
    self.type = type
    self.titleText = title
    self.messageText = message
    self.rightButtonTitle = rightButtonTitle
    self.leftButtonTitle = leftButtonTitle
    
    self.rightButtonAction = rightButtonAction
    self.leftButtonAction = leftButtonAction
    
    modalPresentationStyle = .overFullScreen
    modalTransitionStyle = .crossDissolve
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    
    titleLabel.adjustsFontSizeToFitWidth = true
    messageLabel.adjustsFontSizeToFitWidth = true
    
    if leftButtonAction == nil {
      leftButton.isHidden = true
      leftButton.isEnabled = false
    }
    titleLabel.text = titleText
    messageLabel.text = messageText
    rightButton.setTitle(rightButtonTitle, for: .normal)
    leftButton.setTitle(leftButtonTitle, for: .normal)
  }
  
  @IBAction func touchRightButton(_ sender: UIButton) {
    rightButtonAction?()
  }
  
  @IBAction func touchLeftButton(_ sender: UIButton) {
    leftButtonAction?()
  }
  
  
  
  
}

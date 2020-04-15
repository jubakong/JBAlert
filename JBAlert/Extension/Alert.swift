//
//  Alert.swift
//  JBAlert
//
//  Created by Jeongbae Kong on 2020/04/09.
//  Copyright © 2020 Jeongbae Kong. All rights reserved.
//

import UIKit

extension UIViewController {
  
  // TODO : 3: Animation: Alert, Cancel, Success
  
  enum AlertType {
    case success
    case fail
    case alert
  }
  
  func alertWithoutCancel(type:AlertType = .alert,
             message: String?,
             title: String?,
             rightButtonTitle: String? = "OK",
             rightButtonAction: (() -> Void)? = nil
  ) {
    let JBAlert = JBAlertViewController(
      type: type,
      title: title,
      message: message,
      rightButtonTitle: rightButtonTitle,
      rightButtonAction: rightButtonAction
    )
      
    present(JBAlert, animated: true)
  }
  
  func alertWithCancel(type:AlertType = .alert,
             message: String?,
             title: String?,
             rightButtonTitle: String? = "OK",
             cancelButton: String? = nil,
             rightButtonAction: (() -> Void)? = nil,
             leftButtonAction: (() -> Void)? = nil
  ) {
    let JBAlert = JBAlertViewController(
      type: type,
      title: title,
      message: message,
      rightButtonTitle: rightButtonTitle,
      leftButtonTitle: cancelButton,
      rightButtonAction: rightButtonAction,
      leftButtonAction: leftButtonAction
    )
    
    present(JBAlert, animated: true)
  }
}

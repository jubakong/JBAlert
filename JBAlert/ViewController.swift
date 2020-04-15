//
//  ViewController.swift
//  JBAlert
//
//  Created by Jeongbae Kong on 2020/04/09.
//  Copyright © 2020 Jeongbae Kong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: IBAction
  @IBAction func testButton(_ sender: UIButton) {
    
    alertWithCancel(type: .alert,
                    message: "Would you like to test JBalert?", title: "This is only for test purpose",
                    rightButtonTitle: "Sure",
                    cancelButton: "Nope",
                    rightButtonAction: {
                      self.dismiss(animated: true, completion:
                        { self.alertWithoutCancel(
                          type: .success,
                          message: "Successfully test for OK button!",
                          title: "JB TEST for OK",
                          rightButtonTitle: "OK",
                          rightButtonAction: { self.dismiss(animated: true, completion: nil)}
                          )
                      }
                      )
    },
                    leftButtonAction: {
                      self.dismiss(animated: true, completion:
                        { self.alertWithoutCancel(
                          type: .fail,
                          message: "Successfully test for Cancel button!",
                          title: "JB TEST for Cancel",
                          rightButtonTitle: "OK",
                          rightButtonAction: { self.dismiss(animated: true, completion: nil)}
                          )
                      }
                      )
    }
      
    )
  }
  
  @IBAction func successButton(_ sender: UIButton) {
    alertWithoutCancel(
      type: .success,
      message: "JBAlert OK TEST",
      title: "OK test",
      rightButtonTitle: "OK",
      rightButtonAction: { self.dismiss(animated: true, completion: nil)} )
  }
  
  @IBAction func failButton(_ sender: UIButton) {
    alertWithoutCancel(
      type: .fail,
        message: "JBAlert cancel TEST",
        title: "Cancel test",
        rightButtonTitle: "OK",
        rightButtonAction: { self.dismiss(animated: true, completion: nil)} )
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}


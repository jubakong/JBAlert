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
    print("pressed ")
    
    alert(
      type: .alert,
      message: "Your auto debit token expires after 30 days. \n(If don't renew until 30 days then you can't use auto-debit)",
      title: "Would you like to renew your token now?",
      rightButtonTitle: "OK",
      cancelButton: "NO",
      rightButtonAction: { self.dismiss(animated: true, completion: nil)},
      leftButtonAction: { self.dismiss(animated: true, completion: nil)}
    )
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}


//
//  TabBarController.swift
//  StateRestoration
//
//  Created by Rob Lokhorst on 13/09/2018.
//  Copyright © 2018 Rob Lokhorst. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

  let selectedIndexKey = "selectedIndexKey"

  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    restorationIdentifier = String(describing: TabBarController.self)

    addChild(FirstViewController())
    addChild(SecondViewController())
  }
}

extension TabBarController {
  override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(selectedIndex, forKey: selectedIndexKey)

    super.encodeRestorableState(with: coder)
  }

  override func decodeRestorableState(with coder: NSCoder) {
    selectedIndex = coder.decodeInteger(forKey: selectedIndexKey)

    super.decodeRestorableState(with: coder)
  }
}

//
//  FirstViewController.swift
//  StateRestoration
//
//  Created by Rob Lokhorst on 13/09/2018.
//  Copyright © 2018 Rob Lokhorst. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  let switchViewIsOnKey = "switchViewIsOn"
  let switchView = UISwitch(frame: .zero)

  init() {
    super.init(nibName: nil, bundle: nil)

    self.title = "First"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    restorationIdentifier = String(describing: FirstViewController.self)

    setupView()
  }

  private func setupView() {
    view.backgroundColor = .yellow

    view.addSubview(switchView)
    switchView.translatesAutoresizingMaskIntoConstraints = false
    switchView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    switchView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
}

extension FirstViewController {
  override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(switchView.isOn, forKey: switchViewIsOnKey)

    super.encodeRestorableState(with: coder)
  }

  override func decodeRestorableState(with coder: NSCoder) {
    switchView.isOn = coder.decodeBool(forKey: switchViewIsOnKey)

    super.decodeRestorableState(with: coder)
  }
}

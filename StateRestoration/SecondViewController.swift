//
//  SecondViewController.swift
//  StateRestoration
//
//  Created by Rob Lokhorst on 13/09/2018.
//  Copyright © 2018 Rob Lokhorst. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  init() {
    super.init(nibName: nil, bundle: nil)

    self.title = "Second"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    restorationIdentifier = String(describing: SecondViewController.self)

    setupView()
  }

  private func setupView() {
    view.backgroundColor = .green

    let button = UIButton(type: .system)
    button.setTitle("Sesam open u", for: .normal)
    button.addTarget(self, action: #selector(sesamOpenU), for: .touchUpInside)
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }

  @objc private func sesamOpenU() {
    present(SesamViewController(date: Date()), animated: true, completion: nil)
  }
}

extension SecondViewController {
  override func encodeRestorableState(with coder: NSCoder) {
    super.encodeRestorableState(with: coder)
  }

  override func decodeRestorableState(with coder: NSCoder) {
    super.decodeRestorableState(with: coder)
  }
}

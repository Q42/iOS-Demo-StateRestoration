//
//  SesamViewController.swift
//  StateRestoration
//
//  Created by Rob Lokhorst on 13/09/2018.
//  Copyright © 2018 Rob Lokhorst. All rights reserved.
//

import UIKit

class SesamViewController: UIViewController {

  let date: Date

  init(date: Date) {
    self.date = date

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    restorationIdentifier = String(describing: SesamViewController.self)
    restorationClass = SesamViewController.self

    setupView()
  }

  private func setupView() {
    view.backgroundColor = .white

    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .medium

    let button = UIButton(type: .system)
    button.setTitle("Close \(dateFormatter.string(from: date))", for: .normal)
    button.addTarget(self, action: #selector(close), for: .touchUpInside)
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }

  @objc private func close() {
    dismiss(animated: true, completion: nil)
  }
}

extension SesamViewController: UIViewControllerRestoration {
  static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
    let timeInterval = coder.decodeDouble(forKey: "timeInterval")

    return SesamViewController(date: Date(timeIntervalSinceReferenceDate: timeInterval))
  }
}

extension SesamViewController {
  override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(date.timeIntervalSinceReferenceDate, forKey: "timeInterval")

    super.encodeRestorableState(with: coder)
  }

  override func decodeRestorableState(with coder: NSCoder) {
    super.decodeRestorableState(with: coder)
  }
}

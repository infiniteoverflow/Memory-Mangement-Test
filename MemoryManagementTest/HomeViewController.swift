//
//  HomeViewController.swift
//  MemoryManagementTest
//
//  Created by Aswin Gopinathan on 16/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: UI Properties
    lazy var button = UIButton()

    // MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = AppConstants.lilac
        setupButton()
    }
    
    // MARK: UI Methods
    private func setupButton() {
        view.addSubview(button)
        button.setTitle("Go to next screen", for: .normal)
        button.backgroundColor = AppConstants.purple
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(onButtonTap), for: .touchDown)
        addConstraintForButton()
    }
    
    deinit {
        print("HomeViewController Deallocated")
    }
    
    private func addConstraintForButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = NSLayoutConstraint(item: button,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: button,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        let heightConstraint = NSLayoutConstraint(item: button,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 54)
        let widthConstraint = NSLayoutConstraint(item: button,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 220)
        
        view.addConstraints([
            centerXConstraint,
            centerYConstraint,
            heightConstraint,
            widthConstraint
        ])
    }
    
    // MARK: Logic methods
    @objc
    private func onButtonTap() {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.pushViewController(CallbackViewController(), animated: true)
    }
}

#Preview("HomeViewController", 
         traits: .defaultLayout,
         body: {
    HomeViewController()
})

//
//  CallbackViewController.swift
//  MemoryManagementTest
//
//  Created by Aswin Gopinathan on 16/03/24.
//

import UIKit

class CallbackViewController: UIViewController {

    // MARK: Properties
    lazy var button = UIButton()
    lazy var delayViewModel = DelayViewModel { 
//        [weak self] in
//        guard let self else {
//            return
//        }
        // Uncomment this line to prevent a retain cycle
        self.onCallback()
    }
    
    // MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = AppConstants.lilac
        delayViewModel.performDelayedCallback()
    }
    
    // MARK: Logic methods
    private func onCallback() {
        print("Callback Received")
    }

}

//
//  DelayViewModel.swift
//  MemoryManagementTest
//
//  Created by Aswin Gopinathan on 16/03/24.
//

import UIKit

final class DelayViewModel {
    var callback: (() -> Void)
    
    init(callback: @escaping () -> Void) {
        self.callback = callback
    }
    
    func performDelayedCallback() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] timer in
            guard let self else {
                return
            }
            callback()
        }
    }

}

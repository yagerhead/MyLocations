//
//  Functions.swift
//  MyLocations
//
//  Created by Manu Safarov on 28.05.2021.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}

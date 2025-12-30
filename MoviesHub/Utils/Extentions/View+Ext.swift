//
//  View+Ext.swift
//  MoviesHub
//
//  Created by MacBook Pro on 18/12/2025.
//

import Foundation
import SwiftUI

extension UIScreen {
    static var safeWidth: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?
            .screen.bounds.width ?? 0
    }
}


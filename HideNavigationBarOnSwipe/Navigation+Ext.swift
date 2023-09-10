//
//  Navigation+Ext.swift
//  HideNavigationBarOnSwipe
//
//  Created by Ramill Ibragimov on 10.09.2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hideNavigationBarOnSwipe(_ isHidden: Bool) -> some View {
        self
            .background(NavigationControllerExtractor(isHidden: isHidden))
            
    }
}

private struct NavBarModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
    }
}

private struct NavigationControllerExtractor: UIViewRepresentable {
    var isHidden: Bool
    
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            if let hostView = uiView.superview?.superview, let parentController = hostView.parentController {
                parentController.navigationController?.hidesBarsOnSwipe = isHidden
            }
        }
    }
}

private extension UIView {
    var parentController: UIViewController? {
        sequence(first: self) { view in
            view.next
        }
        .first { responder in
            return responder is UIViewController
        } as? UIViewController
    }
}

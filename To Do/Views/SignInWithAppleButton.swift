//
//  SignInWithAppleButton.swift
//  To Do
//
//  Created by Sophia Li on 2021-01-02.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        SignInView()
    }
}

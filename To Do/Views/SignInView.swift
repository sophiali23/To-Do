//
//  SignInView.swift
//  To Do
//
//  Created by Sophia Li on 2021-01-02.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var coordinator: SignInWithAppleCoordinator?
    
    var body: some View {
        VStack {
            Text("Thanks for using To Do. Please sign in here.")
            SignInWithAppleButton()
                .frame(width: 280, height: 45)
                .onTapGesture {
                    self.coordinator = SignInWithAppleCoordinator()
                    if let coordinator = self.coordinator {
                        coordinator.startSignInWithAppleFlow {
                            print("You successfully signed in")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

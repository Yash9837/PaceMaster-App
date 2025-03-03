//
//  WelcomeView.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("PaceMaster")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                
                Text("Improving your gait is a step towards better movement.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                Spacer()

                Button(action: {
                    print("Google Login")
                }) {
                    HStack {
                        Image(systemName: "globe")
                        Text("Continue with Google")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                .padding(.horizontal, 40)

                Button(action: {
                    print("Apple Login")
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                        Text("Continue with Apple")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                .padding(.horizontal, 40)

                Spacer()
            }
        }
    }
}
#Preview {
    WelcomeView()
}

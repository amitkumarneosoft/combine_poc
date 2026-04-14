//
//  SplashView.swift
//  CombinePOC
//
//  Created by neosoft on 13/04/26.
//

import SwiftUI
import Combine

struct SplashView: View {
    
    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0.0
    
    let viewModel: SplashViewModel = SplashViewModel()
    
    var body: some View {
        if viewModel.isActive {
            ProductView(viewModel: ProductViewModel(networkManager: NetworkManager()))
        } else {
            ZStack {
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .scaleEffect(scale)
                        .opacity(opacity)
                    
                    Text("Combine POC")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .opacity(opacity)
                }
            }
            .onAppear {
                runSplashFlow()
                viewModel.start()
            }
        }
    }
    
    private func runSplashFlow() {
        withAnimation(.easeOut(duration: 1.0)) {
            scale = 1.2
            opacity = 1.0
        }
        withAnimation(.easeIn(duration: 0.4).delay(1.2)) {
            scale = 1.0
        }
    }
}

#Preview {
    SplashView()
}

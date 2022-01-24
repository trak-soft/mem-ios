//
//  LandingScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

struct LandingScreen: View {
    @EnvironmentObject private var viewModel: LandingViewModel
    @State private var isLinkActive = false
    @State private var destintion = AnyView(PlayScreen())
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Spacer().frame(height: landingScreenFirstSpacer)
                TitleView(
                    title: viewModel.title,
                    image: viewModel.image
                )
                Spacer().frame(height: landingScreenSecondSpacer)
                OptionView(
                    options: viewModel.options,
                    bgColor: Color(UIColor.label.withAlphaComponent(0.05)),
                    rowCount: 2
                ) { option in
                    switch(option){
                    case .Mode(
                        let groupLenght,
                        let preview,
                        let numOfGroup,
                        let timeLimit,
                        let clickLimit
                    ):
                        destintion = AnyView(PlayScreen(text:"\(groupLenght)"))
                    case .Add:
                        destintion = AnyView(CreateScreen())
                    }
                    self.isLinkActive = true
                } onHold: { option in
                }
                .background(
                    NavigationLink(destination: destintion, isActive: $isLinkActive) {
                        EmptyView()
                    }
                    .hidden()
                )
                .padding(.all, landingScreenOptionViewPadding)
            }.navigationBarHidden(true)
        }
    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreen()
            .previewDevice("iPhone 12")
            .environmentObject(LandingViewModel())
            .preferredColorScheme(.light)
    }
}

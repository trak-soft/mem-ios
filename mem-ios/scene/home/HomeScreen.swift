//
//  LandingScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel()
    @State private var isLinkActive = false
    @State private var destintion = AnyView(PlayScreen())
    
    var tint: Color = Color(UIColor.label)
    var optionColor: Color = Color(UIColor.label.withAlphaComponent(0.05))
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Spacer().frame(height: landingScreenFirstSpacer)
                TitleView(
                    title: viewModel.title,
                    icon: viewModel.image,
                    tint: tint
                )
                Spacer().frame(height: landingScreenSecondSpacer)
                OptionsView(
                    options: viewModel.options,
                    rowCount: 2,
                    backgroundColor: optionColor,
                    tint: tint
                ) { option in
                    switch(option){
                    case .Mode(
                        let groupLenght,
                        let preview,
                        let numOfGroup,
                        let timeLimit,
                        let clickLimit
                    ):
                        destintion = AnyView(PlayScreen())
                    case .Add:
                        destintion = AnyView(EditScreen())
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
                .padding([.top, .leading, .trailing], landingScreenOptionViewPadding)
            }.navigationBarHidden(true)
        }
    }
}

struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewDevice("iPhone 12")
            .preferredColorScheme(.light)
    }
}

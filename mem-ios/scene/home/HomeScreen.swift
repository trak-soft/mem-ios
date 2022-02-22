//
//  LandingScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

/**
 Home screen
 */
struct HomeScreen: View {
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel()
    
    @State private var isLinkActive = false
    @State private var destintion = AnyView(EditScreen())
    
    let tint: Color  = Color(UIColor.label)
    let optionColor: Color  = Color(UIColor.label.withAlphaComponent(0.05))
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: screenFirstSpacer)
            TitleView(
                title: viewModel.title,
                icon: viewModel.image,
                tint: tint
            )
            Spacer().frame(height: screenSecondSpacer)
            GridView(
                size: viewModel.options.count,
                padding: 10.0,
                inf: true,
                rowCount: 2
            ) { index in
                let option = viewModel.options[index]
                OptionContentView(
                    backgroundColor: optionColor,
                    tint: tint,
                    onClick: {
                        
                        switch(option) {
                        case .MODE(
                            let groupLength,
                            let preview,
                            let numOfGroup,
                            let timeLimit,
                            let clickLimit
                        ):
                            destintion = AnyView(PlayScreen(mode: .MODE(
                                groupLength: groupLength,
                                preview: preview,
                                numOfGroup: numOfGroup,
                                timeLimit: timeLimit,
                                clickLimit: clickLimit
                            )))
                        case .ADD:
                            destintion = AnyView(EditScreen())
                        }
                        self.isLinkActive = true
                    },
                    onHold: {
                        if case .MODE = option {
                            destintion = AnyView(EditScreen())
                            self.isLinkActive = true
                        }
                    }
                ) {
                    switch option {
                    case .MODE:
                        OptionModeView(
                            mode: option,
                            tint: tint
                        )
                    case .ADD:
                        OptionImageView(
                            icon: "ic_add_game",
                            tint: tint
                        )
                    }
                }
            }.background(
                    NavigationLink(destination: destintion, isActive: $isLinkActive) {
                        EmptyView()
                    }
                    .hidden()
                )
        }.padding(.horizontal, screenPadding)
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewDevice("iPhone 12")
            .preferredColorScheme(.light)
    }
}

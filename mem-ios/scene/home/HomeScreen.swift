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
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel(
        tint: Color(UIColor.label),
        optionColor: Color(UIColor.label.withAlphaComponent(0.05))
    )
    
    @State private var isLinkActive = false
    @State private var destintion = AnyView(EditScreen())
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                Spacer().frame(height: screenFirstSpacer)
                TitleView(
                    title: viewModel.title,
                    icon: viewModel.image,
                    tint: viewModel.tint
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
                        backgroundColor: viewModel.optionColor,
                        tint: viewModel.tint,
                        onClick: {
                            
                            switch(option) {
                            case .Mode(
                                let groupLength,
                                let preview,
                                let numOfGroup,
                                let timeLimit,
                                let clickLimit
                            ):
                                destintion = AnyView(PlayScreen(mode: .Mode(
                                    groupLength: groupLength,
                                    preview: preview,
                                    numOfGroup: numOfGroup,
                                    timeLimit: timeLimit,
                                    clickLimit: clickLimit
                                )))
                            case .Add:
                                destintion = AnyView(EditScreen())
                            }
                            self.isLinkActive = true
                        },
                        onHold: {
                            if case .Mode = option {
                                destintion = AnyView(EditScreen())
                                self.isLinkActive = true
                            }
                        }
                    ) {
                        switch option {
                        case .Mode:
                            OptionModeView(
                                mode: option,
                                tint: viewModel.tint
                            )
                        case .Add:
                            OptionImageView(
                                icon: "ic_add_game",
                                tint: viewModel.tint
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
            .padding(.bottom, screenBottomPadding)
                .navigationBarHidden(true)
                .ignoresSafeArea()
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

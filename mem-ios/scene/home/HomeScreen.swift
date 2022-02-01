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
                        },
                        onHold: {
                        
                        }
                    ){
                        switch option {
                        case .Mode(
                            let groupLenght,
                            let preview,
                            let numOfGroup,
                            let clickLimit,
                            let timeLimit
                        ):
                            OptionModeView(
                                groupLength: groupLenght,
                                preview: preview,
                                numOfGroup: numOfGroup,
                                timeLimit: timeLimit,
                                clickLimit: clickLimit,
                                tint: tint
                            )
                        case .Add:
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

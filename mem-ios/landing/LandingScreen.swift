//
//  LandingScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

struct LandingScreen: View {
    @EnvironmentObject var viewModel: LandingViewModel
    
    var body: some View {
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
                    break
                case .Add:
                    break
                }
            } onHold: { option in
                
            }
            .padding(.all, landingScreenOptionViewPadding)
            Spacer()
        }
        
    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreen()
            .environmentObject(LandingViewModel())
            .preferredColorScheme(.dark)
        LandingScreen()
            .environmentObject(LandingViewModel())
            .preferredColorScheme(.light)
    }
}

//
//  PlayScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

struct PlayScreen: View {
    @ObservedObject private var viewModel: PlayViewModel = PlayViewModel()
    var body: some View {
        VStack(alignment: .center){
            Spacer().frame(height: landingScreenFirstSpacer)
            TitleView(
                title: viewModel.title,
                icon: viewModel.image,
                tint: viewModel.tint
            )
            Spacer()
        }
    }
}

struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreen()
    }
}

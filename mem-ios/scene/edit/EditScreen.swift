//
//  CreateScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

struct EditScreen: View {
    @ObservedObject private var viewModel: EditViewModel = EditViewModel()
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

struct EditScreenPreviews: PreviewProvider {
    static var previews: some View {
        EditScreen()
    }
}

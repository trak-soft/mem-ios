//
//  LandingViewModel.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let title: String
    let image: String
    let tint: Color
    let optionColor: Color
    
    init(
        title: String = "memory",
        image: String = "ic_brain",
        tint: Color  = Color(UIColor.label),
        optionColor: Color  = Color(UIColor.label.withAlphaComponent(0.05))
    ) {
        self.title = title
        self.image = image
        self.tint = tint
        self.optionColor = optionColor
    }
    
    @Published var options: [OptionType] = [
        OptionType.Add,
        OptionType.Mode(groupLength: 3,  preview: false, numOfGroup: 9, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 2,  preview: false, numOfGroup: 9, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 2,  preview: false, numOfGroup: 10, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 3,  preview: false, numOfGroup: 14, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 4,  preview: false, numOfGroup: 10, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 2,  preview: false, numOfGroup: 15, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 2,  preview: false, numOfGroup: 15, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 4,  preview: false, numOfGroup: 8, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 3,  preview: false, numOfGroup: 7, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 2,  preview: false, numOfGroup: 7, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLength: 2,  preview: false, numOfGroup: 3, timeLimit: 20, clickLimit: 50),
    ]

}

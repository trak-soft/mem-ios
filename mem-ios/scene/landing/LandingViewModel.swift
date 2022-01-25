//
//  LandingViewModel.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import Foundation

class LandingViewModel: ObservableObject {
    @Published var title: String = "memory"
    @Published var image: String = "ic_brain"
    @Published var options: [OptionType] = [
        OptionType.Add,
        OptionType.Mode(groupLenght: 2,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLenght: 3,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
        OptionType.Mode(groupLenght: 4,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
//        OptionType.Mode(groupLenght: 5,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
//        OptionType.Mode(groupLenght: 6,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
//        OptionType.Mode(groupLenght: 7,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
//        OptionType.Mode(groupLenght: 1, preview: false, numOfGroup: 5, timeLimit: nil, clickLimit: nil),
    ]

}

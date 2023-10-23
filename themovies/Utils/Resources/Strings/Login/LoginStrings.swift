//
//  LoginStrings.swift
//  themovies
//
//  Created by Luis Domingues on 03/06/23.
//

import Foundation

enum LoginStrings: String {
    case onboardingFirstPart = "onboardingFirstPart"
    case onboardingSecondPart = "onboardingSecondPart"
    case onboardingSubtitle = "onboardingSubtitle"
    case accessButton = "accessButton"
    
    func localized() -> String { rawValue.localized(.login) }
}

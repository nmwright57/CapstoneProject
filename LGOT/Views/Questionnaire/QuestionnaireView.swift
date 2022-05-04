//
//  QuestionnaireView.swift
//  LGOT
//
//  Created by Natalie Wright on 4/28/22.
//

import SwiftUI

struct QuestionnaireView: View {
    
    static var uniqueKey: String {
            UUID().uuidString
        }
    static let options1: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Lower East Side"),
        DropdownOption(key: uniqueKey, value: "Upper East Side"),
        DropdownOption(key: uniqueKey, value: "Upper West Side"),
        DropdownOption(key: uniqueKey, value: "East Village"),
        DropdownOption(key: uniqueKey, value: "West Village")]
    
    static let options2: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "2"),
        DropdownOption(key: uniqueKey, value: "3"),
        DropdownOption(key: uniqueKey, value: "4"),
        DropdownOption(key: uniqueKey, value: "5"),
        DropdownOption(key: uniqueKey, value: "6")]
    
    static let options3: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Dancing"),
        DropdownOption(key: uniqueKey, value: "Drinks & Conversaton"),
        DropdownOption(key: uniqueKey, value: "Sports Bar"),
        DropdownOption(key: uniqueKey, value: "Game Bar")]
    
    static let options4: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "No preference"),
        DropdownOption(key: uniqueKey, value: "Guys"),
        DropdownOption(key: uniqueKey, value: "Girls")]

   
    
    var body: some View {
        VStack {
            DropdownPicker(
                placeholder: "What area do you want to go out in?",
                options: QuestionnaireView.options1,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)

            
            DropdownPicker(
                placeholder: "How many people are in your group?",
                options: QuestionnaireView.options2,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)
            
            DropdownPicker(
                placeholder: "What's the vibe for the night?",
                options: QuestionnaireView.options3,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)
            
            DropdownPicker(
                placeholder: "Do you have a gender preference?",
                options: QuestionnaireView.options3,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)
        }
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView()
    }
}

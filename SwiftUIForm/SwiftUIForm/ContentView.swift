//
//  ContentView.swift
//  SwiftUIForm
//
//  Created by emre argana on 11.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var shouldSendNews = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                }
                Section(header: Text("Actions")){
                    Toggle("Send News",isOn: $shouldSendNews)
                        .toggleStyle(SwitchToggleStyle(tint: .mint))
                    Stepper("Number of Like", value: $numberOfLikes, in: 1...100)
                    Text("Video has \(numberOfLikes) likes")
                    Link("Terms of Service", destination: URL(string: "https://google.com")!)
                }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button("Save") {
                        saveUser()
                    }
                }
            }
            .accentColor(.red)
        }
    }
}

func saveUser() {
    print("Save user")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(SwiftUI)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

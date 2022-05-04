//
//  LoginView.swift
//  LGOT
//
//  Created by Natalie Wright on 3/22/22.
//


import SwiftUI
import RealmSwift
import Combine

struct LoginView: View {
    @EnvironmentObject var state: AppState
    
    @Binding var userID: String?
    
    enum Field: Hashable {
        case username
        case password
    }
    
    @State private var email = ""
    @State private var password = ""
    @State private var newUser = false
    
    @FocusState private var focussedField: Field?
    
    @ObservedObject private var viewModel: ViewModel = .init()
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Spacer()
                Text("Let's Go Out Tonight")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                TextField("username", text: $email)
                    .focused($focussedField, equals: .username)
                    .submitLabel(.next)
                    .onSubmit { focussedField = .password }
                SecureField("password", text: $password)
                    .focused($focussedField, equals: .password)
                    .onSubmit {
                        Task {
                            await userAction()
                        }
                    }
                    .submitLabel(.go)
                Button(action: { newUser.toggle() }) {
                    HStack {
                        Image(systemName: newUser ? "checkmark.square" : "square")
                        Text("Register new user")
                        Spacer()
                    }
                }
                Button(action: {
                    Task {
                        await userAction()
                    }
                }) {
                    Text(newUser ? "Register new user" : "Log in")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                focussedField = .username
            }
        }
        .padding()
    }
    
    func userAction() async {
        state.error = nil
        state.shouldIndicateActivity = true
        if newUser {
            do {
                try await app.emailPasswordAuth.registerUser(email: email, password: password)
            } catch {
                DispatchQueue.main.async {
                    state.error = error.localizedDescription
                    state.shouldIndicateActivity = false
                }
                return
            }
        }

        app.login(credentials: .emailPassword(email: email, password: password))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    self.state.error = error.localizedDescription
                    self.state.shouldIndicateActivity = false
                }
            }, receiveValue: { user in
                self.userID = user.id
                self.state.shouldIndicateActivity = false
            })
                .store(in: &viewModel.bags)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewColorScheme(PreviewOrientation(
            LoginView(userID: .constant("1234554321"))
                .environmentObject(AppState())
        ))
    }
}

extension LoginView {
    
    final class ViewModel: ObservableObject {
        
        var bags = Set<AnyCancellable>()
    }
}

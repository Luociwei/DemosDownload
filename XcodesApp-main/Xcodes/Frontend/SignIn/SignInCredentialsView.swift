import SwiftUI

struct SignInCredentialsView: View {
    @EnvironmentObject var appState: AppState
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sign in with your Apple ID.")
                .bold()
                .padding(.vertical)
            HStack {
                Text("Apple ID:")
                    .frame(minWidth: 100, alignment: .trailing)
                TextField("example@icloud.com", text: $username)
            }
            HStack {
                Text("Password:")
                    .frame(minWidth: 100, alignment: .trailing)
                SecureField("Required", text: $password)
            }
            if appState.authError != nil {
                HStack {
                    Text("")
                        .frame(minWidth: 100)
                    Text(appState.authError?.legibleLocalizedDescription ?? "")
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.red)
                }
            }
            
            HStack {
                Spacer()
                Button("Cancel") {
                    appState.authError = nil
                    appState.presentedSheet = nil
                }
                    .keyboardShortcut(.cancelAction)
                ProgressButton(
                    isInProgress: appState.isProcessingAuthRequest,
                    action: { appState.signIn(username: username, password: password) },
                    label: {
                        Text("Next")
                    }
                )
                .disabled(username.isEmpty || password.isEmpty)
                .keyboardShortcut(.defaultAction)
            }
            .frame(height: 25)
        }
        .padding()
    }
}

struct SignInCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        SignInCredentialsView()
            .environmentObject(AppState())
            .previewLayout(.sizeThatFits)
    }
}

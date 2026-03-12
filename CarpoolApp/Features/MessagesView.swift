import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack {
            Image(systemName: "message")
                .font(.largeTitle)
            Text("Messages")
        }
    }
}

#Preview {
    MessagesView()
}

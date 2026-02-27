import SwiftUI

struct RidesView: View {
    var body: some View {
        VStack {
            Image(systemName: "car")
                .font(.largeTitle)
            Text("My Rides")
        }
    }
}

#Preview {
    RidesView()
}

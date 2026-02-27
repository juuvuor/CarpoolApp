import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Tab 1: The Map
            VStack {
                Image(systemName: "map")
                    .font(.largeTitle)
                Text("Map View")
            }
            .tabItem {
                Label("Home", systemImage: "map")
            }
            
            // Tab 2: Rides
            RidesView(rides: Ride.samples)
            .tabItem {
                Label("Rides", systemImage: "car.2.fill")
            }
            
            // Tab 3: Messages
            MessagesView()
            .tabItem {
                Label("Messages", systemImage: "message.fill")
            }
            
            // Tab 4: Profile
            VStack {
                Image(systemName: "person")
                    .font(.largeTitle)
                Text("Profile")
            }
            .tabItem {
                Label("Account", systemImage: "person.circle")
            }
        }
        // Makes the selected tab blue
        .tint(.blue)
    }
}

#Preview {
    MainTabView()
}

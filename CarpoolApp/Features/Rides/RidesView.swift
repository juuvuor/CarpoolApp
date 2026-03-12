import SwiftUI

struct RidesView: View {
    let rides: [Ride]

    private var upcomingRides: [Ride] {
        rides.filter { $0.isUpcoming }.sorted { $0.date < $1.date }
    }

    private var pastRides: [Ride] {
        rides.filter { !$0.isUpcoming }.sorted { $0.date > $1.date }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Upcoming Rides") {
                    if upcomingRides.isEmpty {
                        Text("No upcoming rides")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(upcomingRides) { ride in
                            RideRow(ride: ride)
                        }
                    }
                }

                Section("Ride History") {
                    if pastRides.isEmpty {
                        Text("No past rides")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(pastRides) { ride in
                            RideRow(ride: ride)
                        }
                    }
                }
            }
            .navigationTitle("My Rides")
        }
    }
}

private struct RideRow: View {
    let ride: Ride

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: "car.fill")
                    .foregroundStyle(.blue)
                Text("\(ride.origin) → \(ride.destination)")
                    .font(.headline)
            }
            Text(ride.date, style: .date)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            HStack {
                Image(systemName: "person.fill")
                    .foregroundStyle(.secondary)
                Text(ride.driver)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer()
                if ride.seatsAvailable > 0 {
                    Text("^[\(ride.seatsAvailable) seat](inflect: true) left")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(.green.opacity(0.15))
                        .foregroundStyle(.green)
                        .clipShape(Capsule())
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    RidesView(rides: Ride.samples)
}

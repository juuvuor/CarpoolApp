import Foundation

struct Ride: Identifiable {
    let id: UUID
    let origin: String
    let destination: String
    let date: Date
    let driver: String
    let seatsAvailable: Int

    var isUpcoming: Bool {
        date > Date()
    }

    static let samples: [Ride] = {
        let calendar = Calendar.current
        let now = Date()
        return [
            Ride(
                id: UUID(),
                origin: "Helsinki",
                destination: "Tampere",
                date: calendar.date(byAdding: .day, value: 2, to: now)!,
                driver: "Alice",
                seatsAvailable: 3
            ),
            Ride(
                id: UUID(),
                origin: "Espoo",
                destination: "Turku",
                date: calendar.date(byAdding: .day, value: 5, to: now)!,
                driver: "Bob",
                seatsAvailable: 2
            ),
            Ride(
                id: UUID(),
                origin: "Vantaa",
                destination: "Lahti",
                date: calendar.date(byAdding: .day, value: -3, to: now)!,
                driver: "Carol",
                seatsAvailable: 0
            ),
            Ride(
                id: UUID(),
                origin: "Oulu",
                destination: "Helsinki",
                date: calendar.date(byAdding: .day, value: -10, to: now)!,
                driver: "Dave",
                seatsAvailable: 0
            ),
        ]
    }()
}

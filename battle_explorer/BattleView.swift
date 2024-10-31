import SwiftUI
import MapKit

/// Detailed view for displaying information about a specific battle, including an image, name, map, and description
struct BattleDetail: View {
    let battle: Battle
    @State var position: MapCameraPosition // Holds the map's camera position
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Spacer(minLength: 75);
                // Battle name/title
                Text(battle.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2) // Subtle shadow for readability
                    .multilineTextAlignment(.center)
                
                // Map showing battle location
                BattleMap(battle: battle, position: $position)
                
                // Battle description text
                Text(battle.about)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                
                // Battle image with an overlay gradient for depth
                BattleImage(battle: battle)
                
                Spacer() // Pushes content to the top
            }
            .padding()
            .frame(maxWidth: .infinity) // Center content and prevent overflow
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("BackgroundEnd").opacity(0.2)) // Semi-transparent background
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 2) // Light shadow for depth
            )
            .padding(.horizontal)
        }
        .background(
            LinearGradient(
                colors: [Color("BackgroundStart"), Color("BackgroundEnd")],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .ignoresSafeArea(edges: .top) // Extends background gradient to the top edge
        .preferredColorScheme(.dark) // Dark mode as the preferred color scheme
    }
}

// MARK: - Subviews

/// Subview for displaying the battle image with a gradient overlay for enhanced readability
struct BattleImage: View {
    let battle: Battle
    
    var body: some View {
        battle.image
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity) // Center image without stretching
            .overlay(
                LinearGradient(
                    colors: [.clear, .black.opacity(0.7)],
                    startPoint: .top,
                    endPoint: .bottom
                ) // Gradient overlay from clear to black for depth
            )
    }
}

/// Subview for displaying a map with an annotation marking the battle location
struct BattleMap: View {
    let battle: Battle
    @Binding var position: MapCameraPosition // Binds map camera position
    
    var body: some View {
        Map(position: $position) {
            // Annotation to mark the battle location on the map
            Annotation(battle.name, coordinate: battle.location) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.title)
                    .foregroundColor(.red)
                    .background(Circle().fill(Color.white).frame(width: 40, height: 40)) // White background for visibility
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2) // Shadow for depth
            }
        }
        .frame(height: 300) // Fixed height for the map
        .cornerRadius(15) // Rounded corners for a smoother look
        .overlay(
            VStack {
                HStack {
                    Text("Current Location")
                        .font(.headline)
                        .padding(10)
                        .background(Color.black.opacity(0.5)) // Semi-transparent background
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    Spacer()
                }
                Spacer()
            }
            .padding([.top, .leading], 10) // Positions label in top-left corner
        )
    }
}

// MARK: - Preview

#Preview {
    // Sample data for previewing the BattleDetail view
    let battle = Battle(
        id: 1,
        name: "Battle of Midway",
        front: "Pacific Ocean",
        about: "A decisive naval battle where U.S. forces defeated Japan's fleet, marking a turning point in the Pacific War.",
        imageName: "midway",
        latitude: 28.204781,
        longitude: -177.375734
    )

    // Preview with a sample battle and map position
    BattleDetail(
        battle: battle,
        position: .camera(MapCamera(centerCoordinate: battle.location, distance: 300000))
    )
}

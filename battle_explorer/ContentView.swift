import SwiftUI
import MapKit

/// Main view for displaying a list of battles with detailed navigation to each battle's information
struct ContentView: View {
    // Access the shared environment object for all battles
    @Environment(AllBattles.self) private var battles
    @State private var currentSelection = "" // Stores the current filter selection
    
    // Filtered list of battles based on the selected front (e.g., Europe, Pacific)
    private var battlesFilteredByFront: [Battle] {
        battles.filter(by: currentSelection)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient with a smooth transition from top to bottom colors
                LinearGradient(
                    gradient: Gradient(colors: [Color("BackgroundStart"), Color("BackgroundEnd")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea() // Ensures the gradient covers the entire screen background
                
                Spacer(minLength: 5) // Adds minimal space at the top of the view for layout

                // List of filtered battles with navigation links to each battle's detail view
                List(battlesFilteredByFront) { battle in
                    NavigationLink {
                        // Navigate to BattleDetail view when tapped
                        BattleDetail(
                            battle: battle,
                            position: .camera(
                                MapCamera(centerCoordinate: battle.location, distance: 300000)
                            )
                        )
                    } label: {
                        // Battle row layout within the list
                        HStack(alignment: .top, spacing: 15) {
                            Spacer().frame(width: 10) // Add left padding for spacing
                            
                            // Battle image with styling
                            battle.image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners
                                .shadow(color: .gray.opacity(0.7), radius: 5, x: 0, y: 3) // Shadow effect
                                .offset(y: 0.5) // Minor offset for a parallax effect
                            
                            // VStack to display battle details in a column
                            VStack(alignment: .leading, spacing: 6) {
                                // Battle name title
                                Text(battle.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .lineLimit(1) // Limit name to a single line
                                
                                // Battle front information with background color based on front
                                Text(battle.front)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(battle.front == "Europe" ? Color("EuropeBlue") : Color("PacificOrange"))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(battle.front == "Europe" ? Color("EuropeBlue").opacity(0.3) : Color("PacificOrange").opacity(0.3))
                                    )
                                
                                // Brief battle description
                                Text(battle.about)
                                    .font(.footnote)
                                    .foregroundColor(.white.opacity(0.8))
                                    .lineLimit(2) // Limit to 2 lines for concise display
                            }
                            .padding(.leading, 5) // Adds padding to the leading edge of VStack
                        }
                        .padding(.vertical, 8) // Adds vertical padding around each row
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color("ListRowBackground")) // Background color for each row
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white.opacity(0.1), lineWidth: 1) // Border effect
                                )
                                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5) // Dynamic shadow for depth
                                .scaleEffect(1.02) // Slight scale effect for subtle emphasis
                        )
                    }
                }
                .listStyle(.plain) // Plain list style for minimal visual interference
                .background(Color("ListBackground").ignoresSafeArea()) // Custom list background color
                .scrollContentBackground(.hidden) // Ensures consistent background color when scrolling
            }
            .navigationBarTitleDisplayMode(.inline) // Inline title for compact top bar
            
            // Toolbar configuration
            .toolbar {
                // Main title displayed in the navigation bar
                ToolbarItem(placement: .principal) {
                    Text("World War II Battles")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2) // Shadow effect for depth
                }
                
                // Filter menu button in the top trailing corner
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        // "All" filter button
                        Button(action: { withAnimation(.spring()) { currentSelection = "" } }) {
                            Label("All", systemImage: "globe")
                                .font(.title3)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white.opacity(0.2))
                                )
                        }
                        // "Europe" filter button
                        Button(action: { withAnimation(.spring()) { currentSelection = "Europe" } }) {
                            Label("Europe", systemImage: "globe.europe.africa")
                                .font(.title3)
                                .foregroundColor(Color("EuropeBlue"))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white.opacity(0.2))
                                )
                        }
                        // "Pacific" filter button
                        Button(action: { withAnimation(.spring()) { currentSelection = "Pacific" } }) {
                            Label("Pacific", systemImage: "globe.asia.australia")
                                .font(.title3)
                                .foregroundColor(Color("PacificOrange"))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white.opacity(0.2))
                                )
                        }
                    } label: {
                        // Menu icon with background styling and animation
                        Image(systemName: "slider.horizontal.3")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.2))
                            )
                            .scaleEffect(1.05) // Minor scaling effect
                            .animation(.easeInOut(duration: 0.3), value: currentSelection) // Smooth transition
                    }
                }
            }
            .padding([.bottom, .top], 8) // Adds padding above and below the toolbar for spacing
        }
        // Sets a dark color scheme and gradient background across the entire view
        .background(
            LinearGradient(
                colors: [Color("BackgroundStart"), Color("BackgroundEnd")],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .preferredColorScheme(.dark) // Sets dark mode as the preferred color scheme
    }
}

// Preview structure with an environment for testing
#Preview {
    ContentView()
        .environment(AllBattles()) // Injects sample battle data into the environment
}
//
//  placeholder.swift
//  battle_explorer
//
//  Created by Jack DAngelo on 10/31/24.
//

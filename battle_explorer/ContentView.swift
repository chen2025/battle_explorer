import SwiftUI
import MapKit

struct ContentView: View {
    @Environment(AllBattles.self) private var battles
    @State var currentSelection = ""
    private var battlesFilteredByFront: [Battle] {
        battles.filter(by: currentSelection)
    }
    
    var body: some View {
        NavigationStack {
            List(battlesFilteredByFront) { battle in
                NavigationLink {
                    BattleDetail(battle: battle, position: .camera(MapCamera(centerCoordinate: battle.location, distance: 300000)))
                } label: {
                    HStack {
                        battle.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        VStack(alignment: .leading) {
                            Text(battle.name)
                                .fontWeight(.bold)
                            Text(battle.front.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                        }
                    }
                }
            }
            .navigationTitle("World War II Battles")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            withAnimation(.spring()) {
                                currentSelection = ""
                            }
                        } label: {
                            HStack {
                                Text("All")
                                    .font(Font.system(size: 20))
                                Spacer()
                            }
                            .padding([.leading, .trailing], 10)
                        }
                        
                        Button {
                            withAnimation(.spring()) {
                                currentSelection = "Europe"
                            }
                        } label: {
                            HStack {
                                Text("Europe")
                                    .font(Font.system(size: 20))
                                Spacer()
                            }
                            .padding([.leading, .trailing], 10)
                        }
                        
                        Button {
                            withAnimation(.spring()) {
                                currentSelection = "Pacific"
                            }
                        } label: {
                            HStack {
                                Text("Pacific")
                                    .font(Font.system(size: 20))
                                Spacer()
                            }
                            .padding([.leading, .trailing], 10)
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .environment(AllBattles())
}

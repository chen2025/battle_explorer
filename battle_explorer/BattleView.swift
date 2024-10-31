import SwiftUI
import MapKit

struct BattleDetail: View {
    let battle: Battle
     @State var position: MapCameraPosition
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                battle.image
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                            ],
                            startPoint: .top, endPoint: .bottom
                        )
                    }
                
                VStack(alignment: .leading) {
                    Text(battle.name)
                        .font(.largeTitle)
                    
                     Map(position: $position){
                         Annotation(battle.name, coordinate: battle.location){
                             Image(systemName: "mappin.and.ellipse")
                                 .font(.largeTitle)
                                 .imageScale(.large)
                                 .symbolEffect(.pulse)
                         }
                     }
                     .frame(height: 300)
                     .overlay(alignment: .trailing) {
                         Image(systemName: "greaterthan")
                             .imageScale(.large)
                             .font(.title3)
                             .padding(.trailing, 5)
                     }
                     .overlay(alignment: .topLeading) {
                         Text("Current Location")
                             .padding([.leading, .bottom], 5)
                             .padding(.trailing,8)
                             .background(.black.opacity(0.33))
                             .clipShape(.rect(bottomTrailingRadius: 15))
                     }
                     .clipShape(.rect(cornerRadius: 15))

                    Text(battle.about)
                        .font(.title3)
                        .padding(.top, 20)
                }
                .padding()
                .padding(.bottom, 20)
                .frame(width: geo.size.width, alignment: .leading)
            }
            .ignoresSafeArea()
            .toolbarBackground(.automatic)
        }
    }
}

#Preview {
    let battle = Battle(
        id: 1,
        name: "Battle of Midway",
        front: "Pacific Ocean",
        about: "A decisive naval battle where U.S. forces defeated Japan's fleet, marking a turning point in the Pacific War.",
        imageName: "midway",
        latitude: 28.204781,
        longitude: -177.375734
    )

    BattleDetail(battle: battle,
     position: .camera(MapCamera(centerCoordinate: battle.location, distance: 300000))
    ).preferredColorScheme(.dark)
}

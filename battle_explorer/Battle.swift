import Foundation
import SwiftUI
import MapKit

struct Battle: Decodable, Identifiable {
    let id: Int
    let name: String
    let front: String
    let about: String
    let imageName: String
    let latitude: Double
    let longitude: Double
    
    var image: Image {
        Image(imageName)
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

@Observable class AllBattles {
    var battles: [Battle] = []
    
    init() {
        battles = [
            Battle(
                id: 1,
                name: "The Battle of the Atlantic",
                front: "Europe",
                about: "The longest military campaign of the war, the Battle of the Atlantic ran from 1939 to 1945, peaking between mid-1940 and December 1943. Axis aircraft, warships, and submarines sought to strangle Britain’s maritime supply lines, starve Britain into submission, and prevent the build-up of resources vital to liberating Europe. The Allies won, but at a terrible price. 3,500 merchant ships, 175 warships, hundreds of aircraft, and millions of tons of supplies were lost along with the lives of approximately 70,000 sailors. On the Axis side, 783 U-boats, 47 warships, 17 Italian submarines, and 30,000 sailors were also lost, with the U-boat fleet suffering 75% casualties. Churchill later remarked that the looming peril of the German U-boats were the only thing that really frightened him; destroying a significant number of them during the Battle of the Atlantic would prove crucial for the Allies’ victory.",
                imageName: "Brunnschweiler_Bulte_2009",
                latitude: 46.081287,
                longitude: -26.623680
            ),
            Battle(
                id: 2,
                name: "The Battle of Fort Eben-Emael",
                front: "Europe",
                about: "Belgian fortress Eben Emael dominated several crossings along the Albert Canal. Its capture by the Nazis in May 1940 ushered in a new age of utilizing airborne troops. German airborne units captured the fort within hours, quickly overwhelming the garrison while capturing several airfields, disrupting Belgian defenses, and taking three canal crossings. Other countries hastened to develop their own airborne troops after learning of this swift and decisive loss.",
                imageName: "eben-emael",
                latitude: 50.796534,
                longitude: 5.674396
            ),
            Battle(
                id: 3,
                name: "The Battle of Dunkirk",
                front: "Europe",
                about: "The evacuation of British and Allied troops from Dunkirk involved improvisation, courage, resilience, and a huge missed opportunity. Between May 26 and June 4 of 1940, the Royal Navy and a fleet of repurposed civilian seacraft—also known as the legendary “little ships”—evacuated 338,226 troops and refugees, furnishing Allied forces who were losing the Battle of France with the chance to evacuate to Britain. Had Hitler ordered his armored troops to overwhelm Dunkirk, the British Army might have been destroyed entirely. After going on to lose the Battle of Britain and invading the Soviet Union, Hitler found himself fighting on two fronts, losing the war as a result.",
                imageName: "dunkirk",
                latitude: 51.047140,
                longitude: 2.388635
            ),
            Battle(
                id: 4,
                name: "The Battle of Taranto",
                front: "Europe",
                about: "Britain’s attack on Taranto Harbour was both successful and problematic. November 11, 1940 saw 24 Fairey Swordfish aircraft attack the Italian fleet with bombs and torpedoes. Within two hours, three Italian battleships were disabled, a heavy cruiser and two destroyers had been damaged, and two aircraft destroyed. The Swordfish used torpedoes that had been specially designed for Taranto, a shallow harbor for such big targets. In May 1941, Japanese naval officers visited Taranto. Lieutenant Commander Takeshi Naito discussed it extensively with fellow naval aviator Mitsuo Fuchida in October 1941. Two months later, Fuchida led the attack on Pearl Harbor, a much larger operation with infinitely greater consequences.",
                imageName: "taranto",
                latitude: 40.458893,
                longitude: 17.263376
            ),
            Battle(
                id: 5,
                name: "Operation Claymore",
                front: "Europe",
                about: "Operation Claymore had relatively little impact on the war itself, but its long-term influence remains enormous. On March 4, 1941, 600 British soldiers attacked the Lofoten Islands in Occupied Norway. With combat engineers and 50 Norwegian sailors, the legendary Commandos made their first large-scale raid. They left the next morning having captured 60 collaborators and 225 German soldiers, in addition to destroying 11 factories, 800,000 gallons of oil, and five ships. They also brought vital parts of an Enigma coding machine and over 300 Norwegians to England. Claymore was the first of many raids establishing the Commandos’ reputation, and it was far from the last. The Commando concept became a blueprint for many present-day Special Forces using what Churchill called “butcher and bolt” tactics.",
                imageName: "claymore",
                latitude: 68.166672,
                longitude: 13.75
            ),
            Battle(
                id: 6,
                name: "The Attack on Pearl Harbor",
                front: "Pacific",
                about: "December 7, 1941, marked the infamous attack on Pearl Harbor, a surprise assault that thrust the United States into World War II. In a swift and devastating strike, Japanese forces bombarded the U.S. Pacific Fleet stationed in Hawaii, aiming to cripple American naval power in the Pacific. The attack lasted only hours but left a lasting impact: over 2,400 Americans were killed, and significant losses included battleships like the USS Arizona, which remains a memorial to this day. Despite the attack’s success in damaging American battleships and aircraft, Japan failed to target crucial fuel reserves and missed America’s vital aircraft carriers, which were out at sea. This strategic oversight would prove costly for Japan, as those carriers would later lead to pivotal U.S. victories, including the decisive Battle of Midway just months later. Pearl Harbor transformed U.S. isolationism into resolve, rallying the nation for the war effort.",
                imageName: "pearl-harbor",
                latitude: 21.366571,
                longitude: -157.940369
            ),
            Battle(
                id: 7,
                name: "The Battle of Midway",
                front: "Pacific",
                about: "June 1942 saw the Battle of Midway, a pivotal conflict in the Pacific Theater and one of the most crushing naval victories ever. The U.S. devastated their enemy’s aircraft carrier fleet, succeeding where Japan had failed at Pearl Harbor. America’s aircraft carriers had been the primary targets at Pearl Harbor, but were absent when the attack began. Those same carriers devastated Japanese forces at Midway, losing carrier USS Yorktown and destroyer USS Hammann in the process, but destroying four Japanese fleet carriers in return. American code-breakers had identified Midway as Japan’s next target while skillful leadership from Admirals Nimitz, Fletcher, and Spruance struck a decisive blow in the Pacific.",
                imageName: "midway",
                latitude: 28.204781,
                longitude: -177.375734
            ),
            Battle(
                id: 8,
                name: "The Guadalcanal Campaign",
                front: "Pacific",
                about: "August 1942 saw the Guadalcanal campaign, the first major Allied ground campaign in the Far East. It lasted until February 1943, costing thousands of lives, dozens of ships, and hundreds of aircraft on both sides. Victory at Guadalcanal marked the Allied transition from defense to offense, the beginning of the end for the Japanese Empire.",
                imageName: "guadalcanal",
                latitude: -9.578517,
                longitude: 160.146425
            ),
            Battle(
                id: 9,
                name: "The Battle of Stalingrad",
                front: "Europe",
                about: "The European tide was turning as well. While Guadalcanal raged in the Pacific, the Battle of Stalingrad marked a turning point in the European war. Stalingrad remains the most important ground battle of the war, resulting in the capture of Germany’s Sixth Army under Field-Marshal Friedrich Paulus. The Sixth Army began their assault in August 1942 and was collapsing by November. Units had to be brought from elsewhere to replace enormous casualties. Supplies were drying up, and the Soviets were growing increasingly stronger. Paulus surrendered his remaining troops in February 1943, ending Hitler’s disastrous obsession with capturing the city bearing Stalin’s name. By the battle’s end, there were an estimated two million casualties in total.",
                imageName: "stalin",
                latitude: 48.666321,
                longitude: 44.442126
            ),
            Battle(
                id: 10,
                name: "The Battle of Kursk",
                front: "Europe",
                about: "Kursk, the last major Axis offensive in the East, was almost as disastrous as Stalingrad. Through July and August 1943, Axis and Soviet troops fought the world’s largest-ever armoured battle. Hitler started Operation Citadel on July 5, only for Allied troops to invade Sicily days later. Citadel was abandoned, but a massive Soviet counter-offensive was not. There were up to 200,000 Axis and 1.2 million Soviet casualties. With this crippling loss went thousands of armored vehicles, aircraft, artillery pieces, and Hitler’s last chance to defeat Stalin.",
                imageName: "kurst",
                latitude: 51.745340,
                longitude: 36.202804
            ),
            Battle(
                id: 11,
                name: "Operation Husky",
                front: "Europe",
                about: "If Citadel was disastrous for the Nazis, Operation Husky was worse. The deceptive Operation Mincemeat had already tricked Hitler into moving thousands of troops from Sicily to Corsica and Sardinia to face a non-existent threat. The real trouble would begin in Sicily, which the Allies were determined to win back and thereby force the Nazis to retreat deeper into Europe. When Mussolini was executed and Italy changed sides, the Third Reich’s soft underbelly was totally exposed, allowing Allied troops to approach first Austria, then Germany itself. To make matters worse, the Allies, now winning in the Atlantic, were ready to begin the liberation of Europe.",
                imageName: "husky",
                latitude: 37.638868,
                longitude: 14.372178
            ),
            Battle(
                id: 12,
                name: "D Day",
                front: "Europe",
                about: "June 6, 1944, marked D-Day, the largest amphibious invasion in history and a defining moment in the European Theater. Allied forces launched a massive assault on Nazi-occupied France, storming the beaches of Normandy to establish a crucial foothold in Western Europe. Over 156,000 troops from the United States, United Kingdom, Canada, and other Allies braved heavy German defenses, particularly at Omaha Beach, where casualties were highest. Supported by naval and airborne operations, the Allies overcame fierce resistance, securing vital beachheads and beginning the push to liberate France. The invasion, led by General Eisenhower and meticulously planned, was a pivotal step in dismantling Nazi control in Europe, paving the way for Allied victories that would follow in the coming months.",
                imageName: "d-day",
                latitude: 49.372991,
                longitude: -0.879349
            ),
        ]
    }
    
    func filter(by front: String) -> [Battle] {
        if !front.isEmpty {
            return battles.filter{battle in
                battle.front == front
            }
        }
        return battles
    }
}

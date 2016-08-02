//
//  ServiceProvider.swift
//  TopShelf
//
//  Created by Snehal Patil on 7/31/16.
//  Copyright © 2016 RayWenderlich. All rights reserved.
//

import Foundation
import TVServices

class ServiceProvider: NSObject, TVTopShelfProvider {
    
    override init() {
        super.init()
    }
    
    // MARK: - TVTopShelfProvider protocol
    
    var topShelfStyle: TVTopShelfContentStyle {
        // Return desired Top Shelf style.
        return .Sectioned
    }
    
    var topShelfItems: [TVContentItem] {
        // 1 - define a section where “Breaking News” items will reside.
        let breakingNewsIdentifier = TVContentIdentifier(identifier:
            "Breaking News", container: nil)!
        let breakingNewsSection = TVContentItem(contentIdentifier:
            breakingNewsIdentifier)!
        breakingNewsSection.title = "Breaking News"
        
        // 2 - define a single item for your section.
        let martianRiotIdentifier = TVContentIdentifier(identifier:
            "Martians Riot", container: nil)!
        let martianRiotItem = TVContentItem(contentIdentifier:
            martianRiotIdentifier)!
        martianRiotItem.imageURL = NSBundle.mainBundle().URLForResource(
            "sectionedMartians", withExtension: "png")
        martianRiotItem.displayURL = urlForIdentifier("martianRiot")
        // 3
        breakingNewsSection.topShelfItems = [martianRiotItem]
        
        
        
        // 1
        let milkyWayNewsIdentifier = TVContentIdentifier(identifier:
            "Milky Way News", container: nil)!
        let milkyWaySection = TVContentItem(contentIdentifier:
            milkyWayNewsIdentifier)!
        milkyWaySection.title = "Milky Way"
        
        // 2
        let cometIdentifier = TVContentIdentifier(identifier:
            "An odd comet", container: nil)!
        let cometItem = TVContentItem(contentIdentifier:
            cometIdentifier)!
        cometItem.imageURL = NSBundle.mainBundle().URLForResource(
            "comet", withExtension: "png")
        cometItem.displayURL = urlForIdentifier("comet")
        
        // 3
        let asteroidIdentifier = TVContentIdentifier(identifier:
            "Asteroid Light Speed", container: nil)!
        let asteroidItem = TVContentItem(contentIdentifier:
            asteroidIdentifier)!
        asteroidItem.imageURL = NSBundle.mainBundle().URLForResource(
            "asteroid", withExtension: "png")
        asteroidItem.displayURL = urlForIdentifier("asteroid")
        // 4
        milkyWaySection.topShelfItems = [cometItem, asteroidItem]
        
        return [breakingNewsSection, milkyWaySection]
    }
    
    private func urlForIdentifier(identifier: String) -> NSURL {
        let components = NSURLComponents()
        components.scheme = "newsapp"
        components.queryItems = [NSURLQueryItem(name: "identifier",
            value: identifier)]
        
        return components.URL!
    }
}


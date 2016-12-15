//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Grant Rosario on 12/13/16.
//  Copyright © 2016 Grant Rosario. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://nc.hcpress.com/img/Blevins_sunrise_far_side.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/EUvfBjt1BbY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Grandfather Mountain Trail")
        
        let p2 = PartyRock(imageURL: "http://kenthomas.us/Images/post/Grandfather_Mountain-27527-2.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/My4gO6vrRcg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Grandfather Mountain Scenery")
        
        let p3 = PartyRock(imageURL: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/theme_body/2/9/a/6/full_2230662.jpeg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ICC_h-nt_BU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Grandfather Mountain 2013")
        
        let p4 = PartyRock(imageURL: "http://www.gannett-cdn.com/-mm-/858b3461568ddeca53b1a385362250c62c0ac511/c=0-205-4000-2465&r=x1683&c=3200x1680/local/-/media/WCNC/WCNC/2014/12/05/635533769668600008-grandfather-mountain-winter-sunrise.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YYqiL8FDj3U\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Grandfather Mountain Winter")
        
        let p5 = PartyRock(imageURL: "http://www.lovethesepics.com/wp-content/uploads/2011/11/Grandfather-Mountain-Hike.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/jLylJP-dAHU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Grandfather Mountain Bridge")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
            return cell
        
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}


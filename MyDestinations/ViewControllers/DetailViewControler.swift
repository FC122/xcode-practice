//
//  DetailViewControler.swift
//  MyDestinations
//
//  Created by Filip Cica on 05.04.2023..
//  Copyright © 2023 Ivan Barisic. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage
class DetailViewControler: UIViewController {
    

    let destination:Destination
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    required init?(coder aDecoder: NSCoder) {
        guard let destination = aDecoder.decodeObject(forKey: "destination") as? Destination else {
            fatalError("Error: Unable to decode destination from coder")
        }
        self.destination = destination
        super.init(coder: aDecoder)
    }

    
    init(destination: Destination) {
        self.destination = destination
        super.init(nibName: nil, bundle: nil)
    }
  
    
    override func viewDidLoad() {
            super.viewDidLoad()
        imageView?.sd_setImage(with: URL(string: destination.url), placeholderImage: UIImage(named: "TestImage.bmp"))
        descriptionLabel?.text = destination.description
        titleLabel?.text = destination.title
        //view.addSubview(mapView)
        }
    
}

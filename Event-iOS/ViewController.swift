//
//  ViewController.swift
//  Event-iOS
//
//  Created by M1 on 12.04.2020.
//  Copyright © 2020 Dmitry Alexandrov. All rights reserved.
//

import UIKit
import EventShared

class ViewController: UIViewController {

    @IBOutlet weak var textView:  UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("in viewDidLoad()")

        
        let url = URL(string: "http://localhost:8080" + ApiRoutes.event)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {
                print("no data")
                return
            }
            
            guard let event = try? JSONDecoder().decode(Event.self, from: data) else {
                print("no event")
                return
            }
            DispatchQueue.main.async {
                self.textView.text = event.eventName
            }
        }
        task.resume()
    }

}


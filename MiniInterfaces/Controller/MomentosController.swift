//
//  MomentosController.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class MomentosController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var cards = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: "SectionTableViewCell", bundle: nil), forCellReuseIdentifier: "SectionCell")
        
    }
    
    @IBAction func addMomentoTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "AddMomentoSegue", sender: self)
        
    }
    
}

extension MomentosController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath)
        //cell.backgroundColor = .clear
        return cell
        
    }
    
    
}


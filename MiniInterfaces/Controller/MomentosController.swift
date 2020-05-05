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
    
    var allCards = [CardsStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.insertSubview(UIView(frame: .zero), at: 0)
        
        self.navigationController?.navigationBar.largeTitleTextAttributes =
        [NSAttributedString.Key.foregroundColor:UIColor.textColor,
         NSAttributedString.Key.font: sfRounded(size: 34, weight: .semibold)]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        allCards = CardModel.getAllCards()
        
        
        
        tableView.register(UINib.init(nibName: "SectionTableViewCell", bundle: nil), forCellReuseIdentifier: "SectionCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    
    @IBAction func addMomentoTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "AddMomentoSegue", sender: self)
        
    }
    
}

extension MomentosController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
        
        cell.configure(cardStruct: allCards[indexPath.row])
        
        return cell
        
    }
    
    
}


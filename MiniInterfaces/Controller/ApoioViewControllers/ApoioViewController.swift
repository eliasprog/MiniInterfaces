//
//  ApoioViewController.swift
//  MiniInterfaces
//
//  Created by Helaine Pontes on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class ApoioViewController: UIViewController{

    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts: [Contacts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = createArray()
        configTable()
        
    }
    private func configTable(){
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        //Registering Cells
        let cellNib = UINib(nibName: ContatoTableViewCell.xibName, bundle: nil)
        contactsTableView.register(cellNib, forCellReuseIdentifier: ContatoTableViewCell.identifier)
    }
    
    func createArray() -> [Contacts]{
        var arrayContacts: [Contacts] = []
        
        
        let contact1 = Contacts(photo: "disque188", name: "188", parents: "Rede de Apoio", number: 188)
        let contact2 = Contacts(photo: "pessoaAleatoria1", name: "Gustavo", parents: "Filho", number: 988888888)
        let contact3 = Contacts(photo: "pessoaAleatoria2", name: "Gregório", parents: "Marido", number: 977777777)
        let contact4 = Contacts(photo: "pessoaAleatoria3", name: "Julia", parents: "Irmã", number: 966666666)
        
        
        arrayContacts.append(contact1)
        arrayContacts.append(contact2)
        arrayContacts.append(contact3)
        arrayContacts.append(contact4)
        
        return arrayContacts
    }

}
extension ApoioViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contact = contacts[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContatoTableViewCell.identifier, for: indexPath) as? ContatoTableViewCell
        else{
            fatalError("wrong identifier")
        }
        
        cell.configCell(with: contact)
        cell.selectionStyle = .none
        
        return cell
    }
    

}


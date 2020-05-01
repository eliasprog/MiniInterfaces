//
//  ApoioViewController.swift
//  MiniInterfaces
//
//  Created by Helaine Pontes on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class ApoioViewController: UIViewController{

    @IBOutlet weak var msgsApoioCollectionView: UICollectionView!
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var titleContatosLabel: UILabel!
    
    var contacts: [Contacts] = [] //array de contatos para ser usado na table
    var msgsApoio: [String] = ["Você não está sozinho", "Ligue para o 188", "Oii, você é lindo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleContatosLabel.textColor = .textColor
        contacts = createArray() //recebendo o array de contatos criado
        configTable()
        contactsTableView.tableFooterView = UIView()
        configCollection()
    }
    
    func createArray() -> [Contacts]{//cria o array de contatos com dados mocados
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
    
    private func configTable(){//atribui o delegate e o datasource da table e registra a xib da cell
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        //Registering Cells
        let cellNib = UINib(nibName: ContatoTableViewCell.xibName, bundle: nil)
        contactsTableView.register(cellNib, forCellReuseIdentifier: ContatoTableViewCell.identifier)
    }
    
    private func configCollection(){
        msgsApoioCollectionView.delegate = self
        msgsApoioCollectionView.dataSource = self
        
        //RegisteringNib
        let cellNib = UINib(nibName: MsgApoioCollectionViewCell.xibName, bundle: nil)
        msgsApoioCollectionView.register(cellNib, forCellWithReuseIdentifier: MsgApoioCollectionViewCell.identifier)
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 311, height: 151
//        layout.scrollDirection = .horizontal
//        msgsApoioCollectionView.collectionViewLayout = layout
    }

}
extension ApoioViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//metodo para o definir o número de linhas da table
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

extension ApoioViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        msgsApoio.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let msg = msgsApoio[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MsgApoioCollectionViewCell.identifier, for: indexPath) as? MsgApoioCollectionViewCell
            else{
                fatalError("wrong identifier")
            }
        
        cell.backgroundColor = .primaryColor
        //cell.layer.cornerRadius = 10.0
        
        
        cell.msgTextView.text = msg
        return cell
    }
}



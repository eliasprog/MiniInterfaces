//
//  ApoioViewController.swift
//  MiniInterfaces
//
//  Created by Helaine Pontes on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class ApoioViewController: UIViewController{

    @IBOutlet var apoioViewController: UIView!
    @IBOutlet weak var msgsApoioCollectionView: UICollectionView!
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var titleContatosLabel: UILabel!
    
    @IBOutlet weak var addContactsButton: UIButton!

    
    var contacts: [Contacts] = [] //array de contatos para ser usado na table
    var msgsApoio: [String] = ["Lembre-se, você não está sozinho, existem pessoas que podem te ajudar", "Você pode conversar com um voluntário do CVV ligando para 188 de todo o território nacional", " A CVV funciona 24 horas todos os dias e de forma gratuita.", "Na CVV você é atendido por um voluntário, com respeito e anonimato", "Oii, você é lindo"]
    
    
    let cellScalling: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Solve bug
        self.view.insertSubview(UIView(frame: .zero), at: 0)
    self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColor, .font: sfRounded(size: 34, weight: .semibold)]
        apoioViewController.backgroundColor = .backgroundColor
        contactsTableView.backgroundColor = .backgroundColor
        msgsApoioCollectionView.backgroundColor = .backgroundColor
        titleContatosLabel.textColor = .textColor
        titleContatosLabel.font = sfRounded(size: 28, weight: .semibold)
        contacts = createArray() //recebendo o array de contatos criado
        configTable()
        configCollection()
    }
    
    func createArray() -> [Contacts]{//cria o array de contatos com dados mocados
        var arrayContacts: [Contacts] = []
        
        
        let contact1 = Contacts(photo: "188", name: "CVV", parents: "Rede de Apoio", number: 188)
        let contact2 = Contacts(photo: "pessoaAleatoria1", name: "Bruna", parents: "Filha", number: 988888888)
        let contact3 = Contacts(photo: "pessoaAleatoria4", name: "Gregório", parents: "Marido", number: 977777777)
        let contact4 = Contacts(photo: "pessoaAleatoria2", name: "Julia", parents: "Irmã", number: 966666666)
        let contact5 = Contacts(photo: "semFt", name: "Priscila", parents: "Amiga", number: 955555555)
        
        
        arrayContacts.append(contact1)
        arrayContacts.append(contact2)
        arrayContacts.append(contact3)
        arrayContacts.append(contact4)
        arrayContacts.append(contact5)
        
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
        cell.backgroundColor = .backgroundColor
        cell.configCell(with: contact)
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
        cell.layer.cornerRadius = 10.0
        
        cell.msgTextView.text = msg
        return cell
    }
    
}



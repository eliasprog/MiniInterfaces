//
//  AjustesViewController.swift
//  MiniInterfaces
//
//  Created by Cecilia Soares on 05/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit
class AjustesViewController: UIViewController {
    
    @IBOutlet weak var ajustesTableView: UITableView!
    
    var selectedIndex: IndexPath = IndexPath(row: 1, section: 1)
    var cellOpened: Bool = false
    
    var section1model: [Any] = [true, "08:00" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ajustesTableView.backgroundColor = .backgroundColor
        self.view.backgroundColor = .backgroundColor
        self.view.insertSubview(UIView(frame: .zero), at: 0)
        configTable()
        
    }
    private func configTable(){
        ajustesTableView.delegate = self
        ajustesTableView.dataSource = self
        
        //RegisteringNib Perfil
        let perfilCellNib = UINib(nibName: PerfilTableViewCell.xibName, bundle: nil)
        ajustesTableView.register(perfilCellNib, forCellReuseIdentifier: PerfilTableViewCell.identifier)
        
        //Register Lembrete
        let lembreteCellNib = UINib(nibName: LembreteTableViewCell.xibName, bundle: nil)
        ajustesTableView.register(lembreteCellNib, forCellReuseIdentifier: LembreteTableViewCell.identifier)
        
        // Register Horário
        let horarioCellNib = UINib(nibName: HorarioTableViewCell.xibName, bundle: nil)
        ajustesTableView.register(horarioCellNib, forCellReuseIdentifier: HorarioTableViewCell.identifier)
        
        // Register Horario Picker
        let pickerCellNib = UINib(nibName: PickerTableViewCell.xibName, bundle: nil)
        ajustesTableView.register(pickerCellNib, forCellReuseIdentifier: PickerTableViewCell.identifier)
    }
    
}
extension AjustesViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel()
        title.frame = CGRect(x: 16, y: 3, width: 375, height: 50)
        title.font = sfRounded(size: 18, weight: .medium)
        title.textColor = .textColor
        view.backgroundColor = .backgroundColor
        view.addSubview(title)
        
        switch section {
        case 0:
            title.text = "Perfil"
            return view

        case 1:
            title.text = "Configuração do Lembrete"
            return view
            
        case 2:
            title.text = "Sistema"
            return view
            
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if(cellOpened){
                return 3
            }else{
              return 2
            }
        case 2:
            return 2
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 173
        case 1:
            if indexPath.row == 2 { return 179 }
            return 44
        case 2:
            return 44
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let perfilCell = ajustesTableView.dequeueReusableCell(withIdentifier: PerfilTableViewCell.identifier, for: indexPath) as? PerfilTableViewCell else{
                fatalError("wrong identifier")
            }
            return perfilCell
        case 1:
            if indexPath.row == 0{
                let lembreteCell = ajustesTableView.dequeueReusableCell(withIdentifier: LembreteTableViewCell.identifier, for: indexPath) as! LembreteTableViewCell
                return lembreteCell
            } else if indexPath.row == 1 {
                let horarioCell = ajustesTableView.dequeueReusableCell(withIdentifier: HorarioTableViewCell.identifier, for: indexPath) as! HorarioTableViewCell
                horarioCell.horaLabel.text = (section1model[indexPath.row] as? String) ?? "--:--"
                return horarioCell
            }else{
               let pickerCell = ajustesTableView.dequeueReusableCell(withIdentifier: PickerTableViewCell.identifier, for: indexPath) as! PickerTableViewCell
                    
                pickerCell.horas = self
                return pickerCell
            }
        case 2:
            let sistemaCell = ajustesTableView.dequeueReusableCell(withIdentifier: "sistemaCell", for: indexPath) as! SistemaTableViewCell
            if indexPath.row == 0 {
                sistemaCell.titleLabel.text = "Backup"
            } else {
                sistemaCell.titleLabel.text = "Sobre"
            }
            return sistemaCell
        default:
            let pickerCell = ajustesTableView.dequeueReusableCell(withIdentifier: PickerTableViewCell.identifier, for: indexPath) as! PickerTableViewCell
            return pickerCell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == selectedIndex {
            cellOpened = !cellOpened
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .fade)
        }
    }
}


extension AjustesViewController: Horario {
    
    func recebeHora(hora: String) {
        self.section1model[1] = hora
        self.ajustesTableView.reloadData()
    }
    
}

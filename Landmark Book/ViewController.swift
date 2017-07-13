//
//  ViewController.swift
//  Landmark Book
//
//  Created by Mac on 13.07.2017.
//  Copyright © 2017 Varol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    //buralar hep dizi zaten, game of thrones filan.
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view kullanılıyorsa class'ın başında UITableViewDelegate ve UITableViewDataSource'u ekliyoruz ve viewdidload içinde bunları kendilerine eşitliyoruz. yani self diyoruz, sen, kendin.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //şehir isimlerini dizilere atadık.
        landmarkNames.append("Colloseum")
        landmarkNames.append("Berlin")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        //şehir fotoğraflarını image dizisine atadık.
        landmarkImages.append(UIImage(named: "colloseum.jpg")!)
        landmarkImages.append(UIImage(named: "berlin.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpg")!)
    }
    //tableview'in kaç satır olacağını belirliyoruz.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    //segue içinde işlem yapıyoruz. diyoruz ki; eğer senin segue identifierin benim dediğim şeyse şunu yap. ne yap? destinationVC diye bi sabit yarat, onu da gidilecek segue'nin viewcontroller.swift dosyasına yani identifierina eşitle. sonra da o eşitlenen destinationVC içerisinde benim burada yarattığım selectedName ve Imageı öteki taraftaki viewcontrollerın değişkenlerine değer olarak ata. 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.landmarkName = selectedLandmarkName
            destinationVC.landmarkImage = selectedLandmarkImage
        }
    }
    // seçilen satır için işlem yapıyoruz.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedLandmarkName = landmarkNames[indexPath.row]
        selectedLandmarkImage = landmarkImages [indexPath.row]
        performSegue(withIdentifier: "toImageViewController", sender: nil)
        
    }
    
    //tableview içinde satır silme işlemi. dizilerdeki elemanları sildik.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle  == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        
    }
    
    //tableview içindeki satırları tanımlıyoruz. dizideki elemanları satırlarda gösterdik.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        
            cell.textLabel?.text = landmarkNames[indexPath.row]
            return cell
        
    }
}


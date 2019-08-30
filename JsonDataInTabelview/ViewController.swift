//
//  ViewController.swift
//  JsonDataInTabelview
//
//  Created by Anil on 7/17/19.
//  Copyright © 2019 kesarwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIWebViewDelegate {
    
    
    @IBOutlet weak var tabelView: UITableView!
    
    var character = [RelatedTopic]()
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadJson()
    }
    
    
    func downloadJson() {
        guard let url = URL(string: "https://api.duckduckgo.com/?q=simpsons+characters&format=json") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            /*guard let data = data, error == nil, response != nil else {
                print("something is wrong")
                return
            }
            do{
              let decoder = JSONDecoder()
                let downloadedCharater = try decoder.decode(Character.self, from: data)
                self.character = downloadedCharater.RelatedTopics
                DispatchQueue.main.async {
                    self.tabelView.reloadData()
                }
            }catch {
                print("something wrong after downloaded")
            }*/
            
            do{
                if error == nil{
                    self.character = try JSONDecoder().decode([RelatedTopic].self, from: data!)
                    
                    for mainarr in self.character{
                        print(mainarr.Icon, ":", mainarr.Text )
                        DispatchQueue.main.async {
                            self.tabelView.reloadData()
                        }
                        
                    }
                }
            }catch{
                print("error in jsondata")
            }
            
            }.resume()
        
    }
        //tabelview
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return character.count
        }
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            let cell:TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell)!
            
            cell.label.text = "Text" + character[indexPath.row].Text
            
            if let imageURL = URL(string: character[indexPath.row].Icon.url) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imageCharacter.image = image
                        }
                    }
                }
            }
            return cell
        }
    
        
    
}




//
//  ViewController.swift
//  TompaLab Go
//
//  Created by Ivo on 4/08/2016.
//  Copyright © 2016 Ivo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var tbPokemonName: UITextField!
    @IBOutlet var imgPokemon: UIImageView!
    @IBOutlet var lbPokemonName: UILabel!
    
    
    var pokemonList: [String] = ["Ivo", "pikachu", "Karo", "Hung", "Kris", "Pierre", "Nevena", "Fabien", "Denes", "Jesper", "Thu", "Peter", "Mauricio", "Sara", "Phuong" ]
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tbPokemonName.delegate = self
    }
    
 //Hide Keyboard
    
    override func touchesBegan(_ touches: Set <UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
         }
    

     
    
    @IBAction func bSearch(_ sender: AnyObject) {
        // Clear label text
        lbPokemonName.text = ""
        
        // Get name input
        let pokemonName = tbPokemonName.text

        var isFound = false
        
        
        
        if pokemonName != "" {
            for name in pokemonList {
                if pokemonName == name {
                    showPokemon(name)
                    playSound("found")
                    
                    lbPokemonName.text = "\(name) found"
                    isFound = true
                    break
                }
            }
            
            if !isFound {
                showPokemon("")
                playSound("not_found")
                lbPokemonName.text = "Can't find \(pokemonName!) :("
            }
        }
        else {
            
            let alert = UIAlertController(title: "Alert",
                                          message: "Pokemon's name cannot be empty",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func showPokemon(_ name: String) {
        imgPokemon.image = UIImage(named: name)
    }
    
    func playSound(_ sound: String) {
        let audioPath = Bundle.main.path(forResource: sound, ofType: "wav")!
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            player.play()
        }
        catch {
            print("Can't find the audio file")
        }
    }

}



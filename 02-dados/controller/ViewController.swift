//
//  ViewController.swift
//  02-dados
//
//  Created by Ricardo Olea on 20/01/21.
//  Copyright © 2021 Ruben Ramirexz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//mi primer cambio
    
    @IBOutlet weak var dadoIzquierda: UIImageView!
    @IBOutlet weak var dadoDerecha: UIImageView!
    
    var numdado1: Int = 0;
    var numdado2: Int = 0;
    
    let dados: [String] = ["dado1","dado2","dado3","dado4","dado5","dado6"]
    
    let caras: UInt32
    
    required init?(coder aDecoder: NSCoder) {
        caras =  UInt32(dados.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generaTiro()
    }


    @IBAction func giraDadosAction(_ sender: Any) {
        
        generaTiro()
    }
    
    func generaTiro(){
        
        numdado1 = Int(arc4random_uniform(caras))
        let nombreDado1 = dados [numdado1]
        
        self.numdado2 = Int(arc4random_uniform(caras))
        let nombreDado2 = dados [numdado2]
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options:UIView.AnimationOptions.curveEaseInOut, animations: {
            
            self.dadoIzquierda.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                .concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2))
                .concatenating(CGAffineTransform(translationX: -100, y:100))
            
            self.dadoDerecha.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                .concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2))
                .concatenating(CGAffineTransform(translationX: 100, y:100))
            
            self.dadoIzquierda.alpha = 0.0
            self.dadoDerecha.alpha = 0.0
       
        }) { (complete) in
            
            self.dadoIzquierda.transform = CGAffineTransform.identity
            self.dadoDerecha.transform = CGAffineTransform.identity
            
            self.dadoIzquierda.alpha = 1.0
            self.dadoDerecha.alpha = 1.0
            
            self.dadoIzquierda.image = UIImage(named: nombreDado1)
            self.dadoDerecha.image = UIImage(named: nombreDado2)
            
        }
        
    }
    
    
    // shake del iphone
    override func becomeFirstResponder() -> Bool {
        

        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    
        if(motion ==  .motionShake){
            generaTiro()
        }
    }
}


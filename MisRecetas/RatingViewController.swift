//
//  RatingViewController.swift
//  MisRecetas
//
//  Created by Cristian Rojas on 20/03/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!

    var ratingSelected : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func ratingPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            ratingSelected = "☹️"
        case 2:
            ratingSelected = "🙂"
        case 3:
            ratingSelected = "😍"
        default: break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
}

//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Siman Acharya on 02/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        //make sure image view fills the frame
        imageView.contentMode = .scaleAspectFill
        //asign temporary white colour to image view
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button : UIButton = {
        let button = UIButton()
        //asign temporary white colour to image view
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        //give image view a height and width by assigning its frame
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton() {
        getRandomPhoto()
    
}

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height - 50 - view.safeAreaInsets.bottom, width: view.frame.size.width - 40 ,  height: 50)
        
    }
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
        
    }
}



        





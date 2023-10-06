//
//  ViewController.swift
//  real-time-connection
//
//  Created by Lam on 05/10/2023.
//

import UIKit

class ViewController: UIViewController {
    let URL_SERVER_01 = "http://localhost:3000/check"
    let URL_SERVER_02 = "http://localhost:3001/check"

    @IBOutlet var img_server01: UIImageView!
    @IBOutlet var img_server02: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] Timer in
            checkServer(domain: URL_SERVER_01, img: img_server01)
            checkServer(domain: URL_SERVER_02, img: img_server02)
        }
    }

    func checkServer(domain: String, img: UIImageView) {
        let url = URL(string: domain)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let _ = URLSession.shared.dataTask(with: request) {
            data, response, error in

            if error == nil {
                DispatchQueue.main.async {
                    img.image = UIImage(named: "online")
                }
            } else {
                DispatchQueue.main.async {
                    img.image = UIImage(named: "offline")
                }
            }
        }.resume()
    }
}

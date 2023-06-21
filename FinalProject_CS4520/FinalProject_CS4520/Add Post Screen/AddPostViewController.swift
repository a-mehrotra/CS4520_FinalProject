//
//  AddPostViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/20/23.
//

import UIKit

class AddPostViewController: UIViewController {

    let addPostView = AddPostView()
    
    override func loadView() {
        view = addPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

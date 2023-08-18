//
//  DetailVC.swift
//  IosProjekti
//
//  Created by user933037 on 8/17/23.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var dTitle: UITextField!
       @IBOutlet weak var dShortDesc: UITextField!
       @IBOutlet weak var selectImage: UIImageView!
       
       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
    @IBAction func btnSelectImage(_ sender: Any) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            present(picker, animated: true)
            
        }
    @IBAction func btnSave(_ sender: Any) {
           
           let title = dTitle.text ?? ""
           let shortDesc = dShortDesc.text ?? ""
           
           if let imageData = selectImage.image?.jpegData(compressionQuality: 1) {
               DatabaseHelper.shareInstance.save(title: title, shortdescription: shortDesc, image: imageData)
           }
           
           _ = navigationController?.popViewController(animated: true)
           
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

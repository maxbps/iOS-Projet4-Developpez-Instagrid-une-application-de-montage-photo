


import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var allViews: AllViews! 
    
    // MARK: - Share MView
    // Determines the device orientation
    var portraitOrientation: Bool {
        return UIApplication.shared.statusBarOrientation == .portrait
    }
    var landscapeOrientation: Bool {
        return UIApplication.shared.statusBarOrientation == .landscapeLeft
            || UIApplication.shared.statusBarOrientation == .landscapeRight
    }
    // func that share MView in terms of UISwipe.direction
    @IBAction func share(_ sender: UISwipeGestureRecognizer) {
        animation()
        switch sender.direction {
        case .up:
            if portraitOrientation {
                let imageToShare = Image().convert(allViews.MView)
                let activityVC = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
                activityVC.completionWithItemsHandler = {(activityVC, completed, returnedItem, error) in
                    self.animationBack()
                }
                activityVC.popoverPresentationController?.sourceView = self.view
                self.present(activityVC, animated: true, completion: nil) }
        case .left:
            if landscapeOrientation {
                let imageToShare = Image().convert(allViews.MView)
                let activityVC = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
                activityVC.completionWithItemsHandler = {(activityVC, completed, returnedItem, error) in
                    self.animationBack()
                }
                activityVC.popoverPresentationController?.sourceView = self.view
                self.present(activityVC, animated: true, completion: nil) }
        default:
            break
        }
    }
    
    func animation(){
        if portraitOrientation {
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.allViews.MView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            })
        }
        if landscapeOrientation {
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.allViews.MView.transform = CGAffineTransform(translationX: -self.view.frame.width, y:0)
            })
        }
    }
    
    func animationBack(){
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.allViews.MView.transform = .identity
        })
        
    }
    
    
    
    
    
    
    // MARK: - Add images to the buttons
    var position = 1 // position of Image 1,2,3 or 4
    
    @IBAction func importImage(_ sender: Any) {
        position = 1
        addImage()
    }
    @IBAction func importImage2(_ sender: Any) {
        position = 2
        addImage()
    }
    @IBAction func importImage3(_ sender: Any) {
        position = 3
        addImage()
    }
    @IBAction func importImage4(_ sender: Any) {
        position = 4
        addImage()
    }
    
    func addImage() {
        let image = UIImagePickerController()
        image.delegate = self
        // Alert to ask user camera or librairie
        let alert = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (action:UIAlertAction) in
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            self.present(image, animated: true)}))
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){ // in case camera isn't available (simulators..)
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
                image.sourceType = .camera
                image.allowsEditing = true
                self.present(image, animated: true)}))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Add the image to the good position
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        switch position {
        case 1:
            if let image = info[.editedImage] as? UIImage{
                allViews.button.setImage(image, for: .normal)}
        case 2:
            if let image = info[.editedImage] as? UIImage{
                allViews.button2.setImage(image, for: .normal)}
        case 3:
            if let image = info[.editedImage] as? UIImage{
                allViews.button3.setImage(image, for: .normal)}
        case 4:
            if let image = info[.editedImage] as? UIImage{
                allViews.button4.setImage(image, for: .normal)}
        default:
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Buttons to change disposition
    
    //SelectedButtons are the three buttons used to change disposition
    @IBAction func SelectedButton(_ sender: Any) {
        allViews.style = .topRectangle
    }
    @IBAction func SelectedButton2(_ sender: Any) {
        allViews.style = .bottomRectangle
    }
    @IBAction func SelectedButton3(_ sender: Any) {
        allViews.style = .fourSquares
        
    }
    
}

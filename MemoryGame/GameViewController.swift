import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    // Array para guardar las imágenes que tiene que memorizar
    var selectedImages: [UIImage] = []
    var allImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allImages = [
            UIImage(named: "luffy")!,
            UIImage(named: "zoro")!,
            UIImage(named: "sanji")!,
            UIImage(named: "brook")!,
            UIImage(named: "ace")!,
            UIImage(named: "buggy")!,
        ]
        
        // Mostramos las 3 imágenes aleatoriamente
        imageView1.image = selectedImages[0]
        imageView2.image = selectedImages[1]
        imageView3.image = selectedImages[2]
        // Guardamos estas 3 imágenes en el array
        selectedImages = [imageView1.image!, imageView2.image!, imageView3.image!]
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        // Al presionar "Jugar" vamos a la pantalla de selección
        performSegue(withIdentifier: "toSelectionScreen", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSelectionScreen" {
            let selectionVC = segue.destination as! MemoryGame
            selectionVC.selectedImages = selectedImages
        }
    }
}


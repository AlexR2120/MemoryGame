import UIKit

class MemoryGame: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    var selectedImages: [UIImage] = [] // Aquí vienen las imágenes correctas
    var allImages: [UIImage] = [] // Todas las imágenes posibles
    var playerSelection: [UIImage] = [] // Aquí guardamos lo que el jugador selecciona
    var score: Int = 0 // Puntuación del jugador

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Colocamos las 6 imágenes
        button1.setImage(allImages[0], for: .normal)
        button2.setImage(allImages[1], for: .normal)
        button3.setImage(allImages[2], for: .normal)
        button4.setImage(allImages[3], for: .normal)
        button5.setImage(allImages[4], for: .normal)
        button6.setImage(allImages[5], for: .normal)
    }
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        // Añadimos la imagen seleccionada por el jugador
        if let image = sender.image(for: .normal) {
            playerSelection.append(image)
        }

        // Si el jugador ya seleccionó 3 imágenes, comprobamos si acertó
        if playerSelection.count == 3 {
            checkSelection()
        }
    }

    func checkSelection() {
        // Comparamos las imágenes seleccionadas con las correctas
        if playerSelection == selectedImages {
            performSegue(withIdentifier: "toResultScreen", sender: true) // Ganó
        } else {
            performSegue(withIdentifier: "toResultScreen", sender: false) // Perdió
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        resultVC.didWin = sender as! Bool // Pasamos si ganó o no
    }
}

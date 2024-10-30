import UIKit

class MemoryGameViewController: UIViewController {
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet weak var finishButton: UIButton!
    
    // Array de todas las imágenes disponibles en el juego
    var allImages: [UIImage] = [
        UIImage(named: "ace")!,
        UIImage(named: "brook")!,
        UIImage(named: "shanks")!,
        UIImage(named: "luffy")!,
        UIImage(named: "sanji")!,
        UIImage(named: "zoro")!
    ]
    
    // Las imágenes que el usuario debe recordar (configuradas en la pantalla anterior)
    var imagesToMemorize: [UIImage] = []
    var selectedImages: [UIImage] = []
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }

    func setupGame() {
        // Mostrar las 6 imágenes para selección
        for (index, imageView) in imageViews.enumerated() {
            if index < allImages.count {
                imageView.image = allImages[index]
            }
            imageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.addGestureRecognizer(tapGesture)
        }
        finishButton.isHidden = true
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let tappedImageView = sender.view as? UIImageView, let selectedImage = tappedImageView.image {
            // Evitar seleccionar la misma imagen más de una vez
            if selectedImages.contains(selectedImage) {
                return
            }
            if selectedImages.count < 3 {
                selectedImages.append(selectedImage)
                tappedImageView.alpha = 0.5 // Cambiar apariencia para indicar selección
            }
            if selectedImages.count == 3 {
                checkSelections()
                finishButton.isHidden = false // Mostrar botón de terminar
            }
        }
    }

    func checkSelections() {
        score = 0 // Reiniciar puntuación al verificar selecciones
        var correctSelections = 0

        for image in selectedImages {
            if imagesToMemorize.contains(image) {
                correctSelections += 1 // Contar aciertos
            }
        }

        // Calcular la puntuación basada en los aciertos
        score += correctSelections * 25 // 25 puntos por cada imagen correcta
        score -= (selectedImages.count - correctSelections) * 10 // -10 por cada imagen incorrecta


        print("Puntuación total: \(score)")
    }

    @IBAction func finishButtonTapped(_ sender: UIButton) {
        // Ir a la pantalla de resultados
        performSegue(withIdentifier: "ShowResult", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResult" {
            if let resultVC = segue.destination as? ResultViewController {
                resultVC.currentScore = score // Pasar la puntuación actual a ResultViewController
                resultVC.previousScores.append(score) // Agregar la puntuación a la lista de puntuaciones anteriores
            }
        }
    }
}

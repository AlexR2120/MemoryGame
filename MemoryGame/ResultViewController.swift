import UIKit

class ResultViewController: UIViewController {
    var currentScore: Int = 0
    var previousScores: [Int] = []

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var previousScoresTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }

    func displayResults() {
        scoreLabel.text = "Tu puntuación: \(currentScore)"
        // Mostrar las puntuaciones anteriores en el UITextView
        previousScoresTextView.text = "Puntuaciones anteriores:\n" + previousScores.map { "\($0)" }.joined(separator: "\n")
    }

    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "MainScreen", sender: nil)
    }
}

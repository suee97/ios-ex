import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapApiButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ApiViewController") as? ApiViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onTapAppStoreButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppStoreViewController") as? AppStoreViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onTapWater(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DrinkWaterTableViewController") as? DrinkWaterTableViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onTapCV(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CVViewController") as? CVViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

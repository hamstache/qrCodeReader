// InfoLife
// CPSC 462
// iOS Application Created by Josh Moynihan

import UIKit

class QRCodeViewController: UIViewController {

    var stringPassed = ""
    @IBOutlet weak var uniqueID: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uniqueID.text = stringPassed
        
        if let url = URL(string: uniqueID.text!) {
            do {
                let contents = try String(contentsOf: url)
                print(contents)
                let uniqueCode = contents
                let start = uniqueCode.index(uniqueCode.startIndex, offsetBy: 31)
                let end = uniqueCode.index(uniqueCode.endIndex, offsetBy: -29)
                let range = start..<end
                print(uniqueCode.substring(with: range))
                uniqueID.text = uniqueCode.substring(with: range)
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        //var string = "hello Swift"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

}

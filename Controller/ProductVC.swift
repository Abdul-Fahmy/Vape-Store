//
//  ProductVC.swift
//  Vape-Store
//
//  Created by mac on 19/01/2023.
//

import UIKit

class ProductVC: UIViewController {
    
    
    //Mark:- IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    
    
    
    
    //Mark:- Constant
    var productInfo : [GetproductElement] = []
     let baseURL = "https://19e71834-646c-4969-8644-97962a508f5f.mock.pstmn.io"

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gettingProductAPI ()

        // Do any additional setup after loading the view.
    }
    
    
    //Mark:- IBAction
    
    
    
    
    
    
    
    
    //Mark:- Helper Function
    func gettingProductAPI (){
        guard let url = URL(string: baseURL) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {return}
            do {
                self.productInfo = try JSONDecoder().decode(Getproduct.self, from: data)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
    }

    
    
    

    

    

}

extension ProductVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCell
        
        let url = URL(string: productInfo[indexPath.row].image.url)!
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            cell.imageView.image = UIImage(data: imageData)
        }
        

        

        cell.desLBL.text = productInfo[indexPath.row].productDescription
        cell.priceLBL.text = "\(productInfo[indexPath.row].price)$"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productInfo.count
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    
    
}

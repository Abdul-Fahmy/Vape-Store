//
//  ViewController.swift
//  Vape-Store
//
//  Created by mac on 18/01/2023.
//

import UIKit

class SplashScreenVC: UIViewController,UIScrollViewDelegate {
    
    //Mark:- IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var continueOutletBtn: UIButton!{
        didSet{
            continueOutletBtn.layer.cornerRadius = 15
            
        }
    }
    
    
    
    //Mark:- Constant
    var slides:[Slide] = [];
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        scrollView.delegate = self
                
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        //        scrollViewDidScroll(scrollView)
    }
    
    //Mark:- IBAction
    
    @IBAction func continueBtnPressed(_ sender: Any) {
        let vc = UIStoryboard(name: "Product", bundle: nil).instantiateViewController(withIdentifier: "ProductList")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    
    //Mark:- Helper Function
    func createSlides() -> [Slide] {

            let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide1.imageView.image = UIImage(named: "Vape2")
        slide1.welcomeLBL.text = "Welcome"
            slide1.titleLBL.text = "Value Proposition #1"
            slide1.disLBL.text = "Plug in device using the charger provided. Device will charge fully in under 20 minutes"
            
            let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide2.imageView.image = UIImage(named: "vape1")
            slide2.welcomeLBL.text = "Charging Your Device"
            slide2.titleLBL.text = "Value Proposition #2"
            slide2.disLBL.text = "Plug in device using the charger provided. Device will charge fully in under 20 minutes"
            
            let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide3.imageView.image = UIImage(named: "Vape2")
            slide3.welcomeLBL.text = "First Puff"
            slide3.titleLBL.text = "Value Proposition #3"
            slide3.disLBL.text = "Plug in device using the charger provided. Device will charge fully in under 20 minutes"
            
            let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide4.imageView.image = UIImage(named: "Vape2")
            slide4.welcomeLBL.text = "Usage Statistics"
            slide4.titleLBL.text = "Value Proposition #4"
            slide4.disLBL.text = "Plug in device using the charger provided. Device will charge fully in under 20 minutes"
            
            
            let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide5.imageView.image = UIImage(named: "Vape2")
            slide5.welcomeLBL.text = "Device Locator"
            slide5.titleLBL.text = "Value Proposition #5"
            slide5.disLBL.text = "Plug in device using the charger provided. Device will charge fully in under 20 minutes"
        
        let slide6:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide6.imageView.image = UIImage(named: "Vape2")
        slide6.welcomeLBL.text = "Lock & Unlock"
        slide6.titleLBL.text = "Value Proposition #6"
        slide6.disLBL.text = "Plug in device using the charger provided. Device will charge fully in under 20 minutes"
        
            
            return [slide1, slide2, slide3, slide4, slide5, slide6]
        }
    func setupSlideScrollView(slides : [Slide]) {
         scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
         scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
         scrollView.isPagingEnabled = true
         
         for i in 0 ..< slides.count {
             slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
             scrollView.addSubview(slides[i])
         }
     }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageControl.currentPage = Int(pageIndex)
        if scrollView.contentOffset.y != 0 {
                scrollView.contentOffset.y = 0
            }

        }
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//         /*
//          *
//          */
//        setupSlideScrollView(slides: slides)
//    }
    
    
    
    


}


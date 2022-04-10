//
//  OnboardingViewController.swift
//  AppRaoVat
//
//  Created by Lê Công Minh on 08/04/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Bắt đầu", for: .normal)
            } else {
                nextBtn.setTitle("Tiếp", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        bindData()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func bindData() {
        slides = [
            OnboardingSlide(title: "Đăng bán dễ dàng", description: "Bạn có thể đăng bán mọi thứ bạn muốn dù đang ở bất cứ đâu", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "Mua hàng thuận tiện", description: "Bạn có thể mua những thứ bạn cần một cách nhanh chóng, thuận tiện", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Sản phẩm đa dạng và chất lượng", description: "Bạn có thể tìm thấy bất kỳ sản phẩm gì bạn muốn với chất lượng tốt", image: #imageLiteral(resourceName: "slide3"))
        ]
        
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let loginScreen = sb.instantiateViewController(withIdentifier: "LoginViewController")
            loginScreen.modalPresentationStyle = .fullScreen
            loginScreen.modalTransitionStyle = .flipHorizontal
            present(loginScreen, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}

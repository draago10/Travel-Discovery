//
//  DestinationHeaderView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/24/23.
//

import SwiftUI
import Kingfisher

struct DestinationHeaderView: UIViewControllerRepresentable {
    let imageNames: [String]
    func makeUIViewController(context: Context) -> some UIViewController {
        let pvc = CustomePageViewController(imageNames: imageNames)
        return pvc
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

class CustomePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    lazy var allControllers: [UIViewController] = []

    init(imageNames: [String]) {
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        allControllers = imageNames.map({ imageName in
            let hostingController = UIHostingController(
                rootView:
                    KFImage(URL(string: imageName))
                    .resizable()
                    .scaledToFill()
            )
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        if let first = allControllers.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
        self.dataSource = self
        self.delegate = self
       // setViewControllers([firstVC, secondVC], direction: .forward, animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == 0 {
            return nil
        }
        return allControllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == allControllers.count - 1 {
            return nil
        }
        return allControllers[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

struct DestinationHeaderView_Previews: PreviewProvider {
    static let imageURLs = [
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5", "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702", "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531", "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
    ]
    static var previews: some View {
        DestinationHeaderView(imageNames: imageURLs)
    }
}

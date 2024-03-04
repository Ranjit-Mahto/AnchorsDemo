//
//  ViewController.swift
//  AnchorsLab
//
//  Created by Ranjit Mahto on 23/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    let margin : CGFloat = 20
    let spacing : CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Auto Layout"
        
        // Do any additional setup after loading the view.
        //anchorExample()
        //smallBigExample()
        //safeAreaExample()
        //layoutMarginGuideExample()
        //layoutGuideAsSpaceExample()
        setupSportifyView()
    }
    
    func anchorExample(){
        
        let topLeftLabel = createLabel(with:"Top-Left")
        let topRightLabel = createLabel(with:"Top-Right")
        view.addSubview(topLeftLabel)
        view.addSubview(topRightLabel)
        
        topLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        topRightLabel.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        topRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let bottomLeftLabel = makeSecondryLabel(withText: "Bottom-Left")
        view.addSubview(bottomLeftLabel)
        
        bottomLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        bottomLeftLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let bottomRightButton = makeButton(withText:"Bottom-Right")
        view.addSubview(bottomRightButton)
        
        bottomRightButton.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant:-8).isActive = true
        bottomRightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let redview = makeView(withColor: .systemRed)
        view.addSubview(redview)
        
        redview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        redview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        redview.topAnchor.constraint(equalTo: view.topAnchor, constant:100).isActive = true
        redview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        let orangeView = makeView(withColor: .systemOrange)
        redview.addSubview(orangeView)
        
        orangeView.centerXAnchor.constraint(equalTo: redview.centerXAnchor).isActive = true
        orangeView.centerYAnchor.constraint(equalTo: redview.centerYAnchor).isActive = true
        orangeView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        orangeView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    func smallBigExample(){
        
        let smallLabel = makeLabel(withText:"Small-Label", size:12)
        let largeLabel = makeLabel(withText:"Big-Label", size: 32)
        
        view.addSubview(smallLabel)
        view.addSubview(largeLabel)
        
        smallLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        smallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        //largeLabel.topAnchor.constraint(equalTo: smallLabel.topAnchor).isActive = true
        //largeLabel.centerYAnchor.constraint(equalTo: smallLabel.centerYAnchor).isActive = true
        largeLabel.firstBaselineAnchor.constraint(equalTo: smallLabel.firstBaselineAnchor).isActive = true
        largeLabel.leadingAnchor.constraint(equalTo: smallLabel.trailingAnchor, constant:8).isActive = true
    }
    
    func safeAreaExample(){
        let toplabel = createLabel(with: "Top")
        view.addSubview(toplabel)
        
        let bottomLabel = makeLabel(withText:"Bottom", size:32)
        view.addSubview(bottomLabel)
        
        let leadingLabel = createLabel(with:"Leading")
        view.addSubview(leadingLabel)
        
        let trailingLabel = makeLabel(withText:"Trailing", size:32)
        view.addSubview(trailingLabel)
        
        toplabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        toplabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            leadingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            trailingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trailingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func layoutMarginGuideExample(){
        
        let pinkView = makeView(withColor: .systemPink)
        view.addSubview(pinkView)
        
        NSLayoutConstraint.activate([
            pinkView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            pinkView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            pinkView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            pinkView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    func layoutGuideAsSpaceExample(){
        let leadingGuide = UILayoutGuide()
        let okButton = makeButton(withText:"OK", color: .systemBlue)
        let middleGuide = UILayoutGuide()
        let cancelButton = makeButton(withText:"Cancel", color: .systemGreen)
        let trailingGuide = UILayoutGuide()
        
        view.addSubview(okButton)
        view.addSubview(cancelButton)
        view.addLayoutGuide(leadingGuide)
        view.addLayoutGuide(middleGuide)
        view.addLayoutGuide(trailingGuide)
        
        let margin = view.layoutMarginsGuide
        
        margin.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor).isActive = true
        leadingGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor).isActive = true
        
        okButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor).isActive = true
        middleGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor).isActive = true
        
        cancelButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        
        okButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
        
        leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        
        leadingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        middleGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        trailingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        leadingGuide.heightAnchor.constraint(equalToConstant:1).isActive = true
        middleGuide.heightAnchor.constraint(equalToConstant:1).isActive = true
        trailingGuide.heightAnchor.constraint(equalToConstant:1).isActive = true
    }
    
    func setupSportifyView(){
        
        navigationItem.title = "Playback"
        
        //setup sublabel-13 , label-17
        let offlineLabel = makeLabel(withText:"Offline", size: 17, color: .label, face: .regular)
        let offlineSwitch = makeSwitch(isOn: false)
        let offlineSubLabel = makeLabel(withText:"when you go offline, you'll only be able to play the music and podcast you've downloaded.", size:13, color: .label, face: .regular)
        
        let crossfadeLabel = makeLabel(withText: "Crossfade", size: 17, color: .label, face: .Bold)
        let crossfadeMinLabel = makeLabel(withText:"Os", size: 13, color: .label, face: .regular)
        let crossfadeMaxLabel = makeLabel(withText:"12s", size: 13, color: .label, face: .regular)
        let crossfadeProgressView = makeProgressView()
        
        let gaplessPlaybackLabel = makeLabel(withText:"Gapless Playback", size: 17, color: .label, face: .regular)
        let gaplessPlaybackSwitch = makeSwitch(isOn: true)
        
        let hideSongLabel = makeLabel(withText:"Hide Uplayable Song", size: 17, color: .label, face: .regular)
        let hideSongSwitch = makeSwitch(isOn: true)
        
        let enableNormalizationLabel = makeLabel(withText:"Enable Auto Normalization", size: 17, color: .label, face: .regular)
        let enableNormalizationSwitch = makeSwitch(isOn: true)
        
        //add views
        view.addSubview(offlineLabel)
        view.addSubview(offlineSwitch)
        view.addSubview(offlineSubLabel)
        
        view.addSubview(crossfadeLabel)
        view.addSubview(crossfadeMinLabel)
        view.addSubview(crossfadeMaxLabel)
        view.addSubview(crossfadeProgressView)
        
        view.addSubview(gaplessPlaybackLabel)
        view.addSubview(gaplessPlaybackSwitch)
        
        view.addSubview(hideSongLabel)
        view.addSubview(hideSongSwitch)
        
        view.addSubview(enableNormalizationLabel)
        view.addSubview(enableNormalizationSwitch)
        
        //add layout
        offlineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        offlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        
        offlineSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        offlineSwitch.centerYAnchor.constraint(equalTo: offlineLabel.centerYAnchor).isActive = true
        
        offlineSubLabel.topAnchor.constraint(equalTo: offlineLabel.bottomAnchor, constant: margin).isActive = true
        offlineSubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        offlineSubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        
        //crossfade with progress view
        crossfadeLabel.topAnchor.constraint(equalTo: offlineSubLabel.bottomAnchor, constant: spacing).isActive = true
        crossfadeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        crossfadeMinLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: spacing).isActive = true
        crossfadeMinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        
        crossfadeProgressView.leadingAnchor.constraint(equalTo: crossfadeMinLabel.trailingAnchor, constant: 4).isActive = true
        
        crossfadeMaxLabel.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor).isActive = true
        crossfadeMaxLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        
        crossfadeProgressView.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.leadingAnchor, constant: -4).isActive = true
        crossfadeProgressView.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor).isActive = true
        
        gaplessPlaybackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        gaplessPlaybackLabel.topAnchor.constraint(equalTo: crossfadeProgressView.bottomAnchor, constant: spacing).isActive = true
        
        gaplessPlaybackSwitch.centerYAnchor.constraint(equalTo: gaplessPlaybackLabel.centerYAnchor).isActive = true
        gaplessPlaybackSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        
        hideSongLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        hideSongLabel.topAnchor.constraint(equalTo: gaplessPlaybackLabel.bottomAnchor, constant: spacing).isActive = true
        
        hideSongSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        hideSongSwitch.centerYAnchor.constraint(equalTo: hideSongLabel.centerYAnchor).isActive = true
        
        enableNormalizationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        enableNormalizationLabel.topAnchor.constraint(equalTo: hideSongLabel.bottomAnchor, constant: spacing).isActive = true
        
        enableNormalizationSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        enableNormalizationSwitch.centerYAnchor.constraint(equalTo: enableNormalizationLabel.centerYAnchor).isActive = true
        
    }
}


enum FontFace {
    case regular
    case Bold
}

extension ViewController{
    
    func makeLabel(withText text:String, size:CGFloat, color:UIColor, face: FontFace) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = face == .regular ? UIFont.systemFont(ofSize: size) : UIFont.boldSystemFont(ofSize: size)
        label.text = text
        label.textColor = color
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }
    
    func createLabel(with title:String) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = title
        label.backgroundColor = UIColor.yellow
        return label
        
    }
    
    func makeLabel(withText text:String, size:CGFloat) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: size)
        label.text = text
        label.backgroundColor = UIColor.yellow
        return label
        
    }
    
    func makeSecondryLabel(withText text:String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize:12)
        label.text = text
        label.backgroundColor = UIColor.cyan
        return label
    }
    
    func makeButton(withText text:String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }
    
    func makeButton(withText text:String, color:UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        button.backgroundColor = color
        return button
    }
    
    func makeView(withColor color:UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
    
    func makeSwitch(isOn: Bool) -> UISwitch {
        let theSwitch = UISwitch()
        theSwitch.translatesAutoresizingMaskIntoConstraints = false
        theSwitch.isOn = isOn
        return theSwitch
    }
    
    func makeProgressView() -> UIProgressView{
        let progressview = UIProgressView(progressViewStyle: .default)
        progressview.translatesAutoresizingMaskIntoConstraints = false
        progressview.tintColor = .systemGray
        progressview.progress = 1
        return progressview
        
    }
        
}


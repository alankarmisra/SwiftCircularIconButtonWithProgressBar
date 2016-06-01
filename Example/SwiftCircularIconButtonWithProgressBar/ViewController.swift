//
//  ViewController.swift
//  SwiftCircularIconButtonWithProgressBar
//
//  Created by Alankar Misra on 06/01/2016.
//  Copyright (c) 2016 Alankar Misra. All rights reserved.
//

/* Credits: 
 The Example uses icons created by lastspark and useiconic.com from the Noun Project.
 */

import UIKit
import SwiftCircularIconButtonWithProgressBar

class ViewController: UIViewController {

    @IBOutlet var btn: SwiftCircularIconButtonWithProgressBar!
    
    let iconStart = UIImage(named:"iconStart")
    let iconPause = UIImage(named:"iconPause")
    let iconDone = UIImage(named:"iconDone")
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIconToStart()
        btn.iconInset = 0.35
        btn.setTitle("", forState: .Normal)
        btn.resetProgress() // Set progress to 0 but without animation
        btn.icon = iconStart
        btn.tag = 0 // tags: 0 = start, 1 = pause, 2 = done
    }
    
    @IBAction func didTapBtn(sender: AnyObject) {
        switch btn.tag {
        case 0:
            // Start progress simulation
            btn.animatesOffsets = false
            timer?.invalidate()
            setIconToPause()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateProgressAction), userInfo: nil, repeats: true)
        case 1:
            // Pause progress simulation
            timer?.invalidate()
            btn.tag = 0
            setIconToStart()
        default:
            // The simulation is done. Ignore the tap and wait for it to revert to the start state.
            break
        }
    }
    
    func updateProgressAction() {
        btn.progress += 0.1
        if btn.progress >= 1.0 {
            timer.invalidate()
            setIconToDone()
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(resetProgress), userInfo: nil, repeats: false)
        }
    }
    
    func resetProgress() {
        timer.invalidate()
        btn.progress = 0
        setIconToStart()
    }
    
    private func setIconToStart() {
        btn.tag = 0
        btn.icon = iconStart
        btn.iconXOffset = 4
    }
    
    private func setIconToPause() {
        btn.tag = 1
        btn.icon = iconPause
        btn.iconXOffset = 0
    }
    
    private func setIconToDone() {
        btn.tag = 2
        btn.icon = iconDone
        btn.iconXOffset = 0
    }
}


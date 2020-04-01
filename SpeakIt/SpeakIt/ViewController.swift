//
//  ViewController.swift
//  SpeakIt
//
//  Created by Giovanni Palusa on 2018-01-30.
//  Copyright © 2018 Palusa.se. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let speechSynth = AVSpeechSynthesizer()
    let languages = AVSpeechSynthesisVoice.speechVoices()
    var chosenLanguage = ""

    @IBOutlet weak var speakTxt: UITextView!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languagePicker.delegate = self
        languagePicker.dataSource = self
    }

    @IBAction func speakBtnPressed(_ sender: Any) {
        let speechUtterance = AVSpeechUtterance(string: speakTxt.text)
        speechUtterance.pitchMultiplier = pitchSlider.value
        speechUtterance.rate = speedSlider.value
        speechUtterance.voice = AVSpeechSynthesisVoice(language: chosenLanguage)
        speechSynth.speak(speechUtterance)
    }
    
    //MARK: - Delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let lang = languages[row]
        let speaker = lang.language + " - " + lang.name
        return speaker
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenLanguage = languages[row].language
    }
    
}


//
//  Audio.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 2/18/25.
//

import SwiftUI
import AVFoundation

struct Audio: View
{
    func setupRecordingSession() throws
    {
        let recordingSession = AVAudioSession.sharedInstance()
        try recordingSession.setCategory(.playAndRecord, mode: .default)
        try recordingSession.setActive(true)
    }

    var audioRecorder: AVAudioRecorder?

    mutating func setupRecorer() throws
    {
        let recordingSettings = [AVFormatIDKey: kAudioFormatMPEG4AAC, AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue] as [String : Any]
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("recording.m4a")
        
        audioRecorder = try AVAudioRecorder(url: audioFilename, settings: recordingSettings)
        audioRecorder?.prepareToRecord()
    }
    
    func startRecording()
    {
        audioRecorder?.record()
    }
    
    func stopRecording()
    {
        audioRecorder?.stop()
    }
    
    var body: some View
    {
        
        ZStack
        {
            Color.white
            
            VStack
            {
                Button
                {
                    startRecording()
                } label:
                {
                    Image("Audio")
                }
                Button ("Stop Recording")
                {
                    stopRecording()
                }
            }
        }
    }
}




#Preview {
    Audio()
}

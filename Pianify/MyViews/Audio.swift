//
//  Audio.swift
//  Pianify
//
//  Created by Sanjana Arunkumar Iyer on 2/18/25.
//

import SwiftUI
import AVFoundation
import Foundation

class AudioRecorder: NSObject, ObservableObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate
{
    @Published var recordings: [Recording] = []
    @Published var audioLevels: [CGFloat] = Array(repeating: 20, count: 30)
    
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?
    
    private var meterTimer: Timer?
    
    func startRecording()
    {
        let sequence = (recordings.last?.sequence ?? 0) + 1
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd_HHmmss"
        let dateString = formatter.string(from: Date())
        let fileName = "Recording_\(sequence)_\(dateString).m4a"
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
        
        let settings: [String: Any] =
        [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do
        {
            audioRecorder = try AVAudioRecorder(url: path, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.isMeteringEnabled = true
            audioRecorder?.record()
        } catch
        {
            print("Failed to start recording: \(error.localizedDescription)")
        }
    }
    
    func stopRecording()
    {
        audioRecorder?.stop()
        audioRecorder = nil
    }
    
    func fetchRecordgins()
    {
        let directory = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: [.creationDateKey], options: .skipsHiddenFiles)
        
        do
        {
            let fetchedRecordings = files.filter {$0.pathExtension == "m4a" }.compactMap { url -> Recording? in
                let attributes = try? FileManager.default.attributesOfItem(atPath: url.path)
                let creationDate = attributes>[.creationDate] as? Date ?? Date()
                
                let fileName = url.lastPathComponent
                let components = fileName.split(separator: "_")
                let sequence = components.count > 1 ? Int(components[1]) ?? 0 : 0
                
                return Recording(url: url, date: creationDate, sequence: sequence)
                
            }
            
            recordings = fetchedRecordings.sorted(by: { $0.sequence < $1.sequence})
            
        } catch {
            print("Failed to fetch recordings: \(error.localizedDescription)")
        }
        
    }
}

struct Audio: View
{

    
    var body: some View
    {
        
       
    }
}




#Preview {
    Audio()
}

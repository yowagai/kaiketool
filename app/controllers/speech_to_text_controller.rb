class SpeechToTextController < ApplicationController
  def index

  end

  def search
    require "google/cloud/speech"
    speech = Google::Cloud::Speech.speech

    storage_path = "gs://kaiketool/test.flac"

    config = { encoding:          :FLAC,    #FLAC、LINEAR16が対応
              sample_rate_hertz: 44_100,   #サンプリングレート
              language_code:     "ja-JP" } #日本語に設定
    audio = { uri: storage_path }

    operation = speech.long_running_recognize config: config, audio: audio

    puts "Operation started"

    operation.wait_until_done!

    raise operation.results.message if operation.error?

    results = operation.response.results

    @transcriptions = ""
    results.each do |result|
      alternatives = result.alternatives
      @transcriptions += "#{alternatives.first.transcript}"
    end
  end
end
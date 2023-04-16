class SpeechToTextController < ApplicationController
  before_action :set_user

  def index

  end

  def search
    require "google/cloud/speech"
    speech = Google::Cloud::Speech.speech

    storage_path = "gs://kaiketool/airpline.flac"

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

  private

  def set_user
    if user_signed_in?
      @search_history_user = SearchHistory.find_by(user_id: current_user.id)
    else
      @search_history_user = nil
    end
  end

end
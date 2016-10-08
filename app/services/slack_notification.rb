class SlackNotification
  def call(reviewers, merge_request_url)
    project_name, merge_request_link = extract_merge_request_metadata(merge_request_url)

    message = "#{reviewers.join('and ')} you have been selected for a code review for #{project_name}. #{merge_request_link}"

    webhook_url = URI(ENV['CODE_REVIEW_SLACK_WEBHOOK'])
    response = Net::HTTP.post_form(webhook_url, payload: {text: message}.to_json)

    response.code == "200"
  end

  private

  # url format
  # http://<url>/<group|user>/<project_name>/merge_requests/<merge_request_id>
  def extract_merge_request_metadata(url)
    cleaned_url = url.gsub('http://', '')

    project_name = cleaned_url.split('/')[2].capitalize
    mr_id = cleaned_url.split('/')[4]

    link = "<#{url}|Merge request !#{mr_id}>"

    [project_name, link]
  end
end

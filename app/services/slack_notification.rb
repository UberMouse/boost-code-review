class SlackNotification
  def call(reviewers, merge_request_url)
    project_name, service_name, merge_request_link = extract_merge_request_metadata(merge_request_url)

    message = "#{reviewers.join(' and ')} you have been selected for a code review for #{project_name} on #{service_name.capitalize}. #{merge_request_link}"

    webhook_url = URI(ENV['CODE_REVIEW_SLACK_WEBHOOK'])
    response = Net::HTTP.post_form(webhook_url, payload: {text: message}.to_json)

    response.code == "200"
  end

  private

  def extract_merge_request_metadata(url)
    cleaned_url = url.gsub(%r{https?://}, '')
    service_name = is_github?(cleaned_url) ? "github" : "gitlab"

    project_name = cleaned_url.split('/')[2]
    id = cleaned_url.split('/')[4]

    link_name = if is_github?(url)
                  "Pull request ##{id}"
                else
                  "Merge request !#{id}"
                end
    link = "<#{url}|#{link_name}>"

    [project_name, service_name, link]
  end

  def is_github?(url)
    url.match(/github/).present?
  end
end

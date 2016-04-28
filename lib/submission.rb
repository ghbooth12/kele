module Submission
  def create_submission(ch_id, branch, link, comment)
    options = {
      headers: {
        "authorization" => user_token
      },
      body: {
        checkpoint_id: ch_id,
        assignment_branch: branch,
        assignment_commit_link: link,
        comment: comment,
        enrollment_id: get_me["current_enrollment"]["id"]
      }
    }

    response = self.class.post("#{@base_uri}/checkpoint_submissions", options)
    JSON.parse response.body
  end
end

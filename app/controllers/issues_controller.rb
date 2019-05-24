class IssuesController < ApplicationController
  def issue835
    # This uses the same controller action for both kicking
    # off the request to generate, and serving the PDF when
    # it's ready. It might be preferable to split into two
    # actions, like /pdfs/generate and /pdfs/download
    save_path = Rails.root.join("public", "issue835.pdf")
    if File.exist?(save_path)
      # send pdf data
      send_file save_path, disposition: :inline
    else
      # kick off the job and render the
      # default template for this action
      CreatePdfJob.perform_later
    end
  end
end
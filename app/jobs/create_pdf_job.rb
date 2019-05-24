class CreatePdfJob < ApplicationJob
  queue_as :default

  def perform
    save_path = Rails.root.join("public", "issue835.pdf")

    # Don't regenerate the file if it already exists
    return if File.exist?(save_path)

    # Render template as PDF
    pdf_contents = ApplicationController.render(
      pdf: "mypdf",
      template: "issues/issue835.pdf"
    )

    # Simulate slow PDF generation
    sleep 10

    # This saves the PDF to disk, but could put in the DB,
    # upload with ActiveStorage, attach to email, etc...
    File.open(save_path, 'wb') { |file| file << pdf_contents }
  end
end

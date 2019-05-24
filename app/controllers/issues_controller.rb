class IssuesController < ApplicationController
  def issue835
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: '835'
      end
    end
  end
end
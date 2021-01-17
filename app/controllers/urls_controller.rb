class UrlsController < ApplicationController
  def show
    @url = Url.find_by_slug(params[:slug])
    render 'errors/404', status: 404 if @url.nil?
    logger.info "request"

    logger.info  request.remote_ip
    StatsJob.perform_now(@url, request.remote_ip)
    redirect_to @url.link
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      @slug = @url.slug
    end
  end

  private

  def url_params
    params.require(:url).permit(:link)
  end
end

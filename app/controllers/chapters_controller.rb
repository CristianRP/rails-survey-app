class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i(show edit update destroy)

  # GET /chapters or /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1 or /chapters/1.json
  def show; end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit; end

  # POST /chapters or /chapters.json
  def create
    @chapter = current_user.chapters.build(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('chapters_all',
                                                    partial: 'shared/sections/list',
                                                    locals: {
                                                      list: Chapter.all,
                                                      color: 'chapterStrong',
                                                      html_text: 'Lorem ipsum dolor sit amet consectetur, adipisicing elit.<br>
                                                        Nobis labore voluptates cum provident vel odio quo aliquid,<br>
                                                        autem dolorem asperiores placeat! Officia adipisci a voluptatibus<br>
                                                        ratione accusantium. Asperiores, a exercitationem.',
                                                      notice: 'Chapter was successfully created.'
                                                    })
        end
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1 or /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.turbo_stream
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1 or /chapters/1.json
  def destroy
    @chapter.destroy!

    respond_to do |format|
      format.html { redirect_to chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:name, :description, :body)
  end
end

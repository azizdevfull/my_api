class Api::V1::PostsController < ApiController
    before_action :set_post, only: %i[ show edit update destroy ]
    # before_action :authenticate_user!, except: %i[show index]
  
    # GET /posts or /posts.json
    def index
      @posts = Post.all
      render json: @posts
    end
  
    # GET /posts/1 or /posts/1.json
    def show
      @post.update(views: @post.views + 1)
      render json: @post
    end
  
    # GET /posts/new
    def new
      @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts or /posts.json
    def create
      @post = Post.new(post_params)
      @post.user = current_user
        if @post.save
          # format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
          render json: @post, status: :created, location: @post
        else
          # format.html { render :new, status: :unprocessable_entity }
          render json: @post.errors, status: :unprocessable_entity
        end
      end
  
    # PATCH/PUT /posts/1 or /posts/1.json
    def update
        if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy
      
      if @post.destroy
        head :no_content
      end
      
      # respond_to do |format|
      #   format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      #   format.json { head :no_content }
      # end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
  end
  
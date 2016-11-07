class PostsController < ApplicationController       # BASIC CRUD CONTROLLER
  # Showing all of the posts
  # Looks for the index.html.erb template
  def index
    # This is going to GET all posts
    @posts = Post.all
  end

  # Showing a single post
  # Looks for the show.html.erb template
  def show
    #GET a single post by ID
    @post = Post.find(params[:id])
  end

  # Creates a new instance in memory
  # Shows and empty form for the user to create a new post
  def new # Showing the new form
    # Responsible for creating a new instance of a post - not saved in DB yet.
    @post = Post.new
  end

  # Runs the SQL query to add a new post to DB
  # Redirects or renders depending on the outcome
  # No view associated with this method!
  def create # Update new to DB
    # Saving the post with the form values into the DB
    @post = Post.new(post_params)
    if @post.save
      # A successful new record in the DB
      # Look at bundle exec rake routes
    redirect_to post_path(@post)
    else
      # Unsuccessful create
      render :new
    end
  end

  # Finds a single post in the DB
  # Looks for the edit.html.erb template and renders it
  def edit # Showing edit form
    @post = Post.find(params[:id])
  end

  # Responsible for finding a post in the DB
  # Tries to update that post with the given params
  # Redirects or renders depending on the outcome
  # This method has NO view associated with it!
  def update # Update edit in DB
    @post = Post.find(params[:id])
    if @post.update(post_params)
      # Successful update in DB
      redirect_to post_path(@post)
    else
      # Unsuccessful DB update
      render :edit
    end
  end

  # Finds a single post in the DB
  # Removes that Record
  # Redirects to the index method
  # This method has NO views associated with it
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  # Strong params - allowing specific data to come into the controller. Security.
    def post_params
      params.require(:post).permit(:title, :body,
                                   :author, :public)
    end
end


#bundle exec rails s - opens your server. bundle exec -p 3001 - making it specific

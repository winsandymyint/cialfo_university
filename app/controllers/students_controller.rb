class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new

    @all_colleges= College.all
    @student_college = @student.student_colleges.build
  end

  # GET /students/1/edit
  def edit
    @all_colleges= College.all
    @student_college = @student.student_colleges.build
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    college_params[:id].each do |college|
      if !college.empty?
        @student.student_colleges.build(:college_id=> college)
      end
    end
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update

    respond_to do |format|
      if @student.update(student_params)
        @student.student_colleges.where(:student_id=> @student.id).delete_all
        college_params[:id].each do |college|
          if !college.empty?
            @student.student_colleges.new(:student_id=> @student.id, :college_id=> college).save
          end
        end
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    #@student.destroy
    Student.where(:id=> @student.id).destroy_all
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :age, :dob, :current_school, :current_level, :country, :sat_score, :mentor_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit!
    end
end

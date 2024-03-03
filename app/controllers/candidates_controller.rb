class CandidatesController < ApplicationController
    def index
        @candidates = Candidate.all
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            # success
            redirect_to candidates_path, notice: "Add candidate success!"
        else
            # fail
            render :new
        end
    end

    def edit
        @candidate = Candidate.find_by(id: params[:id])
    end

    def update
        @candidate = Candidate.find_by(id: params[:id])

        if @candidate.update(candidate_params)
            # success
            redirect_to candidates_path, notice: "Update candidate success!"
        else
            # fail
            render :eidt
        end
    end

    def destroy
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.destroy if @candidate
        redirect_to candidates_path, notice: "Delete candidate success!"
    end

    private
    def candidate_params
        params.require(:candidate).permit(:name, :age, :party, :politics)
    end
end

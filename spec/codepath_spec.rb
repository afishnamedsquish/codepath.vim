require File.expand_path("../../ruby/codepath",__FILE__)

describe CodePath do
    let(:codepath) {CodePath.new("/home/lucapette/code")}
    let(:good_dir) {"/home/lucapette/code/project/subdir"}
    let(:bad_dir) {"/home/lucapette/notcode/project/subdir"}

    describe "#codedir?" do

        context "with a dir in path" do
            it "returns true" do
                codepath.codedir?(good_dir).should be true
            end
        end

        context "with a dir not in path" do
            it "returns false" do
                codepath.codedir?(bad_dir).should be false
            end
        end

    end

    describe "#codedir" do
        context "with a dir in path" do
            it "returns the current root project dir" do
                codepath.codedir(good_dir).should == "/home/lucapette/code/project"
            end
        end
        context "with a dir not in path" do
            it "returns the dir itself" do
                codepath.codedir(bad_dir).should == bad_dir
            end
        end
    end

end

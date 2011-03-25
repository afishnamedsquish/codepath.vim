require File.expand_path("../../ruby/codepath",__FILE__)

describe CodePath do
    let(:codepath) {CodePath.new("/home/lucapette/code")}
    let(:good_dir) {"/home/lucapette/code/project/subdir"}
    let(:bad_dir) {"/home/lucapette/notcode/project/subdir"}

    describe "#codedir?" do
        it "should return true for good dir" do
            codepath.codedir?(good_dir).should be true
        end
        it "should return fals for bad dir" do
            codepath.codedir?(bad_dir).should be false
        end
    end

    describe "#codedir" do
        it "should return codir for good subdir" do
            codepath.codedir(good_dir).should == "/home/lucapette/code/project"
        end
        it "should return bad dir for bad dir" do
            codepath.codedir(bad_dir).should == bad_dir
        end
    end
end

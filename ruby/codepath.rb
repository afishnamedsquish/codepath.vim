class CodePath

    VERSION='0.0.3'

    def initialize(code_dir)
        @code_dir = code_dir
    end

    def codedir(current_dir)
        code_dir=current_dir 
        if codedir?(current_dir)
            current_dir[/#{@code_dir}/]=""
            code_dir="#{@code_dir}/#{current_dir.match(/^\/([^\/]+)/)[1]}"
        end
        code_dir
    end

    def subdirs(path)
        Dir.glob(File.join(path,"**/*")).select { |f| File.directory?(f) }.join(",")
    end  

    def codedir?(current_dir)
        current_dir.include?(@code_dir) && current_dir != @code_dir
    end

    def project_name(current_file)
        project = ""
        if codedir?(File.dirname(current_file))
            current_file[@code_dir]=""
            project=current_file.split("/")[1]
        end
        project
    end

    def file_name(current_file)
        file = current_file
        if codedir?(File.dirname(current_file))
            current_file["#{@code_dir}/#{project_name(current_file)}"]=""
            file = current_file
        end
        file
    end

end

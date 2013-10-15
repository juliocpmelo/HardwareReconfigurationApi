#ifndef XilinxProjectHandler_h
#define XilinxProjectHandler_h
#include <iostream>
#include <vector>

class XilinxProjectHandler {
	public:
		std::string projectName;
		std::string projectPath;
		std::string prjFileName;
		std::string optFileName;

		std::vector<std::string> usedFiles;
		std::vector<std::string> filesInProject;
	public:
		/**
		 * \brief creates a project with the given name or reuses a existing one if needed
		 * \param projectName the name of the corresponding project
		 * \param projectPath the path where the project files should be put/generated
		 **/
		XilinxProjectHandler(std::string projectName, std::string projectPath);

		/*
		 * \brief adds a file into the project
		 * \param file the file to add
		 * \param generatedFile when it is a generated file the system doesn't need to copy it, thus
		 * whe this flag is true the file will not be copied in the project directory. But the system
		 * will add the file in the filesInProject vector anyways.
		 * */
		void addFile(std::string file, bool generatedFile = false);
		/**
		 * \brief copies the given file to the destination path
		 * \param file the desired file to copy
		 * \param destPath the destination path that must be a directory
		 */
		void copyFile(std::string file, std::string destPath);
		void removeFile(std::string file);
		void buildProjectFile(std::string projectFilePath);
		void compileProject();
		void generateConfigFiles();
};

#endif

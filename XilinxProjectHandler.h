#ifndef XilinxProjectHandler_h
#define XilinxProjectHandler_h
#include <iostream>
#include <vector>

class XilinxProjectHandler {
	public:
		std::string projectName;
		std::string projectPath;
		std::vector<std::string> usedFiles;
		std::vector<std::string> filesInProject;
	public:
		/*creates a project with the given name or reuses a existing one if needed*/
		XilinxProjectHandler(std::string projectName, std::string projectPath);
		void addFile(std::string file);
		void copyFile(std::string file, std::string destPath);
		void removeFile(std::string file);
		void buildProjectFile(std::string projectFilePath);
		void compileProject();
};

#endif

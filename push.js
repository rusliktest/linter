const { exec } = require("child_process");

const VERSION = 'v20'
const BRANCH = 'main'

exec(
	`git add . & git commit -m "Commit for: ${VERSION}" & git tag -a -m "My release: ${VERSION}" ${VERSION} & git push origin ${BRANCH} --follow-tags`,
	(error, stdout, stderr) => {
		if (error) {
			console.log("error", error)
			console.log(`error: ${error.message}`);
			return;
		}
		if (stderr) {
			console.log(`stderr: ${stderr}`);
			return;
		}
		console.log(`Successful commit: ${stdout}`);
	})
var INTERVIEWING_FOLDER_ID = '0B2ULHQncLa8ZenNHc0V0aDVUVFk';
var TEMPLATE_INSTANCE_NAME_PREFIX = 'Hour Long First Hangout | ';

function main() {
  var ui =  DocumentApp.getUi();
  var uiResp = ui.prompt("Candidate's Name:");
  var candidateName = uiResp.getResponseText();
  
  // use the drive app to get this file. Make a copy. Put that copy in the interviewing folder.
  var thisDocId = DocumentApp.getActiveDocument().getId();
  Logger.log(thisDocId);
  var thisDocFile = DriveApp.getFileById(thisDocId);
  Logger.log(thisDocFile);

  var newDocName = getDocName(candidateName);
  
  var folder = DriveApp.getFolderById(INTERVIEWING_FOLDER_ID);
  
  var actualInterviewDoc = thisDocFile.makeCopy('z', folder);
  ui.alert(actualInterviewDoc.getUrl());
}

function getDocName(candidateName) {
  return TEMPLATE_INSTANCE_NAME_PREFIX + candidateName;
}

/*


File.makeCopy(name, destination)


prompt(prompt):
 var ui = SpreadsheetApp.getUi();
 var response = ui.prompt('Enter your name:');

 // Process the user's response.
 if (response.getSelectedButton() == ui.Button.OK) {
   Logger.log('The user\'s name is %s.', response.getResponseText());
 } else {
   Logger.log('The user clicked the close button in the dialog\'s title bar.');
 }


*/

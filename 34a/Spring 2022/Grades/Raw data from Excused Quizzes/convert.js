let csvToJson = require('convert-csv-to-json');

let fileInputName = 'Jeremy_Excused_Quizzes.csv';
let fileOutputName = 'Jeremy_Excused_Quizzes.json';

csvToJson.generateJsonFileFromCsv(fileInputName,fileOutputName);
csvToJson.parseSubArray('|',',').getJsonFromCsv('myInputFile.csv');

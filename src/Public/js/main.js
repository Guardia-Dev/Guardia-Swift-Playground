function run() {
    var codeText = editor.getValue() + "";
    var timestamp = Date.parse(new Date()) + "";

    if (codeText === "") {
        codeText = "empty code";
    }
    $.post("/post",
    {
        codeText: codeText,
        timestamp: timestamp,
    },
    function(data) {
        console.log(data);
        console.log(data['data']);
    });
}

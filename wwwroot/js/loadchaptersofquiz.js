﻿// Function to load chapters when subject is changed
function loadChapters() {
    var subjectId = $("#SubjectDropdown").val();
    if (!subjectId) {
        return; 
    }
    if (subjectId) {
        $.ajax({
            url: '/Teacher/Quizzes/Create?handler=ChaptersBySubjectId',  // URL của action API
            data: { subjectId: subjectId },
            success: function (data) {
                var chapterDropdown = $("#ChapterDropdown");
                chapterDropdown.empty();
                chapterDropdown.append('<option value="">-- Select Chapter --</option>');
                data.forEach(function (chapter) {
                    chapterDropdown.append('<option value="' + chapter.chapterId + '">' + chapter.chapterName + '</option>');
                });
                var selectedChapterId = $("#SelectedChapterId").val();  
                if (selectedChapterId) {
                    chapterDropdown.val(selectedChapterId);
                }
            },
            error: function () {
                alert("Failed to load chapters.");
            }
        });
    }
}

//function loadChaptersofQuestion() {
//    var subjectId = $("#SubjectDropdown").val();
//    if (!subjectId) {
//        return;
//    }
//    if (subjectId) {
//        $.ajax({
//            url: '/Teacher/Questions/Create?handler=ChaptersBySubjectId',  // URL của action API
//            data: { subjectId: subjectId },
//            success: function (data) {
//                var chapterDropdown = $("#ChapterDropdown");
//                chapterDropdown.empty();
//                chapterDropdown.append('<option value="">-- Select Chapter --</option>');
//                data.forEach(function (chapter) {
//                    chapterDropdown.append('<option value="' + chapter.chapterId + '">' + chapter.chapterName + '</option>');
//                });
//                var selectedChapterId = $("#SelectedChapterId").val();
//                if (selectedChapterId) {
//                    chapterDropdown.val(selectedChapterId);
//                }
//            },
//            error: function () {
//                alert("Failed to load chapters.");
//            }
//        });
//    }
//}

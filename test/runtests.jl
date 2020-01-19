using Test
using StackOverflow

qHolder = getrecentquestionsfortag()
@test_nowarn qHolder[1].answer_count

@test_nowarn getrecentbadgerecipients()
@test_nowarn geterrors()

siteinfoholder = getsiteinfo()
@test_nowarn dump(siteinfoholder)

@test_nowarn searchtag("julia")

@test_nowarn StackOverflow.searcherror()

aHolder = getanswers()
@test typeof(aHolder[1].question_id) == Int

@test_nowarn StackOverflow.getanswerfromquestion(qHolder[1])
@test_nowarn StackOverflow.getquestionfromanswer(aHolder[1])

@test_nowarn getusers()
@test_nowarn getcomments()
@test_nowarn getsuggested_edits()

@test_nowarn StackOverflow.getmoderators()
@test_nowarn StackOverflow.getopenquestions()
@test_nowarn StackOverflow.getnoanswerquestions()
@test_nowarn StackOverflow.getfeaturedquestions()

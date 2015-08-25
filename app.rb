require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pg'
require './lib/survey'
require './lib/question'
require './lib/response'
require 'pry'

get '/' do
  @surveys = Survey.all
  erb :index
end

post('/surveys/new') do
  newtitle = params.fetch('title')
  # if Survey.find_by(title: newtitle) == nil
    newsurv = Survey.new({:title => newtitle})
    newsurv.save()
  # else
  #   @errmsg = "Sorry already there. Try again"
  # end
  @surveys = Survey.all
  erb :index
end



get '/surveys/:id/edit' do
  @survey = Survey.find(params['id'])
  erb(:survey_edit)
end

post('/surveys/:sid/questions/new') do
  newquest = params.fetch('question')
  sid = params.fetch('sid')
  surv = Survey.find(sid)
  if Question.find_by(question: newquest, survey_id: sid) == nil
    newq = Question.new({:question => newquest})
    newq.save()
    surv.questions.push(newq)
  else
   @errmsg = "Sorry already there. Try again"
  end
  @survey = Survey.find(sid)
  erb(:survey_edit)
end

post '/surveys/:sid/questions/delete' do
  sid = params.fetch('sid')
  qid = params[:question_id]
  quest = Question.find(qid)
  quest.destroy
  redirect "/surveys/#{sid}/edit"
end

get '/surveys/:sid/questions/:qid/edit' do
  @question = Question.find(params['qid'])
  @survey = Survey.find(@question.survey_id)
  erb :question_edit
end

post '/surveys/:sid/questions/:qid/edit' do
  qid = params.fetch('qid')
  sid = params.fetch('sid')
  response = Response.create({response: params['response']})
  ques = Question.find(qid)
  ques.responses.push(response)
  redirect "/surveys/#{sid}/questions/#{qid}/edit"
end

post '/surveys/:sid/questions/:qid/response/delete' do
  qid = params.fetch('qid')
  sid = params.fetch('sid')
  rid = params[:response_id]

  if rid != nil
    response = Response.find(rid)
    response.destroy
  end
  redirect "/surveys/#{sid}/questions/#{qid}/edit"
end

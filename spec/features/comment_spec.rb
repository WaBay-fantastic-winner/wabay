require 'rails_helper'

RSpec.feature "在專案底下留言", type: :feature do
  let(:user) { User.find(project.user_id) }
  let(:project) { create(:project) }
  let(:content) { 'Wubay好好用' }
  let(:sub_content) { '真的超好用' }
  let(:comment) { Comment.create(user_id: user.id, project_id: project.id, content: 'Wubay全都馬上就找到工作了') }

  it "留言" do
    login_as user

    visit project_path(project.id)

    click_on '留言'

    within 'div#comment-area' do
      fill_in '請輸入留言', with: content
    end

    find('input.comment-submit').click

    within 'div#sub-comment-area' do
      fill_in '回覆', with: sub_content
    end

    find('input.sub-comment-submit').click

    expect(page).to have_content('Wubay好好用')
  end

  it "按讚" do
    login_as user

    visit project_path(comment.project_id)

    click_on '留言專區'

    click_on '♡'

    expect(find('span#like-count')).to have_content('1')
  end

  it "刪除留言" do
    login_as user

    visit project_path(comment.project_id)
    
    click_on '留言專區'

    accept_confirm do
      click_link '刪除留言'
    end

    expect(page).not_to have_content(comment.content)
  end
end

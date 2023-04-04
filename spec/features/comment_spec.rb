require 'rails_helper'

RSpec.feature "Comments in specific project", type: :feature, js: true do
  subject { page }

  let(:project) { create(:project) }
  let(:user) { project.user }

  before do
    login_as user
  end

  context "when user leave a comment" do
    let(:comment) { 'Wubay好好用' }

    before do
      visit project_path(project.id)
      click_on '留言專區'
      within 'div#comment-area' do
        fill_in '請輸入留言', with: comment
      end
  
      find('input.comment-submit').click
    end

    it { is_expected.to have_content(comment) }
  end

  describe 'after a project has a comment' do
    let(:specific_comment) { Comment.create(user_id: user.id, project_id: project.id, content: 'Wubay全都馬上就找到工作了') }

    before do
      visit project_path(specific_comment.project_id)
      click_on '留言專區'
    end

    context "when user leave a sub-comment" do
      let(:sub_comment) { '真的超好用' }

      before do
        within 'div#sub-comment-area' do
          fill_in '回覆', with: sub_comment
        end

        find('input.sub-comment-submit').click
      end

      it { is_expected.to have_content(sub_comment) }
    end

    context "when user press ♡" do
      before { click_on '♡' }

      it { is_expected.to have_css('span#like-count', text: '1') }
    end

    context 'when user delete a comment' do
      before do
        accept_confirm { click_link '刪除留言' }
      end

      it { is_expected.not_to have_content(specific_comment.content) }
    end
  end
end

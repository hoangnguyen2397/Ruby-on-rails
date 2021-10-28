# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

Practice with Eh Protobuf at my local.

- Create RPC at EhProtobuf: Create CheckMemberIsExist to use in here.

  - At grpc_proto/protos/employment_hero/member.proto to create Request & Response message

```
message CheckMemberIsExistRequest {
  string email = 1;
}

message CheckMemberIsExistResponse {
  string member_id = 1;
  bool is_member_existed = 2;
}
```

    - At grpc_proto/protos/employment_hero.proto create RPC

```
  rpc CheckMemberIsExist (
    EhProtobuf.EmploymentHero.CheckMemberIsExistRequest
  ) returns (
    EhProtobuf.EmploymentHero.CheckMemberIsExistResponse
  ) {}
```

    - At EH project: Create CheckMemberIsExistHandler.

```
module RpcHandler
    class CheckMemberIsExistHandler < BaseHandler
        attr_reader :request, :meta

        def initialize(request, meta)
            @request = request
            @meta = meta
        end

        def call
            member = Member.find_by(personal_email: request.email)

            if member
                EhProtobuf::EmploymentHero::CheckMemberIsExistResponse.new(
                    member_id: member.uuid,
                    is_member_existed: AccountPolicy.new.member?(member)
                )
            else
                EhProtobuf::NotFoundError.new("Could not found member by uuid #{request.member_id}")
            end
        end
    end
end
```

    - At AccountPolicy, create member? method to check if member is existed in database

```
def member?(member = current_member)
    member.present?
end
```

- Write unit test for check method

```
describe RpcHandler::CheckMemberIsExistHandler do
    let(:service) {
        RpcHandler::CheckMemberIsExistHandler.new(request, {})
    }

    describe '#check_member_is_exist' do
        let!(:member) { create(:member) }
        let(:request) {
            EhProtobuf::EmploymentHero::CheckMemberIsExistRequest.new(
                email: email
        )}
        let(:response) { service.call }

        context 'not found member' do
            let(:email) { Faker::Internet.email }

            it 'raises exception' do
              expect(response).to be_a EhProtobuf::NotFoundError
            end
        end

        context 'valid request' do
            let(:email) { member.personal_email }
            let(:member_uuid) { member.uuid }

            before do
                expect_any_instance_of(
                  AccountPolicy
                ).to receive(:member?).and_return(true)
              end

            it 'returns response' do
                expect(response).to be_a(EhProtobuf::EmploymentHero::CheckMemberIsExistResponse)
            end

            it 'returns data' do
                expect(response.member_id).to eq(member.uuid)
                expect(response.is_member_existed).to eq(true)
            end
        end
    end
end
```

    - At my blog app, I can access with the code changes.

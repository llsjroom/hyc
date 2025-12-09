#### Branch
- main : 최종
- preview : 확인용
- dev01 : YC
- dev02 : JH
- dev03 : HS
  
#### SQL 공유
- **export**  
  mysqldump -u root -p1234 book > 파일명.spl 또는 경로/파일명.sql (전체테이블)  
  mysqldump -u root -p1234 book 테이블이름 > 파일명.spl 또는 경로/파일명.sql (선택테이블)
- **import**  
  mysql -u root -p1234 book < 파일명.spl 또는 경로/파일명.sql
<br/>
  
---
  
<br/>

### Git
1. **git pull**  
  : main 브랜치의 최종 소스를 local로 가져오기
2. **git checkout 브랜치명**  
  : 브랜치 이동
3. **git merge main**  
  : main의 변경된 내용을 자신의 브랜치와 병합
4. **git commit**  
  : 작업 완료된 파일 목록과 관련 메시지 전달
5. **git push**  
  : local의 브랜치 내용을 저장소의 브랜치로 올리기
6. **git fetch** → **git reset --hard origin/브랜치명**  
  : git에서 내 branch의 최신상태를 가져온 뒤, git의 내용으로 덮어쓰기  
    (local 상태가 돌이킬 수 없을때/local에만 있던 내용은 사라짐)
<br/>
  
---
  
<br/>

### 규칙
> **들여쓰기**
- type: space
- size: 2
<br/>
  
---
  
<br/>

### 설정
  
#### STS
  
> **들여쓰기**

window > preferences > General > Editors > Text Editors
- Displayed Tab width: 2
- Insert spaces for Tab (체크)

#### Visual Studio Code

> **들여쓰기**

setting
- Tab width: 2
- Insert Spaces (체크)
- Detect Indentation (미체크)


## Issue
비동기 방식으로 json 데이터를 받아와서 뷰를 구성하는데에는 성공하였습니다. 다만, 받아 온 데이터를 만들어 놓은 var productList = [Product]()에 저장이 안되는 이슈를 해결하지 못 했습니다.
Main Thread에 접근하지 못하는 문제로 파악 중입니다.

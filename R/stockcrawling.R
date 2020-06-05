#' crawling
#'
#' 네이버 증권 사이트에서 입력되는 해당 주식코드의 자료를 크롤링하는 함수
#'
#' @examples
#'
#'
#' crawling('005930')
#'
crawling <- function(code) {

  #필요한 패키지 설치 및 불러오기
  install.packages("rvest")
  install.packages("R6")
  library("rvest")
  library("R6")


  #네이버 증권에서 크롤링할 데이터가 있는 사이트 주소
  url_base <- paste('http://finance.naver.com/item/sise_day.nhn?code=', code, '&page=', sep = "")
  all.price <- c()

  #20쪽까지 자료 가져오기
  for (page in 1:20){
    price <- paste(url_base,page,sep='') %>%
      read_html() %>%
      html_nodes('table') %>%
      .[1] %>%
      html_table()
    all.price <- c(all.price,price)
  }

  #크롤링한 자료 확인
  all.price[[1]]
}

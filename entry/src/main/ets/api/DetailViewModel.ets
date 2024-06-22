import Constants from '../common/Constants'
import { BookDetail } from '../model/BookDetail'
import ResponseResult from '../model/ResponseResult'
import { httpRequestGet } from '../utils/request'

class DetailViewModel {
  getProDetail(bookId: string): Promise<BookDetail> {
    return new Promise((resolve, reject) => {
      let url = `${Constants.BASE_URL}${Constants.GET_DETAIL}?id=${bookId}`
      httpRequestGet(url).then((res: ResponseResult) => {
        if (res.code === Constants.HTTP_CODE_200) {
          resolve(res.data)
        } else {
          reject('网络加载失败')
        }
      }).catch((err: Error) => {
        reject('网络请求失败，请稍后再试')
      })
    })
  }
}

const detailViewModel = new DetailViewModel()

export default detailViewModel as DetailViewModel
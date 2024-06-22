import Constants from '../common/Constants'
import ResponseResult from '../model/ResponseResult'
import { httpRequestPost } from '../utils/request'

class LoginViewModel {
  login(phone: string, code: string) {
    return new Promise((resolve, reject) => {
      let url = `${Constants.BASE_URL}${Constants.LOGIN}`

      httpRequestPost(url, { phone: phone, code: code }).then((res: ResponseResult) => {
        resolve(res)
      }).catch((err: Error) => {
        reject('网络请求失败，请稍后再试')
      })

    })
  }
}
const loginViewModel = new LoginViewModel()
export default loginViewModel as LoginViewModel
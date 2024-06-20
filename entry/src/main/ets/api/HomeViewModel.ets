// 只负责拿数据，数据如何使用 后期会交给页面处理，发起请求指令的是页面
import Constants from '../common/Constants'
import ResponseResult from '../model/ResponseResult'
import { httpRequestGet } from '../utils/request'
// 创建 类，包含首页的数据请求的方法
class HomeViewModel {
  // 封装请求轮播图的方法
  getBannerList() {
    // 返回promise 方便后期页面可以直接 .then 读取结果然后处理数据
    // resolve 代表数据请求是成功调用的函数
    // reject 代表数据请求是失败调用的函数
    return new Promise((resolve, reject) => {
      let url = `${Constants.BASE_URL}${Constants.GET_BANNER_LIST}`

      httpRequestGet(url).then((res: ResponseResult) => { // 请求到了数据
        if (res.code === Constants.HTTP_CODE_200) {
          // 请求成功  ---- 告诉页面继续使用数据
          resolve(res.data)
        } else {
          // 获取数据失败
          reject('网络加载失败')
        }
      }).catch((err: Error) => {
        reject('网络请求失败，请稍后再试')
      })

    })
  }

  // 封装请求产品列表的方法
  getRecommendList() {
    return new Promise((resolve, reject) => {
      let url = `${Constants.BASE_URL}${Constants.GET_RECOMMEND}`

      httpRequestGet(url).then((res: ResponseResult) => { // 请求到了数据
        if (res.code === Constants.HTTP_CODE_200) {
          // 请求成功  ---- 告诉页面继续使用数据
          resolve(res.data)
        } else {
          // 获取数据失败
          reject('网络加载失败')
        }
      }).catch((err: Error) => {
        reject('网络请求失败，请稍后再试')
      })

    })
  }
}
// 生成类的实例
const homeViewModel = new HomeViewModel()
// 暴露出去实例， as 代表 之后引入时的名字
export default homeViewModel as HomeViewModel
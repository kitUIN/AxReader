export default class Constants {
  // 数据请求的基本地址
  static readonly BASE_URL: string = 'http://nacho.kituin.fun:3126/api'

  // 请求超时时间
  static readonly HTTP_READ_TIMEOUT: number = 10000

  // 请求成功的状态码
  static readonly HTTP_CODE_200: number = 200

  // 请求首页轮播图数据接口
  static readonly GET_BANNER_LIST: string = '/home/swiper'

  static readonly LOGIN: string = '/login'

  static readonly GET_BOOK_LIST: string = '/home/more'

  // 请求首页产品列表数据接口
  static readonly GET_RECOMMEND: string = '/home/recommend'

  // 页码
  static readonly COUNT: number = 1

  // 每页显示个数
  static readonly LIMIT_NUM: number = 10
}

// 数据接口请求 GET POST
export const enum RequestMethod {
  POST = 'POST',
  GET = 'GET'
}

// 前后端数据交互 Content-Type类型
export const enum ContentType {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}

import http from '@ohos.net.http';
import Constants, { ContentType } from '../common/Constants';
import ResponseResult from '../model/ResponseResult';

export function httpRequestGet (url: string) {
  return httpRequest(url, http.RequestMethod.GET)
}

export function httpRequestPost <T> (url: string, data: T) {
  return httpRequest(url, http.RequestMethod.POST, data)
}

function httpRequest <T> (url: string, method: http.RequestMethod, params?: T): Promise<ResponseResult> {
  const httpRequest = http.createHttp() // 创建一个http请求。

  // 根据URL地址，发起HTTP网络请求。基于Promise 对象，后期可以 直接通过 .then 方法获取数据
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: Constants.HTTP_READ_TIMEOUT,
    header: {
      'Content-type': ContentType.JSON
    },
    connectTimeout: Constants.HTTP_READ_TIMEOUT,
    extraData: params
  })

  // 创建服务器返回的数据
  const serverData = new ResponseResult()

  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === Constants.HTTP_CODE_200) {
      const result = `${value.result}`
      const resultJson: ResponseResult = JSON.parse(result)
      serverData.code = resultJson.code
      serverData.msg = resultJson.msg
      serverData.data = resultJson.data
    } else {
      serverData.msg = '网络请求失败，请稍后再试'
    }
    return serverData
  }).catch(() => {
    serverData.msg = '网络请求失败，请稍后再试'
    return serverData
  })
}
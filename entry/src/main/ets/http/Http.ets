import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';


const request = axios.create({
  baseURL: 'http://192.168.1.15:6060',
  timeout: 20 * 1000,
})

request.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 未来要添加 token
  return config;
})

request.interceptors.response.use((response: AxiosResponse) => {
  if (response.data.code === 200) {
    return response.data.data;
  } else {
    return Promise.reject(response.data.message);
  }
}, (error: AxiosError) => {
  return Promise.reject(error.message);
})

export default class Http {
  get<T>(url: string, params?: object) {
    return request.get<null, T>(url, {
      params: params
    })
  }

  post<T>(url: string, data?: object) {
    return request.post<null, T>(url, data)
  }

  put<T>(url: string, data?: object) {
    return request.put<null, T>(url, data)
  }

  delete<T>(url: string, params: object) {
    return request.delete<null, T>(url, params)
  }
}


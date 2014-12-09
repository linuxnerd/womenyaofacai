# encoding: UTF-8
require "open-uri"
require "json"

BASE_URL = "http://www.chinawealth.com.cn/lccpAllProJzyServlet.go"

# 第一次请求数据
params = {cpzt: '02', pagenum: '1'}
res = Net::HTTP.post_form(URI.parse(BASE_URL), params)
res_hash = JSON.parse(res.body)

# 数据总条数
total_num = res_hash['Count'].to_i

# 数据总页数（翻页请求使用）,一次请求500条数据
page_num = (total_num % 500 == 0) ? (total_num / 500) : (total_num / 500 + 1)

res_hash['List'].each do |el|

  p '_______________'
  p '产品ID:'+ el['cpid']

  params = { cpid: el['cpid'], pagenum: '1' }
  # params = { cpid: '710622', pagenum: '1' }
  begin
    res = Net::HTTP.post_form(URI.parse(BASE_URL), params)
    res_hash = JSON.parse(res.body)
    detail = res_hash['List'].first

    p "【产品ID】" + detail['cpid']
    p "【产品登记编码】"+ detail['cpdjbm']
    p "【产品代码】" + detail['cpdm']
    p "【产品描述】" + detail['cpms']
    p "【产品类型】" + detail['cplx']
    p "【产品类型描述】" + detail['cplxms']
    p "【预计开户最高年收益率】" + detail['yjkhzgnsyl']
    p "【预计开户最低年收益率】"+ detail['yjkhzdnsyl']
    p "【到期实际收益率】" + detail['dqsjsyl']
    p "【起点销售金额】" + detail['qdxsje'] + '元'
    p "【产品状态描述】" + detail['cpztms']
    p "【产品起始日期】" + detail['cpqsrq']
    p "【预计终止日期】" + detail['cpyjzzrq']
    p "【产品期限】" + detail['cpqx'] + '天'
    p "【期限类型】" + detail['qxms']
    p "【发行机构代码】" + detail['fxjgdm']
    p "【发行机构描述】" + detail['fxjgms']
    p "【募集币种】" + detail['mjbz']
    p "【募集起始日期】" + detail['mjqsrq']
    p "【募集结束日期】" + detail['mjjsrq']
    p "【开放周期起始日】" + detail['kfzqqsr']
    p "【开放周期结束日】" + detail['kfzqjsr']
    p "【产品收益类型】" + detail['cpsylx']
    p "【产品收益类型描述】" + detail['cpsylxms']
    p "【风险等级】" + detail['cpfxdj']
    p "【风险等级描述】" + detail['fxdjms']
    p "【初始净值】" + detail['csjz']
    p "【产品净值】" + detail['cpjz']
    p "【销售区域】" + detail['xsqy']
    p "【产品销售区域】" + detail['cpxsqy']

    if Production.where(pid: detail['cpid']).take.nil?
      Production.create!(
        pid: detail['cpid'],
        registration_code: detail['cpdjbm'],
        description: detail['cpms'],
        production_type: detail['cplxms'],
        highest_yield: detail['yjkhzgnsyl'],
        lowest_yield: detail['yjkhzdnsyl'],
        real_yield: detail['dqsjsyl'],
        starting_amount: detail['qdxsje'],
        status: detail['cpztms'],
        start_date: detail['cpqsrq'],
        end_date: detail['cpyjzzrq'],
        term: detail['cpqx'],
        term_type: detail['qxms'],
        issuer_code: detail['fxjgdm'],
        issuer_name: detail['fxjgms'],
        currency: detail['mjbz'],
        collection_start_date: detail['mjqsrq'],
        collection_end_date: detail['mjjsrq'],
        incoming_type: detail['cpsylx'],
        risk_level: detail['fxdjms'],
        initial_value: detail['csjz'],
        production_value: detail['cpjz'],
        sales_area: detail['cpxsqy']
      )
      p "产品[" + detail['cpid'] + "]创建成功"
    end
    sleep 10
  rescue Exception
    p el['cpid'] + '请求失败，10秒后抓取下一条数据'
    sleep 10
  end

end

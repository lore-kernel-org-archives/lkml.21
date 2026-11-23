Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405329;
	b=BLfeLCkM+hBKjrpLk/YxzM+1NNmIw2LtSckFN01vEMVJSKuHyEWHfU//PrYJZ/4FY137
	 OMKYtoTk3T/UFHpNRDggMLuCcwTY7pymngfTog1mmFi9nby1/74I1kPcVXQ1hW6iECCzd
	 yxX8gUymeyMs9j+Sh4rhfQ1EKiWSQDwvrNwSAPqd0iQ75rmHEJju57+DkiQFqalKRFX+a
	 JWSJ01tNzJKF2j15POV526I8yJl/WaPl6Tp38+AndR5gMAeUny6ptNS+XC5BExjaT2OxM
	 qpHVB5zWkGsEU9ESOjo1zd7W141T06PJEN68l1K1emwdoQtAqmZASh0xGjVVoPXn6HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
	b=kXR7MQE6qU48FZJiT2M3otLHVpE9C8qiPyU6PMmgopmuSxrivLsfectlDltyLw5ag3+g
	 t+lyOG931wXsnzMwnlbfTCzYt1+28gRkq+F2HH+wkUvbqiJ6D+01gZQqQUbvbGK5Cw9UG
	 11ZB1oDzitxKPK6hA5TMkTYVMCY0vZDpDLMe/5jnsS2MCgUOnyIrPHutvV41E4j5225tt
	 KH610e1+fRPuwGDzbWCoVHSdNxiWOUVX5xx/ofEbKGa52VwlTg19vzTTzt/yxRBAaYnkF
	 gv00gV//oRXDUvDeoR3yXGxNqjU/LaeW8IDZVaPo8ltBjBa5rC8FKCbNxA5/J6kI7dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTzJt6qn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E51JgrRa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E829606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E829606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTzJt6qn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E51JgrRa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMNr6Hc178680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=; b=oTzJt6qnLd0hstbd
	xT5GdQxklui3K8aOlQ3KlmrNk7szOErxUT/OHKDYv5tl0eR8noJQLb1H9ygwURRk
	Le99huTrH6aQVqzpwCbzYnht6MoWDr6GmvIkNp1itUcEBysCMcY2GjpjS9pM/OBr
	VeVoQSVgla3FrtKpWN6PvXNnLaUARUR3LpN4oZGZ2QSvDWORGQiWbB8fH09xaiUc
	w38ZoJlfqabPhdUPIOY2IzZ4JrSdbzBdGJqynRii0FaA7Ur6vJ2PbR3IOza+DfuS
	HJ4aB34bbOWMEdHAzTldUKyuFJearU9F+ODz0wxHp5kceA/FsFW5N5VCfcEE++7p
	Cqt1DQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gmwst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:42:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso1470897a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795405327; x=1796010127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
        b=E51JgrRahuktshLrc9ZZf1jhRwLZW1xq/lhLpJOrvB7gropeym4YCRRhBxHp41YdcG
         rs4AvLKxmtsnujbTZcq5dQTqEq0EL2hAIqeH5MI6S0PjeBxdWqFV+PWn68c/kUUR5AUT
         PzZYRSeVqRKbkpBmNiexhsNFw91nYaEy4+Gr4kX43pUsiWBEGR5L/Bj9UsVuhgouJv0O
         hFgAGUYS7zjZLsiJpXFQlXuhJm0GVk3rJ9XWx33S/+Y354yN7A2FdX/tJAw/64sGZinT
         lwoQE6ontmjyCMxpJU/VjRZ6lweK5dHSY748QK8CATvGQjoLTjEfRd5rZ6oRMwFcvGxq
         fwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795405327; x=1796010127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
        b=iQeYGqmeW3C1J4eqIIcn13okI44CYBXBh85HCKDLrp9Bwa9gbjVYinIBnI9wRO4jlv
         Ih8tWau9bAGp2WCEmiG2g3EErUmjPDZ7UBjMKvcvC/mjufNUisjax0MQL3wl4l0gVbiX
         Bu/sUV4FZvmM7viJPaKTzQi9EQlqR7D90b3U109yaNc8wBBqSh0Dk+aDIC7xd025xbcq
         tazMpzeshJ2/q84IRFBQ90D99Lp4awCRWllCp57b+As+2WcYkE+MGWuEmdhit1TI9aQ4
         3ezwKhUQ9+QwzzV8EoadK8ySTetdxj/GsAqxw0A0LgR+rwJoFJuom/co4sG9jVl013Ez
         d/Kw==
X-Forwarded-Encrypted: i=1; AL+hErExHaSccx6ycxFSmZWVC/g4IBCMs4UgjJJyY8QTHwcsFd5W6VklkX9HevRa3TyGlc8lkCdU0zs1AMzRe9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J9EuFBb9vGd8SUCRzA/AWCgLeRGiEBtRyf4ewXshbDkK66y5H
	hqUGRO0jhVEyCFJXnuZR9m/chpkNrCrwWLFtGmWr5Y1X7Bcgsiyty4B0AYR2d1QEvKvxAHDvbmP
	uagXlMIIAglpRDQfCX3LOYlA1pIdlkl7E/RyHPX4IIQBOZWMB7yPskITdYW6N+LPiCoM=
X-Gm-Gg: AZFdTZd5omWV6iv+BcL0PS+ZPIXGyfh4+Y5LsFFDPAkY5FYpEyHR4Z6qiVkOaS5w9OT
	zS5OsXScLgNWQWmYD47C2SXL5i6IjXg0xI98jGIz6wnGl8vUsHCRcoGldZ6/PRwVHh7pOFJuoAH
	zK0JBM6l+8+JquzZ9N2Q2t6ZtVpCrXWra1Kw7u/oJIIZodqW/kNlk3+ZxHSXJbMPLc35SbLdndK
	qrb66aKiZKHLXTo2a+5N0oYEP7TqfZn91vzG0ZtkLQp6wD42fXh352GTuYEt9+VyueElj6+TQDY
	hqZiJ67irhbQrNPZiTvfEpctjilF9i91SM3fY7CafOj5skyu23+pQLFd9nxQ+pwULfM4da2QfA2
	JkEviAqQhARtM8FAQ8m84fbXaE/zwyBLqwHA3ZFjuADvfE9b94KnQKkPexPimXulbpatylGX20V
	J+0UjqXDtcqeiOFuXHtSukRiimAocjrKHTLWSmWGHUQWROkg==
X-Received: by 2002:a05:6a20:7486:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-4014e74bf27mr10216915637.66.1795405326620;
        Sun, 22 Nov 2026 19:42:06 -0800 (PST)
X-Received: by 2002:a05:6a20:7486:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-4014e74bf27mr10216896637.66.1795405326163;
        Sun, 22 Nov 2026 19:42:06 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfebdbasm4362204a12.13.2026.11.22.19.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:42:05 -0800 (PST)
Message-ID: <f74a9623-4522-4a30-8d50-bcc148f2b9bc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:42:01 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cpufreq: kirkwood: Put clocks on error and in remove
To: shyckless@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org,
        krzk@kernel.org, peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
 <20261122-cpufreq-leaks-v1-2-96fc17ff7339@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-2-96fc17ff7339@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b03b60f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9A-NSSyiqZj1DCQBHqoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 1Xnc1vlPDaT19O73SvQwasJ-znQu_6vV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxNCBTYWx0ZWRfX8W6JAJ6VXWeL
 O9jsQNqG4dp0EwR26/wqFfyHZGuFt4dgmA3S8c6bJF5gGj+7djT75OVL3t8isN/uM9/viu3GB3U
 f+8vtchlzNzR440jJeBWr6dLA+J+Pi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxNCBTYWx0ZWRfXxJL08vrwts7X
 sm8+ovXXlRL6Bhe4GYYjQfoP1tfAT0nWxJ1jPRsPd3tFgxOdopw6IcSiehrV5BjdPpzqScDmxaX
 T4zjLmS0V78AbKJsDdl9m7kSy+eaX5CJo7fK6wK2jYFwVSzCO6zGNa9DKY4tdrI9umfHiENrCfr
 YWhAwzZfmmaDRmqkK4bYft5uRHu3KmNE/6NDOrf/PfI8M3Z6UHiQGpxzNIyEjjoQu71g2syWiJ+
 oB/2HeJcwxk5JJE9yDFiRsfHW65Q9sF1HLPEMBv/XJPioKlJwmWOHhlvKDAoaP8dZSYErVJpyyz
 VZkAqdsmsBuoR8WIQp6KF2bZ1zRRA52I0pBCeVrTM/165wdEsiJNTiZ4Faws5DJ7iyXpG0/5Gb4
 V400IJVX3y76Pu96dfSH4LyZSP5XTUYL3SOwQ0s7A/7szOP4wlMxFZeQCXzZjVXKCsGHaJ62x6R
 aU95+TgjUsxrpBIyYyQ==
X-Proofpoint-GUID: 1Xnc1vlPDaT19O73SvQwasJ-znQu_6vV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230014

On 11/22/2026 7:55 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> kirkwood_cpufreq_probe() gets three clocks with of_clk_get_by_name():
> cpu_clk, ddrclk and powersave. None of them is ever released with
> clk_put(). The error paths only disable and unprepare the clocks, and
> kirkwood_cpufreq_remove() does the same. So the clock references leak
> when probe fails (for example on -EPROBE_DEFER) and on every unbind.
> 
> Add the missing clk_put() calls to the error paths and to remove. The
> "Unable to prepare" paths now jump to new labels that only put the clock
> that failed to enable.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 2a4bd9f0db24 ("cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
> index 24b285cbeb8d..e85658081c07 100644
> --- a/drivers/cpufreq/kirkwood-cpufreq.c
> +++ b/drivers/cpufreq/kirkwood-cpufreq.c
> @@ -125,7 +125,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.cpu_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare cpuclk\n");
> -		goto out_node;
> +		goto out_put_cpu;
>   	}
>   
>   	kirkwood_freq_table[0].frequency = clk_get_rate(priv.cpu_clk) / 1000;
> @@ -140,7 +140,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.ddr_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare ddrclk\n");
> -		goto out_cpu;
> +		goto out_put_ddr;
>   	}
>   	kirkwood_freq_table[1].frequency = clk_get_rate(priv.ddr_clk) / 1000;
>   
> @@ -153,7 +153,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.powersave_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare powersave clk\n");
> -		goto out_ddr;
> +		goto out_put_powersave;
>   	}
>   
>   	err = cpufreq_register_driver(&kirkwood_cpufreq_driver);
> @@ -167,10 +167,16 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   
>   out_powersave:
>   	clk_disable_unprepare(priv.powersave_clk);
> +out_put_powersave:
> +	clk_put(priv.powersave_clk);
>   out_ddr:
>   	clk_disable_unprepare(priv.ddr_clk);
> +out_put_ddr:
> +	clk_put(priv.ddr_clk);
>   out_cpu:
>   	clk_disable_unprepare(priv.cpu_clk);
> +out_put_cpu:
> +	clk_put(priv.cpu_clk);
>   out_node:
>   	of_node_put(np);
>   
> @@ -182,8 +188,11 @@ static void kirkwood_cpufreq_remove(struct platform_device *pdev)
>   	cpufreq_unregister_driver(&kirkwood_cpufreq_driver);
>   
>   	clk_disable_unprepare(priv.powersave_clk);
> +	clk_put(priv.powersave_clk);
>   	clk_disable_unprepare(priv.ddr_clk);
> +	clk_put(priv.ddr_clk);
>   	clk_disable_unprepare(priv.cpu_clk);
> +	clk_put(priv.cpu_clk);
>   }
>   
>   static struct platform_driver kirkwood_cpufreq_platform_driver = {
> 


-- 
Thx and BRs,
Zhongqiu Han

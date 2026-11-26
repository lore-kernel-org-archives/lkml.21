Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686979;
	b=rr3Pj+hmta6EW+M++J6KK5JcjmKl/AomS4eD+yStRRSLD3PTN7VrjQajDWsJOAG2ftKa
	 gtt8iOh6uRfBYFhwq2Ng8A/cqq/DxvAkG0NEXuTeKDMt7HZ3h4NkED9Sv7tNPo+8mF32P
	 M/mDf02MajexiZSt9mSWrYgLZgZU0UouJFxycO6mQfvwC1qyf1smrtny71/LpUjN7iPGZ
	 j7Yvf0FxWuchq3fsSF5eMdtGsJ/GmxOyOtaV5Yrw/f3MaHXf1HzEUlY7/k/l+VMnox4nc
	 pK0LP9xrQvn1RegWyvb0W63E5LtWGg46tnWxliHXVFmBcnQG0ayq/bEt9UnxaZKmz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
	b=R19EaYr4uo6o48wgZ1aPYzE9xuegWd3AD0XfQ2RR8geH5O/iYy9DIy7enaQINjKlg/WY
	 hSuTQeOw/g3WrHF+oT5Pf3n81wH8Z/pLfkF+esqjZ9Sfd2YzAU0inDZwMu4/hKfhLj6Ku
	 uyZHkP+BOZk5dVu5TRNsAefLENwHnkE++tbxJiCDijOyCgAWdHXHSwusr5wZXKQVhTXzF
	 WKtASGkZDhWS/IIA3SmTgBGP8SHGbl2DfwZL+ggQ5829EMc2UFsJWH1HlLoKyJc5LwG6l
	 +/+H3rWt2FuFPiJoTGowQsVALfbNknR8IzCTCHe2VLlvELnz49zWBi1e4zqRGbHkPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G/Z9mgt9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9640606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9640606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G/Z9mgt9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2wl1682388
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GOcHW9tjnWPfy3JGXVh2ns2a
	T+hFNZ4ZuKMYEvOVVpw=; b=Xc2GvF+vY25WDOEhoJkPfrYHO+KliSW7FhBBwGbz
	lp/Q8RwpCWg2jS99vjSCijjKDNdtLH4cXHmH6qyGflt3RI1nv4Kt12YL6ivyfwnB
	Aoz2nu96rAoKH1PK6cO8a4K0PrKHiqohWchFDwn29ApJuNBaoiAsjzDoRLcjiBFZ
	AvTaGyGMe6F4bufKrpm+ggWroLaNtRw7PFDjIIIyj/piBxUoy/c6jnj7yVZs5e/R
	8Vb1nLuuHaC0ZibjLndy6qOSagAyrEaQW4GDDNKlA99xtaBO4ppl0ZHxjD00KVCd
	vLJFCRrKcPtTzayHdz8WYXNmGrGF/czJReEKfuR6JCofoQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekjsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7121689eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686978; x=1796291778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=G/Z9mgt97fMagk0x7M17tFwcAgSxSSMPS9tmvT8hl5L5HG4RMFwKhM4tR8uWOtJZI3
         sBZ26l1va25YCs91zS3CZiGlK3aSGVSGir9yee4SLJh+pqdt6SxSefc6BT5MJTYMEwmn
         tLyziWBJIvlcGG8ruAfejVT95Qf6dEO+W9oZ88KuL8X57+634cvY5ygcsDDX8h63b6/o
         KJj8jvqO4Ee3XTofNv/IReA7bdJ4gj8iZDBkDqRf73CdocoQ+pamO8jGcms9MT60A9VC
         VrH0Dd+mRjjGOzMdNciuHteMpUGiC4uyOjXCTzqTPDstOoiD09boDNp5YAG18GQ2ODve
         hiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686978; x=1796291778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=0lhU0OKmRD+gijPJjxC/b3r6zzqBQm1nPGZSp6kG37Swvf9LTYAVeGS6H+z35CGiym
         6gcOB6lwxvCrKaKkVer2iu7dbr1uda2JsUYD5VRKz2NTbiiYKLLudyw9+uHHhudfbI/D
         je+EnhiWjCEACbgZSdbxRlb4Fj0wjXv4jPPGIKXYNj3YNBRckH6L/+zHn7H/aKLsAn5V
         QPtPfaZIYDFPIYhh5vfVQDZtY3hSQaKMqxXnEtgscHQLbEptI3EVVV0pF0k36aKVDELe
         Etwz88SldzNqkenYElQJSuWMzGEVvPgNqdbqc0sonaNFxMIjfbkXvASIH9EfCzxgGjBi
         eHtg==
X-Forwarded-Encrypted: i=1; AL+hErEOqKsXGGao6wU+SX8zZcpj9vgNYfATBa7EMZiVitAU90j6K9/5/kNOWCSppJuXeDo2GkZPWQSjX25xIBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xK3wzn4xyfphWYIuiqx6lyS8JebPu0/2QyTxm9jqCvm/jCery
	g53AxvrOcIE5NOAsaADCVCvc/uqFJDrH5XLlUMxStMksu0zztUYkTedk3xCcFvbsju/Jp67+uKQ
	w3EccGD/zIoSg+KuEDo87AQjJvCM2m2swoo3qHKBaSSsYiPDENVREKTnyXvVZGn5RskY=
X-Gm-Gg: AZFdTZdtJz8lp5xVvIKYc+oaQPpABBoQkEpY7hXM9kOsMEuKVNTdmgtHfh23LnOA7O0
	eBZ0uUQp3FuMrqhDcnkINZbsQDgas+Sl31dFu0hh3GZSWMQ0WCkG3Yrp9gZdVaUunSYZ6NG1gjR
	GbN9scLyNU+DixlKiAYWRUYHjnkGmroHW7SDJ82odhhDSfJNdLmPTymYytFKWT4MZ5K/XkkNiz+
	0Ttk9sJPET7G8n6TakxQG9/XBGou+0pdSq1QkbhdWFNuetmuFY+NypnZ8PFn3Jjb10xScBjo+wY
	6bpQtkajOBLQ+O5pmUqNSx0PqkmwJ/N+PVa+gRAF7tf3Lqe2VdFsScV0YifyS9prBCCxgb/nRgD
	wGejpYyiDXIHRw/ikScpKJ4eeknFgl3f4JBwhtIETvPzkM7UBs9yu9VwnFlPF3G2dqPO38TCsNe
	hURTf72bGiVGVStL7KO1s34A==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926697eec.21.1795686977564;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926679eec.21.1795686977053;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm33923950eec.18.2026.11.26.01.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:16 -0800 (PST)
Date: Thu, 26 Nov 2026 01:56:14 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on
 remove and probe failure
Message-ID: <awgCPsPdiQDgPUR6@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/46NPlLPsSjq
 brbHOlR1lbw7AAg/tn6lv2sJ3S5MV2aOq2HDQwhnB1pD6a3CskeGZNOZ1p2xmShiRp+wZqKKyfn
 jdtiBhLUJxdWoLceLtWrdo/IXWC7J/g7//feReqKb1jzacEyoVcCJZz925padC5h8G+ygbhCXyw
 tNQuUCRHFBupq7+rPD4j+eevg112qJvTpYyYMHQgKCHJxpwc5ND/r8j+Uz8hrsmrQ1TbkIVWBeO
 q93jyWj8zZGQX93nCq/NqBj2g/txGXl0uImazeildy+S0I95i+y09Ae/T3bfSdk0eUdp/Ti6zC7
 4XnJ4f62p8Xe2C8XhWcFf7zXkTAbWCdhlTy1qYtfTLj4Kh1MMx3fN6fBNHCP9d91oWnWlZsIBQZ
 I4sadHl8mAEVbwjeWcYcBQEHWkm+PW10gK8zu1Zt31G0ynuTtZeUqXyUoVMhNhV9pJECvKEa42F
 xuK9xgKUxO+Q/7cogFQ==
X-Proofpoint-GUID: W8XJmPHRSSXU7ISyNcaZgs11KuDWTIEo
X-Proofpoint-ORIG-GUID: W8XJmPHRSSXU7ISyNcaZgs11KuDWTIEo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX716yskooxD8e
 R1iXDvznR+WkrBPMXogMzJsRVuBXyDHUN4mZLvYIZhxnWhzzRoub2C3JCicQB/ZaKEvKb/eDsGm
 AJKTxlc53jOMFJMMUILnqlucOyMZBmU=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080242 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2DI7WhOKpHI9u_kDJrMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:24, Faisal Hassan wrote:
> The controller is taken out of reset at probe, but nothing puts it back
> into reset when the driver is removed or when probe fails after that
> point. The controller is left running when its clocks are gated, and a
> later bind starts from whatever state it was left in.
> 
> Assert the reset before disabling the clocks on remove and on the probe
> error path, so the controller is held in reset while unused.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 50fca06c83d4..61a3e3c38f59 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
>  clk_disable:
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
>  	return ret;
> @@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  		return;
>  
>  	dwc3_core_remove(&qcom->dwc);
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  	dwc3_qcom_interconnect_exit(qcom);
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen

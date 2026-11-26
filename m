Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679060;
	b=ThZ6uFj9GJoO/YDjqgcHS4zeq5Ntjyfkr+s/wzNj1sqeRUju06iYDRx71cd+zfk9L/qq
	 PSlNMXEfXGsUj4i+e4/OHQL91vLiLLJbiBZdWE6QDhdSntIPj6RX7ZSn3VzwitRjDFkre
	 k4n5YlG/SPHXLbVft59Yoyw1DYxJ8qoxaizCzFajb+MRxPPp8KkGAaI7j96a+0FJlBCa3
	 t1pfIBKEk85yx+UGXlJ1x/EGieEDTtO+W3QD553FfBjpyDstDqvl+cZwJ30HqNjZERO/G
	 6cHzKkFhua3gNsLpNULkMQLoQIaPbpRiCBm1kR6hKiINc/isuJsz6YG//i1sfav/XQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
	b=ORMYdYXZALYO4orCovPbCRuPnVyjX1fluvEhtry4gyNehzqv31bVtZKPkyY7/ZtaO81t
	 HeD4nTgsEOa5UmpbtQOuYP6ZsP28faHcjVBUquBdqJAhLNpHH6ooqgswef7z9/UCczDPV
	 oHo7VIwyuAoF0n9+S9X/gAuEhp7FavDxSLy8k9EdfAXe56eK2DhRRr+tWDsP9eqfkk+G9
	 w6VGFWt/1kxgfbRds97REEqRcMJ2p6IHIBaKU3VU81kDDszXR0yGZKp3g2EStcao3cVmj
	 T8E95YZxkrf/1omQ0lS0eUsOOVgdit9DhtiI8KANK0H/X1kjoamZ/o3ZQhddBbLtiGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A9606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417A9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7xC2210892
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G7aKyVjdYavK2ZAELbW1cotg
	kHAtEELC6+iiVeRDFQ4=; b=D2I91NFMrsCgWpmcTIk+zto9ft+X0bo1UdjxwLH1
	86unbUWiUZ5NlhmZnvnO2pnnqWCwXjkU4pcsMw7ytJ6PoDmB5sUfY9b5WewhbZeV
	tJFU8Sa+fAVnp8gvjzUOcAR5g+fiOM7d+lDKMW4Af0LR28gVtthxVtjlLXw+1KeZ
	Qdl17zNAN8h0l7jqj/aSONnJ4k/j6lRwjqdfz0YF53AG8j21Yy9sYUalpwT3owCL
	/J24RdpPV2pgtPlPSeEGcRFWa5UVbQACVMYL1RL72zP6cAML0a19PP3+Mq/DRCi7
	7Q9ifxYYYtXqVDazBQjQe6RCzZPFT8HRDeKntrwpU5NkyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9v0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:44:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so10032719eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795679058; x=1796283858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=Qpc+GDZNgG4nRVPTRMYQCDfZM3xgo0w9Z6KMAR5DlWA0unDniM/GuHb/CyhhljVfht
         0W/zWPmtJN15c/wi24UCmV1/uzz9VAIF/rOnNmsaZBoWBxHQaglSsWm01ieR53xh9P90
         47CRBdfb0dcerxCV5Mtc0IKTOTK9ecxVUCJTolUw6q036RqloBdf+3cj7lGmAEBYkIjt
         S4aVzTUHBJChXvDE9sLshZoi2XWhWg1xbz3zW6+rIlrnyLGeCrL+o+sUvJy5f8U89uwf
         0KXVCSgQsjirOFpTspa5ZtfsFRH8psZcPy5+PV3VMs8eWbZsyPfcMh9NuxTp+JAc73z/
         gRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679058; x=1796283858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=SbfjAXRRD8L4Y+vzNvma0ue9hbfhBOSIfjtn5exg6N/FV/Jc3RtnqKGRoTbOv3IwRV
         Rwmo0a9dzCr3hrUevSu6s1EN6upHO1Roag9DwwIuYScChUHYI1GdWl063Z/r+dhLN+On
         s5oNSBGLpwibRvYTFHkK/VyuUFjEAftkZeBO/AeP3kHwweX1in4fjrhjsYG+A9md8GX6
         mc19fRyHcEK9eyt/72XXlU2Ms6EEeShR9liEpknl/11mzHDBD854dSNaFFubwOuRVkPz
         Xar5m5SX9y8joYLQIB00/nmu77k3EKrk5tc0igpO4z6thfkw51Q9Dgyb5YuqkNUNxwKB
         lFBg==
X-Forwarded-Encrypted: i=1; AL+hErFy4T/fPytXPtnX45ddQHDXeCZ1j5lnEggXw7MgZZZr2LNBKfkAarW9Ej98wyzGB932THjrC2X0ipGtwek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YctC2azgv4nbaH8ClBrYsEizYR9bxHJ9bm4POuwd3KkLn7YgX
	boNBetciEWR18BjbRfJmdznJzw/N7uxEAMR/Jm6PAnJdiQQV/Ie5vxddEolTHkeolS3bVbEbnh3
	s0aeZK+kAHQbfI/9OZeCNg8WgRzVoKmkRFVREQbiA6KyeLuIwW/M7J8PuPQBOfjGHwX4=
X-Gm-Gg: AZFdTZcCem8OnTUUur8gFQFR8KMqk+6PtiB/RvMV/09oB67i4WSw3Rb00dx/BQrqbDI
	5TbOM0OJ7xfKjpFGgIIU5ptaNFo3kIB+yzt3dWYq1HWFx7qbL8mp9JXRut/+z3Z6RhXBle7JEc9
	kY+Qkc6rQ3B/My8/mT7oh8RJaxCugs8EEkgoC/3se6JbZwL62OMWXvQtjuqJW35KN8YikVN9rXY
	shQi/uYgWQ79AesDs93CM0S2PlETjII8qo9vAHN1kiN7xDghKkgj/wMhEB59gYgDZ0gPemNbsgf
	sVInop+GSjc/0Jm8W+9HzuBngJCdqgkuW8dl3orJhgh0IfV7ZbVliXyePoyfdwahvJmBKScdqTM
	6VTFp1JOr/rIDWCs53VF7n3bQ5Nts/9Kgh3hwsGdQZIncJzXabLsxYFQfWUYK75SoSfHJtDSEpb
	+Cw6WAUs5TbnZ0FSqQWOcOdi8=
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390658eec.36.1795679057787;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390634eec.36.1795679057224;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm64100626eec.14.2026.11.25.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:44:16 -0800 (PST)
Date: Wed, 25 Nov 2026 23:44:15 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system
 suspend without wakeup
Message-ID: <awfjT6DQ0beqlLUn@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N2hzmeNq84JT3ZGeNJ9OLWAg5Qb5qwsT
X-Proofpoint-GUID: N2hzmeNq84JT3ZGeNJ9OLWAg5Qb5qwsT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX3dTLVA60IP/B
 Iojiee8c6BKJSjTxLrxy4XpsRT98PQXp9R8kTDYdS859X7mMoAnWntac28M/wbpu727ME0LGfTw
 eKgGdi9Wkl/apj23YVU1plg/JvdlQ24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX/FcEKkklPZ9C
 rThZmQlCbPB+m0Febka1AnXRHa4xWkmhilQ0kz1Gs2hYTnQwmXCrabweDF/wbUtJTldfRGS4hsa
 Gg0gx7p/152lGBMCFun5Wcsaq1MXmoguNhCeGX8N08F6MRHXisps7C4GvydV6dJN1P2Gbvulhv3
 kggrf+bqQciinQZH2RwpB2i+ASPyVJZOmRNJXUjStlM9OG0KU0gjiOdu3yBePxfvpOffA4IzbL6
 EjoR3RfB1o+rwS2CVs5OEup7qxzMU6rp9oSJCd3zZSbAcRW7dZL3Ng1zlPSQx4B8yLgyNGimdfX
 EA+GTWHcN/BHkRk8JndqhHaIest7fDu5LOjResf3goJwdgJV4MLOfyhwnUdwja2ftZL3FgK/+Ts
 ntjJGHPnAjc+qx0VN6rbcnE7mYlUPRJVv2ncxaEUQaEGhp16n2x2MG5yrC1Dv3gEymBJsVSzAJo
 Qaxqd/75xotr+7AmJWQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07e352 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BlGo1tluQEYad71Xd-AA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

On 26-11-23 16:17:17, Faisal Hassan wrote:
> Runtime suspend always arms the wakeup interrupts in host mode, even if
> the device is not wakeup capable. If the controller is still runtime
> suspended when system suspend runs without wakeup enabled, the
> interrupts stay armed as wakeup sources, so they can still wake the
> system. System resume does not disarm them either, as it only does so
> when wakeup is enabled, so they remain armed after resume and the next
> runtime suspend arms them a second time.
> 
> Disarm them in system suspend when the controller is already runtime
> suspended and wakeup is not enabled, so the state matches what a system
> suspend without a preceding runtime suspend would have left.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7a7225b900b3..18db19cf2065 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  	u32 val;
>  	int i, ret;
>  
> -	if (qcom->is_suspended)
> +	if (qcom->is_suspended) {
> +		/*
> +		 * Runtime suspend arms the wakeup interrupts in host mode
> +		 * regardless of the device wakeup setting. If system suspend
> +		 * runs without wakeup, disarm them here, as resume will not.
> +		 */
> +		if (dwc3_qcom_is_host(qcom) && !wakeup)
> +			dwc3_qcom_disable_interrupts(qcom);
>  		return 0;
> +	}
>  
>  	for (i = 0; i < qcom->num_ports; i++) {
>  		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

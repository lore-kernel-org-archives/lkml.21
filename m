Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404085;
	b=MJE0HiSUnElBBvq5Srdw5S85d4OGCPEkEiDlCPSv095uRaPVJz3ZbQ6nZLU98zw/ezd1
	 8LwjbOpjMkll3Vd+Tmnp5RCcx2ETBm33/YSZjWq6qRFjUYO8b/C1Leb/mogVsozM7Wqug
	 9w1ht8nu7GoJginbhyiwoq0ZPIqubwtxrOv84GIFQnhlqH2NwaMl4LmbsLNFe7UNLo1xx
	 KqQvGRwl8zR3LQV22SZezXmENSv6EqOeF1NCAJRyMZn5G4GJlPlw9AXRy2HBBYSH04MOu
	 nB0W8xnP2oPTLO2YARP/SU6fhVx3XuYNSW7OWatmmPtkpTp5jqp6GMTERoIl+V1eQyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
	b=iVGgxZe15JrwK7yti2iGEas37mKSBUaIurPUbmpLs8zOLdJOQuvmU0S2UcHRQG4UzbBl
	 dCvrw2PzFcHjeOYuDnp858hfkjwM7rtm9A7NpX3z01kkpY5UjvZvQKhBv2lEDY9odC/Us
	 PKyQsvlQTuGL47fRzGg+7pn0EuIzmGKAxKKIzRQIJGTpmLwGHvUbeaA2+hkazrKoh8BDm
	 l4YwrPiElpM18GS1DQPKpslsxwZLmVLo+KdSxTisYMiPyCrwwhG2EgCSos+AkQ681pk1Z
	 fKkNnD+Ey7nTq9eKtBCp52CyGsIJZS1yfOtBVRgr+YthF99Bg/8qiQziq30fXlyLXuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QoraXHFR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Zo3/uIj1";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC937606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC937606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QoraXHFR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo3/uIj1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMNrJIN1310231
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=; b=QoraXHFRbb9UnELq
	GPO9l0JpOcU6VcmdtSJDDANpnm/s8tsML/fOenKlPD0WCAVWVv/LTJ+jtaD919Ft
	8e6C4XensAVOHJZo4vqvy4/LXxnTkHpXH5fVHruBWo6oOx+AI5c2oD9cNQt0mPRB
	J3J+7AgmHgcPY+iY9T+wSyigCKKvbwMwvHWYC0OqZJSZa/mtK5/WBOtOfNQp7dga
	egnjjrhuj5AvhXHQ5aB6lNCgj6tkRUhuVFFyDljY+NCkfKOIQgfk+37WqbagzLF2
	D4au9eJ6BI7d1cCX/zL7K7rdvCMtJ9KpSI22d/ARSobgQOtTvWMGX2QPdAeWsWDQ
	wGnoKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6n24r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:21:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b427e5a37dso2193358a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795404083; x=1796008883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
        b=Zo3/uIj1Ox691nFw7TymmsPrWz1wnLyJehzkhMZvYfkeE/ZkeQVP9DnKpzd9ld0rQl
         L9nHrhzxfZLOyXhoKY7fmk9uENDf0pxnWYhNGaxh3zlK0tTOC/kwvAKK1h9WkJxMZljr
         rtkoBdReEulAAgfcqAjouqubGcGSCjJwprnqhq23+A5egg85Luw9jTpFH3r9p+YvOhaR
         AWpiGuPZd9GnMZo7HNKu/Vul383AnJ25CdpKPhJ64wDOf23hB/7uR6u1VRubv7bsazrT
         te0MbvKLxSgEhW87DPzqi3tBNFI5TNF+adB7klKqx2i/3PavyvYcJ15sPCPoJ5cRlnBz
         5u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404083; x=1796008883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
        b=2tgNQ8QGiMq+PrY4ABv1BWNWzGDOHS/g15l8oZJDj4F28wWko03BQs55n7Jh/D4FWW
         kkOAtNOGwcKgOtE3X5G2ksP89oI6IwDiGKkAHCeLfrw/e1n3njtMyGVpNsdv0apKTUui
         jKd7AmUl+iRnbbYFzv9uOyLVQg7VIA6pz1RM8BYlNLIoIvINAYLNs4bTB3ABGtCi60cN
         XqPBD2FRclEfuPJycPthdMy5lAVYhL4iNvtXTubeiCBkRZTiNKwo4lg51+RxPHB5DHSp
         fZ8hTxktMPYOydG5aVikEujBQMb8+eQcfr6YDlNVxqjaVtVg20SxSMCFYOBKUaiTInwr
         aTMg==
X-Forwarded-Encrypted: i=1; AL+hErFEPqMERMFxPbeHEjaOnRGbcODMvGnv79lSQRulBXIZUE6qOkowqifq/DAG9GQQE/4Ylheuh+gZ6xTK5GU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YCro1f8dyEkA8GDunfHMnzIvquBNKZLVOEG8ZtwYGEM0u1rTE
	AO79MpdGPfCEs7IWjoEjkwzrT2BfFc1nUs1PNEKxlZ/3ptn3fRwEI3p1QzkJsyogInZ8No61YGd
	FKYyHdCPqBTt260tOtXXRG1b1UfhIBexWgucYZmzDvfITFAw5G3DbtlRRcrNIwNY+gcA=
X-Gm-Gg: AZFdTZeKfQoE4EHDlSA59HWj9ot+RNL2RXjVHXaTnePbQleqvVN66pICh3sc9HaCpQW
	4vf3dHqZWPvDaeSVf/uwA7EXNEqnY+xNteW20aBibmIXY4h1vSE7TTkdLCAHV0Ubsa2OfnFTD1C
	avsSaVzIxakDy6MSBoaC5PWZSZzPGcF9Jb2svf+XebKbk0Ponohuryh/Pok7jySl/Mi6Ah6hKa2
	mPIULp8685cH6LZGwSBZom/9tJKYRJ0OFWfLdtlBw2A/kC9nQyoyxfI8yKlXZQf1MhL9oDzFrOY
	qQBrN/jdJQHgqxYNOSmr3f6l7ePeB1goJC64dbJPbiVup4fc24zhdhTZe+nR/MImXc/9aoHuP9H
	EbDdILWMA7STtwo+hJsd3nmfNANfLzwqEAWexEA9/XxduojhnhYKEHO+K342KEEAiClwXPowPRZ
	iyPZ0jSM95Vfj0ULaLW9sRD9gpEg0TPGK+lj2eCmeTselyRA==
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr9091502a91.57.1795404082638;
        Sun, 22 Nov 2026 19:21:22 -0800 (PST)
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr9091488a91.57.1795404082223;
        Sun, 22 Nov 2026 19:21:22 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b828ab9sm5057963a91.2.2026.11.22.19.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:21:21 -0800 (PST)
Message-ID: <681285cf-b668-46c6-b6b1-793782925602@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:21:17 +0800
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
Subject: Re: [PATCH 1/3] cpufreq: highbank: Put cpu clock if clk notifier
 registration fails
To: shyckless@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org,
        krzk@kernel.org, peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
 <20261122-cpufreq-leaks-v1-1-96fc17ff7339@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-1-96fc17ff7339@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uMPIUQ-tUwaiZOlwszq8sy0yA6cWq1eB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxMyBTYWx0ZWRfX2Z2FRCByxB/m
 d3hCDsm6HAUtYyZP2lCg5MKLMlzxsjt5wv7JvqUZecL4bcP92yPygqNz4L6C+adJ3Mfry8Ffdcw
 tuEgSd8TmrXBRJb6pvq6MWRTpCJJ3BQ=
X-Proofpoint-ORIG-GUID: uMPIUQ-tUwaiZOlwszq8sy0yA6cWq1eB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxMyBTYWx0ZWRfX79oFC2xinPt7
 bIfTtS1Kfqe0yYjfX24yGOYjL+XN2W0akScu28vnnkVGaLvKOuaCYIoW6gTt0F4sEhJxvXuPCqf
 DYrzWjWHA2VB5rwAsNXKkGg3VDMBpL5a5gqnLALmKcJMykZ16d9fz8gSKAkuzlytFYQCDQPnq8O
 yTstty5PauiwqU+g9G+dTZxhALzge/3sqttJLnQlB8MLeUlMrw68WElY2lXbSX3ut+bRTleDuiM
 jaAboJaS+XtDlKzR/vlUUWW+PGINP6sQMozM5H2eJeLVa+n75GAwQezT+bY93dRngSd7QW25S/9
 DocpxgZO4yOUYDuvwwVN70SzpS7zDnVAbpSQX0ghsE0voqpktGdQh3KQo/Jq11RHB0MOi6U2FoA
 qm67e+n8fL5KZlbEmkZ8DokbVRQsziB+w6harPxQDN1Saz8NDIeCsbmFJapPHYfnJkq/TrS+h+N
 NkQZAmXsSBOpCmIIwAA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03b133 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gElGNr783DhJT2Mv8Y0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230013

On 11/22/2026 7:55 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> hb_cpufreq_driver_init() gets the cpu0 clock with clk_get() and then
> registers a clk notifier on it. If clk_notifier_register() fails, the
> function jumps to out_put_node and returns the error, but the clock
> reference is never dropped.
> 
> Call clk_put() on that error path.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 6754f556103b ("cpufreq / highbank: add support for highbank cpufreq")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/highbank-cpufreq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/highbank-cpufreq.c b/drivers/cpufreq/highbank-cpufreq.c
> index a45864701143..ccdaff4384d2 100644
> --- a/drivers/cpufreq/highbank-cpufreq.c
> +++ b/drivers/cpufreq/highbank-cpufreq.c
> @@ -89,6 +89,7 @@ static int __init hb_cpufreq_driver_init(void)
>   	ret = clk_notifier_register(cpu_clk, &hb_cpufreq_clk_nb);
>   	if (ret) {
>   		pr_err("failed to register clk notifier: %d\n", ret);
> +		clk_put(cpu_clk);
>   		goto out_put_node;
>   	}
>   
> 


-- 
Thx and BRs,
Zhongqiu Han

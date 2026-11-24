Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522194;
	b=ObOnK39n2OjlPlPYkQz7qUjt14BeZre+GX9FTyzAxnkz4bqe5ADUWGZw5jyVI4DnL8NG
	 xLlMyB2oVx3WQXcEdjIBEpCegAZbX+OiFFlu8FPT7aeC4lH6BZyUSQQnhyU5PJ0xwCTL5
	 ECs9cnW/h+nEEIGOY6d8sc2Qp/CObrq1rdX5tXjr8UtQrjZccWkL4NVGwIyvSbOdHAIqv
	 sOMKAAcvVWG8519hYX15HXEKqjQhZ6zLMftnMtyBeIo0w10T3E5M2rjX/CSSLtK7x4uNF
	 IHaAvI3woikyjF0x7AIe2xuCsGKzUH/9aXNaECVcAwaIW8t57RWDMLGWpeiAKsEOJTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iIkF99BTPL7r+iEiIqkBD+caYW2P5DX3RwwpiusZ8xU=;
	b=XRCNpv/8EDWFre2RtT176vsO75CGykF5Xa9+YI3XelRwFaGTfzX5xNYDQE/J6chi9qCd
	 3FAwPeAWnfUadVlEOLB00mGhMrMTiM9LQkJowHLUeoy/NQwTOa7wNbg5rdxB8pxA7xtE+
	 xGHMLl3HSGJaYmV0QGppSS1wGsZFdhTyRNdP+uWCmPtYYZg9L4c1FdT1AS5m3yDHY21Wk
	 rCi7RIXlnw5SdDmBSOFdYLUigGFIBaRPY1NVzejLMl3GE7p86gKsfhqd2wCPRJb1wvwFQ
	 ke6nPmnJBEAxSwa6Xqvm0FeW45L71eQPVbGBELIFS2Nhntnx22/hys/72BnZiWnbCXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpCIRcEh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QzgKLgDR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4D606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB4D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpCIRcEh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QzgKLgDR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAucsb1025340
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIkF99BTPL7r+iEiIqkBD+caYW2P5DX3RwwpiusZ8xU=; b=OpCIRcEhtVa+MWGG
	gwdV9KQhmzcqO+AsVLT/Jz4CvAJqNOmJp8UTdLXLYtDjBKRE0HU6Iozodxhk23GJ
	lrESD/1PHtxsqpw3fLZ6raY8FB2DFvXg1ckXz+6Nr/8kEYdVLBNzFvVzIOuSqlix
	tMw/ejXqYOOATgL540t3FIHkkzcZ6QOBKE1dbPW4J/T3falqZNyQXLl/7BLn0tsB
	1ch5/uQOMyzpTKtAv0POxAsP7WD7ZWO9E8czbfxer9SA4ohR/MN9bYTepwEpf3eN
	xc/ZqKrk33oX7IUz6cC0Rd4XB/XBdIBzNNC+II1C/x20dTsUSKW9OU2ls/SiOpMO
	WE69JA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2kuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:09:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0ac2d8225so13059695ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522192; x=1796126992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIkF99BTPL7r+iEiIqkBD+caYW2P5DX3RwwpiusZ8xU=;
        b=QzgKLgDRD60xYYZ1aOuwKAqWXm0VixwPce0rXi2YgawOEi+uDZIKYo4d1X0g0Q7EWq
         HlSR1sbtcjkenVIvkPK5ZU1fUywmjQY4RG6hCwpxilgrQuA07/sBORrGnfV1Anu36qmL
         KwUmzoAMaS6qPPho4LYVf9M8+XMJtszl45OvMewhW+uK09ydrSsXFOphgB3Pa4y7Hpip
         4ZX0gJ49V9A/XgegRby6AHlhHX3lmAXoef0IzqHu20fK9Cejt/vlZbWT5yNS6lC6jzE4
         yhXumbz5vXtre1qqOjdYhqPfmiYgCedWjQp+bTEYLHZc+yy3vVM3PS8ei0JVumBkgRAR
         QkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522192; x=1796126992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIkF99BTPL7r+iEiIqkBD+caYW2P5DX3RwwpiusZ8xU=;
        b=DpQ6wRVLc1XO6+3k96wTI659DGTkXRbl6ZvoiDNLM8kItAxplyMY5KJ+PE/N1sTGFg
         w3yZAfPI5t1bXEon6hel9mEtOJJ9sNEH49fgMkNdtx06Vl7x4mTgzpkW+oT3P2lgz4hx
         CcyFif/YKby7cNRg3q/UHKY+Yw7OtunJfhhMfw5pr3IG5O+ttGxeUV387LlpzbQQCkgm
         lnH3+At7ZHjCnFMVGCSUy88349Hj+uANWJ7EOQdgDhpJ02eYjLetv9jM41gO74cs3bOy
         8greFtweN9hKjg3W+MFIwRG/z6MFijlngOcBv70E0tSJUvUIjUxluTNEC+HFsnlcdIb7
         k6MQ==
X-Forwarded-Encrypted: i=1; AL+hErE85ujGhbBtNjRRSVTvLxvlLt9YSyOM7f5qZIF4WPnf/Uyyykz9GWM8LUhzwkXyLRnBESLV1J8JS+8K89g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aSIwyj1rNfnDM27fSc1bRf6nBawyQvxkI57rI4ZNtV2zNF/wx
	71QYiDTMRqSDeipekDTSH58ejDk/bf4wc31ymlqxFBSdkjiz0UTAHAgZ+gZiiNYaCCXLJMDeg1p
	exKY6diUabKM+uQKvGC9VCMdtBf5r/dOitdiJ+Sy3e0DBDvP9QbCod7e5500HPPxkd1w=
X-Gm-Gg: AZFdTZc+j1Lp55mnuZv1+WF0wH3GX24GfJOCNlhqQBgOVqFZRNGzIl2ZuSr3kdPqn+2
	gDJFHz6IGe+vJn4XZYhXnkHyML5qyg3UsNmrdsmGazvDiN0oBFwF/jptdbqR5VYfvekxASw9VtE
	UZKCpZ2whbGTkGUZNCSiKezGSMgw5qlx66FQUm8i1l0U+c0AlM8shBLoAAa1REwwv3EBM0LGQoi
	xlL050UHrNnJz82WpWd8/ScCP8wVVLELzsMC05poqo+fHejDRqO51IxH0+Kvbv2338YGSN6vnEl
	pWS49M9uaNQpfcmd/fSIMSbGJ7JEek2TF0x+O8vfwn5ornDxKldqquIdkj7ENVMm0FZeUMcY8LS
	ls/AwaCRhPuiYRGoRfMn1yj6mKC3SuQB19lzLog/ogF/G8sPtPHTugkY6T0vXTXQgwarCH6sUrH
	ycYIANJ2ceRaChulrDZw/LLmCKJKlEtINim1vewJggXL/P47bPDrK5qRIzszW1xKsIQw==
X-Received: by 2002:a17:902:f645:b0:2ef:dc42:10a9 with SMTP id d9443c01a7336-2f03ef3d32dmr149717515ad.7.1795522192221;
        Tue, 24 Nov 2026 04:09:52 -0800 (PST)
X-Received: by 2002:a17:902:f645:b0:2ef:dc42:10a9 with SMTP id d9443c01a7336-2f03ef3d32dmr149717195ad.7.1795522191539;
        Tue, 24 Nov 2026 04:09:51 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm70009675ad.12.2026.11.24.04.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:09:51 -0800 (PST)
Message-ID: <8d6ab328-32f1-4ddf-bff6-05f7d58d3222@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:39:45 +0530
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
Subject: Re: [PATCH v3] thermal: qcom-spmi-adc-tm5-gen3: move hardirq actions
 into threaded handler
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com
References: <20261124-adctm5_gen3_hardirq_removal-v3-1-c7923e9a54c1@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261124-adctm5_gen3_hardirq_removal-v3-1-c7923e9a54c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX31m4i88NeN1W
 ZKV479BN5c8VdZWFZscdsSGFOcRSwdHaTcxnyYz6wqZw5VfrCr5u0C9Rwf/swrVyK+MlAych9g/
 NW8VgUESt0AaEgQxfbe0kpWcNMIcphk=
X-Proofpoint-GUID: SzosVMFXswKoRaIZKKERhoLJONF4W6FN
X-Proofpoint-ORIG-GUID: SzosVMFXswKoRaIZKKERhoLJONF4W6FN
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b057e90 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=A5BwiOqi38MATOopfpEA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX7DXHgNhptkd5
 8osnwfpNbqXLOztBKwXjM62ZARtyy0KDb1FHGp3ITG3j8bKhrluvN8cuZNw7a1OgqSONx25bAeN
 e2onAW/v1KfPPTmN7I1TSzJYE4N5WGI2Wq42c4JWRbpjtfx8Kw1bJGODHNkZoCP4roQsq+X9FR8
 RxXRTh6zguUqzaAAHOugZDblBKVIuZhQi+hPvPnBaQZ+dSLYfFn+gWCQHS++ReGRi/FV12ybKPN
 pJpN9JKnK2Nk+HVBrfc9vCYBHzAjhbeLSQZRFWYhrWJ6kYBevlTEN6F2B6z5qtyXn2SwBzrOUya
 tiJl2x1U5v9TLvpqQ5J/slirfCym5dFO8Nj95NxoeI+RJzOzFZzQ7WtNkAh+wJzorUyYtBY5Ijd
 HdYiwW9PpDYVk+q/O1CVfeIbjxt6g4F6proMs5Vo7BZGoT0MYRTtkBR2JLcVbCE80ocO1f6HQ7b
 bYYbyId79B8IWyW9upQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

On 11/24/2026 2:33 PM, Jishnu Prakash wrote:
> adc_tm5_probe() registers the ADC_TM interrupt with both a primary
> handler and thread function (adctm5_gen3_isr/adctm5_gen3_isr_thread)
> with IRQF_ONESHOT. The primary handler calls adc5_gen3_read(), which
> takes the SPMI regmap's lock (a regular, non-raw spinlock) from hardirq
> context. With CONFIG_PROVE_LOCKING enabled, this leads to a warning
> about an attempt to take a lock in an invalid wait context:
> 
>   swapper/0/0 is trying to lock:
>   ffff000b67201018
>   (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
>   regmap_lock_spinlock+0x20/0x40
>   other info that might help us debug this:
>   context-{2:2}
> 
>   Call trace:
>   regmap_lock_spinlock+0x20/0x40
>   regmap_raw_read+0x88/0x328
>   regmap_bulk_read+0x10c/0x340
>   adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
>   adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
> 
> There is no requirement for any of the work done in the primary handler
> to run in hardirq context. Drop the primary handler and move all the
> actions in it to the threaded handler, which removes the invalid wait
> context warning.
> 
> Note that both handlers used a local variable to hold the index of the
> SDAM whose IRQ was triggered ('sdam_num' in the primary handler and
> 'sdam_index' in the thread function). These are the same value under
> different names and 'sdam_index' is kept now, since the variable
> represents an index, not a count.
> 
> Reported-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com/
> Fixes: 948ee3a74f35 ("thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring")
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
> Changes in v3:
> - Updated commit message with right justification for using the variable
>   name 'sdam_index' and moved its declaration to separate line in
>   adctm5_gen3_isr_thread(), as suggested by Andy.
> - Link to v2: https://patch.msgid.link/20261113-adctm5_gen3_hardirq_removal-v2-1-a0c9c4800941@oss.qualcomm.com
> 
> Changes in v2:
> - Trimmed call stack and error lines and added clarification about sdam_index
>   in commit message, as suggested by Andy.
> - Link to v1: https://patch.msgid.link/20261111-adctm5_gen3_hardirq_removal-v1-1-536ed503396c@oss.qualcomm.com
> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 42 +++++++--------------------
>  1 file changed, 11 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> index 910b241fa94d..9e9019f5009d 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> @@ -73,58 +73,39 @@ static int get_sdam_from_irq(struct adc_tm5_gen3_chip *adc_tm5, int irq)
>  	return -ENOENT;
>  }
>  
> -static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
>  {
>  	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> -	int ret, sdam_num;
>  	u8 tm_status[2];
>  	u8 status, val;
> +	int sdam_index;
> +	int ret;
>  
> -	sdam_num = get_sdam_from_irq(adc_tm5, irq);
> -	if (sdam_num < 0)
> +	sdam_index = get_sdam_from_irq(adc_tm5, irq);
> +	if (sdam_index < 0)
>  		return IRQ_NONE;
>  
> -	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_STATUS1,
>  			     &status, sizeof(status));
>  	if (ret)
>  		return IRQ_NONE;
>  
>  	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
>  		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
> -		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
> +		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index,
>  				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
>  		return IRQ_HANDLED;
>  	}
>  
> -	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
> -			     tm_status, sizeof(tm_status));
> -	if (ret)
> -		return IRQ_NONE;
> -
> -	if (tm_status[0] || tm_status[1])
> -		return IRQ_WAKE_THREAD;
> -
> -	return IRQ_NONE;
> -}
> -
> -static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
> -{
> -	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> -	u8 tm_status[2];
> -	int sdam_index;
> -
> -	sdam_index = get_sdam_from_irq(adc_tm5, irq);
> -	if (sdam_index < 0)
> -		return IRQ_NONE;
> -
>  	scoped_guard(adc5_gen3, adc_tm5) {
> -		int ret;
> -
>  		ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
>  				     tm_status, sizeof(tm_status));
>  		if (ret)
>  			return IRQ_NONE;
>  
> +		if (!(tm_status[0] || tm_status[1]))
> +			return IRQ_NONE;
> +
>  		ret = adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index,
>  					     ADC5_GEN3_TM_HIGH_STS_CLR, tm_status,
>  					     sizeof(tm_status));
> @@ -405,8 +386,7 @@ static int adc_tm5_probe(struct auxiliary_device *aux_dev,
>  
>  		ret = devm_request_threaded_irq(dev,
>  						adc_tm5->dev_data->base[i].irq,
> -						adctm5_gen3_isr,
> -						adctm5_gen3_isr_thread,
> +						NULL, adctm5_gen3_isr_thread,
>  						irq_flags,
>  						adc_tm5->dev_data->base[i].irq_name,
>  						adc_tm5);
> 
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261111-adctm5_gen3_hardirq_removal-467a437a78e1
> 
> Best regards,
> --  
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 

Tested on Glymur-CRD
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>


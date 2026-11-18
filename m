Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975340;
	b=tfgRqchb6RZGp/EcqEqDydxmHZ4L4vY7Ti4ZDSjfRY2G3bytLE5qqnl8raDuLcxaKn6V
	 41dtys3wNyCnpuLPiZ+0jhnOkF3u/leSD2uguixFkxYybHKQbOEtd8t/mzh/emTcK0EhH
	 1ONhYHgjefY3h2hzQhLlIVhD27MtJI6VS5hkV1T6I+unfob32xga1erhl7aw1/7UorOK4
	 tKSqJ/7KcHhZaX0t/sPuuS9ADfJ82lVsyE+umlpdLF63OUT8JLqYQUG50/5+YmjORR8ZO
	 aVSWCsvd9p+e7+h/LxRdmuDaPmQmNnizqw7ei/uRAxyNNGGNNpScxdfTWx8YN053/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=;
	b=VkFff+okFe/VZgtNbG/rF37qYqaFSOcAYmcXrZtXU7zQdOFEy7dEp0MTmfJM+xe1Ugjl
	 qvdSLMpzDgByD6FH5Ovod7UaiCYivmCiMSj72USYvQFRqcDybiCcHfOnQjDCoZURH7vtE
	 NMzjU2F4Aqf9zIjmRcNEB2pc9L045lEYiZ6kwTkbdKJpaV0xLlzHSSbhfs+1S/Ua2twoF
	 0vZK0e8HKeblRFHTVwHp+hfaWT8pUrEBTWjc9ZqLW9B87IMDQ6b/kc9BeSzi/MIExIxyh
	 pcEoJmliWDrmpD54U/tkfB2ep6tpFCan7XpoCHX7pnckq4jZ5Mz2fMJZe22rYCHURfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwKLl0Jl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iisccVqG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFC9606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFC9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwKLl0Jl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iisccVqG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuDG2383162
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=; b=QwKLl0Jld8xitQup
	l+HsJF2Dv2+jTBtru7ZsdYqqX1NdfW0xBgn87bKfSnM9ZJLMF/kN9FpBAGdPKCHB
	uYeHUEIDc3sHm9wMyOQ27YYb+qqvkOUnoPDSIS5N+H97Xig1YLWL2IqcHFLunPry
	/EqNW2Q5csx24b8hEyrL3RIskz/46RkabyYrs85YIg6jAJBNIOQJB6XtFQODoQqG
	EaF5JtRDv9ifdpGkQLKwKUyAN5nqvWmS4xZtL3LAXGS+JW7gzkTXBwVHvDNoOh3Y
	DgOJZasNpMNlXve0huTRL4PRoUj5aVNigf3l6MTztQVYUxvQghspkm6WIEr/wb0d
	BsBqPA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvas56y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:15:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso376483a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794975338; x=1795580138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=;
        b=iisccVqGUFzmhNz8fi8ir5AsPA9lcaaIW56Nw/ZhnzoEsmzcd724v1O4Psedb/VJXQ
         vo2tKpnBKll5DLAHdw3yukPcseiET3XKO1vsTADurvba9ulFyj0dj6/9RveGX8ecR27V
         o50UGFx5xfPhr0OfRRVlPK8J0t5FfOPFWKViV4AW7IalEEc9BM355TmPfru27o0Dxra1
         2MmxTvuhLn0vrIDg07cF0vnpLMGmNJMY620o5/NcTa0vmN6BbVOYi/pegL0Qjl0HhQuF
         bY9Vu3xmSIuZGS4qaxkIEHtoAzX+FIKFpwkmzvQwe5siSPDW10MYk4MrmktjEYjPtn6a
         NYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975338; x=1795580138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=;
        b=GfWT6OspcJclozposRQZgmEXm6lcKPJ+mqYhZTUgRNnVra7Vt6Uk+8RTo4k9YmS1I8
         E6VHp+tb7a5Hx3QgARcZsdSFAj+d708lFCeAMwRkGhfrYVjYCYWMP38iPvIXNRY1NI9I
         HwTCawF2XL2jPceuMJQnVKiMnS8y0l1Uev0F+c1j33HeC6ZqfRWJRYuLq1uxKDYpO62W
         c0E0bhNDBKNLnP1UpJ15BNobV8wjOoaK1mbHSIirMPrHP4L73KhzzisBFn1OaCSypSeR
         nvakGDZmRSVKyI4qbLzIX3kd2ac5vk6uHU2OcWMm92zlpzzSCyS09F8+hpDBvRmMUhWq
         dzhQ==
X-Forwarded-Encrypted: i=1; AL+hErHLiK5eR5eg4RJ82c6eLwZUOsxwuePsxWDG9fiJkiToVcxeSIm6IU5idD1lURmR24Avpr/Eh1cmajUC0Ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8URyxaiLDA00Yp+rASJuwazEhD8ULojwqFckt4Lq1dEW015D44
	o2Hnoo1mV/eZyQVgYn4Zdp5qSCjFMdiav5zEsLXygwLukcsjl4QsSCU34wGsmGD3S8/SAr5RvYv
	ZOu8MFPU4fOz45b4L+uiUwQEJN8XFObXbLqWUjT/8I/8wTktOPvXomd7Gf+0ohARjzgs=
X-Gm-Gg: AZFdTZdvobdpopTBqMeLmzlVtkshhkLD/SPo/nHwGTa2xa17Wdcj4zX7KPBUPQeg6rz
	dUiZe2T43JC0kzBgen592EUDxUeGbGbADeA7vc4+oHUTpcb/CM0vNx2RRZH7FcWD2bsG1rHoMWp
	qNMIRtI0zeCW031mKVORctX5pwEPZUMn5UuoFO6w1xYnmUNooOML7kxYIC6hFxrTA0wijHwnW1R
	acoh4ZeIcmQJu2PmU0PcYTYIqYhM2MIEwhAFk0gg/AF95thH8eDcuSmqllVuLwPyCKXJjqmXXa7
	gzawy2O63wzyZrVLiheWL7dK2fr3Ny2wjuvGCD6sxhNVwHOOuN5jRqtGF831+LPaYNJLGX0BUOn
	mHNDX6mxL2VbXtkkMUtsI8YrKYss7yVRBCFOazEJ/dEN+nRH5v4FvTX+ZQTBzvCvFy55rjjMgzp
	91T7QSALjCTTSX6hZ2xpSiHNkxwwFfz6JV3T1c1Pg0Nw==
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr1481987a91.0.1794975338025;
        Tue, 17 Nov 2026 20:15:38 -0800 (PST)
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr1481969a91.0.1794975337581;
        Tue, 17 Nov 2026 20:15:37 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56f6657sm547501a91.4.2026.11.17.20.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:15:37 -0800 (PST)
Message-ID: <c310d7ef-28cc-4ad0-9414-8b5ead52f53c@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:15:32 +0800
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
Subject: Re: [PATCH] cpufreq: mediatek-hw: Release resources when hardware
 enable fails
To: Haoxiang Li <haoxiang_li2024@163.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, hector.yuan@mediatek.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261118034205.2002363-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261118034205.2002363-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd266a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=ae5kI6K66oS_w7Z61gEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TVW-zfFYlIdhnJrHWvmP9ipxHvmBQoIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNiBTYWx0ZWRfXyvjpN8sI7fJN
 VaAjcjpOLYYv3L/ORm9CnqWym/oyeI7ldRicj/U0ylOhhaqoD6L5voabsUTndyumx9BZkorokZE
 CpLIuZkvYm1Wtxsari9tUvnoRR5JicTKq9jxHghXRGb2b2IMDaDTS0BwibL/NZWHjK/fAIjHXKd
 YK+WDyd7E2VuzNFhfv05aq7ZOl229Y7a1ory6BEwog6q0ZVU4KFezWB9ZDSQm9YMJdUslqssjrX
 pbzrekZFkVlvjxq74FgwsR20QNT9033lDY+eTFaxAPVdQ1NMpnZDIVQ/ZqLiFmXTBu+/PlGCrhB
 4nDCQLMnz0iqLxYuEVYDWWdj2BqswIx20acdNnVX2baUPaYF4iAg/8X+QgMtN7bUzUGvWk/qod4
 6Sqsi65bYJ2XCSXT5VtuqyjtvMhTD213Haza0Xbo7jmQtMVHXBoHW1bj6isZ/FekUVeuHiNT4OZ
 RUKAR9Z+wpaBPiN10VA==
X-Proofpoint-ORIG-GUID: TVW-zfFYlIdhnJrHWvmP9ipxHvmBQoIj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNiBTYWx0ZWRfX9gyLbZBClGXC
 UPqwPx8nZY4w5G24NZWOnDSLApCD7L5+2E/4zlnYqTtuG6E39J2cs288Yu/O36POtgIDf0SQf0D
 uRi7xw76ueK8S5mkWZ+NwwZMo0KilOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180016

On 11/18/2026 11:42 AM, Haoxiang Li wrote:
> If the CPUFreq hardware fails to become enabled, mtk_cpufreq_hw_cpu_init()
> directly returns -ENODEV without releasing allocated resources.
> 
> Reuse mtk_cpufreq_hw_cpu_exit() on this error path to clear the hardware
> enable request, unmap the registers and release the memory region.
> 
> Fixes: d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case")


The same commit also introduced a leak in mtk_cpu_resources_init():
when mtk_cpu_create_freq_table() fails, it returns without iounmap()
and release_mem_region(). Could you fix that path too, as a separate
patch in a v2 series with the same Fixes tag?


> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 2c57371ad502..65f15fe935db 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -289,6 +289,18 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
>   	return ret;
>   }
>   
> +static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
> +{
> +	struct mtk_cpufreq_domain *data = policy->driver_data;
> +	struct resource *res = data->res;
> +	void __iomem *base = data->base;
> +
> +	/* HW should be in paused state now */
> +	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
> +	iounmap(base);
> +	release_mem_region(res->start, resource_size(res));
> +}
> +
>   static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   {
>   	struct platform_device *pdev = cpufreq_get_driver_data();
> @@ -321,6 +333,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   		if (!(sig & CPUFREQ_HW_STATUS)) {
>   			pr_info("cpufreq hardware of CPU%d is not enabled\n",
>   				policy->cpu);
> +			mtk_cpufreq_hw_cpu_exit(policy);
>   			return -ENODEV;
>   		}
>   
> @@ -330,18 +343,6 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   	return 0;
>   }
>   
> -static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
> -{
> -	struct mtk_cpufreq_domain *data = policy->driver_data;
> -	struct resource *res = data->res;
> -	void __iomem *base = data->base;
> -
> -	/* HW should be in paused state now */
> -	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
> -	iounmap(base);
> -	release_mem_region(res->start, resource_size(res));
> -}
> -
>   static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
>   {
>   	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);


-- 
Thx and BRs,
Zhongqiu Han

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702983;
	b=l/1AnV5nUADLH0xRtRhf9BovWS1KcgvaqIPCAKRggA/HB35UuTf29TP5iXzp9pUqpZcV
	 Qk4yGhvQ1OMEbfBe5whvA9WjDYhCIOxj//8vGBW7MW0P2jHqDJidWDtYsKQ96Ln/slOIt
	 emPiguVS3McDprZkpIjWJFWD/wxn6jYsXLlMw/Q5cUJ24mNRSOpH3zXghGaC1lbp3nVwY
	 DcI0nTPxK6EmA8wjLsrZ41CVisofEPE5t2rZZqXYGD9VkbOX2ilxC/BK4kNk7r33gW4yb
	 D37M2diR7HB84Vgf4M4159/XEayfNdhINvDTMEHMgtwvotq1TIxoTOOU1feUa54dt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=;
	b=oknGxZizF3NqiSLIyxHeNcjOQikvpvFclXBODb9gW8GOjbMXW0xNFw6ytAlxc12ORBmC
	 GTK2D/MErg2CnU0vUoVHsON7/dTJtykXNynoQ1iVAAJszJ10Qi6962ZZaccQtReZ6gPKL
	 zQT3ZoXGeeSGLuil0n2zajBGBWibvxmPJGbKAmJiFzp/NJrIUqtiqdExt4xJ/BaWX3ylf
	 g4YBlisfG0UBFvTB1ea8+i6XH92Aty6efr/rnYOKP7cTNx/hiEIkXRAstj9akJ2F/r3M0
	 Cr08aY4tskc+Xe4GIhN+VuNB72dnaisjwkGXHWg8r7Epw+F+I5QK/0NESpS2c2Vcqrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDk3D2yf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KhvQnrYk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1EB606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1EB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDk3D2yf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KhvQnrYk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVoFX633235
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=; b=oDk3D2yfb5PYVxpM
	nJFid7gT7XrHliooiSDwTKNXKJGaf8DNzGNmJhsLwRLJQtjji3Pyb+9RRvgg0rTx
	83j61SEjWZZd+EG9TE6FAWwDNACQjG4UXYxPTfC8zDG1DBY8csl7j1zrhKWG7rrx
	8WFPgnIXp+9Y79urnktTk4gH8m+KVxzZLwMTw47PKN/ZH7D2IIh2KB6ORacmsqs6
	BBhMWCIuWvuIe2fd08PPrUFNWdjby7hxqXSQOwmNbMw5CRDFLqyiRUpQ30+vWhgH
	mzR5Ja0GSJdFM2EFhQ1jxy5U1WxDqEl58Tu0A4qUvm1bUqEocYcSrZADAJrkwcck
	fYOKLw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne1d1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:23:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f2e2c3482so8105526d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702981; x=1796307781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=;
        b=KhvQnrYk2VpWLJGulTeSLTzvCh6VTVOor2y0yMe53Kawx7HQDpU5Op0IUOJkQ1Q/r7
         AvXdg3KEGR+OUyInlguHwwE63wNpxLzM+qbexYsoOvMe+EfzuhpXwHkYUvEcMcwdM2nL
         iN8nDPlEddZxxi7IR7qIllqCHbNxrOV68UkoeF8rXFjsZiIN1jVYo+/bwX1QIgHB31lg
         +RCqXupYEosdg7aIvdaSQEof2IyNzxRr3ydfUxyBHlNTk3uZin+w68Xj614vq4iSONQo
         ew+628dQ2dNEqeoCNnmIP+cfBgkorXd4hx4aRpFZGV+vpI9ZaUthFf0Miw5P/8QZ9a5V
         xKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702981; x=1796307781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4Is8dhLzB0RM0C72WiR4TBH/SBKDIS5u+uM9POXKDs=;
        b=JOtPBNUlWHgqz9pAtL3PUTn9atdro0xCCnNfDEQ8ISkA+BQDnsoZk02SHuPTT4LTXo
         Jbj/eC+1PbDTkzTtaXNC0sr+LjFAMpEIH7D8P0tmwyKOyaHhN5AQjfTNG/ZZKJksSoKO
         TdZeOwDkXvoBRfdZF2yPx7/19+2SfLkn9dongN3jjW4j/JSWQZrFkhjGcotQ6W+q4wiN
         YfNfd94uYy3uDtYYnDIHu1BJ8czaa0+9amVh2abuhqk32Eb3DbaxMR3h9cBI37RT5bb1
         dO6sKvSBH5E94N9aPXw89weOZd0coRvOjP/aUyuZ1vT8WfxL6TsS96oRipg5mzNac9Ad
         CQjw==
X-Forwarded-Encrypted: i=1; AL+hErH1RTeRhZ1ALl8ej3GdigpJk0F/GRz/b0mF435reRiUdlx8AoBSX4wGRfkMr2u2jXEvF78b20R3kDgsHJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NkR9C2KwB7cyh28YjKyKmKggjQlXpNXM39YxdUMGnw4CNodR+
	SMad8oA3IEFo/nMuq4sY7qzXA4vQ4xiX5bgIe/ZkqXXLxbUUmuGai+FF68EbOk8lPPDdbxo+R7j
	idBPbo7CK6vP2Om6iN58yb5cZra0tZi7u+Kha9/gSkozz9CNuZGVLNtHgGwXRzAwxGhQ=
X-Gm-Gg: AZFdTZfqnm6m9vDbeDiX/xGXHvgvG4rzcAWe3J7lMa9+v46x/HUCJOsNtmDNQRWSfkN
	cGgAXMzaRq44IC7XFbY7hD21cvPs9anTPe1oQjchy6EqcZNfM1YgS6OBV0lOdxWowvawn+Gt2fI
	g9I0JUlMm9+3/WqgvhEJHFmvAOTnBCg/rF+SrnIcek9PO0nYITJ+BhG8n5xJ/MALOD2KHqfOyFA
	0pqJr1fo3JhHQVZAEuHO9xyz5hubWDcv5FjKDKTLRPdY2cRwG7gfdmjV9Vs+4/HhucBrAl6neAn
	7tnm0HE11OowQKH3g/BASjB1rqVqj+8tiVjg6WigwTLLPJj3gSHBErlfryKRQIqwc4riSphw4MZ
	VnNXoNrBh8xFBelrvfxu5czee6Kw4HJy/rhF5Qm+Yn48ZGmEoCyouhHQ2HkxF60PAhf+HXo0=
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3561491385a.1.1795702980660;
        Thu, 26 Nov 2026 06:23:00 -0800 (PST)
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3561486985a.1.1795702980158;
        Thu, 26 Nov 2026 06:23:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm9816240a12.31.2026.11.26.06.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:22:59 -0800 (PST)
Message-ID: <2af8f98b-56e1-4cf3-afff-37a59586a68b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:22:57 +0100
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
Subject: Re: [PATCH] mmc: sdhci-msm: Disable clocks when runtime resume fails
To: shyckless@gmail.com, ulfh@kernel.org, adrian.hunter@intel.com
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261124-sdhci-msm-v1-1-75c70ed6569f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-sdhci-msm-v1-1-75c70ed6569f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b0840c5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=PR8Mj0BxCgJnN8q3-T0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX5kZnA/aV1u7Y
 PtYyRAr0ToBYjzMQ2QyIe/RlAnzVt2K0OGdRVuFFtKIh5jHbC5r2O3AQ+hn557zujO9kuAUrFwh
 Uvz8fLgBdsdG6TfiOtGVWE/W9yCiJDCwYhi1lqjMx3q+BRR0n+CM1BgtlWm3inRSDmGw7i/xgKL
 vj+MRqyom3BuahgPiODS2DxVci61vpTEUnXqCwqYXvTh7G/SjLqWriVXvRsJ3mGWY5isJjjtoX1
 mXzVxX1R15kI+CixhyGn5WceDM0LWmqahbTb6MC0J9FHJSvw6ClWL+qLdzoQCsnjpvtxatsAAV+
 3ZWaNXl+/oT0wiXccqmvOZQh5y6g4tWpeaqdqQ8X8cl88jYH8L0jvih1GKxM0bt0h/0LRsnizWW
 hFCxcorwAw7n1tGb1Rjdr01zsztcNsxAO3OXQzAxRqC78fuuLCtnNDAJeOzq0G8/rBl9XiTEKgc
 dN4z028RblC9Pn7EbNg==
X-Proofpoint-GUID: 1Plw15CO2XWdOMfar_H9kF6xKk1m4eFX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX0wWJeRgKQ2oa
 RxMf2LDltcAilWEqBFmhU4+HCFfDv23hqxNX/lFRwatY/Vb5YmunIjiE+Fg+1uTwmSM/y+m0+fp
 ysdDc2f5BE1Yfu+r4qwPuFSkioV0/X0=
X-Proofpoint-ORIG-GUID: 1Plw15CO2XWdOMfar_H9kF6xKk1m4eFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/24/26 5:31 AM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> sdhci_msm_runtime_resume() enables the bulk clocks first. If restoring
> the SDR DLL config or resuming the ICE fails after the clocks have been
> enabled, the callback returns the error without undoing the clock
> enable. On the ICE error path the OPP performance vote also stays in
> place.
> 
> The PM core then keeps the device in the suspended state, so
> sdhci_msm_runtime_suspend() does not run and nothing drops the vote or
> disables the clocks.
> 
> Undo these steps on the error paths, in the same order that
> sdhci_msm_runtime_suspend() uses.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 21f1e2d457ce ("mmc: sdhci-msm: Re-initialize DLL if MCLK is gated dynamically")
> Fixes: c93767cf64eb ("mmc: sdhci-msm: add Inline Crypto Engine support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested on arm64 (W=1). I don't have the hardware.
> ---
>  drivers/mmc/host/sdhci-msm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 32b1bcba47d6..39db20ce5bb7 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2978,20 +2978,27 @@ static int sdhci_msm_runtime_resume(struct device *dev)
>  	if (msm_host->restore_dll_config && msm_host->clk_rate) {
>  		ret = sdhci_msm_restore_sdr_dll_config(host);
>  		if (ret)
> -			return ret;
> +			goto err_disable_clks;
>  	}
>  
>  	dev_pm_opp_set_rate(dev, msm_host->clk_rate);
>  
>  	ret = sdhci_msm_ice_resume(msm_host);
>  	if (ret)
> -		return ret;
> +		goto err_drop_vote;
>  
>  	spin_lock_irqsave(&host->lock, flags);
>  	host->runtime_suspended = false;
>  	spin_unlock_irqrestore(&host->lock, flags);
>  
>  	return ret;
> +
> +err_drop_vote:
> +	dev_pm_opp_set_rate(dev, 0);

This is not right, it doesn't do anything with the clock and
introduces another point in time where the clock is running with
the power pulled from under its feet. Instead, we should kill the
clock first and then do dev_pm_opp_set_opp(dev, NULL); (notice
it's a different function)

Konrad

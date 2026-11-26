Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651337;
	b=QYeKpd8Mghm8D2gQ0GPXDA6zPckg/gpCQM2mo7iZe/De5MalWa62vpSYQu+Qe0h8LnmK
	 6xrLZKgg/xdgCexqFCQ8mNUnoTQkXzDqywwdjHcpcizh4T1X8IeAbeOVEWeLwogtYpALZ
	 GLqlNdKtklLSspW033y9kr8yOUhDCnCcC8X/s25Y4aaYYXWmYPzE+cBCuxi86P6MNQyaa
	 fAMsP73VcJXQY+4lNt2Q1fd4G+5MFdWdCHkA8501pxfWl0wk9HZN6g9uakpKfak4cZnmq
	 RZRf4O6oo3JvavqY96G7SggMhjRqazDrW5wm9k3OkZysmeiErSKfojUsVsqQHCGbylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=;
	b=1ar9r/yv7XKqDCyTMaWFd9BNpVti/91kIYu+ptz8BgbYfhd4arnjqmRGyHWaFgpLLCRN
	 s5VML0B2nJOUCmlrHe2ypCGeyWEYn4MGY7/5jEVM0oAOtxAlnGpTyKHKnGhdxMSvmfhHO
	 iD69Gwewh4pqNjOZkZy/DKKj7mODDgi6FqQ7OxoZZ7YTdSrEOLnDyOPS9kF7UF9bm8/QV
	 mKGJJgHjLDyBPNHjN6BupcCCLibJBgvryZBAlhIAo3Yy3iflVQJ4HW2j5hQwW+1OBZoAH
	 IxRUKHEFT7Ly4M4uwxfuG5cf8aMWv5fJjmypHcVblUH/3xnU/4fOiqt2nzfhCmmlpoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0zHOKBc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XJt/Js96";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5034E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0zHOKBc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XJt/Js96
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJgh0j1138083
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=; b=Z0zHOKBch2c98mCk
	Je3/utDj/6DWW7Y3mEh4ebKMbUBAnaavE6sDooW2+yKA9WF4MLvDCNrrxnZpGZUk
	OCOaCafv5XyyspMKsT2+53w09NWBrzc9Wa7YzSJm52FS05FF+OD/hFs7oJNTkaDG
	8ETlQnfH3znOYTrfL9ahHEdaL7TThnxZAtX6v8llGz4LG8Q4WsNR9KZXYcbRwUrs
	vB7TlXCf0fbJaXsGW7H1GBXdsux12YnT+wl5THZqRhAtzz38m/508b+RnFdSVX1a
	tJrlYI7Jc4D3yK8XuQ9C9zj5x6CBZU+3cVCC22dgAtIBr8wiMR9diMZCi5OJ3Xb9
	Ulfrcw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s8p0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:02:16 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99e0a55e4b4so1747910241.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795651335; x=1796256135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=;
        b=XJt/Js96fp/eNRie0PWjSpBpLzSFqrczD/r6F3cgF8lqi6Byrbr1od7x433KStb3Lb
         kyLKeMS/jCmZCgfwYz4Wdte4AYAuPVA/4jCH3EEkthZDV/AQtM8Lgr7XS8CClRH1I5Of
         iamyxXp+ViSpBoKWYbtuchJLdiD1SXGH9Vk6HCES7aIGM/1crHkVCTLuXZvXsmgF+7MT
         uoI2VKoVO7SC3CKhPfGzFxUIA4EJkBZIlr6mfsRNfHc89Yax72n5c9Q8fpB9CGDZ+zd4
         QhnmHlLbmsngd1jLiah0cPY/lz5D3y8lmUDt+oknUhe9r5mLs74biTIXo503AQbYZclc
         S2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651335; x=1796256135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=;
        b=Nqimp58Fe1VPyLQiixYwjEJFyeqmPlbdVFTligSIX9rNcEuy9pPfpdxKOFU6j0Qgwq
         HmppkR1EBohwNwQ2AN6aCY4gT+duAoXPHCdEzrKJiUpjSJo6ZIxl9UhnrAmblCzpmCgA
         prir+FXP7Y2t7G8p0b+wQSJTBTKDiEytqe2uuI3eiR2WYaxZR9Lrc97Il8yMDg9i9FSg
         l0iR2/W56XempzPDYAoQvmNgEBj/yel6Jrf1Y7Ewzykp8v+2pNN9W6aZhVRiH9eW8GZd
         pCIn7gbDiWh531AGIgTfGduQ59omXnvvrFdSaC9/USl7aorp36LwwUFn1b4TXPTGbHef
         3QRg==
X-Forwarded-Encrypted: i=1; AL+hErH6Nztto1rRS9Qh+uCJ8xNl2ftieavwuWrd67fQS1YSD1h8JR7w+f0zeDdxJbI3spuV1eZRBJruNlaQWsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z86vCvuUXzhtQ/wXOj6SYH6T85mi9pTL4TfaFggBFirmDo0vyqe
	NOF+fxZKq2djzG/WPw5OzqdcLtAiVeLUcKcYI1dsYdVvGRque2bICIDUKjIdRsXWI2GCzuOblyL
	Fk6cmiHmlcY8BOf3hbVhli/zt11JcefeWrZxfFojo1hJAszmFeaYGV24Vv/8V4ev27So=
X-Gm-Gg: AZFdTZebjABtEm9xRKCIgVi+F/xlonQA6DGChmOvFwDg9nTtPhXw9Ojla7VOkbsh1bE
	FYwR5evRCz0jM3mhDvq5cPGmIwQ5xGX7fBustxVvDSy2PEIRkQqadRENWC2XCntARfryF4Rp2OM
	HPJRXx8ZcQAV93p5xy0dNK4rql4/0nREuoMFnJ4eWwVqa9gCflg7LeFi6mh+AvWADGcpA8WmoIs
	9fvf0E+qprY4zXhGRoCO744AQ0C2pB1BmyFWlWW8DC5cFFj39Oci0RgBAWvsIDYKegaxPguG69m
	Hfy8w/srDGbVzXwslLHbmmnzCuy2C1kFDKnJvXsRklYo1EGdVRTeS12zPJqBEBx8+Sff2NpKFUK
	jZEXWjW8O503bJorFRj3+tunjT6W2FTZ7WqvIaDWvIH432izFFLQLC7pYrjNHhvM6oKEg1JgjAH
	XdZYU5XE3CF9wnq7BMVrwzYPfG9a6E5RyQsmY=
X-Received: by 2002:a05:6122:e44b:b0:5ec:b4ec:e93f with SMTP id 71dfb90a1353d-5ee8aef5b41mr10335528e0c.10.1795651335295;
        Wed, 25 Nov 2026 16:02:15 -0800 (PST)
X-Received: by 2002:a05:6122:e44b:b0:5ec:b4ec:e93f with SMTP id 71dfb90a1353d-5ee8aef5b41mr10334927e0c.10.1795651330438;
        Wed, 25 Nov 2026 16:02:10 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:f3bd:f67e:d6c3:ff0a? ([2a05:6e02:1041:c10:f3bd:f67e:d6c3:ff0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm761206815e9.13.2026.11.25.16.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 16:02:09 -0800 (PST)
Message-ID: <1e12ac6a-eb73-4f54-8a79-8da13d6c1638@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 01:02:08 +0100
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
Subject: Re: [PATCH RESEND] clocksource/drivers/timer-mediatek: Enable the GPT
 irq before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b077708 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=Ll55pq3paLvcCbb_psMA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 4PCgQR-9L9dXeW3VqUNShuEyWwOB9TBb
X-Proofpoint-ORIG-GUID: 4PCgQR-9L9dXeW3VqUNShuEyWwOB9TBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5NSBTYWx0ZWRfX8ycYmwyXkyuP
 cS3Ne3jwEFOqVqwAGaYCXqkQgtIFsXzf7Mpmwp51TAELkJXzYAGVjJdYVM55WHk4/WSim/lm5lj
 pmPBXBjF/zCsv0FHqmbbfH56GI/cswWrB7T4dnJcGiEAnEdLWCXr59Nk5IJLLnEK+gXIXHDRV4e
 9ZPrGQUgqEAMN8Z7Mn7miHSBMYbzLgQlNVeY00OnB23WlwlocwjrAivUbmOw9hpIPlm5IqHLE5J
 1su3Gj99ZqtrzTKfrqskKPJD+yeUdnBBnLQic9h8HFo6GTMWuerBf1+FVgQ8fpZ62iwO179AmuG
 CyO4EqkkdOzytj6yaIUoeJA9xH7FJkYVLu/GdgMaU72pPGicFgG6pJ1eH1o6q8dCTLpKDe9WIM8
 Ia0yBKqihqIez53JYXp8o7Fb6IM4oCrYo4JWTcW1BHFUP35XJWBWvHoL8ly9DqmISBq73uTtc6C
 IZmWj5MiNcJkAx0AhHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5NSBTYWx0ZWRfX8Gc5xcC9UQvq
 vcSWbYajK4ZjNvY0Awyw/6uMQI0/EHfwJasIRko7BP4QC1w1iLsAYWlIYMuWufVg/0KEE9e8oGH
 BUd5JDWGdP0v40fS6RPIVjDyV2YsSVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250095

On 11/26/26 00:22, Ryan Brue wrote:
> Since the driver probes as a platform device, the GPT clock event is
> registered late in boot, when PSCI CPU idle may already have put CPUs
> into a state that stops their local timer. Those CPUs wait in the
> oneshot broadcast mask on the hrtimer broadcast, and
> tick_install_broadcast_device() arms the new broadcast device to expire
> at once so that it wakes them.
> 
> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
> clockevents_config_and_register(). The forced event fires while the bit
> is clear, nothing is latched in the status register, and the waiting
> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
> state in use, this hung the boot in 20 of 40 boots, and in none of 16
> with this change.
> 
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up.

Please have a look at:

https://sashiko.dev/#/patchset/20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4%40gmail.com

> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
> broadcast device is armed at once to wake CPUs that are already idle,
> and that event is lost because the GPT's interrupt is enabled only after
> registration. Traced on the board with prints in
> tick_install_broadcast_device() and mtk_gpt_init().
> 
> This is a resend of the 11-03 patch with the review and test tags from
> its thread folded in. The code is unchanged, and it still applies to
> v7.4-rc4 and tip timers/urgent. As a 7.4-rc1 regression, it would be
> good to have it in 7.4.
> 
> This patch was developed with the help of an LLM coding assistant.
> ---
> Changes in RESEND:
> - Collected Reviewed-by and Tested-by tags from v1; no code change.
> - Cc Daniel's oss.qualcomm.com address and Chen-Yu.
> - Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
> ---
>   drivers/clocksource/timer-mediatek.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 842d6ee4259e..1b2cbcc2795a 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
>   
>   	/* Configure clock event */
>   	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>   					TIMER_SYNC_TICKS, 0xffffffff);
>   
> -	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	enable_irq(timer_of_irq(&to));
>   
>   	return 0;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
> 
> Best regards,


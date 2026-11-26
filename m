Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710136;
	b=5Fd1SKKaplD8XSrqFtsODUIdmA29ER3UMfzjJRewqiYFHolchpGVvPCxncfW4XqmqEQu
	 591Ebq144vlgLDo8j5yuTWHkwiYcvxIcFIfCXoxe6efpeikL06aKc+M85ssr6WyxyYsC3
	 stp0SNwahub/pbDGI1GXoBe5KGtULOMwQQIZ46O2cT8n/WWAPDznrMyIRTzOKnngzQ4sK
	 wJvOjrxMfgx79Udip2/X8a+LqbZl0+73+2aUfH4pTPg11gEV/HzgOsp2PpVgbKtSLuMNx
	 MqHeJnfkUPtoiVxN0hzP4ap/wd3Gaz8BrbwJEIebzF4p4MCOvQQxmxawitFPubO8PWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
	b=Ix6SsKHBhg7nDukH5+0jEPOijvOadYdJID9NTPU+nBuFGnQUwZ0DL7U2qek3SYjOgvVc
	 qmS0u2qw9ZYu3FCuNTGRistK0/kbLK8SqWQA9EJIAPs4AIBm93Tx5QYcAqAPN4p17i6d2
	 iJV4gakrCAHUAdoPpsoS/VgbC+fgtk+wk+pWsnuanyHDXnatv75fioQ8yqMFrxL6ex8sY
	 WjnM6WQU1OO1o2UoWOtDdIjG9oj4bSTaOR6Y4CFdB9kjm5Nqsdq7lNenXjPI+3rKBrQv4
	 QtZoECAJrVAxZsW9PID9gx6vJoQXbZTb2m3pP3653FdSj/jGQOZ56736gx8CgFMGI0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sTXcBPYS;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD00606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sTXcBPYS
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so58453115e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795710134; x=1796314934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
        b=sTXcBPYSeisnxxEwCZoFkwQP+w7rdOFVMnhCKwiTziMru4eR0LHtPa3aha6YYT1ceV
         CpmeE513GLsWm9+qqjK7wKXB7vapqRlPYKpQoB2Ffc9EdCY+CCjbwfy+QZtVgr+irFW7
         t7ufYEZ20H0Co2XeU4yJTf+3t5lazV15Y+cqlO2YwdB+787Modeuo0nGWcjCuGYRXVs4
         1akr24E0Xmdr7WT1m0mICXL/8lEGMedXGadIfV4wgf3HNI8HwypKypK5K0gSj5mGxN/v
         JA8ugjrD5VOLGnQbchT19EMbtRo1ALPIhUVBZwx+eaKKg/diWEezfOsKAZtwL1w1todn
         U0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710134; x=1796314934;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
        b=c0hLYGRiYUAWxypfjT59NW9OCDbeArCuPZBHb9swgpXbYoQ9zKcmc+GB2W082BL5uz
         5Z55I3iWZl8bY4dJtnKHbZZw5aPke5INxzmlsMEDz0YCHgWQ9zGiivMVc5e+YOM8vX48
         QBVi5iqjODfo4ZQmEQB1P6m3rdOtxh1MMYJFFQbpuFq/MV2tVqPw0WuUK7qQ77kmHdPG
         jcD++/OuTJ2YuNuWAbL4v20CsYrnlJ7rHuXF6+6TJFdQu1ejwArObIdzP9gmgAkrTJR+
         s/a5fgZvSZ7lkeWzdpmGCZKuMntukfx2DRGrwUzQUIHBUjuOowWydr3LxKPv9C54ZAKy
         2bWw==
X-Forwarded-Encrypted: i=1; AL+hErEIGpjCqy/8i6YG+PHV6/BSXBRVtdRLXtF+GiN95R6A4qnKn9rLI10pzmIuOZHFgdhYVUJ9ekdIlTADJ3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+41CS8SrFQ7elPtlKjCTNXcIm5kYpF9Pi4VdeKRiXlfw/5ylmW
	xG9x5u1UGn5tKFDRD8iDMkGJnWwRQXVSzjeJdPmYkL2lQh+knSpt2j98xQ+1BRmiQVw=
X-Gm-Gg: AZFdTZfR/0pOW9tKrm7V1Zb8WNhr53VQV7FQgJELncZMU5MgPlZViNvhfyF0PzfYOaS
	ndHsMPekp8qm8tZnBx5wLo0WbMOM6zFBzMnx1mKo15c7osWZKVxkgdnVzLRRx2Ki4UK6vvSLnqO
	w75C55fLIZUcptUEX5IzibLGXAH7e0BQ3zyZj3CDs+ejUcymiKbTgjTherVWlWbjyIS4A1WJ3x1
	QhlgPO1J3VxHKX6orI3+7ezLmy0BKeKdgctShL2x0pR2Dg1TYiLMSNIacZD6ofR0Ucpf+4Hiz6y
	fvTkw/CUw/IYsx18fZNn9dQp6YnJICe1ED5a9PdrhxYQNxXDHVFYRIEkMXkSzRQxEQIOeFR1I3A
	zZiX+cDroKLxpUdkRFaafRdxo6eOPrmn6ClN8rm5TVzVenV44j6BTL8jD9P6q27dVJoxdQul0xD
	a5LtymJhm1QBoaEEoaijqbl6Xc1z3hfrwcAwKg9N95LiepkF2JOo0tQt00cnaNwZb8zBQCpQben
	J9gH55bd4mSem82Lu2UBEjq7UsU60UayYd1YbVfKS2WJtxhtg6iafmao3wGHuTH9b4vE/k89o1x
	ab5eC05AdkEJq3tcLTLGNP2OHzR/dBB8q29hEy9tCjre3Wylx2fPj0/T+b07UFw=
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr422575235e9.12.1795710134157;
        Thu, 26 Nov 2026 08:22:14 -0800 (PST)
Received: from [192.168.0.167] ([109.77.24.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm42722484f8f.2.2026.11.26.08.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:22:13 -0800 (PST)
Message-ID: <c7e1b25b-23c4-4598-9a22-577e105cacf0@linaro.org>
Date: Thu, 26 Nov 2026 16:22:12 +0000
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
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 02:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If we
> find a real use for this we can turn this back on. In the meantime drop the
> definition, it only confuses things.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
>   			.formats = &csid_formats_gen2
>   		},
>   	},
> -	/* CSID2 */
> -	{
> -		.regulators = {},
> -		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 64000000, 80000000 },
> -				{ 80000000,  100000000, 200000000,
> -				  300000000, 400000000 },
> -				{ 300000000, 400000000, 480000000 },
> -				{ 300000000, 400000000, 480000000 }, },
> -		.reg = { "csid2" },
> -		.interrupt = { "csid2" },
> -		.csid = {
> -			.frame_sync_en = true,
> -			.hw_ops = &csid_ops_680,
> -			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.formats = &csid_formats_gen2
> -		},
> -	},
>   	/* CSID_LITE0 */
>   	{
>   		.regulators = {},
> 

This patch is too naive, it leads to:

20261126-purwa_camss-v6-2-5ab97aea3832@oss.qualcomm.com

I'm going to NAK myself here and do something better.

v2 incoming

---
bod

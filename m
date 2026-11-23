Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398400;
	b=4GzAIXwWXP25iySDQzvsFkMQup+NizAXVW5aRzNyMMoxmMbE5OEl3V1FMrndSsXBr537
	 hKeRt78RcMCO0UaYMLqM0i9ZyTGIXrwgHKfPiH71fXlzrB+JGtmKljjQQfTv9k5xbmrHN
	 OX2TJbvj+qHNAsNu40ZIx//pOjq9JHDoL4FjF593otH7fFiTpPKtO/iX9/IH4MKmI+P1T
	 CtlYt0TRvlmkHWm5m1vpExZ0hsSF9NElmv8Uaw3AyudtQZeFWvn4xlQXw5kW3bb4yxvqW
	 sfg/a+hMHDVVRWQvS6zxiJtYdwVhPqppef9qQ+MM9WQpIJacAJwv6u1SOhuz9wuIAYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
	b=lMY/+52OpgcbxGR3+8fjFFi1O/PMarGbpLXICpg/V3Pi4YgiN7lyu2f5RcOjymAo6gg1
	 uIzq4vBAEIXY/KDiEZlRyycWvXvhQO0x6kuZq2Hhg5cwQMXDFwBXGGmLVdzUWmjyR/zuP
	 1lo1xIHeW3oiwcn2cxrCyqEEN4FYyQu0n3AstB+SphadQGHFSmHUzYXNEwnw8uHMoIO0M
	 Xlch3tXm0NybL0CaTpxlRLnaZElq2KjjGpI0R4F56CBQCkxpCahOkl8gSkNNpcxJt8Q11
	 10yrweG46IPJ84ZDxg1/s1pHn42vpCMl3zI/umnE5/WYnsbTUgrVsvcPIeRC/go3KaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1FE606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so27192885e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795398398; x=1796003198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=hyMUp7qtXScGFjw5VJWtC8lxSVW/noa4jMYKoldsEQMVJJfY+9Sq7WvD/3a9YtO61f
         t7q73AZbrv9pio+/1SqXRSNyPPVXOdXN2qLGCeDhkhj/M3o545TMI5DNs+JMIU+rn+59
         hQrSx7HzWfe0FYJUWv1i66v/qdPGNjWAH94Kc2y60LmwbXqAu3pTLwEt0Y7VXZjulDd9
         f3R3R90rtf+JjUpCnn3Nh06DQxr5tSV1hu2FtYCgas7hwt3CSBFvmT4DcRzxL4qqo/kh
         7rMae1m40aaJN7SgoLmnR8MmEkIAzWHJuJwoMP16c+cMpV4AmIJUpPaareUMzlnzz8mQ
         ZWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398398; x=1796003198;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=Os9rysDw+UYYipAX6kss3Ks+YFR7MtKGNcM3uwElswY2Th9PBY5gbpg8nt6RvSxDmF
         MwBYzzHN+A+bdHVPiZe5ABeUJKBXf0coQifAX3d/+kN9X+uxkDt3I0Ocogy2bYgjbBcF
         c1Z8XGDELBiu2x/8UXZFbpTxRWElpYrI82BXoRIEu8Q5/uWVp5zMd63nbTKAMCuZENV0
         Lr3zytO6scW+lQV2FmgNdaI1phxcMyEhu6u5DJC6UEbWDfsXhRVKZMjqVGsjPZzRmis6
         IXxiVhv5SXpZftCbAJPIe4g551o31eW9sTZUXk+Wk664CNmRAX46iFmVcA1hr/RG0yOt
         SQug==
X-Forwarded-Encrypted: i=1; AL+hErEovAnrVOdRFx72HhMv/FILKmr+u3BcaF1Pi0KVWAxHPnDRpf9QxDxPirnxrMWIic3Hb6WknxkySYP9lWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QbmTC4K1cqjDnOnHgM6q8GIFdvpMCvYZKDyMwOyqqS7vD0rCH
	fbYeuFH4BUFyxT908mCF7YGmrhyhSPhBHuzkZ6wz5LZuyI7blN/sHcE66AXXrnJQ2Hc=
X-Gm-Gg: AZFdTZdl3j5mvBqBVSLT3bR8do8WfEQRWdnxyVF8hnxkgeXIqTnMrGsSjLXnn16nKFS
	wtDDvrCn6plU7032xlEbT4fw6QNEDG9ckIxab8Olf1oIw1qsgONW97JJ5xWCg22r/1PL8QQ3Beb
	+J7LvEnRKrG/JvosPB591JHVBHoqcOo8NuDjXYWQpxCG1BpoW9hAGc2NoZaJXFtvvOZrrC2h6SR
	Dxkz3kwxesJEF6X0Cm2ZPSC2xEloEOFwGexIM/Efs7bA/GgcV2jYS/4Yt4YSrAMY2KF7ZB2G4Mw
	eHBEd8CrijNYpcZxsWisgTjqjvMk/bWJB2fXbMjXiqOrS6c6hbqiY2Bkmsj7tb3L9DrjaH3Elnn
	B/mchZXSbO80f9sqSoaRvgXnKoUCORsLCcJxkzHiFFJSk3pH/FBpRMH2BnrqMqe/66xS4kvYczH
	8MmWsEf5QRTirJuKLhsfILJ2ZXLpZ+Yt3Ek+WQRdIGKFkowEXptEeKfijyGjLOVrW7UwT7IMCEt
	5lH6YzF3rNSIaBgDmV7B7BZ/OE+6u/Y8YxIYEMlOTgrhff8PM86OR6tTR5o8WMmZCLJ1XDMAgEn
	JL1d5+GWbJLfNzYnzlmap4tcq5ZqjsN4xqaXuSESIA==
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr210403515e9.22.1795398398283;
        Sun, 22 Nov 2026 17:46:38 -0800 (PST)
Received: from [192.168.0.167] ([109.77.88.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm264872155e9.9.2026.11.22.17.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 17:46:37 -0800 (PST)
Message-ID: <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Date: Mon, 23 Nov 2026 01:46:36 +0000
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
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 15:04, Nihal Kumar Gupta wrote:
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
> 
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
> 
> Signed-off-by: Nihal Kumar Gupta<nihal.gupta@oss.qualcomm.com>

I mean this is a bit of a convoluted way of describing this.

You have one less CSIPHY Hamoa has four Glymur has three according to 
this patch.

=> Fixes: tag
=> A commit log that says this

Talking about the ports doesn't really describe what this patch is doing.

---
bod

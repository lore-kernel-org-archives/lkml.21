Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421251;
	b=BJ5xRBpNqjVnVbXoDqKovV3805a/zhdHzjCYM2MFPVa3qrvifdcKYw3qYuyHV+D2ZrQ9
	 HJMurvgUgQRqVASQRQxk5Az7LdHTKu2Pv3dAjW440nuFD7aDmKAm83HAv3KA/eWKfVJWv
	 0CV5nmVa8ruvLyyHzAMvLp9Vs4sO1ZXFlxLCUzys/G9hvDHMknKJTcLMmk/qZXPRMrKmI
	 lThD03CftWACVue7fLezkWaDEs5wmzWOuFQOafDMqb1OLIh+OQgeTkWqNy04/L36m0TcN
	 nV2WoFGNVw0c0ds+KRGvZoQACVWFKgd2oTCemCv8AebmqNSef68BH5uIZ24txmF432Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
	b=NzL7VNSFni7bjO/2l04oGknn7vP///hJ8ojqdu+0lEw9wHQktethGspvbMRboayooqhs
	 2+yo+rWKLtI0Ox/bXWQNI1pexr0Z/tM4C22QfYzAdxSGdjk3qdMo6jG67vYMV9OU/g+bo
	 u5pQ8Lr4k1E56GV0TzVn9H4iuOM01j+4E6sY2uodAIPOMrvSk7iKbFGin3L2TQqRmX4ZM
	 xpUSbiScrHD9vlJPqVMnO6YWG05rAxzU/wVRfIVAQQ8RlQEKmLxTrgFeFU7ZRSu4BaodR
	 lADKoy1esW8d3HppdZngMbIvuOAcqbvGljgjD1tXYFZCdz+nl9IQBHX4Yi8AzYo/jdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Nd8tQEwv;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021260A3824
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F021260A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Nd8tQEwv
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so2086798f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795421248; x=1796026048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
        b=Nd8tQEwvw2YVHeQ8j1Cb46XOj1W6KTiKi55pRshAkmzgXk660CQlg7it9/dDUxWvZR
         HiHj7dU5yALL1R7gq97965gGFJsx+0mj3aapPkq7VvG78sdRxkhNmLB32vpYQDmHu7Q+
         GWZANiiisuMmVdhErOcvtxw5imyZorhl4pvPAG2lvvUMw42goZu36Hmg5uxvrgTQu5/d
         Awjdc6tzeYDjiDbVB4ickreDMX3baO07gu4+BGY7T0OzsmreaiSUf8Ezt7ujDb96+OOU
         oKLMaBOCWsTbgjvp/UQbBrb62jWNG/WoOI8hhnigAO+POKC0oiU3k/QSvKR/4BGMTk2o
         +m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421248; x=1796026048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
        b=B4+C5dLlId9dqEz3mMOyRTga6AqI0d/hMYtaW2OYKFAA04DmYiM1t/6eacP/W8/0zn
         rb+ILe2L5JPZJ3Vc88GkBIWe3sYzPBTkKnek0AytKGQU8CPhVMm8vl6ChJcdZAYUJiVf
         XP8ZmDUUGKi5E+CrdC/E+1Eaij0UpisbT6dGAA648yw/hZsz2c9/IjfQSUPpKw4N8z3P
         9BSxR4NQlfiANxpT0OxtiXTaMX1FEGyE3TmHEWK546L2yQK10KxPI/fMY7bFnbfiermZ
         mcCRwdrFdbKlfZ943lTugmO6iYKf7WULOnJ3bnzCQxPn67luZwptVncAvuAxxMh7FWM6
         amdw==
X-Forwarded-Encrypted: i=1; AL+hErHUJ3I3tYG7n5DyjiP7l7PsYoKNuHfZKUwWyQ3b5MLHDuJ4Q/nTGw8HVOS9n9+5QRTiezi/pTOFKrpTf4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mnl3ofoCtmYAOBfDNrjnRbD8hE7Tu5wVLMaalrngfkstBfePB
	Yi6FPWgZdIT6ru1hoOxoHSdArw6tyyP2VVkWJF/ltCm2lnAaRgxcm8E4gJIeg7xE7fI=
X-Gm-Gg: AZFdTZfVBw9CoeawazoX8RVwxnsfoqZH/PhQ3jMSDjpUD40vh3AFBFFF5GMArsLOTgq
	shWw3aLP9vC2Cs46pLZQyBAYRIdQQ+XQlthUsbXIwyhee0HmjfusphwAC8faLuN4UZ+9ptudk7u
	ty6mFu4o0IKflTGeozkbGfqOV8SLKEmWlfF4kh8clugF66MYRJE3q3Dh7HecAOAcc9M+710MrI3
	2XlgIJ7ML41E1zWIycIZT7WNotxASrmEvVYHe9jHdrEKaT/yXNz+v6e8ZB15yTxEB8SR5SJF1k3
	QFSgAai2nFNALUfqAXwHcz38BZ8WFzucUzTHE5cdHj49CuLbY+YDZzZRVla6+XKozz2AlIiRRWc
	/wy9jYLLsLt/U8ly5YFSpmJYB/Q9fhBSqx/+KJh3UcghyV9Ybk5bISKtQXebKwpbQK6/RNNg2D4
	XamFEGDhn5VgoHytZ4XfSReOIX+J5TdkcOGpgBY9jPguyxjz/9t9V1T8q5nmlln4v2UDX6tBEoU
	FNuc4B0q5gZx23wErzKcnXNo/czXrooRzCf/la7M1bSvggIj788MUUWZD60XyogP7Onjufmd5s1
	M4i/XGcP53BtZ9zIROnq6aN78BS6/ghmsE6OLcI=
X-Received: by 2002:a05:6000:2c05:b0:498:b92a:30b with SMTP id ffacd0b85a97d-4abb0c5d560mr20861869f8f.15.1795421247404;
        Mon, 23 Nov 2026 00:07:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm20895154f8f.44.2026.11.23.00.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:07:26 -0800 (PST)
Message-ID: <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
Date: Mon, 23 Nov 2026 10:07:25 +0200
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
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
To: Claudiu Beznea <claudiu.beznea@kernel.org>, geert+renesas@glider.be,
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

Gentle ping.

Thank you,
Claudiu

On 10/19/26 15:25, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> When the system suspends to s2idle, any of the IP blocks may be in the
> wakeup path. For a device in the wakeup path, the generic PM domain (genpd)
> does not disable/enable its clocks across suspend/resume. Re-initializing
> the MSTOP bits for such a device leads to synchronous aborts when its
> registers are accessed for the first time after resume.
> 
> In a suspend mode that is not controlled by firmware, power to the SoC is
> not lost, so the MSTOP and critical reset state is retained and does not
> need re-initialization in the first place. Skip it when
> pm_suspend_via_firmware() reports such a mode.
> 
> Fixes: 5cd33db56956 ("clk: renesas: rzg2l: Add support for MSTOP in clock enable/disable API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index f6293c968bcf..3d2281456036 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -31,6 +31,7 @@
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
>   #include <linux/string_choices.h>
> +#include <linux/suspend.h>
>   #include <linux/units.h>
>   
>   #include <dt-bindings/clock/renesas-cpg-mssr.h>
> @@ -2697,6 +2698,9 @@ static int rzg2l_cpg_resume(struct device *dev)
>   	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>   	int ret;
>   
> +	if (!pm_suspend_via_firmware())
> +		return 0;
> +
>   	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
>   	if (ret)
>   		return ret;


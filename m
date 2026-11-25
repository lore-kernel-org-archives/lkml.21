Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603037;
	b=n15qmTlc2OllOq9TfCvYafE3aBmaa0rB+W4zoizMuAUhL/LtIajH6vgirvlm4aoJwa2+
	 qU9b4TXEaee45LC4/BD0wQTgs8CvghBHAqs75hor3yIIm5xv9eMnUsAa2vxbi+LQsH4Kp
	 OgTYoaoOXczLZpxgRL294QqYFBBF/zgeh2+A5i0bqLlxUUdvjnp8Z+YU36FDtSc2v69I1
	 0uWs1EWeyTI1ZGu5rIzk3p0ZXx1Yqr97KPS6Zd6isWklt/S1MfQSvWExZmszCe68NYAsB
	 Sjn/lTrC+K3S0jOsqcc0bvMMD+SKOQPFqDxWnMeMwXbLVoVxGKV0dGHCXiUl/JkYoqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HjjQ4RF7btdRb/yccVHLGll0ZfchmSlAwpbX+qzuMEk=;
	b=ZKjwT7Di7lFPacJpXyTFPwBXXIYkVi7MsNI9JsZ1yr9Mvip3sTh0OSHPFSWKJ7tFunIh
	 /6JyxE/vZUuMCWmv0PFybaEEt63AGH/H15EFpWnb+kxeM4oBFpT5YudPlXM8kfb0eySHx
	 27LtBPbPqog2b8jlvmTplaD6ruyY6SkvyxjHhNjnbO0WrOO6ZiwUnhoWtvSkaKmwtL6k2
	 evcVZ1X4LJTHNHIFNq7/p20qI/2+BJwrMM/Sh+ryFgyhycsjBISqt9GrDFA7qseoBzCAr
	 FAMZi8L47W8yBh+AmRvg1EORm1FsSp/z2OEmbdzx3BsS+kJ4lxLvfGvUBuDUK21jOuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cnyG9anV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0254606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0254606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cnyG9anV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so49689125e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795603035; x=1796207835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HjjQ4RF7btdRb/yccVHLGll0ZfchmSlAwpbX+qzuMEk=;
        b=cnyG9anV9+tEJ8LtFELy6ZIeP9iGbpJnEWHEWD8m2xEXLjZ2r6XX6Q0L2BC6eHIuqR
         tFOQW0MTnVfX8wGmdS8DuzmOqGl2PVJyyGl31BoQkuv9j8vdAcUmINALr2JUK92O0MEH
         Sf/7gjxpQzAiKVvT+vBhZFSZpnMTVE5Uem5a2kQFbiw6u92BcUoKZ3NuTsdx8gvPR6NP
         S+5+eG2VG/LU2d2vWySqhLkqmFKhfy5cJ7KSbDDwgy73WMn05lmM4Nw7k2E40KpYUYUQ
         NWjwWU2aSwW2Rb9P317N/kRlukga4FWST7HpoByeDojD61soL/szUpUk9O8VB4CSTE11
         OqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603035; x=1796207835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjjQ4RF7btdRb/yccVHLGll0ZfchmSlAwpbX+qzuMEk=;
        b=GfQUG+sdsGlUNQI+oTLTAXQxI1SjGBrDaiAFyIzvUfemheGEdu2lZsj+yF7YUQCuaE
         o+wUfIjCtSsvL9a8jzx20Yc4h5XrmHxpbjKn0evS8jHAFMPDzrsCOyDtAYWUEMLxARTT
         Bn0aGgk/uC9B1oFhvG/6uY97L1uVtoKjJlz3jncMO/nGGkFoYZmcX54q0nTx+Hok4rgB
         zfSx+BaN7A+NLgiJ3Ju/58H3QAKPg9lCtt/KUSlIh47o2o2d2Zf/17jtCilWeszyNniZ
         xvO1w2C7F81gQHm+/L7HgF4lGG4u5GFVhjqAmCpRfh6fNwqtKcptDtKDREuNwG5wjJA6
         Pimw==
X-Forwarded-Encrypted: i=1; AL+hErENu8qIaR9Y3Lnx58syR/KX54oMy/hkNVPOjxsGHtBLjV7IVX+T5U9v6pXFViGf+w+IZiyuP+yqLcqTUa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w3HIdt8My5kGYkQU5po7v0RA+HqN8muvQlBwTYrG1L8gVocfP
	UJrpDADjiWvvYN3lCfD/oKzJZ7QOtFVBdochamFFzrCMdgnK8RmfBRja9y5yBD4uUK8=
X-Gm-Gg: AZFdTZefFvnVLHFwxjtCDZhfZqoxzmM7J+OMc+NcYQt4pTY18HK5gOaYsams1LCa7Bq
	9qvOLMkQALwgTpF7jX1ygBWPySUQpVBZK/IDFhvY7N/hHpMdWL5Et6ib2xdNN/KqJ3fW1vmBmv4
	dQW1KquoG6Jl8Wd6gKcfxVGbty1qZjmkzsag9hyHkRwYAH+4rR79hJPr2Uhl3CC09gMZBN9dW4Z
	894XW2/U3AfpltSv+Av5Qo0GCHqMhKqth5eris9oG7XLprspDZUC1jOZbCEmRKY+MLK0x4UGFxo
	KDrtqw8rwgTx5gvns0aSYt2nXFz4Nh/3aErdPfXEkQD3sWyeeGnYU3fuLZFJe6bVCZxhKa2xzM8
	bkDo8bQrSkFOjrlvllZGaVEr6IoeQDSf4wBHudlCY2y3RxrjjOW03/7q/Qr6Loyj6YJDgou9GVr
	fUTdThA3XzFhE873ocexRzOoZezfqCoziSviW6bA2b/pVcS7OLcjjbi9Yv0kuwGpNH/jr1z5lJw
	zTxGSD11kuWr4xr7FjMWhZJikxwEGBlrNAKQ6uEsh94rDmU8vDpV/uRn9y2NWCKbM1phbYeGSXA
	JmhPoicHoded14WNSQuh16edX4s=
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4bb8882375cmr360820775e9.32.1795603034960;
        Wed, 25 Nov 2026 02:37:14 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm569732465e9.3.2026.11.25.02.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:37:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 25 Nov 2026 11:41:13 +0100
To: Joshua Covington <joshuacov@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <masneyb@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: rp1: reset cached rates on probe
Message-ID: <awa7SfNvWXcItiBk@apocalypse>
References: <20261124231751.83938-1-joshuacov@gmail.com>
 <20261124231751.83938-4-joshuacov@gmail.com>
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
In-Reply-To: <20261124231751.83938-4-joshuacov@gmail.com>

Hi Joshua,

On 23:17 Tue 24 Nov     , Joshua Covington wrote:
> The clock descriptors are static, so their cached rates survive when
> RP1 is unbound and bound again. The "varsrc" clocks then report the
> rate of the previous probe, and the audio PLL and I2S clocks start with
> stale cached values.
> 
> Reset the cached rates before registering the clocks, so that a second
> probe starts from the same state as the first.
> 
> Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
> Signed-off-by: Joshua Covington <joshuacov@gmail.com>
> ---
>  drivers/clk/clk-rp1.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> index 1dd276dd2b..60037b19db 100644
> --- a/drivers/clk/clk-rp1.c
> +++ b/drivers/clk/clk-rp1.c
> @@ -2416,6 +2416,12 @@ static int rp1_clk_probe(struct platform_device *pdev)
>  	clockman->onecell.num = asize;
>  	hws = clockman->onecell.hws;
>  
> +	for (i = 0; i < asize; i++) {
> +		desc = clk_desc_array[i];
> +		if (desc)
> +			desc->cached_rate = 0;
> +	}
> +
>  	for (i = 0; i < asize; i++) {
>  		desc = clk_desc_array[i];
>  		if (desc && desc->clk_register && desc->data)

Thanks for your patch!

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

> -- 
> 2.56.0
> 

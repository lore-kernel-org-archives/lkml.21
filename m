Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304932;
	b=nXIyKcEkQrWFQKksxnB2+pLw3KzYeSh2+iUjJXmNzxRjfJc4Y3mvpJFtGbBnahXBe0Sm
	 pJRxhtaDDKEGLo87l9D9JFXb+RXy12Fb0W3vNYnOav7ZldUqVb5+N4CtgNpv+L/bP12j6
	 DA0Aoh3EFtpHfwicWIRwY7V8klovVMIx6s9bV84aixKc05UCCxykfBPAvI6x3Fy+Z2Kaj
	 wL1EnpbGUzAiaBjy7tgfH+QXcrlKfcHFmfKav9IAKE2zRrdDmEzLHkHTnRLo61KqU/CY+
	 IgmTBOXK2sII2jE5as60/+n7cHe9dDPhPwqXtsf7Tnf2i9OT+fxWICXG1ds5rtBn4KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
	b=0kChgdlq/6JzSjXySGlYH+YZeThf5fUhAHRwGHZLTzNvzxXeCc6xjf0I92z3abYux44l
	 yFxbMSDARrQtGO6xMsN9yPRpR6rfoij8P049K5lYsG78+qqfXMUFOgk2uG/TxNatx6xdh
	 ovYWyaRK5Dq49Dr/pbHpLFljMRQ0rtQI+Z7iC0m9qSEvEZCxClFqmu9rZbSfrwRxyAf18
	 AmIHEsZ4w/utOAwGehi4GLnjHmSugpkWL2M/2pAOVy1WgKpYkfhClrkjv8D3xmFAPJsme
	 FE2sOkjOpgYIogrjYlji4l2t/T6S7CPa22Fo/KjbXowJbZD1fVJx4tfdLQr7/H38EEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEi1dkvd;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5847606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5847606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEi1dkvd
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1811674a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795304931; x=1795909731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=AEi1dkvd1iAbx9IB0IMCR3UE9iO988yBfhfkjx2i9mjncbiEHVVBFfXZ55Siz7OLad
         hKHygBI5EWiua/IGIhAo+QKpeDXT8b53qhFXdt7p7s7V/9J9qP7c1BMuZ39aeIz1bNMp
         Q5phb+V2Pyo6/7Ai2Xa9ooMuCCFBEHhUaBnFWlAxify3gS+UOZTiTfDYlkdkCkW0uCf3
         AJwvk0btxPHVDq4GCveTblWNKSY5m7900GqJulzpo8SuxUWx2gSZMhJIgY+ZzmGhwTtT
         p5XgjLG4heBRdLTVV1CR3Ksn4UjSIq4gBcvaBrwjndr8vwfNdrxDo95yzhO04Xvct/wG
         lvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795304931; x=1795909731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=c3JY4WzPgRafQKZOss+J551rhvqLBJEl1TIeZ0bLGie6CL3iTaevZSlvB6sQFovlQ+
         UKIZtRAaGXD9qL7/fQhisIRE6LSHqAgobeeHD22V582eTXhDWYjSGLuakNN9npX7vgY5
         gdTkzJQi/zAR6zjN0upzUNzwIGJss2tVpfq9G7dgYXSora1dM8AEZ5DqwZsX0hdgOWya
         ng6O7wnLhCaADd7qOrXHsYYf1QTUA0suwgrEOT7g/791oxq6ZHtxVPBGAhlEMBabcgSx
         NqKSa2Txpe8MTqipoe+y+EAEUY4sX9OGeh73NHRMmAigJ/3cPDFRfsxC/1sxWiU4zIG2
         iqjg==
X-Forwarded-Encrypted: i=1; AL+hErG3FDPzs52otYYijrAqk6aAFjqb9+v/mJovRQ8cPQ0HNSpAmTV9kfhmQS1iQ+TLWr4U3HpzNyE2u24mDvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3FDbKc/mHXkCx9zc5uiXIX2KWP0yYy7lQkfc/ciOsmA+OPUmD
	K6tfXstfWSgnPO5d6cjxhZzocBQPxQqBBKfzcRvjujUakJmit4heodBI
X-Gm-Gg: AZFdTZeHQLJxKsO90V7FwT/ey6iDlKwvuD8j3QcgraVEXQC9+SEkYsifX824O4oKXKo
	jCWrc4Q5/NB7OBP5ilhX5vOVS8bNc3BjQFkEO1lKMr/VgcfYdtGpCwJwyS05yS2XFbYIHkSjv7P
	ADKnj4AFTdWUe4nPnXqKLLwyHQAR1KnDU7ZwoVqHuE7Y8V/SQKAbFkaDyICa7TCOpmkDZd6o/Fi
	ID0utKgoKgeQ/xOphOw0qkP/+hSpoFxJtbiIraZDVsWSZ5o3C3dkKxDmLtsS2TSu0HKwFA6Aa4u
	Iw3l37KE0PJjfz9BTVOSW5NNp2g3D4rr5xBFnmpUJykNbg/pn5NqRXQjoUBqkSI1uEILAPNHded
	tE9NZfXAr9GZ3Cz9suzLUTrpBa/a9bIby4wOI672yM5j6ZH5cFqd8MgYY41Qz1llGv/ArU5S7Yo
	lZlbPhnC7eVqm63ATKaz9BmaH7yDudxir+KDOq+4JzMVbJNuTjK+Af5ANI0lmAKnYMSG9SNRSkF
	vI/r4nR8/IDDaPK23EYI+w8TsxZIkbpT957Q1wBp73QIVowztwfr+QzJ7rMxPN4NgIqTIRSq4L/
	QMPa2eVa/bNFJwCerw2kADadHz8=
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr6761492a91.61.1795304931081;
        Sat, 21 Nov 2026 15:48:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm10532985a91.1.2026.11.21.15.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:48:50 -0800 (PST)
Date: Sun, 22 Nov 2026 07:48:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: gaohan@iscas.ac.cn, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: sophgo: Keep SG2042 gates listed in
 protected-clocks enabled
Message-ID: <awIs42O_vJN3gB7l@inochi.infowork>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
 <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>
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
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>

On Sun, Nov 22, 2026 at 02:18:05AM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> On Milk-V Pioneer, EFI runtime services use I2C0 and the serial flash,
> while Linux drives other devices behind the same gates. When those
> devices runtime-suspend, the gates are turned off under the firmware.
> 
> Mark gates listed in protected-clocks as critical. Unlike qcom, still
> register them, since Linux devices use them too.
> 
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  drivers/clk/sophgo/clk-sg2042-clkgen.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> index 6abc2c973c49..65ab18f701e1 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -840,6 +840,18 @@ static int sg2042_clk_register_divs(struct device *dev,
>  	return ret;
>  }
>  
> +static unsigned long sg2042_gate_flags(struct device *dev,
> +				       const struct sg2042_gate_clock *gate)
> +{
> +	u32 id;
> +
> +	of_property_for_each_u32(dev->of_node, "protected-clocks", id)
> +		if (id == gate->id)
> +			return gate->hw.init->flags | CLK_IS_CRITICAL;
> +
> +	return gate->hw.init->flags;
> +}
> +

I have a question on this: since a procteded clock should not be touched
by a driver. Is this logic necessary? I guess this is a shared clock
topology between the kernel and the firmare?

Regards,
Inochi

>  static int sg2042_clk_register_gates(struct device *dev,
>  				     struct sg2042_clk_data *clk_data,
>  				     const struct sg2042_gate_clock gate_clks[],
> @@ -858,7 +870,7 @@ static int sg2042_clk_register_gates(struct device *dev,
>  			 NULL,
>  			 gate->hw.init->parent_hws[0],
>  			 NULL,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> @@ -900,7 +912,7 @@ static int sg2042_clk_register_gates_fw(struct device *dev,
>  			(dev,
>  			 gate->hw.init->name,
>  			 gate->hw.init->parent_data,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> 
> -- 
> 2.55.0
> 
> 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702740;
	b=Ivy6gQF4eaEwVLAswsfRnOO6bhoouPBtEBdN+jwyplpdh7A+OMaQrnqZUIEh/V4mRdR8
	 ee4I391MqTuGDxTpTzWnYKmZ+Vq7kfJuhvPwRA51GBaVRslQ4WcmFszpXG3rurv0zss1i
	 7shz/x02PIb6GsaF7r4czLwGznPjNoo3XGm/0POPlhB4+gnQur2Bdan6V5ddiPEPekUl8
	 G4MVv7nlAvFtsoWd/6shAQ/l09p4Plauw9GDZATenh60LMW35WKw7ZsGsiWnAglg3dpAl
	 ACd0alillkcMOD4XaVPsUs+U76xj+ARO3B5fiB5rSA9k86/r0+64yKxMaPwH7DUEeyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=28IeRESigF0NNn4XBnfBQB0H4Zviuqvhwn/jiwKjQBo=;
	b=hlO6yTGwGJoX6XvLaSri3jL6ZTA8xuKZxVHTH2fe/4wNo45PjOiGyz7Nf7nvmsZxrpYA
	 9agVUWbu2FhqfXL5P49Fh7ql+YhrH9/s8L7ymplVNw/3frlh1megEKPwk9BxgTe/Poih0
	 /Sl1B4WGblYrsDL7KTbaiM9MNRFsoh/Xnyypa2vgt7jwpLOgszAwI52muN/T8S9gX74gF
	 a8KApuN0VLX3bG0tGd78u6/k8arEwkSJim2X74PrIgA7D7HAbXKuZgEzH8b8WDZQxjOVa
	 vwjKe/+KguaMEY6fJioscHgVat9hsPw0R2pQCTuGbWFbFCA7GJy360eddV42HAly5gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vheCxAEi;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vheCxAEi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so66500535e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795702738; x=1796307538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28IeRESigF0NNn4XBnfBQB0H4Zviuqvhwn/jiwKjQBo=;
        b=vheCxAEizQRnqTvN6o2Y9Xh1AQNqTwupEYrvUmHKOD/hTohfk1PEDBxYnoBkUnQFPz
         jdX35zSHTPcB6Y/ahYIEXZIs7e1e4Uv4+yvNPvBP/I0FF0T0QtBo0yi1pq6DTCx6juyH
         3CMMSyd7CWfhGN3C2bRJvc4fryYs2si1hwRhdFkpMiB6TdF27wx9HQWAFkpO29u55YDc
         VWMn17vcHmOxJIXVom+VbNWdAK8ur7yW8IehaZsxFw85vNgcIljXGA2Tv6aPUOIHzrmp
         9R963512ldgNkfliglMgjRdmXxbjkIdGIdryYbqQ3AVJEoUe5jOQNxtExcXN/BmMGHU5
         EAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702738; x=1796307538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28IeRESigF0NNn4XBnfBQB0H4Zviuqvhwn/jiwKjQBo=;
        b=MqKPV6kPoz4/zEZG5NyenmhZInco+SoTLHzvR1tGzJlcIun6ElgYIA+q3vvYsZB7qZ
         OnVnljBdyDBpM2of8XIDerHqEJvedFr+pEP1rWrijMMnUOkNrvcclVk/buYOtLpRq+3I
         h3/6HPKYx/e1OX5VhiqUyybnufty9Jlutv4cgtDPpVimui0sY2sTSdSUHsMI/HRXVj2K
         /nGEwF2MH8W1FWsz3g+BQWcg+JMI8gAWrDMw+pdtMPKaPQNfomm3oT9s7Jl30s4VtW9K
         0+mfWjT7K9x/qJTaoZD68ooRnQnRIpV3e6rCcwI0GPeBOUJqk6h32oHvkZDMRyX78YA9
         YGkg==
X-Forwarded-Encrypted: i=1; AL+hErFXqLIhKiqRPIic7dNPut2ze4AcifZaDQc+rPyZ9ADVka/24AYPKkZQIJVhswBScg8n7a2FPLier/ULS/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ymH1fcSarbfa03GrFoVs3nwBHLpMZpackifznnboGq1WX9Jo/
	lHKiG2yzXrK9Tg8t9KcUwlKshPRj8r9e/wG4JJVz81hGNnkUNjsSRrl4xSTFZPLrgQM=
X-Gm-Gg: AZFdTZdRUGozZI1cSE9bMvSQMIDMRs9nZz9zPjbs8Iqmgxv0eeranDFArLoErRh6QEv
	NmveZnHh9sFbAqqHLS9Vtiq0cImMRSFrnHHcWvHRgM/4WlOM00l1hm1y+ciXElBd5iEQdfutMtE
	Z0cpesZRkHIyEfGm3IUlAlet9dqGNYRRFLwez9tadc5EfjhvK76jn1mO0odvAOO1F3+jvzX2X5T
	W6TUPkkkV4S0BeIrdXJzoNF3dubLSl7LTh4qA6idQGK45n58I1ods+2N7xBoXvH50QXd2GQL4Td
	b/vdL/qavBetxsXZiHSigbHRfyn4lCPRUR9L92bXO9x/3LkfGynxhsdCpS+byH4AIoGpjWbOmEr
	LlBrEk+Koh+GWZBt9S3ywLJ67fLCf9dKSh3ra1QM/rQCFMiiWRl+vt7iS5Y1icI4vSMpHa0Z6v9
	r13ZQQKKEyWRyC1tH+5/zDIinXrV3OOP5hReW7TC56IVH46/ZPoCDsdtAZrVNxGzdCgqvj4FmZO
	XE3qwM7+qq6XG0No+IFBDcRTk5cPL7f91shAuTXWWR4/Mt/UZGLX1O3b54Rcq0cA0f+WgR4M5Tv
	BywfFs0oD08lpiHbTsMW0GzBL+8iRALBeeS2baAP+e/B1hgP2lGolpQ=
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr418306405e9.20.1795702738375;
        Thu, 26 Nov 2026 06:18:58 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm321693005e9.1.2026.11.26.06.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:18:57 -0800 (PST)
Message-ID: <e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org>
Date: Thu, 26 Nov 2026 14:18:57 +0000
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
Subject: Re: [PATCH] coresight: tpdm: Fix fwnode reference leak on probe
 failure
To: Yige Jiang <yigejiang86@gmail.com>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/11/2026 13:29, Yige Jiang wrote:
> coresight_get_platform_data() takes a reference on the fwnode of each
> output connection's destination. These references are not devres
> managed; the core drops them in coresight_release_platform_data(),


Don't _tnoc_probe(), tpda_probe() and smb_register_sink() have the same 
problem? We should fix all of these at the same time if you'd like to 
send a V2 with a patch for each driver.

It's quite fragile to have to call this in a certain order in every 
probe function though. Doesn't seem like it will survive further changes 
or refactoring for very long. Longer term, Leo is working on refactoring 
the locking and connections. Maybe can do something like make 
coresight_fixup_orphan_conns() re-read the firmware for unconnected 
ports and re-connect them, rather keeping these long lived references to 
fwnodes.

> called by coresight_register() on failure and by coresight_unregister().
> tpdm_probe() gets the platform data first and then returns directly
> when the drvdata allocation, the MMIO mapping, the dataset setup or the
> device name allocation fails, so these references are leaked. The nodes
> come from the base DT, so this only leaves their refcounts unbalanced
> unless they are dynamically allocated.
> 
> Get the platform data just before coresight_register(), after the other
> steps that can fail, as the funnel, replicator and TMC drivers already
> do. Nothing before that point uses it.
> 
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261109 (630059a5a632).
> Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_CORESIGHT=m, CONFIG_CORESIGHT_TPDM=m, CONFIG_COMPILE_TEST=y; baseline and patched coresight-tpdm.o, no new warnings.
> No hardware or runtime test was performed.
> The paths need an allocation failure, an MMIO region already claimed, or a dataset setup failure in tpdm_probe() after the output connections were parsed.
> 
>   drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 102b8b7edf87..07e19c1a94b6 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1404,11 +1404,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	struct coresight_desc desc = { 0 };
>   	int ret;
>   
> -	pdata = coresight_get_platform_data(dev);
> -	if (IS_ERR(pdata))
> -		return PTR_ERR(pdata);
> -	dev->platform_data = pdata;
> -
>   	/* driver data*/
>   	drvdata = devm_kzalloc_obj(dev, *drvdata);
>   	if (!drvdata)
> @@ -1444,6 +1439,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	desc.name = coresight_alloc_device_name("tpdm", dev);
>   	if (!desc.name)
>   		return -ENOMEM;
> +
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	dev->platform_data = pdata;
> +
>   	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
>   	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>   	desc.ops = &tpdm_cs_ops;
> 
> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

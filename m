Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104909;
	b=sIDni48NS3yOrJTMwPDRS4D62y6GR2y42ZfKTSv2z8WCMiLhJKScL+WjK5oFwP2KDf0Y
	 g+Dk8icWiXOvPmo9GxAZcoLcJldur3sHPnbSfGu+dIZ8pQU+U6QSg4MQBfhpIkXUXR5uD
	 2W8yUDRdxWotXHCPH7z8AB5am86btkc4WcxNIAINihIZXwaaq2lH4iFd9JTil7wcCq3ri
	 gRrLss3FnjB5lqilrkGBqDpA4qRvHnW5fROhcsOmJHGPkoQW1KBHJTi+4P42tdxNU7Pip
	 JvFqC7ro5XFlJyyDsUtauXb8oyHJnRzdUMyj1REBPVgFCibbqizpNwctiNqUtvVMEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
	b=Gs+XGMNS/djLclIsnQFnrduME73rYcaelXPWFJyLTfIeEmj1+0fyVoVsUzGYB4FNgiRx
	 ub2wfpTVFNeC+AwvWe1xV2PXlNXAE9Z3o6lzi2hriTnacASDmRjKyK0K8aQeqvazu7acd
	 lLj41SF48vg4RfQFf/k+r5IwFFl1KI9GSICtNPZxpJkGMFGROwfEfGi9u6f1ykhjlnj0d
	 MI2eCgoAA6WSI4Io+6q5ZYmBkcmw2gfeNtC1PmzWR28vddETW79baFVKKaPu4aGlJ6Vbq
	 uvpdVfErWXL2IZm5pmbJUcqQgbqJBM3Llq744YWd4gKcX8WB+RqCwskLsjC0STYdGJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nF7KCEXV;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D53F606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D53F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nF7KCEXV
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5126505cb3so175512866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795104907; x=1795709707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=nF7KCEXVOJWPVyLiyh9gH7j6TgFIshYrCfF9a0YLidBgWbQthopZ8X2XxlMIy8y/oh
         9+jAjo+uOTQbxl82APPj/R/l/JgRavu7yB80ikV6WLGXUkO27NLpZT5H4KvwdrWjt67l
         HUrS3WJWRDgnZyG9KpvACEv13gKwz+ei6ER/NSpbtsLskMyMUfQnE28bjGigM0I2udwV
         9P4R4DsKCnsb5aZ3ap4ZGUxyY4+05QCyB6d24j0haA+9Oe2HRNFd8+9hg9qmsqBFX3md
         le7PeMLrelKN+cLHMOWq++P81fcQgGCR3SwpuRA6gAhF7Y62xOg6PfzZW20Hlx1IdSIY
         CvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104907; x=1795709707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=o6fCj/J0NcD/7RD4xrIjUpNp3rOsk7w6UDC0f52/8WyyEobEOgk7SPXmCviKc/1+M3
         TaRmSWyVkv6ysZeShsA8y6rjfDF+9x2G1gaeujeiBa/YkXSAn4D2kuIvjB3GwwlHHRPu
         zz5s2i5apcYsUlCxIzQxAN1ZXMz2RjmhcPI9Mx+X/GcoHhB32syj/rBa8eXvNFqQNexL
         k3xPsP3DEAkvVkOfKsM5oR2iZCOmE0Dnsud/tHY6dBSB8ubEasGnw1dC1F9+RYRVfqnV
         JLf8++d0WjvQO2XXbn1CvU8GnFNn9AKkVHDYir2Z5lDZdfbhN1zRHObygpS2TZAEL25o
         PojA==
X-Forwarded-Encrypted: i=1; AL+hErHJ7cHA6m912Y3qGcco4exlprLLNQpXpdZyuqzUqVwVvgtkv6YFN+G9AaruF1yASiyODCBV4sR75EoE45I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sbcXHI/y90umrs7PoBCMg0o1vlv+0DS9FaELVDqLMHzPGBgfc
	EQQo1GM/RBvciZ1naXRh3s9wPk8cpdaMr7+NGEgBp+pPttaJ2b+Ed7ZZn7E64ugnACY=
X-Gm-Gg: AYBFou1C03N3EeGtEQbqD0lNEjYU4Re9CwSHhAXx+PmxTKX59op0FlMeW/f3wc4Ez9Y
	8G5QnhBmr0wRwZd0f0xOxpp2I6R1Woi6cGk0PneVDBdqZv9OBMDP6SCk2ZwGl3/yJ/HNxPg2/4R
	R0ck+waeMVKYPTSULZNZLriaGKHzRdPK5k7iR4hLypE6scewr+gQfFHMVXoE9CrtUaQFZ/2HgEW
	lPweq0oeekUZ+yeUJmZh6E/5lueOqnkpalZ+0V1Td4xCiEwWGR0SzN9MGDyYp52cR0W1PKLOXVy
	7RQEQUTJJjYPOHkVcQIHWCcTEbB1o+FT+aSLi6wehBqwqSvQ6qtE7Fc83kF2elxM7sjsGykKl9T
	kRLMNqoHWjcWezxTMTwd0MBGFOillxD2k2miMbvJiYiIdODk8ZQDc42CXhb3MdOYrCW4hAzrxd/
	zNiGb78iODi25VjXeKFsWHPg23SLpu6EQC77Z7cGTfeX+2aCge6dDO97QqnZN7MM+4y/rhLqyle
	B2YsCuMAZL/w7rAvtCUwhqiG7uhYy9z5ZhxBgpOcqq9G+mlA9rW1pGqzVDHZpP4DRS7izMHFT35
	bfmj7dSlzJktx8zmnIR83St3wPXZF/4c
X-Received: by 2002:a17:907:2d13:b0:c41:21ef:26ef with SMTP id a640c23a62f3a-c513aac43a9mr40174166b.20.1795104906817;
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm16082866b.4.2026.11.19.08.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Date: Thu, 19 Nov 2026 10:14:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] remoteproc: amd_mbv_bram: Bound device name
 formatting
Message-ID: <av8gg6d7eKwpfcTQ@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-2-ben.levinsky@amd.com>
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
In-Reply-To: <20261105051902.1646651-2-ben.levinsky@amd.com>

On Wed, Nov 04, 2026 at 09:18:57PM -0800, Ben Levinsky wrote:
> rproc_mem_entry_init() interprets its name argument as a printf format
> string. Passing the device name directly allows percent conversions in a
> DT-derived platform device name to consume nonexistent variadic arguments.
>

I read the last sentence of the above paragraph 6 times and I still don't
understand the problem you are describing.  I'm guessing it was generated
by an AI.  Please refactor.

 
> Pass the device name through a constant format so it is always handled as
> data. Limit the formatted name to 31 characters to match the space
> available in rproc_mem_entry::name while leaving room for its terminating
> null byte.

What to you mean by "handled as data"?  Moreover, the size of
rproc_mem_entry::name is handled properly in rproc_mem_entry_init().  What am I
missing?  I also suspect this was AI generated.

> 
> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
> Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
> index e4a103cf8455..6cf33c7b7e64 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  				   resource_size(&res), da,
>  				   rproc_mem_entry_ioremap_wc,
>  				   rproc_mem_entry_iounmap,
> -				   dev_name(priv->dev));
> +				   "%.31s", dev_name(priv->dev));
>  	if (!mem)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 

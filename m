Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715522;
	b=XzHS6/LmDd8+1YKSQ2YBriWVp2RhfSCmk+6Ad96RfjPOzhd0leR38D2Yr2TFV5SV5roK
	 RiU9fHc6ev6e+tX0dw7eNWw2pO8DFYfN3VYJPy3vlW829r9u0wGxQWrdj16M3vBURttiM
	 JZWo5CQL8xlWutD6cxceMNsA+ISE8H/x5qragTZfVly7MPQgGCm1JlHtnPimA2R5Jy4Sc
	 mJcWczr570ZhTubQ3FP/9gDUc/U8aWkmvw6Kj3Jr+M3gSWyS1NFbDrsD40FwVw4Eop5D6
	 pYHfP6jIJyktLxyGcBeETLGJ2LnocZBDnCaSPwJaF15Pe+A+ONZjuqblaJ3BRaoJl+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
	b=EwvCl9wJ0ge+pSCuYGQq8WNAolIFuFCBeV8fQZmNKba5u1SFP91yPHuE07V1F49s6ZDW
	 D/5+nw3fS7mHBWm7aVMyJWzgCrmWjf2MtmqwIyNsWZ5wn3SehOZk35d1jRneKtUk5mfCd
	 Zvgo0pQO6jWQTyyWteQbNOLDwWHcCs420tpGsNyvXIKaYZo4TDylLNEHoeQ5b7rWapQnz
	 tnT2QAxi8E3jevowoXPxlQH6WQneqAK29b+IYIN88b9HdESYx3NL+Ybg/oB4ADbhEbluc
	 D1dmeih51b7p5th94UY72UjAu6H6+8m75TU1q4seKCj0daVC7pwmm2q45CH87dDN/zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QKXbSnHP;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A71606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QKXbSnHP
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f01f296937so54988375ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795715520; x=1796320320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
        b=QKXbSnHP3bdiAbAldj63evXjFjZAhK5b2iAAF1yzbqlGxpFk0pr7gdElglvGDBP8cb
         awdIL8Z9Fjo2ZKPFKkTLMoHBckUeEa9Mb76sRl+zrsjEZaDyidQcXxEkBC67nP8jbL6t
         HtE5Lb+Yzg7oExuhykx4AWBlpSVh4FUkQPji24H46KMJelK+x2/87Nmj/CRJBaqBSJqe
         vYQP5F46lOb0sCA1TKfA7jVP70WMIwW0fyqnUAEZ5SKiqHVwYIwsyYLKeXblL6snS0B+
         POmzm7rfKNjYU+i0cOWKouooJWQPgWikfQAnXfDG8xAOqrud7dgzrks0wKYmQb1tLdOk
         TNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715520; x=1796320320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
        b=ycJVcskep0JIuPQjK4kZ1MoWFC1TX4h2GJ1HxlBVHizPxvpJWGfHhy/BoN4Wqgc4Rt
         oD869M0+maSR80//kFpfnYvhNKe3y5FaSAAzTnTihgLDgglyI5zDwp7SBnS3NCnPyMMY
         w4DgxRlt50LwPoEc9HJSFxhTJ1ImvI+NjM7tVeR1Wtp2PdsZwO3LdafnWl39cmaKhbkR
         oSejpYU0gUvBinIwMgcHKHWONXOjKShF+561/EeaBPC7uTkfnvSimxsNbskmIf9qOLi/
         x17SOsyWkp6MzKDI6SLnPuPTfi9Ivq3FcDWqO9x8Gu9XJr4qonEfRPVsaJIS4roMzzHp
         Xvww==
X-Forwarded-Encrypted: i=1; AL+hErGomTS1ijtr0MM5fDJ6pZ7m7o+WtvOsKHc9c1llCtAAKWlHzZfjJPH7EjaqhxI0rMoRPBM4fBcuLMnlIVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bAcclPGXhHPPMcdOUYQi8dV4q8jpOuoAW0BruRZCLUmmX9TQR
	3pFlBzpMSZEM+U5VjPOIbp6C2zbfxmgmW+mdtAzT826e0w1MPw5sLjxGsBERiHLaLxE=
X-Gm-Gg: AZFdTZf6qp8jQNYV5yc45dyz6wBTa3lWykG9sC+P48R4tJ2V+Bcu1DN20b7xpFmey2f
	+83xzsQ6Er6VzL8JGnxZZDqibAvInjFRxZQbuhQDpLiOEu2dX3uRkvwW8gQsplWp/J++n+tHm76
	JQWlRrznp5L87MbCTqanM6q20/aVl06rP20mRomkIiiTu7kD7vSpHGVJLqCYvOLr4XU2VjFG/YO
	4dQ3W+c+vOCbt4+jBWYbnRryhnegsI5SblFEx+chOACux1JUMTCfP+xhaqQKheEMis2/9EiCnTL
	3x5CdwaZO6wn+1JsVqJ0J8caJY7r2mEYdjm298KHeWA0Q1K/KtlgDnfW/22thBJqJC9raQeUgA6
	yz9QSD0661xgKE8Pr6B5VfcsOq204/pRGyNORoeXuUgr7m3NHU5OturyQK4nmNKRJePV+T1tIfb
	O4/+N7kRr6F4DjRf0eVns0ibeE+Biyc4i1fD3Y9gVPaGleH91K4CclqJQbj+BDqzUBePw0w43W7
	p1TRAaVlx18imVYNAzmMsfcT8XDqxM0A35Tod78BHNu/tFmYN+ciI7A72WW/sEfDMFAcDi/nYhW
	Z2GKpPHnslHn4CiJF4QqXBPsXweba4VJ
X-Received: by 2002:a17:902:f603:b0:2e9:4f7b:affd with SMTP id d9443c01a7336-2f03efb00ddmr238487665ad.6.1795715520260;
        Thu, 26 Nov 2026 09:52:00 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ce00:143c:88b9:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm76723865ad.68.2026.11.26.09.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:51:59 -0800 (PST)
Date: Thu, 26 Nov 2026 11:51:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ian Rogers <irogers@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] remoteproc: core: Format firmware carveout rsc->name
 with %.*s
Message-ID: <awhxvZtW_VCOpdfV@p14s>
References: <20261119170505.1515029-1-irogers@google.com>
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
In-Reply-To: <20261119170505.1515029-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:05:05AM -0800, Ian Rogers wrote:
> In rproc_handle_carveout(), rsc->name is a 32-byte u8 array inside the
> firmware resource table. It is passed directly as the printf format string
> to both rproc_find_carveout_by_name() and rproc_mem_entry_init() (which
> call vsnprintf() with zero varargs), and printed via "%s" in dev_dbg()
> without verifying NUL termination within sizeof(rsc->name). A malformed or
> corrupt firmware resource table containing '%' specifiers or lacking a NUL
> byte in rsc->name can trigger out-of-bounds reads or invalid vararg stack
> accesses.
> 
> Pass "%.*s" bounded by (int)sizeof(rsc->name) at all three sites in
> rproc_handle_carveout().
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wformat-security enabled; fix and changelog drafted with an AI coding
> assistant. Verified with an ASan/UBSan C test and build-tested under
> LLVM=1 W=1 and -Wformat-security; not runtime-tested with remoteproc
> firmware images.
> 
> Fixes: 72029c901a02 ("remoteproc: add helper function to allocate and init rproc_mem_entry struct")
> Fixes: ffa5f9c84810 ("remoteproc: modify rproc_handle_carveout to support pre-registered region")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 23f8539a99bd..1b1743093edc 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -837,14 +837,17 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  		return -EINVAL;
>  	}
>  
> -	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> -		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
> +	dev_dbg(dev, "carveout rsc: name: %.*s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> +		(int)sizeof(rsc->name), rsc->name, rsc->da, rsc->pa, rsc->len,
> +		rsc->flags);
>  
>  	/*
>  	 * Check carveout rsc already part of a registered carveout,
>  	 * Search by name, then check the da and length
>  	 */
> -	carveout = rproc_find_carveout_by_name(rproc, rsc->name);
> +	carveout = rproc_find_carveout_by_name(rproc, "%.*s",
> +					       (int)sizeof(rsc->name),
> +					       rsc->name);
>  
>  	if (carveout) {
>  		if (carveout->rsc_offset != FW_RSC_ADDR_ANY) {
> @@ -866,7 +869,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	/* Register carveout in list */
>  	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
>  					rproc_alloc_carveout,
> -					rproc_release_carveout, rsc->name);
> +					rproc_release_carveout, "%.*s",
> +					(int)sizeof(rsc->name), rsc->name);
>  	if (!carveout) {
>  		dev_err(dev, "Can't allocate memory entry structure\n");
>  		return -ENOMEM;
> -- 
> 2.56.1.708.g77570a6a1d-goog
> 

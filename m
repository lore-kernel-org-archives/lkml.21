Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002803;
	b=sw0pmshFV2RcK95d0TZFKBf+mxpPk9ZmO9XgvLtRg58XLIzNvHdleDzLSfCPZnbvvQ6t
	 PoDAmB1pcfwt6+IO9GUQlCpjCt9KJVgg/MxWlckw+n+ZU+rMx1GYj3/VXCEP2jHSUkYcf
	 EcJ2P6bbiTY6FvefysIUQdLckCqW8ULBTWm8rE/TyXAV/4zrApJjdiTTPuses3A5jIB9Z
	 khGWCuP/Lf8S/NGyD7g9HX2qdLfNx8vc3/v2Fc9pWlJdga+25eW11wkFGU2WqSFlUsxtI
	 j22WubmSx9C41YJdFSwGu2iaeu23fMxMVj9ibSVCmiqRrVMYlG0Q5an8E8+jyXwKCoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=8N9FZyOEbyiUWy2rIi8L5t2k68c/Uas6jnWB07vla6Q=;
	b=dP3ND2CJXSwg483njd0dKIb4idQE4VhcyFcj6AN0cPZTRuz+ybZjfrJtgjSOk38A8Cr4
	 BwPpFyCxlAzxDAkNggTdISr2xMnobdK/JEfMR3yrahj53hoUQ4MxFmcI3lXQUvSYUxsi5
	 1ATvQvwN9THhjo8BK4toBFiaqS1CuL6J+rT+sJSj2X82G6VvEYwarahJmdvPNbNKtzoyu
	 M8kAaRdHSKUJd6Mo6NHEUUUi148rOfZj4+nt3xIwc6OyBXDtfAwgp0uycFPtrMZOSdBbf
	 O2dFaMVWbT8pLcVSmQdfTUvZB6A9eAD2hyO3sP/z45xdDyi2xTNz/LyFQlI0eum6tcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ3Q2pSa;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9A4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ3Q2pSa
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so1583984c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002803; x=1795607603; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8N9FZyOEbyiUWy2rIi8L5t2k68c/Uas6jnWB07vla6Q=;
        b=eZ3Q2pSaW/sllzbZcVB3B1+WG9ZrQ4z/CH3kn9CJa4aED8iLqX+JQE76Z3NgE6s0yI
         ZBwInpRiejQZcd7MP/YjsXaED37KqZF0LLDfVTUGfw4Yx5/KEn7qK1XW6E97qQC82pFJ
         15Dvt3Gq/mazhxMBmwfgz7Ng/W9ojKU+2JI/qs9gnUEi6rBm8XwQbOMK2cgKPyg013jy
         W1vy1jnt30c1prtZwJT8v26R+W1h1YB0Nq3usflRO+najVCAYmFIJvH2S9AAVW3nwA4C
         JEi7w6LFdQhDh/eTm6WpLWKJgQ2R/i+sL1tUkzG5sqVDnslH3JMM6I2mAifQdt56P9rO
         AYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002803; x=1795607603;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8N9FZyOEbyiUWy2rIi8L5t2k68c/Uas6jnWB07vla6Q=;
        b=aMpeff1sBBLKdKEmEPn5UqTVJqtQzFF+Nv24QfXEBpFqWXD5QseI+pYYdd4cOfsSDV
         ubyx0PRpCI+ARW2Ki65JN7QV058XFuSvAFJ5JI7ZZm8QtRvfsz0xawkYsGOFw05CsCik
         v+bjIaZqr/3y3vgma8VnIdeD9KYkBimEiS4u0WdeK4RY839eR6nqDI3xOFXK5IZj5SU7
         RedQC7LbGWvQOUVpI1oM1dTAW/MbD8QWaMCPaCjn5WHKz0xgghWoIDB0U/SOVw9Oq+E3
         ae/WQwtPs+DvtNYP7IYirGt71GA7bqWJ2uIESCbwO7C5+Mxqn2d/ypiskz6101VuezBW
         M5Kw==
X-Forwarded-Encrypted: i=1; AL+hErEq9I65TYidyrdyUYvuRdhIq89zlWR41R4TUegvJfQ6YsbMBYwv3lxC5M1Cpd+x2IJyRlpmcvBOZAaadVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A7FOpuWCVqaRr7MNHE+/nVmkPx4oxd03wHjCZG/lU8yitvMQN
	o/+/63pI0Ns0LjxbF5sKr3Ew/HdWH30Ysecf2MgHJoNmtWTHRwPohksAuad1EQ==
X-Gm-Gg: AYBFou039Ye6ItjQ5ekcP4kx/ZJysocLghMwZvFhRaYIgWCBTc+TohEOixFlxVn/JfV
	RV1q8543bXVLfvEYTQDxmbyI/9InWGfTCgb60Ez0BHtAhctRJzQ9EsHLomf72B86E+MVcWr88Mg
	yq+KOnT0g5VnZf3JJ25A4WGn3ZOG1bM1iQ7+RyDimh5+AF5dUQwP+q9jeym34I25zi5YyMNXFgw
	L2FCqyJ0qJNBllyyFl0bk35H9BW+iiIu66gx1qAC2JWDCeBzPUglPcgJcrdBRQrxaFNHI/bfR0b
	skBLfEQMCkxWby0rziDzcOJDsHD4fxsuwybKOkb5+JBh/cytMvYOZ0QNRbopKyeZUjPp8h20LXd
	34alrf/LzUa4tjnr2chUJskvJSAzcTI16p+LpbL50VnTS89sK8ZHO70Elhle+wieQv/vV4jYDkp
	X/+JrtbKIG1qfeF6tafP6N7sa0zGjxrllxPXK8fl84iFSf0Se7qwZFiJ73aozQ/aw4jxy/zFufM
	FvdzZD2R+u5MbFyxodJLo3e8lEv+0w4WBdfw2LlWG0yE6EH2rmC5sC29Lpa8puNrElNt2Yt0MH6
	cvGVwyPCjpZsSX86PvZAg/3uOP7HPJmQsab7M/22NQnJEObH
X-Received: by 2002:a05:701b:2056:b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b543cf2a7amr2077988c88.16.1795002802386;
        Wed, 18 Nov 2026 03:53:22 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm9120829c88.9.2026.11.18.03.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:53:20 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: mdshahid03@gmail.com, maddy@linux.ibm.com
Cc: mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Mohammad Shahid <mdshahid03@gmail.com>, Athira Rajeev <atrajeev@linux.ibm.com>, Tanushree Shah <tshah@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf: vpa-dtl: fix resource leak on allocation failure
In-Reply-To: <20261112134455.6880-1-mdshahid03@gmail.com>
Date: Wed, 18 Nov 2026 17:02:01 +0530
Message-ID: <ld6q74um.ritesh.list@gmail.com>
References: <20261112134455.6880-1-mdshahid03@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


mdshahid03@gmail.com writes:

> From: Mohammad Shahid <mdshahid03@gmail.com>
>
> vpa_dtl_event_init acquires dtl_access_lock when initializing the
> first vpa_dtl PMU event.
>
> If vpa_dtl_mem_alloc() fails,the function returns -ENOMEM without
> releasing the semaphore.
>
> Release the semaphore when buffer allocation fails and no other
> PMU events are active.
>
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  arch/powerpc/perf/vpa-dtl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
> index 3e3d65b6c796..20eafeaffa6b 100644
> --- a/arch/powerpc/perf/vpa-dtl.c
> +++ b/arch/powerpc/perf/vpa-dtl.c
> @@ -396,6 +396,8 @@ static int vpa_dtl_event_init(struct perf_event *event)
>  
>  	/* Allocate dtl buffer memory */
>  	if (vpa_dtl_mem_alloc(event->cpu)) {
> +		if (dtl_global_refc == 0)
> +			up_write(&dtl_access_lock);
>  		spin_unlock(&dtl_global_lock);
>  		return -ENOMEM;
>  	}


I looked at this code and I am unable to wrap my head around it. We have
dtl_access_lock and dtl_global_lock. Then we have vpa_dtl, which is a
per-cpu variable anyway.

So I am not sure why we need both locks held while doing
vpa_dtl_mem_alloc(). What exactly are they protecting?  Can we move the
allocation out of the lock and just assign dtl->buf later within the
lock?  In one other place I see dtl->buf = NULL without any lock.  Also,
do we need a spinlock to protect dtl_global_refc? Would an atomic
variable not work here?

The above fix is not wrong per se, based on today's code, but it would
be better if someone who owns this code takes another look and fixes its
design while we are at it.

Another motivation for doing this work now is to bring in clang's
context analysis for arch/powerpc/perf/, which can statically check
that such locking rules are followed, provided there are proper
annotations for every lock and the data it protects.

-ritesh


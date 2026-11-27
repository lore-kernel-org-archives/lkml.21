Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789750;
	b=BLoYWVnv3mZyVarcALyEVyBoqpdEmn89sAOtr9Am+Sk3HkfY0FJIMAE9MtCfAdnHCKDd
	 PlrfLpnFrot6MtwzOZy+eGXirq5yiU8Fbr3iLaWvTl+Q+/lWvkVZ/vpeFpOvSW1lBzNm+
	 iCI4qJnMcjU8Y1yeOO1sGpRT+z7C8D//AkzxvPI1IXkS3dJBIrmtkzA3sIm5tsMqqOOQS
	 nWliCCzWJ6+T9r+KOI53WyYSG06kMqp8SVN44MXAOxQHUkdk1vNhL+AalqF6H5Zp+tVN4
	 8WZA0UzXR6tvyVKjh+1j4HVt38Y3cGV/kowb3rbeRC8dE8Y8VibCU18M0k6FnmvJstA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=dm6cr41faFC8ArIx047bjmXEdHglWtT+kfMScNTGFvA=;
	b=NDcfb0TfqHCUBcuWOioZRnLcgtJw7wYfK3xFiQhlhWJpHEzDNHdXj2Gt1duyPd6HsTkN
	 xZwGEmlT1dd3pBayKSIX6Ia+tiA9r7/M3jTPHLJSXXtrWoionnbVc8JU1NL2Xla2/XIDR
	 Fn+aqG9vQDSTk3sadkZk3k8scLpxMeDPL1Y2WtmWUjj40lCBPHehgQebRukKOrQleoBBT
	 N1iT2Lo8yc0XEq/kNqkrc857G2Y7DGU7Y49azqjqm2SHBWu0l1LRcTT8Qp8nPg3eFrvYU
	 s3Lhbk/NJ0irapuPStIxqF5zBnc1q8fIpbS0VWO0UAODD1o3EQlWkuzQc56dq7s+EsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTzvOrNF;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FBF6070F5D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FBF6070F5D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTzvOrNF
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so12171439c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795789749; x=1796394549; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dm6cr41faFC8ArIx047bjmXEdHglWtT+kfMScNTGFvA=;
        b=gTzvOrNFvhK0STCGWJLm6GIpHLn1mPTWmnueSCdTgmPwePHg/bn+713K7/zOTnp8CP
         +jlGBv+RVcOWn70jW+tJTqv23+vWRHYRWDNLoPrO4BwWPwCK0ZqF6TmwBFKSR/ZI9StF
         5jKFP5XPgu/JkbAEFYFtcXe4ZI+oMd9bCLkFaQrYvA6Bu8ogtoW3Pjix5i8dCrh7i5MJ
         DzkQRyi1DoypwH9wS5kgYdIPXntMMPJsXtfKXe9+Z40L63C6OWLFNENc7VWnArHoiU0R
         QO8ihRl0k8AW7RK+JBaeA6ODH0EMOS96WZbrwPZwKWA2wpzErzaOnZf08Oc2FRAqaqpy
         ADFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789749; x=1796394549;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm6cr41faFC8ArIx047bjmXEdHglWtT+kfMScNTGFvA=;
        b=J1/6Qft/cehSv8UtjurFJVEXri9r+bNUN7tE1w2QVrKTf85WdkqQDdmtnQ0GLbYYx1
         OlM3UeCF860U6ECzGLCrjRG/e7g7vKEAvoxcrEl9HHs92lUJn+sKBN227DVAoWHaInB/
         kx7Rpn/JOTY5YI6ixDhBeZhMu72O+LpL9PoWiG9LE7lBOPr1dhJqMF72G9hVYvcZiRRr
         g97g4ohDD3h/kahtN5NjUQsIF106E0lmh1B7tjA/J3zte8zVonjQtXPZXRA6VLkjIXPC
         uiUJ3wrhu8LFtuwd2YRizgf7oOZE8JJm3J0mhrlLsS8nKCLiELwSfNjIJVsBRm5qHAAp
         UZ2A==
X-Forwarded-Encrypted: i=1; AL+hErHTNrff20KroB4occRcaiu1n4qVAJGXfLSpHHuTMeuDTy2yj0ILbYvGl3GAq6j4rKoAcc/dAC2/dPhgg+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j8YOwrydzsCJ8bNVLirm50wTfUfoazR0vVanbk1bjJLcgcszB
	+0/BkqGSsfhq6LlYsxUqISfZHi8ZqD/eV1Ob08UWe3yH+295wk36ym5Q
X-Gm-Gg: AZFdTZf+S4cy6MxzJO/KzEStTamh1LdzVp72N7Pd9wstjUwn69xQNeueQPX1mArbC6q
	f5/5Zy5ccj7QEoDQ/SKgvEWEJc7uYoDBYlRlJ/iWpLxX0H/hRqVgATdp5mVS2x00EpPtpiLsbPt
	V5aJSJaQPQfXYeKarNVuTWwuJbmaBlyGpD/KcTy6mf0gjug7KZp+Mtj1scT2JG9QX9idr/zZVG/
	T0ohddzl2zX0ZgErRE1EpI4lcBlTyeeFe/mP8pK0HYq1VP0pSYWbX4exQJMGS9uVnS0IhEaHUgP
	dO6qD4ipyhbSs7b5CqO5A/VUm4oRtizWLoi1WWndRKJBJh0Ja/ghVkep4O0Qawx2aaQfOiHconD
	2fWM5J136/8qUaynPqgcIhzwgGzzVnBh4mrUtpUqw0XXMYGaAK9kWS8fJgjj7O8BvHGkcE3FcA3
	/WzD/xrEMy1Yu6JeKCYSu1xr8rrO5eN2F72f7hN+xzL+MkPJeXTgL/ntBUP2h9/zrXllhEcWtUx
	2fJlvocFX2H39hqWpptvpGcXT/jdxzxMh+ODXiaZtNRIdnobjZKgp3w7uXxLZrdY2qKJO2A89sI
	9r+hckqXrEE+1sBC7y/HA5O+GK5nqz9c+UbcrEd9r9mRFL2Uqw==
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr27107990eec.2.1795789749052;
        Fri, 27 Nov 2026 06:29:09 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm78273881eec.14.2026.11.27.06.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:29:07 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: mdshahid03@gmail.com, maddy@linux.ibm.com
Cc: mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, sshegde@linux.ibm.com, atrajeev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Mohammad Shahid <mdshahid03@gmail.com>, Tanushree Shah <tshah@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/perf: vpa-dtl: fix resource leak on allocation failure
In-Reply-To: <20261127052345.23361-1-mdshahid03@gmail.com>
Date: Fri, 27 Nov 2026 19:46:53 +0530
Message-ID: <5wxiwe96.ritesh.list@gmail.com>
References: <20261127052345.23361-1-mdshahid03@gmail.com>
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
> vpa_dtl_event_init() allocates the DTL buffer while holding
> dtl_global_lock. Move the allocation before acquiring the spinlock
> to avoid performing memory allocation while holding a spinlock.
>
> Since the buffer is allocated before acquiring dtl_access_lock
> allocation failure can be returned directly without releasing the
> semaphore.
>
> Free the allocated buffer if acquiring dtl_access_lock fails.
>
> Fixes: 4708fba19ade ("powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf")
> Suggested-by: Athira Rajeev <atrajeev@linux.ibm.com>
>
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  arch/powerpc/perf/vpa-dtl.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

I am unable to apply this patch on any of the upstream trees.
Could you please rebase your patch on top of powerpc/next-test [2]?

[2]: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next-test

>
> diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
> index 20eafeaffa6b..57bc5773949f 100644
> --- a/arch/powerpc/perf/vpa-dtl.c
> +++ b/arch/powerpc/perf/vpa-dtl.c
> @@ -338,7 +338,7 @@ static int vpa_dtl_mem_alloc(int cpu)
>  	if (!dtl_cache)
>  		return -ENOMEM;
>  
> -	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL | GFP_ATOMIC, cpu_to_node(cpu));
> +	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL, cpu_to_node(cpu));

E.g. in this commit [1], we already had changed this above allocation to
GFP_ATOMIC, which is even merged in mainline. So it seems your base tree
is old. Please rebase your changes to powerpc/next-test as pointed above
and resend.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9500416c8aa7c271b85be6a0d5856da62b60223a


-ritesh

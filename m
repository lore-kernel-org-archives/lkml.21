Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453231;
	b=PK0l+JXIZMkLeSpK1Bl4gb3HxntjLBBmUPy96ooq2bt8v/59c36La/YrnDh4GCMnPkft
	 rYyOcy9sVcnX3RW8VAvD3HJldQ+/r7EogLXSLjg0Mg589MFbidfvtEtAkNPd6NCapzrtD
	 QB0Jbw5/5QQKRUpJaK39Is1iLaOk8BEnhm56r61cmkb9MJMqmtDoAcu3OzPQpcIs8gAK2
	 6vC7UuMtqaTTIPZgsoqIiIguSBlxIjnUAYcDLEAtc/+L+rORDtmA7ysPUFBl08MsERuBv
	 M1SGTm8slBVa5JI+MeSZkpC5+z6XsXfXJRr3BkSNoCf8bklf2LAGDpLVLQpeZQas0Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453231;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=p2p3ypsEiTb7jEINNh57+xS6Ae57sSrLVt1+Kb4/7Xs=;
	b=vuZZH00s0wJDACG9/SKwYRVYkvf7aTVC85yJh3QAQ0uG6hJnnsGffEsoCYxJUrF0CDkv
	 Ob/S4Q/CwHSE8nBbJBlQd8zQO2jGDmGCI+kG+7mWeCexX9Fk1MerIXLithjY7fVRQ0L6H
	 B/uW2ekmhDKuexRb4zfCmsR87Fx+4N6WVk6hy0snLfX9mgXTc0GT5JDGNqdz6xP5PMrtU
	 Svdijl4vbeOjqhl5sewX+0rHua23VPOzBxtpnDeDnRsSh0dXz991j/PS7rUPXLAjZRwR7
	 ElivphY5kFZFhNF5G+mAZSj3DQI+PoZYjBRW3IkmOk1Xi1+/EUP543UAw0txIDQDlkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jl3c52aD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=m2OGPhVN;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4AD606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jl3c52aD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=m2OGPhVN
Date: Mon, 23 Nov 2026 18:00:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795453228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2p3ypsEiTb7jEINNh57+xS6Ae57sSrLVt1+Kb4/7Xs=;
	b=jl3c52aDrcMFVZZx/9g7HjBW8cKlyg0nOZGVsmOYvXPbIhrGoEQfbkWx8xmDNZAJeGHubR
	+I5daLxu+sEkmGKL9+1KXuLfWUso1U4KzZvAarslzaPa5vwHVPIfs/LBpegbkxdrtDmR+e
	sVAE5EGrIdHNGxF60rRIFPm1aiJWQGGmipi8EUuhu48Ax+cR2/QHQTGWAxcpVY1RMHZfUY
	XpIDJxygvd09W5kUE9+c3GKPRnlJVjIhxyNDm9nDDau/YcL2UOuWjX7SCuq0uYdF1Lt8Rv
	HcuV1KSSUA7XOrTWKib2uRRUzD4gAj40gA1e51vG9RPsVQaeXi+XeaSXUK3/og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795453228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2p3ypsEiTb7jEINNh57+xS6Ae57sSrLVt1+Kb4/7Xs=;
	b=m2OGPhVNP/Gj1Gl0PFcOAkGBiOWvyc1Ah59Iu2J5/ixUNvEpHqaGcetKHW3kpAmWjRj5nI
	YhUd5QS09ZaG5UAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Yiyang Chen <cyyzero16@gmail.com>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>, Xin Zhao <jackzxcui1989@163.com>,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] softirq: Limit the BH count warning to RT BH lock users
Message-ID: <20261123170022.MaJ0oWIE@linutronix.de>
References: <d9554bee441d2c763ef8d61e966a7a471915bbee.1795372382.git.cyyzero16@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d9554bee441d2c763ef8d61e966a7a471915bbee.1795372382.git.cyyzero16@gmail.com>

On 2026-11-23 02:35:47 [+0800], Yiyang Chen wrote:
> __local_bh_disable_ip() warns if a non-preemptible task first disables
> BHs while the per-CPU BH count is nonzero. Without the RT BH lock,
> this check can turn off lock debugging on a valid call sequence.
> 
> With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=n, the following sequence is valid
> for two tasks on the same CPU.
> Both tasks call the BH helpers with IRQs enabled. The per-CPU BH count
> starts at zero.

This is slightly confusing the diagram below. The key point is that the
first task is preemptible, disables BH and second task is not preemtible
and does does the same.

>   Task A                          Task B
>   ------                          ------
>   local_bh_disable()
>     softirq_ctrl.cnt += SOFTIRQ_DISABLE_OFFSET
>     current->softirq_disable_cnt += SOFTIRQ_DISABLE_OFFSET
>   <preempted by B>
>                                   preempt_disable()
>                                   local_bh_disable()
>                                     B's softirq_disable_cnt is zero
>                                     preemptible() is false
>                                     WARN on nonzero softirq_ctrl.cnt
>                                     softirq_ctrl.cnt += SOFTIRQ_DISABLE_OFFSET
>                                     current->softirq_disable_cnt += SOFTIRQ_DISABLE_OFFSET
>                                   local_bh_enable()
>                                   preempt_enable()
>   <resumes>
>   local_bh_enable()
> 
> The warning relies on the per-CPU BH lock serializing BH-disabled
> sections on the same CPU. With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=y, A
> still holds that lock when B runs. Since B is non-preemptible, it skips
> the lock acquisition. The nonzero count then exposes B entering the
> section while A holds the lock.
> 
> With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=n, there is no BH lock for B to
> bypass. The same nonzero count simply records A's active BH-disabled
> section, which may legitimately overlap B's.

Correct. It used ensure that the lock is not taken therefore no
"protected resource" is in use. With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=n
this is no longer the case.

> Guard the warning with CONFIG_PREEMPT_RT_NEEDS_BH_LOCK for as long as
> the lock is optional. If the lock is removed, as discussed earlier,
> the check can go away with it.
> 
> Link: https://lore.kernel.org/lkml/20260310115534.3477871-1-jackzxcui1989@163.com
> Signed-off-by: Yiyang Chen <cyyzero16@gmail.com>

I agree in general. A fixes line would probably be a good idea.

> ---
>  kernel/softirq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 7fc2200392cd..f64f6b594951 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -195,7 +195,7 @@ void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
>  
>  			/* Required to meet the RCU bottomhalf requirements. */
>  			rcu_read_lock();
> -		} else {
> +		} else if (IS_ENABLED(CONFIG_PREEMPT_RT_NEEDS_BH_LOCK)) {
>  			DEBUG_LOCKS_WARN_ON(this_cpu_read(softirq_ctrl.cnt));
>  		}
>  	}

Sebastian

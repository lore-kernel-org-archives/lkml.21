Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583977;
	b=T39iw0/7HNEq06LBpgcHYToN0AlrP71Jl9OULHmgn3kVbaPVtheHkVGUnAIoL9lr8RaZ
	 wm0nnlWnHnw+EO6DdVEQ3sABhXgU2I4dZD0vFkym97zXeTGu2YbOLlIv5m/jyF0Ql3DCS
	 EPJF9oGyG5i6+ta5/nAcg/MKzitHlqiYEMPoTw4N43SeRBk7jb7mRzMxNj5iZvuVj73PJ
	 QT9aQpLGftGSh7YriF4WnEc9VWyfUIRLc02j3ORsGEjPxWcdmsCdTeR7xRAXuQIdLy3xQ
	 bljFK0287QNwmx3PMILd5Q6tBafPbQFF0c2kUAIq9h7uAn4U9Z3rRe8Y2SUa6hrg4lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=++Apgl37kjRYqQpIi3d+LCDkwVVawhVRcSfP5lZmBu4=;
	b=w2zvObLDxC6XEjDHl5/pM+aOapBjbcjUO/vWN8FRoWfYjrp6hTaTT42D/X978TzWWRIf
	 Ir2/+yWIMd9cDdFwr6BcqzLb93SZQOrhYeF9I6q+w/ywo3kihh+s8BiqwGwu+eldg4+F3
	 1eaXaJLEed6EO1UOtvIIywN/7IdEQjZ4ZTSa9PMVgJ06S8wJJQRvCyG9wEe3f3VMbppE8
	 AOX+Y9SUETOfrH3s9FQ6kZ/FHNX4B804q96yzkhhv051vcmRTVriINoQJrPLJuvw8CLBq
	 16K2lTfLvs+br5zQEfc2xdWuE8gtI5HrUJYg93Ia8c1Om2TZLwC2Dqv/qGx1gHsYL2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4zvXCto;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EF6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EF6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4zvXCto
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0918f9e6cso12685265ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795583976; x=1796188776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=++Apgl37kjRYqQpIi3d+LCDkwVVawhVRcSfP5lZmBu4=;
        b=B4zvXCtoBOViByCN556STozY1uYwuOqmuuAFuNCP83vFOWrHSwAI/cTs/2smjchkAi
         eodtznUsfheJOLv0U7VrmM+v7TNK0kxYdSl7GDVft7X7Pau3ncZsYHCaIKE9JO1QLqAX
         Iqaun/nO8h1Kl1Az/j57TOas3TbTMkHTYYvcJNQQkmyBcuDfPeoEQerK3Kl7152gJBbv
         jUriCaxlDTZhM2MYgVrvXj+Un2PbGaRh8FcLCwjXNI5dYByM3DvZl2Hr/CB4jvNPtIGO
         DcCO5RlS3yT+Tx6VkvtnKRIkn9wGb+ucfA4NnDBNxWG4J911Fh4f7T9WnGmW5jfrYCza
         3Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583976; x=1796188776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++Apgl37kjRYqQpIi3d+LCDkwVVawhVRcSfP5lZmBu4=;
        b=vDIixQ+aLusYUoyJ5qZpxVCvjSu59DcxAhDbNRiUUvgPqJ7Nh2dlUD72R6ARO/4Vrt
         Olovy9Scl+Q3Clp98RjqxqGGZBkVAUPAO3HlVLJyi/VW3pwjWCR0A0uJGOGv9sdWPPUr
         9xV3zUjCYd5YbCUqGirOamUyPisb2CXplfFORW0u27wTU3CIvL+XqDtJ+f7/SttD3tKw
         qT29tunm832ijI9tqLblnL4rOPTUA2Wm3Io2LwPvSeXcpSSMzEbiK2KvyGseFUR1W78O
         rAeFP0SQRo0v5qooNRphndMl9cdd1ktT/FkwQ1qAjN4mt4RSjq0ebQhklRLyhTBke7G2
         A/mg==
X-Forwarded-Encrypted: i=1; AL+hErFCwKqoUaZpvCpD69Eq2iTkuBrLJxx/foKxfmYGldHQkBJ4LLh0wPU0IKCNbt/N4Z/IN6wfl8cl7uGZzUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pdWkgmWlGFJ362/0CNhe4KwyhFwprTTQzILcU0tJpQB6DeX5x
	at8+Cv9Ko1WWrzS0VUaU2sTScGDY1j3HvBpNs39sDcqvvJn1T+7KzQ8j
X-Gm-Gg: AZFdTZevyGaYq3CbIk1C5X2DG/D96WrvUbcniqH3DxJDSxOQZCIKBmtNUxV0cDXNDeP
	O8oUZDzg0N18O1U7yTEOpH4EcoOv/C45mexiWIN+avIHj3YM8MN8CEZfyl7H/Z/9DX7Qtp3/KMg
	UzTO13k0ikh6y8O+UF7csriahDBfQcBkS023kIHxoX2pPk7tlOdd/NxK2rPw1+uuOKJfM7IM2Yr
	Tp/xmbbhBcRBHNcrMv0sjVT1RgOBOI0jqKIIVLQJgI4zk6uJqWjRWY4MqbcRNFow9JAN/vxUBnk
	O2pYLkyl+Cn6mKQxnNUCz4pIPz8cnb02QvaypL56NNBapdnqiQHIQs/T9oVZZfb2ISoE0q2BRpy
	xls0X90g6ngXDF9HYtAX3wDc0/Tw6TdwHJc00094MKvcnzWzJNelbJIs4ZG5e0nrh0HsGs7Jp/O
	dUmq+HD/sfLXsobeN/m4kUHuV0jq1tshjf+HnCvieW0Mu9+LUZehgNYZAbzCgVonur/54as55Jx
	FU0pkNUT2oRbYFYk8tv8o7wcpZdkk/J9CMmLT1cdb6UbrCc4ZRkxH1xXH58CBkt2Ssa9CesTyNZ
	GytHynkP1B0uuO/u8qwVeSRoGEexF/VuZRco835+jXVyVxdCjaeFWeITd1KNayweW2GXzad/4Gw
	B
X-Received: by 2002:a17:90b:288e:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3b41c9cf219mr14157411a91.26.1795583976121;
        Tue, 24 Nov 2026 21:19:36 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.51.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm10183348a91.10.2026.11.24.21.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:19:35 -0800 (PST)
Date: Wed, 25 Nov 2026 10:49:29 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv3 1/4] powerpc/64: Leave lockdep hardirq context around
 replayed interrupts
Message-ID: <awZuo3adxt0d77KH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <cover.1795441238.git.ritesh.list@gmail.com>
 <57a5455331a768ffe7d66409ea228d31e9ec1edd.1795441238.git.ritesh.list@gmail.com>
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
In-Reply-To: <57a5455331a768ffe7d66409ea228d31e9ec1edd.1795441238.git.ritesh.list@gmail.com>

On Mon, Nov 23, 2026 at 07:21:50PM +0530, Ritesh Harjani (IBM) wrote:
> With PROVE_LOCKING, boot warns once and lockdep turns itself off:
>   DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context())
>   WARNING: kernel/locking/lockdep.c:4448 at lockdep_hardirqs_on_prepare+0x22c/0x2d4, CPU#0: swapper/0/0
>   CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc2-00027-g074831f06e18-dirty #123 PREEMPT
>   NIP:  c0000000002b2f2c LR: c0000000002b2f28 CTR: c000000002426f90
>   REGS: c000000004f075c0 TRAP: 0700   Not tainted  (7.4.0-rc2-00027-g074831f06e18-dirty)
>   MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 48022221  XER: 20040000
>   NIP [c0000000002b2f2c] lockdep_hardirqs_on_prepare+0x22c/0x2d4
>   LR [c0000000002b2f28] lockdep_hardirqs_on_prepare+0x228/0x2d4
>   Call Trace:
>     lockdep_hardirqs_on_prepare+0x228/0x2d4 (unreliable)
>     trace_hardirqs_on+0x98/0x11c
>     irqentry_exit+0x64c/0x1064
>     timer_interrupt+0x274/0x6bc
>     __replay_soft_interrupts+0x158/0x380
>     arch_local_irq_restore+0x1cc/0x244
>     console_flush_one_record+0x438/0x654
>     console_unlock+0xb8/0x1e0
>     vprintk_emit+0x300/0x56c
>     vprintk+0x20/0x34
>     _printk+0x40/0x54
>     lockdep_init+0xdc/0x104
> 
> The warning is triggered because trace_hardirqs_on() gets called while
> lockdep's hardirq_context still says we are handling an interrupt. To
> fix that, we need to ensure lockdep's hardirq_context and
> hardirqs_enabled state stays consistent with powerpc's soft-masked
> interrupt replay code and the generic entry/exit code.
> 
> With the current change, this is how the new state machine looks like:
>                                        hardirq_context  hardirqs_enabled
>   arch_local_irq_restore()
>     trace_hardirqs_off()                     0             1 -> 0
>     irq_enter()                           0 -> 1           0          (softirqs held off)
>     __replay_soft_interrupts()
>       lockdep_hardirq_exit()              1 -> 0           0          patch: the loop is not a handler
Yeah this makes sense to have it here.
>       timer_interrupt(&regs)
>         irq_enter_rcu()                   0 -> 1           0          handler starts
>         irq_exit_rcu()                    1 -> 0           0          handler done
>         irqentry_exit()
>           trace_hardirqs_on()                0             0 -> 1     legal: context is 0
>       next_interrupt()
>         trace_hardirqs_off()                 0             1 -> 0     still replaying: back to off
>       ...                                 same for each pending interrupt
>       lockdep_hardirq_enter()             0 -> 1           0          patch: restore for the caller
>     irq_exit()                            1 -> 0           0          softirqs may run now
>     trace_hardirqs_on()                      0             0 -> 1     IRQs really enabled
> 
> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  arch/powerpc/kernel/irq_64.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
> index d5c48d1b0a31..e2f1e5b7a3a7 100644
> --- a/arch/powerpc/kernel/irq_64.c
> +++ b/arch/powerpc/kernel/irq_64.c
> @@ -76,13 +76,11 @@ static inline void next_interrupt(struct pt_regs *regs)
>  	}
> 
>  	/*
> -	 * We are responding to the next interrupt, so interrupt-off
> -	 * latencies should be reset here.
> +	 * We are responding to the next interrupt. The irqentry_exit() of the
> +	 * replayed handler has traced hardirqs on, which also reset the
> +	 * interrupt-off latencies. Trace them off again.
>  	 */
> -	lockdep_hardirq_exit();
> -	trace_hardirqs_on();
>  	trace_hardirqs_off();
> -	lockdep_hardirq_enter();
>  }
> 
>  static inline bool irq_happened_test_and_clear(u8 irq)
> @@ -116,6 +114,15 @@ static __no_kcsan void __replay_soft_interrupts(void)
>  	 */
>  	local_paca->irq_happened |= PACA_IRQ_REPLAYING;
> 
> +	/*
> +	 * The irq_enter() of our callers is there to hold off softirqs. Each
> +	 * replayed handler enters and leaves the hardirq context itself and
> +	 * returns through irqentry_exit(), which again traces hardirqs on.
> +	 * Since lockdep only allows that outside of hardirq context, so leave
> +	 * it for the duration of the replay.
> +	 */
> +	lockdep_hardirq_exit();
> +
>  	ppc_save_regs(&regs);
>  	regs.softe = IRQS_ENABLED;
>  	regs.msr |= MSR_EE;
> @@ -168,6 +175,8 @@ static __no_kcsan void __replay_soft_interrupts(void)
>  		next_interrupt(&regs);
>  	}
> 
> +	lockdep_hardirq_enter();
> +
>  	local_paca->irq_happened &= ~PACA_IRQ_REPLAYING;
>  }
> 
> --
> 2.39.5
> 
LGTM

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

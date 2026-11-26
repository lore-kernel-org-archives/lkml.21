Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670344;
	b=JP1xiItTNqiUcXipmtDRiPnJPfxAzIQK1z7ZFMlL+FaM7RPyYSTLmIceWF5vQxI/XvO5
	 z+jYJxFTlduK+bwvERGB16DVasf5nWhmZKzTs+IpcPcodn4AMo4O8cm0T6EUZalmvWlnw
	 LR/mGTEZsVy35tcLKhawl2jFNvU9UrGE90FF22Fm2YfPLkiSgO0aa/f8rRl591yY7UPxg
	 gknIVt9Jngw+xd5jTZBYBm3BW6K3jmkVMcUn76uNcIZSXRLLlPT9jfRUQkiFpoF5sQOaU
	 JUolRVSUE7jV3aTc67aeXj3K8Q4d3NWV1cX7Tf+sFjDThADfjRgC3Org8mmZUtZ0e6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SmGwW+D3JztXCRa1pJ0AYwGqb4CeC20tVUU8LlpmFso=;
	b=JIsaqoQuCb0d6ALsX7nIH5AbhSVv5P3vezzDXxhYu7Q3HWQj4BGC1ENUoBt+XPQzH6Ru
	 cSIFG7SquM50ahBP9mYVJZADx29OsWtXRKSlvlBfHgf8uSKtArXTfktSRYiiWRHIY++NA
	 W4sHmZABTFrjdJZX2A3slucgD+5BUI/E8EoKAJ9IpjTX9eHYPaaJi69+OjTkuIPS/PhEz
	 7jHTqJCgKP35xTojn7540zoxAfONFuKsNeqTuhwmgRMH3r54UcGZN9gYLo5LTI5hUJXBJ
	 icOkYEMREaof4caC44A8C54MdP7J+/6YO7bKHc5B0F0lsa5+Rsut5WAM746r+AeIFiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvLXsUXg;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C935C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C935C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvLXsUXg
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so4017154b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670343; x=1796275143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmGwW+D3JztXCRa1pJ0AYwGqb4CeC20tVUU8LlpmFso=;
        b=AvLXsUXgPkiTFjjNz8ExKpCzuWQOTTx4zxsjwC/fv/6N/rR1UfIKtMPDIU4eas2Slz
         unCi+qGyHXdP1twnq3Uvcic1XmO1J2mjvSURYAELvTWEXJ/AuJs+lbhl4vQd6nnbAMFp
         7TY2ZzHzWEQfddk/tTrhBS2ulYwshGlqq0+UGW1Re7pC/XZRvKc/A5eqmW99R9OsArDW
         DkwFabTJSZWPIDnI+TqhMHv+2x0UHGx1korASFJ9VroK+MaLz1U/6DvprWodaDqhyFiV
         hvCGemXZzCsOHbXNpb4nW2aXQuVahtVMP4aVCjtVdOr911iDeC+HD/GBMZ5P67M2zFq4
         svCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670343; x=1796275143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmGwW+D3JztXCRa1pJ0AYwGqb4CeC20tVUU8LlpmFso=;
        b=ch73OJhc7p/PdKU6cSb81defxS9WIE643OvwZyOKPlr5EymBbw/6ZrxwXxacs6EX2X
         dSf7f2tQg9iEDW17Rvv209kcxCNTfhsTg4+hBaAA81YAFdAHZFgOBEoCiBgfrf7jZfQa
         SMxhqWhO7tSj/6jMbu/3/BkrULbtrwSiFDU77UvA5Gw/g8nQlGPgUtIW+coKNtbb3Q5P
         sxeeUaxntAl73hB5EQaqgFHpJMHHd9bsg//UXfF6LIXwDiVz+oplJ+S14+qeuSAE1q11
         roVLJVmswkH2mD6PvKOMrfa9kwVNyehkhImlKpsGwx3mYieEBEJBFsCBhq2kPAlT+tSZ
         2x3w==
X-Forwarded-Encrypted: i=1; AL+hErH5CswoghMAp7g0mqJ6lZ+261voQTqQOHVxp0QaIRNBEpNNOSBeIRlapj5z1W4kj6kE+KwPe9p8/VHbDq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/qQ9w5oitMV3WlRJqvEmyxyMB8zGdl27MNoe1CoJSmjNv02LO
	qecl3y4MszkTLI87Kbi133jCpHTzc+0Zk3el0VHZgl6zZUJ1KIySP0mv
X-Gm-Gg: AZFdTZfxIavhRBTKkUHSCwH3qU61afkr7huWC7zTvWfDah7bWZe6MlhhQ6pCFmmYnU6
	3iuvK9+VBTYMFTtYrGrTw7yZqN8+KAZ70QPENSqTnIkAFK8icCbj+L6jmdLnyoWiSQooysbpyyu
	KmMwGHDtMTtzG+AWFH3TA6OtCY1c9eKk+1NouzmYYRGfxT6DyUR0GdVtpSvluC9s833Bf9cPdAr
	84eMCfwgVbMHSD46H80S7AOpamaL7FeltI6ofzSJUJ3Vm1LGFuRwAljMMT2L96ucnJGEEMT4g0c
	vHilMJfZEUO2zzs/shDk/HOHI0pSxe8TQcyvQOTiMTsWcS5G8STTFbw01tR6P/4dt3co9sUOJ3/
	uWc98XMJwTafMmmFX8zfuIXqw/O0pjlYtweHp7mjmuCvHuDLAljEEMcTBavCYvhj2NC2PAfCyww
	4i6LVosa+gdMEm3M8A873RO1nUiupKHFl1a0DMYPfN9/sJuHzNqy6VoyGSXsoTHtgJ2A6oj4V6J
	9AKvELlpuJ02r+E3Q56hJtgk9SLk3vmBwaHTe7Zms5CgZNbPF4dNhvrRdrEG97PbMpRZJAtRw69
	hvsSerq/Ir8YVfoFrvbt6Fm745HAiZKPFUercft/XQu6pU2MeylrqIa29/v+RweWaOJpcgvA6oq
	zMl0CQwRULY48Pme6TT3WZg==
X-Received: by 2002:a05:6a00:3c92:b0:89e:db6c:f199 with SMTP id d2e1a72fcca58-8c87c57b613mr11322869b3a.14.1795670343036;
        Wed, 25 Nov 2026 21:19:03 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.50.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm10149403b3a.27.2026.11.25.21.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:19:02 -0800 (PST)
Date: Thu, 26 Nov 2026 10:48:56 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv4 2/4] powerpc/watchdog: Disable preemption in
 arch_touch_nmi_watchdog()
Message-ID: <awfBNN6hpOHXS13M@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <cover.1795603946.git.ritesh.list@gmail.com>
 <fb07a250216a733b064f8eec672f9e682c3660d8.1795603946.git.ritesh.list@gmail.com>
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
In-Reply-To: <fb07a250216a733b064f8eec672f9e682c3660d8.1795603946.git.ritesh.list@gmail.com>

On Wed, Nov 25, 2026 at 04:56:04PM +0530, Ritesh Harjani (IBM) wrote:
> touch_nmi_watchdog() can be called from preemptible context, e.g.
> sysrq-w via /proc/sysrq-trigger. The powerpc implementation uses
> smp_processor_id(), so with DEBUG_PREEMPT we get:
> 
>   root@buildroot:/# echo w > /proc/sysrq-trigger
>   sysrq: Show Blocked State
>   BUG: using smp_processor_id() in preemptible [00000000] code: bash/238
>   caller is arch_touch_nmi_watchdog+0x3c/0xd4
>   CPU: 0 UID: 0 PID: 238 Comm: bash Not tainted 7.4.0-rc2-00029-g7664547149ae-dirty #126 PREEMPT
>   Call Trace:
>    dump_stack_lvl+0x138/0x150 (unreliable)
>    check_preemption_disabled+0x120/0x158
>    arch_touch_nmi_watchdog+0x3c/0xd4
>    show_state_filter+0xf0/0x338
>    sysrq_handle_showstate_blocked+0x24/0x38
>    __handle_sysrq+0x134/0x3a8
>    write_sysrq_trigger+0x178/0x22c
>    proc_reg_write+0xf4/0x150
>    vfs_write+0xfc/0x71c
>    ksys_write+0x8c/0x150
>    system_call_exception+0x310/0x590
>    system_call_vectored_common+0x15c/0x2ec
>   ---- interrupt: 3000 at 0x7ffd01755b98
> 
> Unlike the generic version, which only sets a flag, we update the CPU's
> timebase stamp and its SMP watchdog pending bit, so a migration in
> between touches the state of a CPU we are no longer on.
> 
> Disable preemption across the update to fix this.
> 
> Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
> Cc: stable@vger.kernel.org
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  arch/powerpc/kernel/watchdog.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 44f178e07531..1a8514b2d853 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -459,9 +459,13 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  void arch_touch_nmi_watchdog(void)
>  {
>  	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
> -	int cpu = smp_processor_id();
> +	int cpu;
>  	u64 tb;
>  
> +	/* Callers may be preemptible. Stay on this CPU for the update. */
> +	guard(preempt_notrace)();
> +	cpu = raw_smp_processor_id();
> +
>  	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
>  		return;
>  
> -- 
> 2.39.5
> 

LGTM 

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

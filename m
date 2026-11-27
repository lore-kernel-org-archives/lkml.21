Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800587;
	b=bhdr9F/rhSlnLCHYOK7r8s58JXbtMe+hzStz0zVIoG0V9c7ZK808X/oZ3z5yHwXsAagY
	 ACLcM8Ov0BId5JTcp+JHWa9fEcrYVT/9izt+2FUUEJHVEErUSy8pbtDqJqcGAjT65VQou
	 8naLbf+HELITvTkDm+38Calng5kOzR9XR3gEpfHYOV2Y3M6AV2i05beyKAU8iVVstpT/0
	 ksa8fpljyJ6yG0cemePjmq35RV6tH4DqwjsehePslnTH7lWdAWR5I4t1yj0dzgDlfXr8a
	 AkmWQ9KU+qlWUy7tFy/ZpFR5684icaTj8klglFS8KfZSwO08gMbKPHGlPm9DcGFK6bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=htgkc1niw9wiArafcYtBRNur9uqGXrmAC1AoCVzanjA=;
	b=U6eOxQGJPz8v+c3O1EV8Qf3esPf5aP7lWLeqJmb4ArafcHYw22EOpIsDpv1NBRE8jHNY
	 o+Hc6geomoeBP4HnbNFtENQ/mHp4CzHLdGnUg4zUfye0ic2ZY6VypLJhW410ps2eVtFDY
	 nRBqbDMqRfbkTVHqWSHfdYVvosFSufBpqgo7AAgjxxDurISHzYJEjuww+OU02maLrihOZ
	 gKHlnm3JIpL4qZ77KrctoI1Y09lzlS2iToB1acj1AxlPhs5C8e1ibeuU3QfT60woh8Fb3
	 5nVxzrYu0rZ9Y3wqNjN9hmWb9vhIuWuV3zNVQqA3metmMxnIyEx9J1gyuBKi2rUfOkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVLtX7+S;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B032606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B032606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVLtX7+S
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdece95eca4so430342a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795800587; x=1796405387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htgkc1niw9wiArafcYtBRNur9uqGXrmAC1AoCVzanjA=;
        b=iVLtX7+SSFDbYIrS6OVPSAo5t6IxcggXI+nGE07dNPr9uGcW/Z5pqy2m4To8SI3kuO
         6mgwfgKRNKrR58YbGrnXgPu2bBDfl7qXjz+dqhZp3yyQKj4NXR3bjDGCzaJtUq24h19j
         5h/vQ8hNQaZxnjcAVudhI973lqmvqx95HKJ0l7/TGFWbA3rKpEFC/zh7pc0Z4Kjk+OPr
         w7VjHCAVeCmRUIdmpfnDvg+4v6FdRHO1Tej6Ju6r77R0i0IQmXVsCDsVGRWdKtMEsjza
         nXEaoCIog6vYmZxx4ZJpVaBI/uv9S19AWgsfYrT0NYCj2YfVLnlJHX7oGsVrdKITx+T2
         ol7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795800587; x=1796405387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htgkc1niw9wiArafcYtBRNur9uqGXrmAC1AoCVzanjA=;
        b=dAALLvUF4UCgId+okiy4UPDqbcx76FSHyqaGRls4NEMPnRuVxthEl3VTlsHjwRUOmX
         SoSAAOY0w1CnT67J1bDXqOnP9j8QGo/ATwgxozKKouC+Vnbt9r23YpWwVW6zyY3Z2DPV
         eOyL6DxpWhkt/aEz5icNLOV77xh9Jol2sMzBbBk58KmMw1stYp3dybhdRd4pQF3ITzuA
         RlTURGLNcmdOIeqQGl6ZLXCJ2azMVAM1k0N+23uK9eLpLru70cPnxCXTD42G/k9OVTu1
         Pi4RIMYfiO6G4RcNnbCYUNFpNPo1oqNFH+TpS/MolRgxRetacFRHfKWglwfjJ+F4qwL1
         dnGA==
X-Forwarded-Encrypted: i=1; AL+hErHjJ2WbTuLLLHxPs0s4PJigyPvau3n+gVUMwxxKNRO6T4pfaQ7qr5xPl7knPRShR21yNPZf14c9+MXOQMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MKmZUUCIqsqkikI+lrcFHQWdtcaiXnQ9mdUMvEjXcTWlLY8Ab
	LYJgTlNLVIkaSsIQtrCk2HC9oKguP86bP6+zw5vUCxD7Iptp4ZOy7Dpq
X-Gm-Gg: AZFdTZerzDVMBaU76uSwPHJBmW4tQ7AVwAWtDWmSUj3poE5P0ihqglj63ZOWYeo9ShK
	TbFgxPUZ17D3sg6YHtUH7eYSTw7tuoQEOHK4Dac2QRj3Tpl3LGMKTPtmbBuXzee28z0OXbso4jK
	fYQAT20zbmQXBeKwmaldBGZMCEnLhdqWL7yKOfpqu8Ws7zeQpLRWubJjK+ukdRshEP4pcWKttYq
	j00xrsrX3D8mol88sBmVB0t5HcbvjMuEteEyxlplaY8rdnMkupWZaj7ehkBD0uGmnlf7bWU37rb
	B8ct8GEzhyOd+Uxvc2p2NTs96vdOa+bjG1ng1e0TniioA+1pGVX4we1A4Mxki45wjJ8G6R/VCAy
	uA6mwmOfy6sYlxGvLmtshra+vogNSdgo6h+rfQBuDINFGdDEtkcqq9qXt1fJPPqnHznKXuXk5Q7
	stc7asvOSaLKSTjsVPhG+tZk44mcBRQ2sxm4D7NZFoUmNWgEae81IkH00Zge9i0rJJOKp8wDYAx
	JbCVFPTOUDowoXISEaFqDJyCkQeDQyV6lq42DcZy26/OegFQrujx8t4nO3jdS6b3JvfQuclP0eL
	LtuJZsZh9lc3rtNhG42jBU8q0gnwvhcJq1vSkvYiFqEjzFL0YrI=
X-Received: by 2002:a17:90b:248e:b0:3b5:35eb:5e85 with SMTP id 98e67ed59e1d1-3b535eb5f39mr2367200a91.2.1795800586587;
        Fri, 27 Nov 2026 09:29:46 -0800 (PST)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d05782asm12632435a12.24.2026.11.27.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:29:46 -0800 (PST)
Date: Sat, 28 Nov 2026 01:29:42 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND] clocksource/timer-riscv: use
 riscv_has_extension_likely
Message-ID: <awm-BjjOPxHo2n2E@google.com>
References: <20261107134952.17873-1-jszhang@kernel.org>
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
In-Reply-To: <20261107134952.17873-1-jszhang@kernel.org>

Hi Jisheng,

On Sat, Nov 07, 2026 at 09:49:52PM +0800, Jisheng Zhang wrote:
> Instead of static branch, use riscv_has_extension_likely() to check
> whether SSTC is supported or not. For one thing, this is straight
> forward, no need to add and enable/disable a static branch during
> probe; For another, riscv_has_extension_likely() is based on
> alternative mechanism, it avoid some downsides of static branch, for
> example static branch's metadata in the __jump_table section, which is
> not discarded after ISA extensions are finalized, wastes some space.

After reading the __jump_table note above, I checked the generated
timer-riscv.o. One side effect I noticed in the disassembly is that gcc
stops inlining riscv_clock_event_stop() with the alternative asm, so
riscv_timer_interrupt() ends up doing an extra call/ret plus a stack
spill/reload on every timer irq.

Not sure if it's worth worrying about, or if marking
riscv_clock_event_stop() inline makes sense to keep the irq path flat.

Otherwise, I tested this on qemu virt smp for both rv64 and rv32 with
sstc enabled and disabled, including cpu hotplug, and everything worked
fine.

Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/clocksource/timer-riscv.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index b310e6721fac..151f4f0cfd6c 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -29,12 +29,11 @@
>  #include <asm/sbi.h>
>  #include <asm/timex.h>
>  
> -static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>  static bool riscv_timer_cannot_wake_cpu;
>  
>  static void riscv_clock_event_stop(void)
>  {
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			csr_write(CSR_STIMECMPH, ULONG_MAX);
> @@ -48,7 +47,7 @@ static int riscv_clock_next_event(unsigned long delta,
>  {
>  	u64 next_tval = get_cycles64() + delta;
>  
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  #if defined(CONFIG_32BIT)
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		csr_write(CSR_STIMECMPH, next_tval >> 32);
> @@ -112,7 +111,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  	ce->irq = riscv_clock_event_irq;
>  	if (riscv_timer_cannot_wake_cpu)
>  		ce->features |= CLOCK_EVT_FEAT_C3STOP;
> -	if (static_branch_likely(&riscv_sstc_available))
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC))
>  		ce->rating = 450;
>  	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
>  
> @@ -186,10 +185,8 @@ static int __init riscv_timer_init_common(void)
>  		return error;
>  	}
>  
> -	if (riscv_isa_extension_available(NULL, SSTC)) {
> +	if (riscv_isa_extension_available(NULL, SSTC))
>  		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> -		static_branch_enable(&riscv_sstc_available);
> -	}
>  
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
> -- 
> 2.53.0
> 
> 

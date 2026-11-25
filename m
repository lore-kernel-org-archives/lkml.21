Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585843;
	b=lPFybcWhXOqrT0uS134/szKG+V7xVMdsj9yMrQWduFaPIztV5t/TiWhqk4iY4/wRmWOu
	 kGzpkTEN6DEOm8Qr8bmU/YS5jco3b4n6k3PYotx2CpdW/TpGN29esoidWhb5B7uJC7K5y
	 3PUKt9uwZFGMywTncs0z5qxB2/BQy8sgzsP0udQ7zjcYCy/BdCDuECjmps0wiKovcXEI9
	 NT00tDNolhidl+U0MjbMQ0++RLILgz9XkvAK0MsUXIBJFnZTdTK53y+ZZURMkLrk9Erdy
	 eu3+ZQ9kXhAg65+fNJ9zGljE4/33UU9D1lC26BMOocILwNjWcQ2n4TpxP/x1v5z4WRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ROEbaJZgsjUR2jXRu+Oh+vuifiOcyZNOtowCB7+3Vv4=;
	b=oG8r9MeDVQ9iCwX68LiiG5m5DUP630P6evTdQ5pjgaMDkgQpV0ZY8mjPUKot4YlzX/7T
	 AHOv8dpA4wAx7WvyAi0KOT0lc2gppA+PcTVQfz9D2/hSzs5vlJiFIFNkZWyR0D1mhO4MT
	 jHvnf3Qv/EavYPwutuoxM8wYflWoXFLmCMsWly9d/zb8zfD1ykEUueniNh6wjiM5qN15a
	 8pFsf7fKBUsFSGyGBKLc87LG2rCZC9jiI+W2kXVtNEu/SUGvUv8K9vE0tG7zvNzruQHTM
	 IclA9TzEwT5Yqs9Uv4efgnWNdXOI/i70u3QwbVfeHb+WmxBY2y7PQYS9b4OxdbUNNhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BL5Oh30v;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01721606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01721606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BL5Oh30v
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04bea9a93so46809425ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795585842; x=1796190642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROEbaJZgsjUR2jXRu+Oh+vuifiOcyZNOtowCB7+3Vv4=;
        b=BL5Oh30vzrSpx1HPKYmDihMSZy+x4PFVNXhOREMhl+eJ1mqZV1jzQzz06ZKPcAz1iZ
         tjxVNiIBZmDRIfqgaQS9ult+/qJuDPLO3lC/WydpzqRBV+4NCW8gxc9huoMhEbjG/eh8
         5SL+E3kJWwmRrVIa1xHL823kT8xjvmcpgW9/y74EWss+pu1wQDZ4f9LADyu567apDLaY
         jK/M87Vz3NjoHIBpVdpB0ihY8Uex7QzZj3kR+yEvuBXyD2e1wUTYbslNdLt1yIEUmJEb
         +6H4QWUOBadcNp/LCMPP/fTuPuPJpqr+nvfYeuO65Q5FOo0K9PcvgisyM/P1MGJ3D1Yy
         Bxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585842; x=1796190642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROEbaJZgsjUR2jXRu+Oh+vuifiOcyZNOtowCB7+3Vv4=;
        b=G0bSJ/4p3E/01jDHkj4LogwPF9LXF9g1QrcPEAxX8qWY//KQoHrhEkxVgGjZIR70ZO
         JYTlbKPXEbrg4cp+pmBHwscOGMSQHpCJLvqY0vNLrKZo0V+vKSihzRahF7Ru7eaAFYMP
         E03c4NUpz90kGEIxQIWi0FPyV5+aycm+O2idrF5FIHlWKWq/4x81M3JRxcZxtY2KXL3j
         Nm4YMOGn87Z5Kv9ynP5NN3tRatr+HjjKyw/ZXP1Ry6uuUAifx0jcT0/jE7Meo0XgzlFV
         FrQRXovlSCHYnkyrX18b+/1aMtrXh0yxppxhnSY6rxv9ZlBC529SaXPXESch010lnMX+
         CXoQ==
X-Forwarded-Encrypted: i=1; AL+hErH8R36uSgMkBjeEAaiBCFgUN6x29QxktEbItzOeuTqkuJtxYYsQbGFY44WMPRa6fL9e2LrKiaIB52YrAxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L6BEvFcaIYYIqGL6X01eHqH4S1s8vLp+MwMQ+vZqaIxi13j/n
	JZ4vExN3Xr9n1H//S1v7D23ach7Jbrcyy87wIUDgX7VyO5cOiH97XuTt
X-Gm-Gg: AZFdTZfCZ+EaucueKxIwBkJoXc0pUACroJA0S6DEYUAZnwCQygf0OGVCIDuwNM1fzuu
	Cz6P9peBtTdftDBKET+BJYRuhlc/I9TyIcXGuGZln5g18PrYzfs9+KzUwliQOVll57l1v3PjB5k
	Djsdz4V+H+KEjKIZef99C0obPk4MZX8YLEgcDGeE5lQ4rTGE59LMxDo8lYuuM6DTyxYzqCJtKsr
	rws23IE9uiauxaE7mKLVHSQ1QLVfdfiAVz9mFCqcDF8wf/Xf6kxLxZ7L0X3v7CVRa3Nzss50edn
	9FxzfFZ91mTvMa7VBQVjdxQadDnahMXrrMNGo3/hmFeSuuk4hf3USC56d1BNZZ6OnjYFg4orjlB
	60qDPrTOAnY2gdYCin2FkQ3bU2sv8pj+/WtCwIz5Gc+2XylRPI4yTW28a7SPpbB9VgdxKd60XVY
	PjXZiRcI/xM7CuGt4ErNWj6/nNTB7v+g6ccsWSrzr/X1+tjQMcW+4oh0+T9WrPpJq2oGaxb+U2+
	OJSwZ+NZZ3X61idp8LkySvm1PEJtWmOB7XNFEqlRd0q1sLy0T8tbGE9J5vxtIkK7zayoKlV9lpz
	9jOEebOEgHRwwwOXMFrjR/vkQr6En0uatlNpixTRWAapNjqO4Mt1i3i4Ex6h1+Y8+wOj8AGi6XD
	Y
X-Received: by 2002:a17:902:db11:b0:2ef:eb06:387 with SMTP id d9443c01a7336-2f03f246dc5mr175431075ad.47.1795585842120;
        Tue, 24 Nov 2026 21:50:42 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.51.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c88sm79569105ad.56.2026.11.24.21.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:50:41 -0800 (PST)
Date: Wed, 25 Nov 2026 11:20:29 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv3 2/4] powerpc/watchdog: Disable preemption in
 arch_touch_nmi_watchdog()
Message-ID: <awZ2qXSxXPO3XUUb@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <cover.1795441238.git.ritesh.list@gmail.com>
 <8a70fa42449a63a73b8340d3296974cc519b5826.1795441238.git.ritesh.list@gmail.com>
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
In-Reply-To: <8a70fa42449a63a73b8340d3296974cc519b5826.1795441238.git.ritesh.list@gmail.com>

On Mon, Nov 23, 2026 at 07:21:51PM +0530, Ritesh Harjani (IBM) wrote:
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
> Disable preemption across the update. While at it, let's also mark the
> function as notrace (since we might be within a tracer when this
> function gets called).
Do we need to also mark wd_smp_clear_cpu_pending as notrace?

Regards,
Mukesh
> Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
> Cc: stable@vger.kernel.org
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  arch/powerpc/kernel/watchdog.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 44f178e07531..32d4e716cb0a 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -456,12 +456,16 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  	return HRTIMER_RESTART;
>  }
>  
> -void arch_touch_nmi_watchdog(void)
> +notrace void arch_touch_nmi_watchdog(void)
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

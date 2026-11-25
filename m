Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615377;
	b=njm33OXkljga6qFev1uht52Ubif1aqU2akYkHIrqMD8V9wL5HM88wYOVI0BNYrr0urYD
	 cFhRsm8m8x7KFkZZl+0CJiiG1sPYTSlVB8b/NusnHQdXclc9GtPF/8j5c+EIyxvCPKAXB
	 g5XWfDHAEL2mslCWyrDOabzlPikC/y1FWm2/Bvpmo/34eCSz6Mf2vFrKWNTAZuscR8TMT
	 BTQcZGXeYcw5bM88z0K6LDLiT6k7F5IXun8BkRRVgzb1+tq3Kx1LZBvx1Jp0ibJ6pVseP
	 EC/WwC1667oe33YzU1qH+RIT3Kux89t2o8Kg5QLwRp/f3/B0mQJ6JV2wyVtmNazoIrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tHONq08nC4X9qMcp/4zGQtPWASfmcbRhLdusAHN+ZIw=;
	b=LDNi0omO2rlxhGAaOcXz8uHTAKivvbNLOpQDloKU8lrM3jnHIJuIgMHUy5Hg6bALtS+v
	 4m/KK/4Dax/pBgQLQNn7OQnpSiPoyLNTLjOANkjd6XgLNiuSUhHX3FDv2NPXE5rfgd6KC
	 zUXzaHDSWdF/Mk+cjL8qznkNlRKC9v5FLClbl9fwN5SN6gYh41nZvayPO1XUyUcCLkJ7h
	 GuZmvNpNzhuLCJ1G+kL+L02zY07GWFP4ZN5qLmJJlxTU+QTEqQSJujISgJXSXH6s60d24
	 FMXzgfRojWGO1G9Yg/IGCT2lcUQRwz8brJfAYQEiYFEYu22yJeI8geqUhkD5P2QT68A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="THnd/DsR";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D280A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=THnd/DsR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so36676175e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795615374; x=1796220174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHONq08nC4X9qMcp/4zGQtPWASfmcbRhLdusAHN+ZIw=;
        b=THnd/DsR2Pq0ZYFOkt5LmL5B7J7KZAnj6WbTJ4nP9BRSFD/NC8CqPwKSKugGaFc5ul
         mrL+Bd8MxRWc1hPPSdM8UF/6o8JuVYUwIX+CfEt5w8fmhpt+TmqkqdvOeC8t3xp4nK5f
         cDfRm4Kf0bJ0fq0AJBgwoGratjRGWWiwSQUF7l1+3ZvklHNucbXVS8zhiA5d743rd4oX
         UN4gUhNXSpheVh9GIBt9Y8B7IAfBOKOmo8Jvu6SX0dWXDrcvRow5LS8kCNHroOmx/wM6
         tdeZ4bAt7XH8KuZpGXMcHbcqAFNzYFrnx3APVsWmgOFevCDNeWh9RpEk77P6hmk5SPC7
         jjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615374; x=1796220174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHONq08nC4X9qMcp/4zGQtPWASfmcbRhLdusAHN+ZIw=;
        b=J4lxe9FYXQEnh5GoG2Gmgrf4oEx30vWN5KgTPxDKM0iodSKqqBTeyQn7U4SwFm6Yp9
         hSe0q/XaSpJvn5RwCk6ioOuDpcMmEtgXcxxSg7dtVIoioI/zUwg/XBeyVN7BmKX5KJR2
         iXgCTYjhwg/olRe8r7cBnkLEzlOU5sdpoerl0I5pUls3yNi/dzjYK4pHT2uLZgGHrPb6
         /yjons0F0jaej2M5LPfZrC748eSwjOgMqGMoJcWkAA/vv/Iu6fhqfGmUP+dTHEGWSayJ
         Xtwq4xGOUAsL0IUVCKm/5N+w3MlmfDDL95hED34Ss6MG+PlC/9PnV/qK0r3hYLkrK2bq
         e1tw==
X-Forwarded-Encrypted: i=1; AL+hErEdxmXi9B/xVTzQMOX5+TboSkA7SSoVsuthg7iNRSLmgJH0pTJEEbCTaJlfKMmkyDx2v4iEwGpB1vvyAjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z93BD7fsX+Rh1GDDhheOUncttdEt7NHXv9JaIVxeZ4ACo9cIhTl
	z8zklSWUoZfsdaVWulSN29MIjgOnd1HMuXXDT48nznol17c9oVJQvRB8D0TcVdelAhA=
X-Gm-Gg: AZFdTZcGfWGLoQRK4tlvO/kMr82vtmJkvmiGvuBr/7I8TYlbwUcn6kJJnqTYrP7Cjeg
	P3qf9ICAieZuOJNwjW9TeSzRoJeqHuavQIRI+zXvGbs6JyrKhTq+idVyzUZz+f9M1RCMMQdLAhz
	osKQNJXSKCgY8hugt9pp9/OSoCQjJb6DYr5R2/JOd5gkM0P5YVn0H9ysDdK2/kjOJk9kAXyi7Mj
	ZWqxppP4biIRac0kKrKEOUuQpF0VOLlbqZ4p8OoMcc3LLG6dKZWHN5kJindNmmap9UkaJ2aNtfx
	TG9Nc8nsC+xejzOxjgq5zPIm8BQ2Kwswe5sL3w+4FAww8eI4GzbMcq/TC04XMsN/fA4gtlhEpv0
	L1Z7pA1hEY3QVbJx5kCiacdSjHEuPyaRcmFYsmXeWlJ2LBq4swbwDcYiJ9hPQnq5TB+QFL4fTSQ
	tAxDvmhF8GBuau/IH4zNvqFVe6hgSpcyGhbth6Vm+KTR/C7MzWijOMOd07pVHf1mVZiV9fmfsp0
	WxKuyB+1h6bwqXRtRlcYsSYyIjZmvDor3s3yokRCVZNBpeDRI5yWCOxQr31Tg6YQFL3PMutbWHF
	38xnhc839fin/1br7OTcu/Ox7IJcbF+DH/EnG4cIY+uug+E=
X-Received: by 2002:a05:600c:4e94:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4bb86161de1mr460541005e9.16.1795615373893;
        Wed, 25 Nov 2026 06:02:53 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm715759415e9.13.2026.11.25.06.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:02:53 -0800 (PST)
Date: Wed, 25 Nov 2026 15:02:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v4 6/8] console: Support unsafe flushing for
 panic/emergency restarts
Message-ID: <awbqiycLbPPFU2N3@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-7-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-7-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:54, John Ogness wrote:
> Introduce a new nbcon-specific console field @allow_unsafe_policy
> to store the unsafe flush policies for a console. The policies are
> represented by bits, specified by enum nbcon_unsafe_flush_flags.
> 
> Define unsafe flush policies for:
> 
> 	panic+restart: This is for kexec and reboot from panic.
> 
> 	emergency+restart: This is for emergency_restart() when in
> 				the emergency state.
> 
> Define a new flush type:
> 
> 	PR_FLUSH_RESTART: For flushing before kexec and reboot.
> 
> Implement the policy check within nbcon_allow_unsafe_takeover().
> 
> No functional change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  include/linux/console.h | 20 ++++++++++++++++++++
>  include/linux/printk.h  |  3 +++
>  kernel/printk/nbcon.c   |  7 +++++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 227a7cf296f60..1afeb90692395 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -194,6 +194,23 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
> + * @NBCON_PANIC_RESTART_FLUSH:		In panic, unsafe flush before kexec
> + *						or reboot.
> + * @NBCON_EMERGENCY_RESTART_FLUSH:	Unsafe flush before emergency restart.
> + *
> + * NBCON unsafe atomic flushing always occurs at the end of panic() before
> + * the kernel enters an infinite loop. Users may choose to perform unsafe
> + * flushing in additional scenarios where the current kernel is ending in
> + * order to increase the chances of seeing console messages, even if it is
> + * not safe to do so.
> + */
> +enum nbcon_unsafe_flush_flags {
> +	NBCON_PANIC_RESTART_FLUSH	= BIT(0),
> +	NBCON_EMERGENCY_RESTART_FLUSH	= BIT(1),
> +};
> 
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -326,6 +343,7 @@ struct nbcon_write_context {
>   * @data:		Driver private data
>   * @node:		hlist node for the console list
>   *
> + * @allow_unsafe_policy: Unsafe atomic flush policy. See nbcon_unsafe_flush_flags
>   * @nbcon_state:	State for nbcon consoles
>   * @nbcon_seq:		Sequence number of the next record for nbcon to print
>   * @nbcon_device_ctxt:	Context available for non-printing operations
> @@ -461,6 +479,8 @@ struct console {
>  	 */
>  	void (*device_unlock)(struct console *con, unsigned long flags);
>  
> +	unsigned int		allow_unsafe_policy;
> +
>  	atomic_t		__private nbcon_state;
>  	atomic_long_t		__private nbcon_seq;
>  	struct nbcon_context	__private nbcon_device_ctxt;
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 68cf51db5f0ea..267a0a6fd23cf 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -148,6 +148,8 @@ struct dev_printk_info;
>  /**
>   * enum pr_flush_reason - Reason for a flush
>   * @PR_FLUSH_RUNTIME:	A flush while the kernel is running
> + * @PR_FLUSH_RESTART:	The kernel is ending, but another instance should
> + *			follow (reboot, kexec)
>   * @PR_FLUSH_HANG:	The kernel is ending and will enter an infinite loop
>   *
>   * Flush reasons are used to determine if unsafe atomic flushing should be
> @@ -155,6 +157,7 @@ struct dev_printk_info;
>   */
>  enum pr_flush_reason {
>  	PR_FLUSH_RUNTIME,
> +	PR_FLUSH_RESTART,
>  	PR_FLUSH_HANG,
>  };
>  
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 8b7483bd57188..f1789cfbd8b57 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1471,12 +1471,19 @@ enum nbcon_prio nbcon_get_default_prio(void)
>  static bool nbcon_allow_unsafe(struct console *con, enum pr_flush_reason reason)
>  {
>  	enum nbcon_prio prio = nbcon_get_default_prio();
> +	int unsafe_policy = con->allow_unsafe_policy;
>  	bool allow = false;
>  
>  	switch (reason) {
>  	case PR_FLUSH_RUNTIME:
>  		/* Never unsafe flush during runtime. */
>  		break;
> +	case PR_FLUSH_RESTART:
> +		if (prio == NBCON_PRIO_PANIC)
> +			allow = (unsafe_policy & NBCON_PANIC_RESTART_FLUSH);
> +		else if (prio == NBCON_PRIO_EMERGENCY)
> +			allow = (unsafe_policy & NBCON_EMERGENCY_RESTART_FLUSH);
> +		break;

Many different flags are mixed in this function:

    1. CON_NBCON_ATOMIC_UNSAFE from enum cons_flags
    2. NBCON_PRIO_* from enum nbcon_prio
    3. PR_FLUSH_* from enum pr_flush_reason
    4. NBCON_*_FLUSH from enum nbcon_unsafe_flush_flags (flush policy)
7
It is easy to get lost. I wonder if we could do better. ;-)

Ad 1st: CON_NBCON_ATOMIC_UNSAFE is not ideal. But it is done. And
	I am not sure how to make it better.

Ad 2nd: NBCON_PRIO matches nbcon_prio. It look good.

Ad 3rd: PR_FLUSH is not that good. It would be better to
	emphasize that it is a "reason".

	I would prefer to use the longer PR_FLUSH_REASON_ prefix.
	It will be consistent with "enum pr_flush_reason" type name
	and more clear.


Ad 4th: Both NBCON_*_FLUSH and enum nbcon_unsafe_flush_flags are far
	from clear. And they are not consistent. Sigh, it would be
	great to emphasize "unsafe", "flush" and "policy".

	I think about:

	enum nbcon_unsafe_flush_policy {
		NBCON_UFP_PANIC_RESTART	= BIT(0),
		NBCON_UFP_EMERGENCY_RESTART = BIT(1),
	};

	or maybe even better

	enum nbcon_unsafe_flush_policy {
		NBCON_UF_POLICY_PANIC_RESTART	= BIT(0),
		NBCON_UF_POLICY_EMERGENCY_RESTART = BIT(1),
	};

	plus use:

	struct console {
	[...]
		unsigned int		unsafe_flush_policy;
	[...]
	}

	and finally the local variable "uf_policy".

};

What do you think, please?

Otherwise, the patch looks good. Note that we do not need to check
here panic_on_this_cpu() because NBCON_PRIO_PANIC is used only on
the panic_cpu.

Best Regards,
Petr

>  	case PR_FLUSH_HANG:
>  		/* Always unsafe flush on panic hang. */
>  		allow = (prio == NBCON_PRIO_PANIC);
> -- 
> 2.47.3

>  LocalWords:  PRIO

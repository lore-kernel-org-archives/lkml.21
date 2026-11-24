Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537669;
	b=1gHAO6r680ZsNRQxBQ6qPzrqTXzTwSPSXhUAbY8OAiGqvPnntbbs8OACrbZr2cyzthUd
	 o4gfxzQwW7HJmx/3UVNesB3ki+EPTxin6bk1wc3EWtxQDzo0w1ZOxOLEDTICkGn490CE4
	 c8rqEHv+haUcNgf9JjAngwIIefP8o4VQykt+h5Qq+Xm1X0w9KgmHX2BviUYeqTPZiVwl8
	 jMbTxfgt6k1iV9Zk8S4WGoOQz18vI8rSswjEbS7HqN2q9k9FFqHRewg11uXx473atrcnX
	 Nzwh8p1iyRoiiYahCAn/UyVjVeNxuLLk05eyQQgO3HfWd36gZaY7We63KXsSGUc4+kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=R3zuLxf28X0H/xa7T47tiKvpemvGGgA/Y2mqSnzT7Gc=;
	b=I/WW/5MgRCn1OwKFCAvg/8PoTmhj5NXof207zqsMZ0hZ8Dz7uyAfgIyG3QcYGfrI01AO
	 ziVYf+CmNSm+2k6k4rDubrmQ3HpUnzDyUlrr7UnrCv9LnQ+yBYnXJ77xlW1I8x2M62hKa
	 eedGHsH6ttlsRNaMAPgROWIrtN4D0w4Nm+GI2NParB68VES+E3JO39cfObfyMma9niqc5
	 PLUD6Es62xZSqW57fy8VAQafCNagvy69Qca8ZzixjOGNhfX8YP1VD1yeC8jHUqROXT+8q
	 FWzeRigNTxW7BoN5Xz3J5aFVo/5Ez5J/gdPSFTNSF+OggNFlFt83pY+W7d9uTSfdqbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SVC6mUcv;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79375606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79375606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SVC6mUcv
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso3618297f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795537668; x=1796142468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R3zuLxf28X0H/xa7T47tiKvpemvGGgA/Y2mqSnzT7Gc=;
        b=SVC6mUcvCqnrCYIYmC3FlAjz0y1boHH/hpssjCciD2GcUhoVhRJjrMnaFy15mhO+KD
         t4rMPOYnAMCEUEpGHnNH07csHT4hKc1Rb/uHIxzyBpZxUvdEZMzIip3Yuzzw+arKdeck
         trsmnR4pMthvGKjQwH3PM2/4C9+19s8MhBLCtgaJtRJwLZf8vrLCsrwhdX5qOG7r+5Oi
         93AQRvEJlpeF3PS6PmERVzBBW+QEF3jrDeo3FStH22sY9UP+Vd861udU9RJupaDCdY13
         2CMMWhCWfuEQBccgtOCFiTuWlQbzJASShtdhVWgkAIh+DYtGCWvabD28IBwfBXnEIDfq
         5QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537668; x=1796142468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3zuLxf28X0H/xa7T47tiKvpemvGGgA/Y2mqSnzT7Gc=;
        b=FcsJv6GS+cH/HTX1mUcfRX5spD8W5iv+Wj6M705YdTw1X3XMN3V0+BupSKc1Z1pQXV
         QEy3qCzV6ngfDuIqiuWcV8Tbe3edYuCJFOq5e/8IjaxBqLmXnavQTanFK3FTYQYmRhLE
         nEa/tg1bWcTJqphHfYsal2Sf4Z3isgLey7S6EnGIubwGBPXxoclm+1EtfP2PKpWLMO3x
         3ffzagCyIaJgLWS77c4Ly5JQhjJhSuJiZKyC4vlvzfpet3kM+dajVUDRBIxr2lh6fW/3
         dckUQ939NaP7Z3NfYA2e4mkcbBC576NuRhMtGvy6GEvOoXnyKNy9pN7eO9+2T76aThRL
         FK3A==
X-Forwarded-Encrypted: i=1; AL+hErEK8ehwM4qbiMlHFeuV4m+eE1pIa1BDhKPAYy1iGy1iUylh9s5Fs5C5iy52441ysKY/e16j67duN/++gTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ix9Kngc+Y7M5VpsHeawXfC0OPfW/FjT8ahDXA4yPUeHr6/Xz1
	hm+Sx3mRP1/8LYjodS4mBZEE5o3NjT3DyRq2B2Tx1EQAwccEVUwnEmgEH9wOOlESiqM=
X-Gm-Gg: AZFdTZfTZjNh1lI40g9oHJ7uy7C1pBWWlIuTl8zyRvZPalzinAugW471EBlL37RHW4h
	U+oBxpe/YOtL6RqV0JNkshzvzOlDtmnQL7zwYZO1tYPvqgVon7AtwK92wkyz0vW7cLmOy2HKrXb
	uVj+YSCYQCXnPEPJvN0W/e5X7TtUSINVhygReRSB/Pc3GbL/5Mm+Ti8ZkYRZZqvnZqmPv1sPs9n
	Qhzcazjx93sn1LyTO4/+K4LMv/btwDpQtZHjUv0HhDSkE2Ns7gMeJcRo3zPIFZe3xhkuBm1pRwu
	Z1SIEPJ6yVoXdGv2y/OMMeV9oAm2JmICIaewdu3amY9uw9KJm1dn/jWOlPj2ODU7X4dhZhUcj5d
	5YiONhiPbl4Ugd2n8mz50o3wKYs9QAgac0BU1Ruv6jso9gwYfV/hxi1ziCCXG859rIACx2whR+d
	QUx52xJHVxWHZZLMtR68SHsMcybncEaO/+nv46uCbHAQeGoeQff2nXf+7ncSffL3XAUxzh2XH2/
	hUpAxBipDd4oTvdPVdAKqqCdpKEVPibXTRsp/00MFDsPou8k8LWHjKg3j00qWjixaP9yRVOCupx
	kdiTVfDvcNaUu3i9P/dn84nCwVBvCOw=
X-Received: by 2002:a05:600c:8b11:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb8881d194mr319287845e9.27.1795537667763;
        Tue, 24 Nov 2026 08:27:47 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm29083209f8f.50.2026.11.24.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:27:46 -0800 (PST)
Date: Tue, 24 Nov 2026 17:27:44 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 4/8] printk: nbcon: Use @reason instead of
 global variable to check flush policy
Message-ID: <awW7AFsiUkhRWdqy@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-5-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-5-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:52, John Ogness wrote:
> Currently nbcon_allow_unsafe_takeover() is a hack, relying on the
> temporary setting of a global variable @panic_nbcon_allow_unsafe_takeover
> as a gate to determine if unsafe flushing is allowed. This hack works
> because unsafe flushing is only performed at the end of panic().
> However, this hack is _not_ sufficient if unsafe flushing is to be
> allowed in other contexts.
> 
> Since at the end of panic() nbcon_atomic_flush_unsafe() is called with
> the @reason PR_FLUSH_HANG, it is possible to identify when unsafe
> atomic flushing is allowed using:
> 
> 	PR_FLUSH_HANG && panic_on_this_cpu()
> 
> rather than:
> 
> 	panic_nbcon_allow_unsafe_takeover && panic_on_this_cpu()
> 
> This allows removing the global variable hack and opens the door for
> unsafe flushing to be allowed in other contexts.
> 
> Provide nbcon_allow_unsafe_takeover() the flush @reason to implement
> the check.
> 
> No functional change.
> 
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1453,24 +1453,31 @@ enum nbcon_prio nbcon_get_default_prio(void)
>  	return NBCON_PRIO_NORMAL;
>  }
>  
> -/*
> - * Track if it is allowed to perform unsafe hostile takeovers of console
> - * ownership. When true, console drivers might perform unsafe actions while
> - * printing. It is externally available via nbcon_allow_unsafe_takeover().
> - */
> -static bool panic_nbcon_allow_unsafe_takeover;
> -
>  /**
>   * nbcon_allow_unsafe_takeover - Check if unsafe console takeovers are allowed
> + *					for a specified console and reason
>   *
> - * Return:	True, when it is permitted to perform unsafe console printing
> + * @con:	The console to check
> + * @reason:	The reason for the unsafe takeover
>   *
> - * This is also used by console_is_usable() to determine if it is allowed to
> - * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
> + * Return:	True, when @con is allowed to perform unsafe console printing
>   */
> -static bool nbcon_allow_unsafe_takeover(void)
> +static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)

Nit: It seems that the @con parameter is not used in this version.
     So, it might trigger a warning during bisection.

>  {
> -	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
> +	enum nbcon_prio prio = nbcon_get_default_prio();
> +	bool allow = false;
> +
> +	switch (reason) {
> +	case PR_FLUSH_RUNTIME:
> +		/* Never unsafe flush during runtime. */
> +		break;
> +	case PR_FLUSH_HANG:
> +		/* Always unsafe flush on panic hang. */
> +		allow = (prio == NBCON_PRIO_PANIC);
> +		break;
> +	}
> +
> +	return allow;
>  }

Otherwise, the logic looks correct.

Best Regards,
Petr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536832;
	b=sXIi6QNb+AjDHC4SB+I2JtUOUAlYULI6f88wW0/yB40EbV1+YSk/0d2C3fhmZc1C7Kwf
	 OdJcBoruJXnOgooRNdBXsFSkGYBjdxGs0sq9Tjm24N949LUM41pvUQQIrXl21dS2mbD+U
	 0wbJdwW0y+0ufaLFTRztNcpN+CC/XYurEsa9K0Dc6IQgggM8gb0FbauKiWkG8psHkfxNx
	 54Ya2/bXXOLTw1sEunLCcVbUYSnfuF5XNHzjYSMHaz2hnlujHVwyPVjEYGJMROOI8E43j
	 4TbtVYF+k9nd6A0TONbj9oy3PWZOQBtQkbd8n3TAaEd1Bb6JA/eOBq7TYCpkPXmEnfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LBJUeeLBd/j2UQXVukjFGjfTw0JwauIgVax6uPLXyWQ=;
	b=EPNcILRmPpsLFSyTpBQ41O+M4lFG0U+642+uYhRu5GaX8oWJ3gx2Txjh2UY6Pixavjhp
	 O+PuV6GYT4UWVyLjoQUMeKmGWgEWSwbt6y+oFTqN2SiFjI8ThYk/4XPz1q7dqFrH8MQsP
	 4wvPHfdP4whLZbByVoPbNVr5sbwExzwaSx4lLgsS73qCdo1EHs/0/X/K+VqFxdMv4KefO
	 BsRcXW6bPAGRN6VB80YvmpjUNdnOxXYWXWmqwWwmKyvkemhTtnFmSFhIcev2ykoX+xXQk
	 THQDuE3sf6IhEqYbdLGaugMPYVg9udnuOUGE+ofkd3LnLcmFrgQbd8PpfP9uGJoucHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QxiPcyGN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D7606A695
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59D7606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QxiPcyGN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso45359365e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795536830; x=1796141630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBJUeeLBd/j2UQXVukjFGjfTw0JwauIgVax6uPLXyWQ=;
        b=QxiPcyGNWLi+CToafUDhr670VlJ3uY8lOcXrlc5Tb6MSgv74pdv9YYK9FWn3btQdQp
         QaTeEpQw+Ov/GjXRrH3ERvcOGZ/WSXh7whcBVwNYs7qSKnQKMXDQj9Fiv4jNA2CrM+V6
         5iyPVThyWQSnfvwHO/HtJqzv6+J0gQKmn8DqLS0K8bS5LMSwVjjH7rmgUiLQPP2dTVU3
         Zp+fg10UKRzfVq9JUrB9UbT/4wMFHv3DxDR+5mAEjvqnns57beVkLQfQYg/7IRj4I8ze
         R3FLZv/Qkq2hhe3l9LNFZIMGEzPRYjD82ELxb6IFOjzYomcxNILhMalU/PB6ZAuLg4X3
         /Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536830; x=1796141630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBJUeeLBd/j2UQXVukjFGjfTw0JwauIgVax6uPLXyWQ=;
        b=jcxfEAsV8dMh3P+QwYM5+8Y1M2SqAvI6DCiJEtEwSG50QSMld7ue8pYiNhBuaUfGas
         R+vNp5p9xoYZCvMVpZ+KFl0p2qZqNg4J/UZ/O5L62kMVJvnDzQkqDNh3+JqhxIQGPc4Z
         4gXjtPKPGB3mYBYfBMqcXyH/Ic7O9nLk0phbN3a9OXpI08H0w41c4dv0WBP8jgZ8s0l/
         hflVCagEtkJapJLA9omvHq4YKZ+8+JEy6Fy4J/aFgx0NVZ/+EyozccojdbCBqO/0Oq4C
         zwAyPzexYjBnb7d4TdbNaEjqbzv9RFQfTeVdL6njk5G1O5rahvXfb+lzVK7ImJ+trE+s
         q1Cg==
X-Forwarded-Encrypted: i=1; AL+hErG9mkZ615Di/hqzUwY3Jt7DoebqX6DptNoxVAqMMnVm611cmbeW6Ve8e3+1OXngekUrL+yWWXMxa3svPtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zTns/zdS/i3X4BdcZTOY6aqFm7b4EzXu46siBqRIDKendZ6Ge
	/bG3GicvD/zNvn1hOx9gh93puHCu+OJNA3QYScJlA2VLRhNHSsjLQkAYZYP5HbfjLdo=
X-Gm-Gg: AZFdTZdEpMwMY/XFq7PTGSD17HuNSnzH3T/T5W6Of3B8m5AGlhv7dSy8sZjZW5JlZCr
	MH+gEaJVr/yQoTeyIzNuttGh9vKE+vsZr6wPsncz6ZtfjYg15mKqNG/cyJCgQTMmHuRkCG1Nf3L
	4qSrdJ1TzoJb6FJ4va3t7JCz4l7TjMaIKEPGE2uQRuo9RRbNwXGK048uxYHCK05sc76Ef0UAkjC
	bPR/S79KinV5RiCOOlfeQ+BQpFfefu5dKOmLsRFmAOderHdS5/nG3cOhJuMPVPcJ46a/D/oawmh
	RX8csP0ZLfkp90lJ9MDYxSEOMMH0GqJzC6d3qJYE9TyItL5NhOZP81gZSeDFKN5hFUPBIJe0YRJ
	MVeDL/rvwuBht+4bbw+7Idh3h2EaKSYDJ+D7lHYUj8mq4AQ8zcRwfAhn3DTWKZwa7fFnvkWNLUo
	IfMO8Ml6wbl7J1fqiS6dLrMPQuISSKF9ERTeAb3pfIO4SAa0Lg/w6kNBITFHorxeEQrSdykfyog
	tys1VRnoZpMdFb7/wydi2KxdQ1m6di6Y12Uv6CSQ+9NN3zJCo0uI/rP7r+zDBy9cNcjoTjT/igy
	PbdNqyIZxJ0/yhr4tyMCw1k9GXT8RJpr
X-Received: by 2002:a05:600c:4f4a:b0:4bb:6752:8413 with SMTP id 5b1f17b1804b1-4bb8880015bmr348896465e9.8.1795536830015;
        Tue, 24 Nov 2026 08:13:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm265449965e9.0.2026.11.24.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:13:49 -0800 (PST)
Date: Tue, 24 Nov 2026 17:13:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v4 3/8] printk: Move unsafe takeover check out of
 console_is_usable()
Message-ID: <awW3u4xEwwbQARPl@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-4-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-4-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:51, John Ogness wrote:
> Change console_is_usable() to never claim a console with
> CON_NBCON_ATOMIC_UNSAFE is usable since that is the normal use
> case. This allows moving nbcon_allow_unsafe_takeover() out of
> console_is_usable().
> 
> To support unsafe atomic flushing, provide a variant of
> console_is_usable() called nbcon_is_unsafe_usable() that accepts
> CON_NBCON_ATOMIC_UNSAFE consoles as usable. However, this adds
> responsibility to the caller to determine if unsafe atomic printing
> should occur.
> 
> __nbcon_atomic_flush_pending() is the only function that enables
> unsafe atomic printing by calling nbcon_allow_unsafe_takeover().
> Rather that using console_is_usable() to select atomic printing
> consoles, use nbcon_is_unsafe_usable() and only select
> CON_NBCON_ATOMIC_UNSAFE consoles if the unsafe takeover is allowed.
> 
> These changes effectively move the nbcon_allow_unsafe_takeover()
> check from console_is_usable() to __nbcon_atomic_flush_pending().
> This has no external functional change. Internally within
> __nbcon_atomic_flush_pending() it means that
> nbcon_allow_unsafe_takeover() is evaluated after the usable check
> rather than during. The result is the same.
> 
> Since __nbcon_atomic_flush_pending() also knows the @reason for
> the flush, this opens the door for the unsafe atomic flushing
> policy to be enforced in __nbcon_atomic_flush_pending().
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -625,13 +624,8 @@ static inline bool nbcon_is_braille(struct console *con)
>  	return con && (con->flags & CON_BRL);
>  }
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +static inline bool __console_is_usable(struct console *con, short flags, bool use_atomic,
> +				       bool allow_atomic_unsafe)
>  {
>  	if (!(flags & CON_ENABLED))
>  		return false;
> @@ -645,11 +639,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  			if (!con->write_atomic)
>  				return false;
>  
> -			/*
> -			 * An unsafe write_atomic() callback is only usable
> -			 * when unsafe takeovers are allowed.
> -			 */
> -			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
> +			if (!allow_atomic_unsafe && (flags & CON_NBCON_ATOMIC_UNSAFE))

This is a good example that different people have different mental mode and
prefers another ordering of the checks ;-)

>  				return false;
>  		}
>  
> @@ -675,6 +665,29 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  	return true;
>  }
>  
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.
> + */
> +static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +{
> +	return __console_is_usable(con, flags, use_atomic, false);
> +}
> +
> +/*
> + * Similar to console_is_usable(), but allows atomic unsafe consoles. This is
> + * only interesting for nbcon unsafe atomic printing.
> + *
> + * Note: It is the responsibility of the caller to decide if unsafe printing
> + *       should actually occur.
> + */
> +static inline bool nbcon_is_unsafe_usable(struct console *con, short flags)
> +{
> +	return __console_is_usable(con, flags, true, true);
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1468,7 +1468,7 @@ static bool panic_nbcon_allow_unsafe_takeover;
>   * This is also used by console_is_usable() to determine if it is allowed to
>   * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
>   */
> -bool nbcon_allow_unsafe_takeover(void)
> +static bool nbcon_allow_unsafe_takeover(void)
>  {
>  	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
>  }
> @@ -1672,11 +1672,24 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
>  		if (!(flags & CON_NBCON))
>  			continue;
>  
> -		if (!console_is_usable(con, flags, true))
> +		/*
> +		 * Using variant of console_is_usable() to include consoles
> +		 * with unsafe write_atomic() implementations. They might be
> +		 * allowed depending on nbcon_allow_unsafe_takeover().
> +		 */
> +		if (!nbcon_is_unsafe_usable(con, flags))
>  			continue;

The above function pretends that an unsafe takeover is enabled.


>  		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();

Here we get the information whether it is actually allowed.

> +		/*
> +		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
> +		 * not have an unsafe write_atomic() if this context expects
> +		 * safe printing.
> +		 */
> +		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_takeover)
> +			continue;

Here we duplicate the check from __console_is_usable() using the updated
information.

It is a bit hairy. It might be better to use the up-to-date
information in console_is_usable*().

I suggest to rename __console_is_usable() -> console_is_usable_unsafe().
It would take 4 parameters, including @allow_unsafe_takeover.

It would be used to implement the most commonly used variant:

/* Variant used where the unsafe_takeover is never allowed. */
static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
{
	return console_is_usable_unsafe(con, flags, use_atomic, false);
}

And this would be the only location where the longer variant is needed:

		/* unsafe_takeover might be allowed in this code path. */
		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();
		if (!nbcon_is_usable_unsafe(con, flags, true, allow_unsafe_takeover))
			continue;

> +
>  		if (nbcon_seq_read(con) >= stop_seq)
>  			continue;

Note that I have not seen the rest of the patchset yet. It is possible
that I miss something.

Best Regards,
Petr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602165;
	b=NoIsQGMX8g8ukVkszY9AG/7EL0bclL/TIbQN+ef+GnAXsUW0+wCU7BkH1zJApETlCZyw
	 gzz0PP5s6fLBJZp0LlUBJnxHKgTJgnSNMDDRhbFnSDP50oP0ejk61DDgyEqgMsnhmaWF6
	 hnf/S2PUzfWBakTjqfF8kwSDACpNxu57RPB71JKIHcVOzqVhbg9HV5ffdNxPGTnyKnm3d
	 pJCIt4KYodHq/97NXBDgPQejqNDnCfY7UfpWm+nXbl7j3D5YWuRXfjdi+XTd/p5BVEF6d
	 T23Uh2opqBehbyF1LHCSA0gxhpWQzDdFn1Ic8b1hkH7Mee9Hlf2Ju8evoc9Rlb3BJyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ijkPT1gsMM8wRBmH+8prLgdVJMEbcnJW1LjlDQCmSt8=;
	b=f3zHVWOkEvkTLsBqrhfzBmI25SDX+doFigCXzHsmb5KqQv01DOgWkvQneGLY0ImailIV
	 RMz6R5nBWp4COWa2cIMXy4nVS0HH6iTY8EADoJNpS8b54LtybC2kh8+LchV73w6fymG01
	 SONgPNCcL4xkJ2g5wmPomXZ6nhcuCdqBw0RQqaR8CWcs9+hqCcKiFuworivdCmUqz93iH
	 OhmRk+Le7Y06/q/4h6MWbjunnvYjYkmRgngWiRx5V3i+d0p3MxseqU6PdxAl9OC9z25on
	 z+pk3tG+/Jmz2Fa21f91mIZJ/jSRlUW1JtfLuGmaElv5UeUSw8g+G6Qwofcu3pcAWWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JPY6Sgb3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F00606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JPY6Sgb3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so47353685e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795602163; x=1796206963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ijkPT1gsMM8wRBmH+8prLgdVJMEbcnJW1LjlDQCmSt8=;
        b=JPY6Sgb3uf5xkA0lv/GQotrSDXNHqf2wEdanFDkfLk/1GLuOucpEOfu/49hLXIFk02
         ahsres1qEgCrnJ+HXRnXtnXd4pp0pR83BFkzP4P8YCtBwAeNQioNZEUR54Y589MtaVXS
         v7K3hdSBqWg/ts7pUVtV9dESY8cjOJpzX0cmViU6R0A+MLUC6qKCkzknvG05drgZmGx2
         BKsA02QFQti6h2RfI/83M4ec+oMEAIorsyAGLjVvcjtudcLQDOomsuMXfuNqt6xHXKTJ
         t64BJ1JcRbLn2YIxyJ6tu1LWuxx/h4gNKkGPCgmKdOFvaUAOMTyy5Y/uB3PpExf3Iomr
         n61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602163; x=1796206963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijkPT1gsMM8wRBmH+8prLgdVJMEbcnJW1LjlDQCmSt8=;
        b=YIgfc+G0/9EiT68jAxw4TIAuWKRJPwIBrIq8ZT5L/GRB8ScUeOml2FQXNDZKfUIYM8
         hree95IblFWEIND/1gczzRN12CspsIonobDUjKzrlB2tU1ovhtkbBGsEHLkJRO3p8F5m
         mOeFtA4lnHgDBHa2hTtkz32tdj0Zuz6GY4yQN+UjWodxvd8Rc39S7YRhQ8wlzdSxEAVk
         znU3LULZBS7ZtCSEor2jO2RGrHPbD4XZOnSPkD0hcLOnbFmaLJ6MJXYAKgdjxwF24SEI
         by0HkmV8CY3Hf80WynZss06cpuO94hxSb1UWyGj8u+SaLu9STEggoYj0vDKUbFR5xmwU
         fylQ==
X-Forwarded-Encrypted: i=1; AL+hErEPicn+B5ZQYrS+8MAuUvrrjD/VhdLCaRdr05NezvJcdTP1nrW9GLaCATKz0vaCFGzbu23rhgmxWYDp+zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lhmCrTfaGVdXypIOnN9m7f0yFLT/Us5mhjolOCGUkaIEHBbto
	dlv9p+t1X8HAtmlgza3ORukn3udtYDJZkZZV4kokgcpZgeeoAytU/f6+hUgx1JgNTdM=
X-Gm-Gg: AZFdTZdPgwd6+IOHjSMlSzIfdJMeId44urGl+D79gT5m7qytkinLUk090+yCk7ZOHKg
	en07fUTuJMRrZzNeBlccqWx1H7wRunARV636WWnHewhljqc5nWOHjH55NUfavjBMYAl9y80P/E8
	4WRL6UY3QXgo2DNm0or0IuH5B9MWJ+0Ua5JbUKvep4DOSde12Uy3ozPH29qQtZ/5+ywJg37HGN6
	7DTYIZQNepce2y76C+XCezn/3/CW/96NT43+IMd5a5xGDWqaMt5o8ZP9gjZy9TwNbN1syZwe8Zg
	0WVHFhZsU3bgxHCc5A2h31UWYuOBlj7Wcpv9/0d6lz0Ydb9oZokPyQ4moIyeoVp0U7Yva2dh9fV
	fdlzNJbKFTckZKoalSgjnFBl4Ei7FYfaK2m2VEsv8X4mx70OQP4+LZ0FyAxsDv7hPREfUFfBVZA
	GVea828cVLYN4q/N5zZ/XfqdRIk157ypWVv00O5ybirFGOHBhp5gDDKPNZScGkGjY1KkXQx83OE
	E8kJwrcemGbYQKpp4z1mNzJoXaqSQq3Wk9KNfBEaWXrdAE47NpM1k8OYfA4WZs8ET53k6ViwXxN
	5NWpJVvHZ3ddb1eHs+rL/kJLkRBXuLc4o4AFt5IBBontvw==
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr368785105e9.13.1795602163096;
        Wed, 25 Nov 2026 02:22:43 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm526548365e9.2.2026.11.25.02.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:22:42 -0800 (PST)
Date: Wed, 25 Nov 2026 11:22:40 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
Message-ID: <awa28PGg8L4rEDha@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-6-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-6-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:53, John Ogness wrote:
> Currently nbcon_allow_unsafe_takeover() is identifying if hostile
> takeovers are permitted.
> 
> In order to support unsafe flush policies for CON_NBCON_ATOMIC_UNSAFE,
> there needs to be a distinction between atomic flushing using an
> unsafe implementation or atomic flushing via hostile takeover. The
> former could be allowed in non-panic, whereas the latter is only
> allowed on the panic CPU.
> 
> Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe() and
> change its purpose to identify if unsafe console printing (in general)
> is allowed. If yes, hostile takeover can be allowed when on the panic
> CPU.
> 
> The comments for the WARN verifying no hostile takeover attempts
> during non-panic have been expanded. The detailed description will
> hopefully remind us of the necessity of restricting hostile takeovers
> to the panic CPU.
> 
> This opens the door for unsafe flushing (with safe ownership) for
> non-panic situations.
> 
> No functional change.
> 
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1682,24 +1689,31 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
>  		/*
>  		 * Using variant of console_is_usable() to include consoles
>  		 * with unsafe write_atomic() implementations. They might be
> -		 * allowed depending on nbcon_allow_unsafe_takeover().
> +		 * allowed depending on nbcon_allow_unsafe().
>  		 */
>  		if (!nbcon_is_unsafe_usable(con, flags))
>  			continue;
>  
> -		allow_unsafe_takeover = nbcon_allow_unsafe_takeover(con, reason);
> +		allow_unsafe = nbcon_allow_unsafe(con, reason);
>  
>  		/*
>  		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
>  		 * not have an unsafe write_atomic() if this context expects
>  		 * safe printing.
>  		 */
> -		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_takeover)
> +		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe)
>  			continue;
>  
>  		if (nbcon_seq_read(con) >= stop_seq)
>  			continue;
>  
> +		/*
> +		 * Even if unsafe console printing is allowed, being able to
> +		 * perform a hostile takeover additionally requires this CPU
> +		 * to be in panic.
> +		 */
> +		allow_unsafe_takeover = allow_unsafe && panic_on_this_cpu();

I was a bit confused by this. Also I think that it is error prone. For
example, it allows to use the unsafe_takeover for
CON_NBCON_ATOMIC_UNSAFE consoles anywhere in panic(). But it should
be allowed only for the final nbcon_atomic_flush_unsafe(PR_FLUSH_HANG).

We should make this decision on a single place. I suggest to rename
nbcon_allow_unsafe_takeover() to nbcon_check_unsafe() and pass
*allow_unsafe_takeover as a parameter. I mean something like:

/**
 * nbcon_check_unsafe - Check if the console is safe or some unsafe handling
 *	is allowed for the given context and reason.
 *
 * @con:	The console to check
 * @reason:	The reason for the unsafe console printing
 * @allow_unsafe_takeover: Decision whether unsafe_takeover is allowed (output)
 *
 * The function decides when either an unsafe write_atomic() callback is
 * allowed or when all NBCON consoles are allowed to used the unsafe_takeover.
 *
 * Return:	True, when @con is either safe in all contexts or when it is
 *	allowed to perform unsafe console printing.
 *
 *	In addition. the @allow_unsafe_takeover variable is set to "true"
 *	when the console is allowed to perform the unsafe_takeover. Otherwise,
 *	the variable is set to "false".
 */
static bool nbcon_check_unsafe(struct console *con, enum pr_flush_reason reason,
			       bool *allow_unsafe_takeover)
{
	enum nbcon_prio prio = nbcon_get_default_prio();
	bool ret = false;

	*allow_unsafe_takeover = false;

	switch (reason) {
	case PR_FLUSH_RUNTIME:
		/* Never unsafe flush during runtime. */
		break;
	case PR_FLUSH_HANG:
		/* Always unsafe flush on panic hang. */
		if ((prio == NBCON_PRIO_PANIC) && panic_on_this_cpu()) {
			*allow_unsafe_takeover = true;
			ret = true;
		}
		break;
	}

	return ret;
}

Then we could use the following in __nbcon_atomic_flush_pending():

		if (!nbcon_check_unsafe(con, reason, &allow_unsafe_takeover))
			continue;

Note 1: We might want to refactor the function when we add the checks
	where to allow the unsafe write_atomic() callbacks.

Note 2: I thought about calling this directly in console_is_usable_unsafe().
	But it would require passing the *allow_unsafe_takeover as a
	parameter which is not needed in most situations when it is called
	via the console_is_usable() wrapper. But it still might make
	sense if we make the parameter optional (allow NULL).

> +

>  		nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);
>  	}
>  	console_srcu_read_unlock(cookie);

Best Regards,
Petr

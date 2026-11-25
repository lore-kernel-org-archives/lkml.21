Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612019;
	b=bbD2neH6x1tRY1rvAyzL0OHBilwgcxwQF7XwgTF4pQXPum6Lx3S3t5eekHkMAgUXTzee
	 dJwWrjJX6+6LrC4Zlj0FlNnDVmgdDorwB88KD9DHnPsIc1eQ9r0xl+gDn/eIcuYwnvMN1
	 +eEzeqak9prsivczMkDL9/PIL5d3g6KOrcTxw1QISkmVQ74SE6+7ZnlPR8NKpYPSUUAsV
	 iGAaEZnHZ3hHpOz3PKmDmmaKKJVoLju7icTm1LevyH73cRP2RCdJaibgwi2G8y0Ame88f
	 XTemrxuYXiUP1Jk0WGp60kxe23NCu3b3mcgmow4qgWOilAdwY3HV5FOhIqCxdVrMD4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BTG3o/gfnhJbNoTu/8LWA+1k6i1e7Av0FFvwUtyiWVg=;
	b=abXVuii0pfB+omkPi12wEAWVt5lBD/Pf21EbhR+8IsB648vMH1PYoCRqM+5iFQMZ1TCY
	 ftF+7TIkxoESnqnHTkcTgV6Eq70sXaD9BpTdC/FGQG2/o98QQTS1JQBPfYFrdTerjeV8V
	 QVaPsdk3NnI6S8oGu9NAeMuyGLWw9KQQrUBnnjRJncYSAGYyq+VsDVsdKnbbQaKy2Y7Ni
	 Wpr+BrrvAk6me/fWL0MgvJHbVgSDOpO1Xjh6Kukil0bfHJ+riY04Sl/UELoQW/y+1i3j2
	 LSZSV6oBoqhDrFvvRBRdBPrzEVHf1StFw2N2QGU12DSfX5sBdp0n3645T6TpkFJJoAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YqYVv31m;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC61606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC61606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YqYVv31m
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so48962895e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795612017; x=1796216817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTG3o/gfnhJbNoTu/8LWA+1k6i1e7Av0FFvwUtyiWVg=;
        b=YqYVv31marPEOPgSgCN5FJ1N4GDGzGd7rq4QtTeo/hThBGins0I60SXk6Y3tXbiROG
         ttRYn7/EpGMz1KYPJOGZuAL3ds9y1wTtdvvy14LCGDmhq7OX0et6FKqbs62ciLVmEvD5
         4l0b9BwHvYHqvQJbPfmC9NsiJK2XiOG42tDlXhwV3C+R0Ix+1eBplW601tiUjZpiEJMv
         TW6xo59JQYpe1Xwbg2BS1GhY1LkNwZrT89+dPdu2YNDPJ7aTSSe0EWgYUFhDPObGGzPk
         XaeECkhHN3FOBCW3X99yaMW9w2AXtzCTL/QCggsz3euD2+Fq548eikHh3XeIcau7lJq8
         ycYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612017; x=1796216817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTG3o/gfnhJbNoTu/8LWA+1k6i1e7Av0FFvwUtyiWVg=;
        b=GYQGuxAJkbBss8UvGj0sySfD5hXgtJ8RdGtJuj/rJp6bOk8VRVbTd+J7EcmJZm0JYL
         4BA5kOFSXzLX+ZVKKZTwB/2L8TFghmSaTLSv1CqzMKwNY4ovFJKeEvHJOdkAukv5Zl/f
         SbPOnFTbFpKnKb/HreZYcR28BtDAhn89aIsA7oN/1f7aznNo2kskkBYMBeJuGcrtwA+H
         DHsjI+p5BJzzbmnoEpHg8/qrpyIbfwP8/ed6ltNTEesL8YepjBLebbz53iuwaECINDQE
         DS23Q1Fra9BQOcVW1gtw1qGnGs60fidZwgDz1+Dy/wJ57VwYObr9LipbPFNCjHpztFed
         1vjw==
X-Forwarded-Encrypted: i=1; AL+hErHDubsrBIvwOOMjTBsA09HfKbZiECYF1W0AfM6zgvPYgXAPYybiA3bYCwfPjz2PFkld7yn/eDL1XZ8+tvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z943EjcDk2cK7wFo/05V74+h1PcFCKF09g8w6KEoLopd39k0zoY
	RAzKqjZIuzI89PZ2T2L5JcCW5T8f6XRmkGEbzAZlEvPAYIxwgAFcTqNnURvKy8OEFog=
X-Gm-Gg: AZFdTZdbWWbumFED2s8lH4cw94FYfBL6CsC6CAd6nDx7qIPhc456jZOizuq7dIc+/zk
	8HHNURxnuFFw3wpr1mPFBoHtoYDO9sewmdAd9vTrAZvP5HJ7XlO42EV8OLi227uEvzOBe6yNdpw
	bvIe2LbENwl+E7Rs+RBFTJWjDBxUKGjzC6kXpWMf9DuSXOf+MO054250/8MX91R5r7Va/ESZsJU
	AWMUTD1nb+mhQOdBZh2kOpp0nRE615D8jF8IoPtuJ57bQ0wwI19itHipslFVyvzYUjf+3KHeUZE
	01GrWRqEsF8Thaj8Zipn7WD2PzQxXHDVjZa9CRaokYp5+QG6dp6E2nSvRSddhwtJoM0HjOANg35
	hZwoCr50g45nC5bxZY2yY0MheYZU+YwNAW7vwnGd4cwaxzIuwkyCwRJiIO+hvkpWyGmRblhqniS
	i/arwpZ/U20NuvMPhuBLBEjFH7haPhEX545R1j0O0/25rJFJYFVN+B02l9KzmwRYLAx5xp7F7bB
	jJMa79mennqBZTd/Bys1U3akLmFvG/4EIhY07TfwaEFz7YTf4Jg0RxZ3N+MUercXPFV1murjuiX
	mWnMgUfYz6n4Pa/+kwMlxEZ60p9vAXRrPTUPH/Zz7s6UKw==
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr387477015e9.0.1795612017395;
        Wed, 25 Nov 2026 05:06:57 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm677180135e9.0.2026.11.25.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:06:57 -0800 (PST)
Date: Wed, 25 Nov 2026 14:06:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
Message-ID: <awbdbzUgE0guw2BO@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-6-john.ogness@linutronix.de>
 <awa28PGg8L4rEDha@pathway.suse.cz>
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
In-Reply-To: <awa28PGg8L4rEDha@pathway.suse.cz>

On Wed 2026-11-25 11:22:40, Petr Mladek wrote:
> On Sat 2026-11-21 17:41:53, John Ogness wrote:
> > Currently nbcon_allow_unsafe_takeover() is identifying if hostile
> > takeovers are permitted.
> > 
> > In order to support unsafe flush policies for CON_NBCON_ATOMIC_UNSAFE,
> > there needs to be a distinction between atomic flushing using an
> > unsafe implementation or atomic flushing via hostile takeover. The
> > former could be allowed in non-panic, whereas the latter is only
> > allowed on the panic CPU.
> > 
> > Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe() and
> > change its purpose to identify if unsafe console printing (in general)
> > is allowed. If yes, hostile takeover can be allowed when on the panic
> > CPU.
> > 
> > The comments for the WARN verifying no hostile takeover attempts
> > during non-panic have been expanded. The detailed description will
> > hopefully remind us of the necessity of restricting hostile takeovers
> > to the panic CPU.
> > 
> We should make this decision on a single place. I suggest to rename
> nbcon_allow_unsafe_takeover() to nbcon_check_unsafe() and pass
> *allow_unsafe_takeover as a parameter. I mean something like:
> 
> /**
>  * nbcon_check_unsafe - Check if the console is safe or some unsafe handling
>  *	is allowed for the given context and reason.
>  *
>  * @con:	The console to check
>  * @reason:	The reason for the unsafe console printing
>  * @allow_unsafe_takeover: Decision whether unsafe_takeover is allowed (output)
>  *
>  * The function decides when either an unsafe write_atomic() callback is
>  * allowed or when all NBCON consoles are allowed to used the unsafe_takeover.
>  *
>  * Return:	True, when @con is either safe in all contexts or when it is
>  *	allowed to perform unsafe console printing.
>  *
>  *	In addition. the @allow_unsafe_takeover variable is set to "true"
>  *	when the console is allowed to perform the unsafe_takeover. Otherwise,
>  *	the variable is set to "false".
>  */
> static bool nbcon_check_unsafe(struct console *con, enum pr_flush_reason reason,
> 			       bool *allow_unsafe_takeover)
> {
> 	enum nbcon_prio prio = nbcon_get_default_prio();
> 	bool ret = false;

This is called also for consoles with a safe write_atomic().
The check should pass in this case. So, we need to pass
the flags parameter and set the initial "ret" accordigly:

static bool nbcon_check_unsafe(struct console *con, short flags,
			       enum pr_flush_reason reason,
			       bool *allow_unsafe_takeover)
{
	enum nbcon_prio prio = nbcon_get_default_prio();
	bool ret;

	/* Console with a safe write_atomic() pass the check by default. */
	ret = (!(flags & CON_NBCON_ATOMIC_UNSAFE));
	*allow_unsafe_takeover = false;

Best Regards,
Petr

> 	switch (reason) {
> 	case PR_FLUSH_RUNTIME:
> 		/* Never unsafe flush during runtime. */
> 		break;
> 	case PR_FLUSH_HANG:
> 		/* Always unsafe flush on panic hang. */
> 		if ((prio == NBCON_PRIO_PANIC) && panic_on_this_cpu()) {
> 			*allow_unsafe_takeover = true;
> 			ret = true;
> 		}
> 		break;
> 	}
> 
> 	return ret;
> }
> 
> Then we could use the following in __nbcon_atomic_flush_pending():
> 
> 		if (!nbcon_check_unsafe(con, reason, &allow_unsafe_takeover))
> 			continue;
> 
> Note 1: We might want to refactor the function when we add the checks
> 	where to allow the unsafe write_atomic() callbacks.
> 
> Note 2: I thought about calling this directly in console_is_usable_unsafe().
> 	But it would require passing the *allow_unsafe_takeover as a
> 	parameter which is not needed in most situations when it is called
> 	via the console_is_usable() wrapper. But it still might make
> 	sense if we make the parameter optional (allow NULL).
> 
> > +
> 
> >  		nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);
> >  	}
> >  	console_srcu_read_unlock(cookie);
> 
> Best Regards,
> Petr

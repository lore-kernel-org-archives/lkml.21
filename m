Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615707;
	b=u5Hm1u0ZuTVo5taP+Rb5a5vWmJodb4WaVw3//sdkO4vQfMsW4q9DSHuzU2zbhnJPBzPa
	 Kcqxuos5kn1hwbSf1U/LBWUOsp7aCnCg0o5aKJam3BGKH3ipqMbFJnpI3WMw860t4LJMm
	 rgKGkItbXrwxHvSsRFqdTdzyNtQx3gOp/Cz38i2aNdREwX1EnQedMJtfSnqNS8NY505ul
	 QxwQ+1MP+kvmTK78bOgBvokNiMYKO3C+N4ua56dgTZgalMl/CBtNpFhb5qIVHgkmFacdN
	 xEhpWagTOZyCHPGTbZGPet3baxqEEdyqKyO3O0XklCj9ez8FhpW2hnPJZW34lnYdyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WRZsidmdVV9MmuhVngxLRixfY4ChNMd3+703cMo+eqI=;
	b=ADNWNACbmj6uVIsiSE0XX2e+PFBCn4Y6b+a73ovdMRP6FQ97yXoxwrFkHfq/f+IBEMPT
	 8NIMyQHH8t2hcXCNmo24lxblJlUhqNrlh0Ba5QrFq7jTXBx81KodMUueNlrlTG1EwX09a
	 GzgbFLjZScGMyUqxuWqadb5785jA2p1Qfd/Q/IQHkmX9KxN3QgrGcBdLYUjlz13pVGwUt
	 1wpNF2G8rbZInFZ6XLYhaKPARpvfrnixDHnBYfg3REd8VSaxe/OP/rLm3wD5ZIweOJjFA
	 KfV9rnq0FIxSwxRIlCm3WVuW6yvSzWJOK0r00IiJMK1wQzMMFMxPDpxM0pZG8F9YnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="eWn/DV7A";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980D60A260A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E980D60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eWn/DV7A
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49465892f7bso4228922f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795615705; x=1796220505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRZsidmdVV9MmuhVngxLRixfY4ChNMd3+703cMo+eqI=;
        b=eWn/DV7AR77zL2mzC2/P5A8V5LNgOnAZ28wcdp8TgF6rPI7QlEJiC2ShzLgxMQpiFV
         UN2+YxNsn/Wypm07k4w7LUrUwKdw8oHkecjbfYS2p+Um/lg2/5aGdWFS2GDnQxEzDCvC
         E49NiOm6C4EGUuh6QF4pfvqxmux9Es1px1fVFyae6FLsbKACqmNNB0WThz9axuY/+080
         uuOscyjSPDJCINyspDIhBuI1ngMnCKw2xbBTQEPhB2QpZM+2VpRRPjVNOcqUp8JeUbZW
         B90YJghp3L2R3YZzYqX1NocO+YPX9B+S71C6VOHCKxELjq33TKlEX6Tr1VUAVOt/9reK
         7YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615705; x=1796220505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRZsidmdVV9MmuhVngxLRixfY4ChNMd3+703cMo+eqI=;
        b=Ju9GuwpBv+zGjGp2LtxM0d1hCl7mAgdD+h4d0HUBjADhCzrs3mI2VeyyptoJXDo0Sf
         zUj4SVN8dpkVKEWnkHEjDhAFcC31B3G8H6ksyMoE5YfRXg4EVbBakW8iM4g+99mAart7
         3T24u1P8oOmfK1h6LFeosuNN4vk/W7guYjVYVjtNoO3JDNHV4RxBX8/fpVTKvtDxanOe
         DHFCkTYDqPeHPI9bAshus0mjiB1bE1qNh2h1YJkqpXi6CUL9HAOJ44p3u64FButiFxbL
         Z4ZOpW06i4jl8BGC9yj+w31CoyNWAwQmeDV/SuGvEB71+MtsL2ofg01wOVn3qPtrFwVu
         C5ZA==
X-Forwarded-Encrypted: i=1; AL+hErEwoINV/dfJSAfej7E51YtkOUqVievT6oB3KrKlS7tXY/y3q69zJpl/3DgQ4RCTlKbtnzXA0cUVdzGbvUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZLtFm7d+gIg5IFPD9GQPEzKKJimXilWa51mUocp5eH+wz/MFY
	8k0l55tZe48GNDv7g2hqi1+/sOM4FE9GZ/zT+Yg0+rI6VKKtQPwtzBHIIoijyx/JPuc=
X-Gm-Gg: AZFdTZebftEXzdnqF6lc8N7xawoOEwLdjbECMJRYjDXu5aS3QcJahwJVvwOZ1mBHNlU
	aHU68yNHOgvHE5qseaxxeoITWUNQKrAIO5L2vNrNDyPidWRAREucIk2EVRlxOoNixr2LV1p5CPa
	7UDTGDml3MouZZo84R1YSyI/iXZaqRqTN24jD6serbJ/GVg4k3iJOnzVHaG9r2mhh8vdKRR434H
	eedg1vtBHr0pMr26wxhw5f0VuJ3xJ7w5Xvke4yeGDmTdWlBOI9eBi/IM0Ur7R6WZ3E1hPnEInXV
	KovU0Upi/xrltpqNRClYnewWagFbIqdrYeL0NTw6CWXfXZ4KrWATK/Avrf4yq5Z9loazqGif9G6
	xYMCdgXCbComE0duN3PbcnxHlB6AOgs9NgQQMMPTPTEFdW+IYXlvUcKcdN62jph4mnN/Prc5Zte
	FCh+3+ErQG2+Nj4XtwIptGSjL7ZJ036wVf94bHAtgQntsLBqwyHtIMIDCjRGDL9EX6Ow+Itq75G
	tU15DRbkQZloLL8okV6HU3ThXcRkbq7eqdxqhHzMaAaLLdHnxKuOWS/Bztu2b8yKHtJ1huJhorU
	SDpoJJ0TBRYsEdBToR6y10tkiLzCegnL8aRIAjIIiK3wNw==
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr34992361f8f.56.1795615705236;
        Wed, 25 Nov 2026 06:08:25 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm34510403f8f.51.2026.11.25.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:08:24 -0800 (PST)
Date: Wed, 25 Nov 2026 15:08:22 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
Message-ID: <awbr1gCJTiLQB4he@pathway.suse.cz>
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
> 
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
> 
> 	*allow_unsafe_takeover = false;
> 
> 	switch (reason) {
> 	case PR_FLUSH_RUNTIME:
> 		/* Never unsafe flush during runtime. */
> 		break;
> 	case PR_FLUSH_HANG:
> 		/* Always unsafe flush on panic hang. */
> 		if ((prio == NBCON_PRIO_PANIC) && panic_on_this_cpu()) {

The panic_on_this_cpu() check actually is not needed because
NBCON_PRIO_PANIC is used only on the panic_cpu.

Best Regards,
Petr


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

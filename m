Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866904;
	b=H0RhlfnGEkpPVsfvUGR+GG07jVQvkcmOPE+9KDNYOYJjVPLhKV+tfeTrogWIAu+En7O0
	 JnWkEGZgGIuU+jAim4E1UAURv/gSwcwhZQjfW3Gz59V5kENhbBRqnHAfRkG0i5EvgrirS
	 nWHxHDXNFVj2aJCPEuzrqQKxz8dwGQoOSpbiYILIVFUkSm8L3alO6FItPXsr16un+4dhh
	 TwC6yrP5A4DUOmoZ1EO99PNE6k/PWVWQPvtvZxrCMF3CZVpSb99kOtBTxK7WP+6LFgesB
	 Fy7bNBceCa+2LH2q30Cj4B0BIAXhXJ8sTIQOLvIhCBZ3L9bliOx3q2NBKgM6wUIS4Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aYcr/Vbck1ztUmS15ZTJlw73vVEYDKhMroKfUy1hlew=;
	b=w0AaZEDlngBI98ry5L0cmM/sp1Xoe1yeCAOiL6hK+KPmLnTQAHHM+Mdz8CLpjzaliH9r
	 TgGEF9u8fYYnLHkWPWI7HYkoAQa73XT4vzdqDPntjPJrZ6SZI6xlPSrbc0uBqFOFMHezn
	 G/Iv3pe0cXzvZjrhpfC79N8d2wEohdXA1V5zK4QOG9LYyzS1ulENSZRCTLpTfq9WatrP/
	 hLgi7/CFLLKfs2Rv+LbBzV7lYWweUrw6pQXmfahweAe+IRFVv8uAG5anDtbhoWXv0mrlm
	 cPYYQi+fn1G4Ij1vXqfJvy6QOYXW/YqWDgclH/HMaLq1Tk3ceKW0l8ks8OlrwxDsuHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmabmFsJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15D606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D15D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmabmFsJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso84916725e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866903; x=1796471703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aYcr/Vbck1ztUmS15ZTJlw73vVEYDKhMroKfUy1hlew=;
        b=BmabmFsJdICXPiXcElnIe1TFv/o26HwlXPW87Y3amLlU3xobT8vLUI0LHU0ruwO1fR
         cYJOtu9/Aw+LgWS6Gbue3B/Qep33qVgKS8Rw+3OFFPJ7V4MCx47Psgay3TJMIhhw3nin
         bmoAXRjBMLeQZNr+UjhI4DYYwUstfHd5b4OlWqM1nT6Qjo1r49lTSTW6i4jjxIGj7iDo
         2b0c14Ul4qIhk+Z9VlQ96cqjdKCHUEHY8L4wkQdhBWqpetzJN/hlKeMQlzqnEdtPokbX
         aqPdwKUX+D0wW23gg6jpFMM1QJTagyzW/Sl0bKjPNI9BVUzmyE0T4PvDNu0qrTRGdPM1
         ou6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866903; x=1796471703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYcr/Vbck1ztUmS15ZTJlw73vVEYDKhMroKfUy1hlew=;
        b=kjQTvNn35uhHCvoLdBdUZUy4GSwbKUna1vlK6Sufkk/WEFgEzjMqGzHnu/z7CnuAT1
         60b75n/PLw6QTGjzdk/Z8gnljjGWGNal6uJ6jVEWVQtQotLpDb+4vSbgmr7dIvgDeecH
         nE9N3Za7h4jxjjH6H8Mt4rytUkwnq/pLhkf5ibb882gwoiNnjp43fIHUZkA3gXN86kUv
         xslzZNzE4obuUu7RHq/TBDntgM6C/SnSiPDXaDL9QvDL2htsTITvoMsx347eilrgzReJ
         LMdSmNJSlCR6/811g2ROLN4WAi/fwSK2o7yVddpwfiRLwKGs7vPrmzLdWfSx+EhRN7WP
         IkxQ==
X-Forwarded-Encrypted: i=1; AL+hErHi4l5/X75KIZXsodx82C+I3MisGK9C1R4bL6gl72745H3r0kvAn2MfLpzmhNZuOBTszE20UviWR5Q8x+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q9/Fg3p5kG/yaSzG5z25BaOVDY7NS5OmMI21cvTHuiW3tNDcc
	3esDMFXVYX2FsgyioW2Vok4q8UdhhjQxWxiwZrU8Mb3BdBL/R+TZ9Ly3
X-Gm-Gg: AZFdTZdesI7v5OvEMzDjClGDGwcSlSxEyt0HTSC3Ib5FWKUxXHA3/GmAjNu838/cfJ1
	AjnK6y7LpWcGfQMZmEjD9ig/JlMJTuU2Hrr7jfhUIfQoQep2WI1xKAT2LJgnQhn5sgIU/XLThpg
	s+skwWtfNa58vW7ChQAXauw18fmu35n+lMvctuxyb5dioonkJdLIrBPSjE5Sr9J/iXExeODuGIq
	oREl/7hWNXo2Pdke5UvJv1hiNJOiwaYnl337fN4xBz3Gcz4+4L9FlseNjD6DutgwZFL5BOx3dvb
	trB7VWFCCmnnX7e5bXJ7iLdC4TgwD55EhumZyXXK3IZUKFFOAM6pamO3citUwk3reIhXsgVY5mP
	ijTh5AgFbYNaEI4BsOeMdrsHtooWd9o3yytoZflYFtvKOuMdMW1IAeEH1dxVpV3QSg9/1G52ONn
	vpBUjZ/trG5b9WCAkAMjXHGcgrxCNthJ/MqTBROjl7QmGR81n+cjav3jAR9p5f7jPxHwzh6K/nP
	VeZZBXH5VFtF4hkSCwmSB+rBuKKhR+uA7YQHXhdPHXenLnPcT2stTqzyIG3wdx8g7rAU+xgn91L
	YzrQdnDJ2TUsDLTE5NtyQYLuvjDDqU7AzI891zBBjjHzBtineRv4J7unhHE3AbO1BsFy/BQb2vv
	mTYcQ+8QhmWi8M/igNvZ9Yt4oRH6Bqv+k7etOnEZnGhSFeqpDTEIVB3aSrBhZ2taj
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb88819294mr573223175e9.30.1795866902705;
        Sat, 28 Nov 2026 03:55:02 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-095-117-034-170.95.117.pool.telefonica.de. [95.117.34.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm634936515e9.9.2026.11.28.03.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:55:02 -0800 (PST)
Date: Sat, 28 Nov 2026 12:54:31 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Wen Yang <wen.yang@linux.dev>, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/9] rv: Verify generic IRQ context transitions
Message-ID: <awq_lh1x7P6NQrx8@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
 <9419fa94de8acc8f1ae445004b77d20d0be3e98e.camel@redhat.com>
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
In-Reply-To: <9419fa94de8acc8f1ae445004b77d20d0be3e98e.camel@redhat.com>

On Sat, Nov 21, 2026 at 03:23:08PM +0100, Gabriele Monaco wrote:
> Maybe, you could somehow reuse the __schedule() tracepoints and understand you
> came from interrupt context, but that would obviously not match the
> interrupt/preemption counts, although they are (now) guarded by a BUG so you
> don't really need them.
> The loop should work fairly well anyway.
> 

Good point. With the BUG_ON() in preempt_schedule_irq(), every irqexit
check is already enforced elsewhere.

It seems dropping irqexit and its scheduler tracepoints is best.

For irqstate, I injected faults on arm64 and x86_64, with and without
lockdep, and went through past IRQ context fixes:

- Its only unique catch was an injected traced entry paired with a raw
  exit.
- A leaked PREEMPT_RT serving-softirq bit was reported first by RCU or
  lockdep, even with lockdep compiled out.
- It would not have caught any of the past bugs I looked at. Most were
  preempt_count disagreeing with lockdep, irqtime or nohz.
- On a Raspberry Pi 500+, it added about 73 ns to each
  irq_enter_rcu()/irq_exit_rcu() pair and had no measurable effect on
  hackbench or locktorture. PROVE_LOCKING added only 12 ns to the pair
  but made hackbench eight times slower.

How do you see it? The results above only measure detection beyond the
existing checks. Is irqstate worth a v3 for other reasons, such as
running a model of the IRQ context rules on production kernels, or is
there something you would like me to investigate first?

Thanks,
Karl

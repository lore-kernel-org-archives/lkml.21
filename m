Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684635;
	b=deH+ccGtjd0hIf7BxBYXs6wVE4bVVKF79hM/r4rCZrMaJq8CS6l9bda7qCi7TiEx+IYy
	 I3rO9CCtKgogz2lFSringgRUmIXS+pHtdJseJX7FhAfR6QtOmV8vlKNurZVhIaVoXxrLz
	 qs8ArbAD6ItbXnhHBb057BEEPVN5vyyaKYutgIBrk+3vcKI5hzpEIrd5rAe9NtAgN2VrW
	 kMbmdpZr8MUhXs3ZpR6b9DBmK9+T6S/js/LD9GZ6mW93WKd52tLq8cDFrJ8mWtJgBlQ5X
	 ic+LB3UpnX3QQTqmB+MwjRTSiPduJB1412HxZWDkmugSMVTvGHIR48SLu9PAhllyITQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=C/z0kFZffqp1LFtR2rltFphJVQEqkB2za+Qwi9gT7eY=;
	b=QGMywbwzij/kwMyV2RnT1IACVIX7/ZJQJNAwI0chjViV0w8OK63KfyLJkfL0y5FPU1Jc
	 Uw5eqKgAoGbOJTlhWjZxgmO/epf2oSddIHTNHPe5Gmvpfrjw2Qjn/JCRrPqPpkVkBpBc6
	 zOZayOnpE3TJeI3ZxMwZpYB2Z1MHQoM7KBUB3k6o2Xi/ktQI1rG3bnQPx6zglNLbglT/u
	 ih+R7yUF1zx47e1XWDDFICgPL+LDefJdotctSPhe7YhPrjEssTyVutg7o90Xf8G5KJDrN
	 cAgYyKIL97QTlcco2fQ1LSBRDX+chEqCs8LzKs7jckN3u45xPeVL6GOkiqL0eM4bXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6p70MTL;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8F606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE8F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6p70MTL
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4f6f98587so345532a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684634; x=1796289434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/z0kFZffqp1LFtR2rltFphJVQEqkB2za+Qwi9gT7eY=;
        b=r6p70MTL3/Xp7tYLBv0xUqK504I7RvC/GMoANlXUQwqgpJFW0Q4Y2tC2alhflbNCcq
         /A8OA8nFLlUaOsHPDDxNBtdwCZPltr1p2LvUwRUQhOyArmF/IR3WwgGe5dXg6IfHlKNS
         +CdwQ4IQmsDjXCIdGvgan72z07pP11kM/KVZ7xqRc2CWoZryv8mmX51MM67mmPj4Vmd8
         AxWq64uSSQvpvxxiJteq0d46UF1dtU+vczWaEJGHBm41Bpnx1gBebTGekyVP+MR/n0dn
         7+pRd2c9o37KOdlt2eNX23MFQlOe1WECONDYqFpdILvnKHPceVidEXjVbPBliyfgliAY
         EYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684634; x=1796289434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C/z0kFZffqp1LFtR2rltFphJVQEqkB2za+Qwi9gT7eY=;
        b=MVB0qMlOWmY1PhVT6X0yfa+Evifi7p0Cl9i/kPL9y6Cg+rXuYcLDeBIkyVT0p7F7EC
         N9OjEn7Gwrqk2HLKNxnTE+1WD74IYDrv4CPs5LFFcVJfaieAXbrStFtYb0lkGEmbOINe
         jfBcHFA4ak7K9uYg6HxH3xblgZayKpyTFlrDB01NrXKtlXm0nHHeagwg0Fj6e+g73OuO
         7QzJQcQ6Z12ylk+m7awo+xym/Pc4iGXf3l3kZlsO7O6IeoEeyj5yX6QRnFPmU43WJgy0
         BieBm2zLR+SS+o7C4fq4Pz7PyQM/4CYKjH9gaSTpmU7TyRWYJDJg24bpvdguRHXouf1w
         k6rw==
X-Forwarded-Encrypted: i=1; AL+hErHJFHG0S3sKyvP96naiaDO1YXJVh/ngutk/kRMybBl4SF9et+DS4ipLuu1ue1lqFpMu9p0gq+orcJMcnUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5dXVbz6xeertV5juOekNd1yDZ5k/e0AIgKmYVmBfV8r46CW0e
	SQEci678sAv3ixq8IcoeIRUd9s8DN32w0fgm3Hfp+3IkN7cOSy9Jg5f3
X-Gm-Gg: AZFdTZeY5OGjvzGkyPR1H2HP3BH+5+cLWMHY4Fmp7gT0tuwcK08NKMLsk0ODHYauHnl
	0wgqGRLmzaSeNxuaFmr+kt3uloY4rxWsd3BKpIR/OR01F0UvEvTi65cx2hLpnuEC8iEpXzi9bWK
	CthkgkF8iGQkVWqSRtKgWaBUOgIHgFKvKi3ZehhckTF8TaVEimKpnBHibyW7LqjOPMWMlCH5+XI
	iAIpa6IvMF2P7r/sAN+nopzaYpq2IaMBHWZe6j85PpoVpgUa2BuUl1+KpDbvElhjeHp9HSeJVdt
	hjqFOYF0kZ2ZBpW1gU8h/6ate6Bx15Fxgb7yUv9nnvAkeyjYhulHFVfpjkdhm6+ADLA4R1WyON2
	giyoK3T/3F+DyrFlD/JPgTrG6qtGgFTG1BcTgjq8GyP5RgBg9kM1DkaZ2pDVEa0ZaQ/Tb8X4M+E
	skpKy2KHCdHmqwip+PZ5EiQzjhDafbwt+eFwRjsNu4zsLy3h8YStlucJEYh+qoQvJOCr6z0zbR4
	Lf64HuZzEylc34cKSC3BiNse5Iy3wqbBnjGRUM6CcdHC5KgBeDWWC8a9RnVA/ajiFgvggnX0n4O
	3pAXdaIKcwUoxX+4cK02zlMfnsdPbdA7vt94bChwqhqOcw==
X-Received: by 2002:a17:90b:498c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b41c55b914mr29233956a91.0.1795684634345;
        Thu, 26 Nov 2026 01:17:14 -0800 (PST)
Received: from gmail.com ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm11023723a91.17.2026.11.26.01.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:17:13 -0800 (PST)
Date: Thu, 26 Nov 2026 17:16:42 +0800
From: Wenwu Hou <hwenwur@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] tracing/hwlat: Bind the sampler kthread instead of
 setting its affinity
Message-ID: <awf4-hjPFkBxPUev@gmail.com>
References: <20261125084600.2306377-1-hwenwur@gmail.com>
 <awbklFE66PIMKFop@localhost.localdomain>
 <20261125103822.2129a7ec@gandalf.local.home>
 <awcLwio_qyE3d1bL@localhost.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awcLwio_qyE3d1bL@localhost.localdomain>

On Wed, Nov 25, 2026 at 05:24:34PM +0100, Frederic Weisbecker wrote:
> Le Wed, Nov 25, 2026 at 10:38:22AM -0500, Steven Rostedt a écrit :
> > On Wed, 25 Nov 2026 14:37:24 +0100
> > Frederic Weisbecker <frederic@kernel.org> wrote:
> > 
> > > >  static int kthread_fn(void *data)
> > > >  {
> > > > +	unsigned long flags;
> > > >  	u64 interval;
> > > >  
> > > > +	/*
> > > > +	 * kthread_bind_mask() sets PF_NO_SETAFFINITY to keep the initial
> > > > +	 * affinity from being overridden by kthread_affine_node(). Clear it
> > > > +	 * now to allow userspace affinity changes and cgroup migration, but
> > > > +	 * keep per-CPU threads bound to their CPUs.
> > > > +	 */
> > > > +	if (hwlat_data.thread_mode != MODE_PER_CPU) {
> > > > +		raw_spin_lock_irqsave(&current->pi_lock, flags);
> > > > +		current->flags &= ~PF_NO_SETAFFINITY;
> > > > +		raw_spin_unlock_irqrestore(&current->pi_lock, flags);  
> > > 
> > > This is not pretty but moreover, is it a good idea to let the user override
> > > that affinity?
> > 
> > No, but we used to. Perhaps we should make that not possible instead? :-/
> 
> Right, the affinity should only be changed by the kernel if tracing_cpumask is
> written. Otherwise it doesn't seem to make sense to let the user play with the
> affinity.

I agree. Perhaps v1 is better.

> -- 
> Frederic Weisbecker
> SUSE Labs

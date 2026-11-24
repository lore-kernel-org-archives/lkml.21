Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506057;
	b=O7uneTi0R6FnLsDzML+LioVQrrqVBNIk9NZWazMzd3i3nP6NqZaYJoI78Y2vizJvsjCv
	 DaFmR2Us264o3ym2zWkm1tBDvow1rdRe3sdYuGfh//ZzzeEc0YNE0PTZ9VczKukqPZ0eo
	 qo3ag1E0mjCGRPc1aI3Aoo6slX0NhtEs+8H1yeLMKnG6zSJz5aUiwAw0wgBN8aiuw0w5X
	 vDb0LTTYZequWiGyuZYmXzKQ0fwj+l2gyu8+5fAwlc4bKp3S48t+yVJtcqx6nirnjqcSZ
	 /kwrnRdcQyBmei688fNfAGUF9Iq0OfoAG5J8Xo8HN8AI/nU53Pf8aITHFkkwdSVfbhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VfMJu1/Z0+MhYaERKBAvWhqLuJG63Qr8aUBnI2D/RKY=;
	b=y8mQew3DNNaUupcyqTIsz2rnQrwpIJa18BnamGR0pJ2703EC76GWXm+epqrvVSqX09fX
	 BPbAP6XDbj8M421cTiwLt8MCUD+lbjlyKy+AbRtjVdZ228IAxQ8KDDSuu5Cm23Q5m9nX0
	 JrjTXFRkwAg4iCZdMSc64PS65mumhf/FY0ynTaofHZK8WUJkIgqAAl0Pk9tQNWPUzlF+j
	 FY3MWUXuv1q8C6pH3r3O5x4rqUMXDNq01OzFHauQBUng9TvQZtbMCgaJ/xDI7nd9TR9Sl
	 sGjaPRtW34l1Y1w6eB41c1a3JI+Ho9EcHa4ouVMi/FaaWbK8NNj1ehoWe3Kp+vMsGUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OdOpOVMi;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB4C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OdOpOVMi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so53335725e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795506056; x=1796110856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VfMJu1/Z0+MhYaERKBAvWhqLuJG63Qr8aUBnI2D/RKY=;
        b=OdOpOVMiDhecZFxaHwLUaP2wVxwEYCePq+psoEYFRMANUQM8DIPuJl7rjMHRTz41iv
         ueC15y51IO1VqJ2JoM9YwVkcvaoErwZrnpIR8L9wYMJb2g1p6uGF6jRjJpM4HfAyyRDn
         sGqTN2zJUWlQCHcUTRT3ww8jcfQgMaeWuP1bk198XI49iep7irkvh1ZxzD0zzM7omC3q
         aGVrTXjEHOKcwGEnHZeuAowI3d+9ulqmHwkPx7nFK2ARt/Uca3R1R4mKZ1FeVFPhVl7E
         Jqxxos8EW1PQe2RR9MkqSVcFLtg0llnBShHBMd7nNIjvwmuX12R1w//7Y/5SFz+C5UAH
         umEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506056; x=1796110856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfMJu1/Z0+MhYaERKBAvWhqLuJG63Qr8aUBnI2D/RKY=;
        b=UKBZZaS6scUcQp987jlVGkQfFoNVYRn5YPOe4a6u3eJBkuQMV6w8sXJoc6h8mf8mN0
         tPppUzdDfzRUP+CnB0722iAWHgFeJWGdONyctSPKJEd6IloxbJEK8hTiFACuuwwZNiaq
         n3TkvFXY5UtdZnen2ToFYJRA6KngYYlajgE5PrMKaPoz+PmJs0vDIyljGFlUcFla1Ugj
         XxdQRaVvK9bdtU3pC+DKYSJUObceYTJuSc9z6+WLtGEqxjHd7kSjRFsF96q5dT8iFFlf
         vdMo6VDVxZJbdIH25XD0+eQbIjyEanjz7EuYmcnSLEkjr+sxXA0Ff4wypnc4PwrA0KHY
         V3sA==
X-Forwarded-Encrypted: i=1; AL+hErFlSk4gUC6drw2DIqArGTdhkRo3Oc3zllWjFwKqKTBIILsEr/+vkyhrp+SY9iVxzCOwG0WZAvi6qm3rWl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Rs2AyV8UY0pbzNp8U1ZegT1UJnbyAGereIAEkDfmCfGzPARA
	jCdPLCJEpbgbRR1fT6+BcZWdlBlKJXaWvzLu95AKJrXLYaIIQApcyc83ZiK+8asrvgfn2Ehl5UX
	FHkvs
X-Gm-Gg: AZFdTZfNmQo6yPvBnaDB1fvO4RanLVVI6vtozcxLfboUdnn9w03ly5yVBRYY0u270Vb
	/vNnTClcHsVNzBAT+0HzvllzJRgCRTYIAfZrYtFcchirwIBXGz1cxXEEvSLfuT4K4i50lMvXtK6
	wIn85UsI4vwh72ZniPreq2Hzgg/7LuIPtVAt2wW7zvQZLYVOPeOBYsdaLGFdx198qWuRUEsfL9F
	t7zww9IavhYDsouHgXhJ1BgH8kg3mXc2vRbpVWbzi7BnQWX7S2kk9UoE9/e61khqLmhqfsEmfcz
	MRkW1aRw1rgC4vZmJA7Eb5NMmg9NmTkBqliKThrW8+P9zwarbgda1fVhrxKVcFc3/LhIc9cG1Hc
	vTW2l6kxpx32aK9jPpPl0EmMdmi19qoazh5Zn63nkVX/y5L6BRvTQh6p+bGLIagYprC7wGOzE+P
	TAYIwBK00Tp96MUs25u6Tw/E0WY8EgbcVmgBkJ3bCi2rkqoT/VdDJzboud0ac2yPaHfA9fTLCUC
	X1lLM2ihbDFjVA32qtyZBeJ9nHyno4yn7P4uJ23SW697zYHray0nEww5T5j9V77LL4P4fmpHSsf
	8HzTdb+vHYVuTYcJPHGiZ235bfmuNx/Gfg2La36fiNJ7Rg+pMWjjwx/zFCK79+fnHr3Q+Rf7I4S
	Lg0EJrwk=
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr276839275e9.16.1795506055882;
        Mon, 23 Nov 2026 23:40:55 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm444084645e9.8.2026.11.23.23.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:40:55 -0800 (PST)
Date: Tue, 24 Nov 2026 07:40:45 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>, Wei Wang <wvw@google.com>
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <awU72HxIUrUVncvs@aerith>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <20261121041507.39582-2-qyousef@layalina.io>
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>

On 11/23/26 14:38, Christian Loehle wrote:
> On 11/21/26 04:15, Qais Yousef wrote:
> > Static keys are not guaranteed to be enabled atomically across CPUs.  Or
> > across callsites on the same CPUs. Which means when sched_uclamp_used is
> > enabled, some CPUs/callsites will return true for uclamp_is_used() while
> > others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
> > decrement without increment this is safe as documented in the code. But
> > an increment without a decrement is a problem and will leave the
> > uclamp_rq in a corrupt state.
> 
> So if we only need decrement to work then we can rely on
> p's uclamp_se.active and decrement regardless of uclamp_is_used() and call it
> a day?

Removing the static key could bring back the complaints about the overhead as
Vincent pointed out.

> > +	/*
> > +	 * Due to a race condition when enabling sched_uclamp_used static key,
> > +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
> > +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> > +	 * the static key flipped. The race condition is unlikely, but ensure
> > +	 * the uclamp_rq() state is set properly on each entry to idle.
> > +	 *
> > +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
> > +	 * lost. Since we are imbalanced, hard to know what is right. So just
> > +	 * cleanup. This should be a transient error state once we recover
> > +	 * everything should work as expected.
> > +	 *
> > +	 * We need to be careful of some paths that can force idle with tasks
> > +	 * are still queued.
> 
> It wouldn't hurt spelling these paths out IMO.

I prefer not to, this means maintaining such list. git history has info why
this was originally introduced.

> 
> > +	 */
> > +	if (uclamp_is_used() &&
> > +	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> > +		init_uclamp_rq(rq);
> 
> I guess this means init_uclamp_rq() will need to use WRITE_ONCE() for .value at least?

Hmm maybe. Peter let me know if this is worth respinning another version.

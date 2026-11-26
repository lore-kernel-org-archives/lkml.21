Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693697;
	b=YiM4wLlKDsVTWtzd/T3YO4CMXpJFTfmdg/Em678J2ziSHcyfPX/fY15NYgXdXu5pzPqZ
	 PcKGgyzZULZsUOSB9MekxzYUlmWRDnkUlrAsttTKdVIXmqsr1l6fizBA2WhqW7F+XWRoA
	 sR7VvbuoHg54Gva4vWN6dWCCRQHiONK97f3YDnZBoSatSoKEB7Y3RFUfTsSRQ384q2sG3
	 1Ui+8b00I33cW3BDLXMRFeU/K2oS9lzbtBvdLHzJtHT5p92knQHWKlmtM10cQm9FMluSj
	 KpJZY1Q3g1Z0AIrlS5HwU3cLPNlfzJlWKs84AagqBTOKnua6hWfxDN04afqdZe7F4jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AMooAxJV0YyjxKCR5eO/WtQElIvhAFHNrxOaericcxk=;
	b=iBX7Gb/AseGz76Xto+PSgev/Rt2LgQ9Ti7w7LRTwIPkyy1zRB20ayfgqpRkwIose2HdM
	 cgB2e7fuRUkrISiuaTLPF2g4K8SFIFzvhT/9f/kmCKTnXnDrt2pndLsYX21abujjqcMYO
	 L6ZxUZCtruZIhewJuT3okIweycoSIUX6KQiH0+ng1Mbx9TJw04Ci0GG6AkHDAPZay3+C+
	 U1omoMVUgs8jmANRnyguqTdWgkNsUru29vrUaqeboC0a7xBzz25ceHlXRs+LlycYEQsRV
	 0Ber7RXBb3SVUkKVyddDBJn+GQyiPZF8GKKFJtYRVY2mcaGvEHMBuVDnS0+CzzEwb2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kPxRhYvZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE860A5BCF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BE860A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kPxRhYvZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso85201865e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795693696; x=1796298496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMooAxJV0YyjxKCR5eO/WtQElIvhAFHNrxOaericcxk=;
        b=kPxRhYvZJreEG0NQbPFCPgZSyjrdL85igvSXzKc1q797CoeJkjZ0loXweyGIUg2Isl
         /vGjjWC6sXgbHmKotLF2BsJcfmRerTN5O82KfHEbcRvhCn21ZoPr5R8jnMmTsJo6s7qY
         dn1bjKfhduVyrQMdFrG3DDHemgS0EG3/xRHYUllh2v8KTQ9iZ7wmUaWmPpAlahmV/C3P
         64JYR4nXs76ECYws1ZYKDtdsccoUHIPfljkSYj/Z1zgiIleip3oud3enROOEhdpY1N1O
         1KusabDP6FrmIyxESuG7JRjZ8dkvsLUzd30JzhWXi7jPZSZ/whhtt0BhusRjMFjvvxfN
         +DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693696; x=1796298496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMooAxJV0YyjxKCR5eO/WtQElIvhAFHNrxOaericcxk=;
        b=lmluNIee6kVom3YVQz4H3InRpHKjdK8K+fb4/gw6he5CKRVKNQInlF2rwT3+eqhDlA
         eO3fNURin+9fgaK2uPJbHE28j/RsMbTEWWiFIcyCS/9jiKXh1umszMXULA6oSp/ppVAk
         I4gx0oW076JpzRDEsGv755aLZJ9PvTVkwEe1/g/p12oUQ40aFyPE5QEJnwttx7d+LTvY
         A2VBv1Wb2qx4JiH5ClLxL7/gltAGwzzHEeBn2z9LnuEnVY1h4tno41sQQXVdgkKdNQ6V
         1FMD+9Ksj8mYi82en5xFz+d74hGM6iILzdg4VB0F8XCqvbZpPS8pzsZB7OpYeH6Hklyu
         9V8g==
X-Forwarded-Encrypted: i=1; AL+hErETxwUF0cljjamKl7i6tN19dhD4zefJ/X6+3vBpPNS1xYFE4UkSVJji9XQjtnj6ja7Y4P8hKN7XGHfJnkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wRvYMSpQ52QQoUltLt2EPSxaOIapcjiqfSsQULCxelopLe0kk
	YZ7s+J5lQt23bAGavn2pFJJW1wjxvJEhQkJDKAqwGttbyChnXOyUp5oHsQ0LnINJLOmgPRbsVeS
	iWzyq
X-Gm-Gg: AZFdTZekjuksf8liLIpUxvJIqI9WLIQ+Vd1P8WXD5lsPHFNrQGxgjpK2lVKTBWIy/v0
	LA1KmKfy2U5GhSTs2eFNQjHWhOMGPXHgIL3lAoKdpChEwNdfcRGyTFklmCmRPpLEamUsBQsmEx4
	TA0/2tKVHyuW2Oc9zvnC7Lpd/27OA+ls6TjbPYyleEXr/HNHbedQs8qnEXRKpxINztRVe/jvcc8
	0sSxlC50l9GREM4PSsNPgb6fUzVasfxcZDbG3sA+e2U3v7hipRAa4ox7WjOoL9OoJ5APOCINhEq
	5ICdvnnUtnLm9xblIKN/wd72dNB0lrwAbzSJkZ4VzmyNnrxgIgB0t5I513NfS6cPT0iUWXYePpR
	nnQab4cD9vG0U2fXk+AhcIK3P/JbmdpxlqQqvgdE0tvvTo1zvV/5nsyPqKfpLYNF88USROdzVmJ
	1hdPNZ1bXrJ/vSMRp1nGtFuGhO7/GNO8R8pYId7x3HXB/TIoN0ox+8+jnOfEPd6ngUo4/QcgnO/
	yBdRyqILT8aHDZZhbuPLqFA9E1KLJftWdGGNvLRtbyWsi0nPPKbgL1Z3R6y2FXcOZNNCrUxTKWc
	xNxl9YxC//B9H41KvP2WCuMTjYc4Q9R9UEg23O2+GHgz1b6n69X/O0orSuBtTg1izApir4d7J+H
	/cNV6jDV+5dS7OXUBK70NL1GZjTxxn90=
X-Received: by 2002:a05:600c:1548:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb887fe7e0mr432974515e9.9.1795693695339;
        Thu, 26 Nov 2026 03:48:15 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm626603165e9.8.2026.11.26.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:48:14 -0800 (PST)
Date: Thu, 26 Nov 2026 11:48:09 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Kayra Cizmeci <kayracizmeci@gmail.com>, Wei Wang <wvw@google.com>
Subject: Re: [PATCH v7 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <awgaK3x8w1z_-Awa@aerith>
References: <20261126012836.15205-1-qyousef@layalina.io>
 <20261126012836.15205-2-qyousef@layalina.io>
 <32f8da5e-adbe-4b91-8bd5-d446a59e0c3b@arm.com>
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
In-Reply-To: <32f8da5e-adbe-4b91-8bd5-d446a59e0c3b@arm.com>

> > -static void __init init_uclamp_rq(struct rq *rq)
> > +void init_uclamp_rq(struct rq *rq)
> >  {
> >  	enum uclamp_id clamp_id;
> >  	struct uclamp_rq *uc_rq = rq->uclamp;
> >  
> >  	for_each_clamp_id(clamp_id) {
> > -		uc_rq[clamp_id] = (struct uclamp_rq) {
> > -			.value = uclamp_none(clamp_id)
> > -		};
> > +		 memset(uc_rq[clamp_id].bucket, 0, sizeof(uc_rq[clamp_id].bucket));
> 
> nit: indent

Hmm I thought I fixed that before posting.

> 
> > +		uclamp_rq_set(rq, clamp_id, uclamp_none(clamp_id));
> 
> So I did reproduce WARN_ON_ONCE(!bucket->tasks) on CONFIG_UCLAMP_TASK_GROUP=y, which
> relies on .active being in sync with bucket->active.

More details will make following your thoughts easier.

> FWIW I don't see a good way of mitigating the missed decrement for .active,
> but if somebody else sees it please shout.
> I'll post my proposal in a minute

Please send it on top of patch 2 and 3 at least as they are good clean ups that
I'd like them in still. I think the two approaches are not mutually exclusive
and the maintainers can pick both this patch and your other proposal
potentially.

Given that this imbalance can only (if at all) happen once after boot I don't
think that WARN_ON_ONCE() is consequential assuming we fail safe - which
I think we do but since you weren't specific about the path and I didn't go and
try to untangle it, I could have missed something.

FWIW, I think since there are no correctness issue but inconvenient _expected_
harmless warning, we are good. It could just make debugging harder if this
warning is due to the race or a true bug. All the sensible choices have some
imperfections..

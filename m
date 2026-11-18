Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012351;
	b=yC6FLhOGBSq0j6ZdNWrmV0tYjTBMVKwNu8QfwOI/YaiDzpSwPKR6AFXXHzVjoJDmTIzz
	 piW2CTD12kW+OImfGlar6eITQxrZFcvTQ3gkB3ZyvvRrWWuOAEbF0gfsN0PgpB6i0qJhx
	 j3JmhZvgrHMqzOKANq1APeFkZaZIdmIvTzx026C5kYfOlYyHNHAARVD9TbhaBIwDwUWzZ
	 sdKXCh9/nTfnVq0JcwDvzx6kvr6Apjv0f5xgbH5ilDfkRPXAaHzB/8/Aj0b+4qOPjYtZQ
	 GLTLlPirmbc8hm1MfJrtfVkZ6U1rJYpPwmHM1fEMXWs+pdjJ8iB/e9SuTNX1DOGxDRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012351;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
	b=fMpZ+CQ+/lPwJfM5Yb10IRT/cOLfhsU/hgp7YNHuSGaEVdFHurVxjmcxgEjBPouzbGT7
	 z21+or6V/hoiE1ZYYt+7jCRftpt0t+iWSkM1JsGGEnLX19OirkkVpmIFtHwiK6tZ5WEBT
	 5UP0FS9jtac1Nk4JCJKwzuJNJbE50VgiWoWT4QjD2YRTSilUlL8jAQ506wWRdf/U/w3/c
	 sId20uzET+mS6l5rqziKMW+bzOxC0RsTm//rUOFRwaZCG9pm/LwUl6Wnehgjyz6hSnenK
	 JqWYIo/Nwab8lvchSN/edwfXSt1UnytPP2qNQzla5qMolrIWoe+8yRK6ZGTCSuZAfxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VaD+Xsu3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jhchfRR+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4F4606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VaD+Xsu3;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jhchfRR+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795012350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
	b=VaD+Xsu34vU64AKsQ/3FGGJHuzhiLtHQnsCNzlppRoorGh002QJMjXaBegLUGUzUg342Rn
	7KbJ1wjiA/xJYjp9bHq0MqJVJE03JkHdQSHgXQGR1E71KypjsuAwJpoxDG3ik86HAreqp+
	tfbGFOYrFM8UrxhgmYKz9aDlCmcul8M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-3R42rpBtNKuWvwHtlTERlg-1; Wed, 18 Nov 2026 14:32:28 +0000
X-MC-Unique: 3R42rpBtNKuWvwHtlTERlg-1
X-Mimecast-MFC-AGG-ID: 3R42rpBtNKuWvwHtlTERlg_1795012347
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb68a5e792so4932505e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795012347; x=1795617147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
        b=jhchfRR+9STjT4RdQylP7KrJi5iKHkLKKg+LqCVbi+6LvYc/vlbXKwv+BbYq9IyMB5
         5IuuHmdsLkM2rw2y6UhKtLVj1wJeVgZIliUYnnFwyBooZl3lPlPjle9k6c9PjiB350TR
         ZdRR0OcSgvgiZaML0rzx4h8rU2XLsXvGAbf5Cm8NLa5+SdGfDzvkgg3NiYc/r8MBs1bt
         Y3knU0pXRvWk37uIGmeS3wbA/XMgLSH1UBvdcZsRGN5EhvpLsA4ZZEQcoZXnNl4n2zQQ
         /rWcyjyE018M2KmjNVvvymzL+Nls+cOtEIEDk09i8PkO6LBq6ANB/M00NGOAjbvSleoI
         iXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012347; x=1795617147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
        b=HiS0iQqNLrxF1m3oWdiNjobLgZn2lBp0deXt07dGlmibvfhBUq/gki3YLFajfSTApQ
         tNojXBy22aUj3bMPanxCHA0rjsko4mCOYF7L/4U+zGSR9918Mgr0Y33pp8LGQSxnljRH
         jTJ5rz4iyoVMIkptZIDEBbQDkAaiKBCm67zOTNNEC2e+6PlX1SuHp3LqIGHxi5BRpDDe
         JEMZj90c9nuBom7djd2FLfu+HsKJ5bq48+qw6uPe90MWUokP2HL3bdMMdP74yZ7IKPMI
         tBkPAJmJLJl+3nGhQTB6khIkjbO879BwHSUfpYnBniakXDMDjKeqAbSJMpCaTWsoNLwW
         pvNA==
X-Forwarded-Encrypted: i=1; AL+hErF39Ce3IhzyYguhyxInVI2WpeVJUHO0hxVpd2dVdwKMojj4ycYXCY5/ZfJmLETpHooD4i+lGZe/lUxASNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BvXDJ8hmF30cm4gYo3PAot9d+mCM4W1+/vFlKn5Rx3t75BQsm
	crPh5r0fwAVnRe7KiMdElVAdPGIF24lEs6ZcQBUQci0R22RPXmRmbO/Uvsitj7tdzFk/4NpBHcl
	wYpfikKATbWNb7tFFmkXjeE0qjwE97B8jfDlEzElktg+uV27lYHnDvnKcoUq3hI1TOw==
X-Gm-Gg: AYBFou1guE+5can+QNEr6GlV/VW3VYEPQ64o/J6rhmfUxvL6AAnZ0CbrALZApEqJjp6
	u1IZfh9g8Hb6vvpKIO3bDxU0m/rapIzOeISAAKQXijXXEO7QfdBPy3kbpxdS1nsFbc3qG+LyaEI
	TGrUWCt2gDa3EHsOFpfxR+vLY3ze1+GgP0um5TRoZUJ52pFa/8hnTcPc53MmnbAn5DCsuUy5hAI
	SS5SLFIaJ8+vRyNhpsFb6TTQ8uUbisQz04Fqk1NURaykHb1+fNjG8VBWSyvF/H7HOJoP4HH7HmQ
	YSyMOXQqqFwYTBefL5/SZK3CfiPd5ErF+M91kggsSuzZkGHpxWnFvxcCgOQJ0kzSuZdqachnn2c
	J+t8jOxM1ZNR1C7FYghvxsAuBvH3dhIhsMmB5gYGphIYLh2sMaxPf7iJhrxlyv2oOSctjAO4Zn5
	v96z0=
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr55544905e9.1.1795012346844;
        Wed, 18 Nov 2026 06:32:26 -0800 (PST)
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr55544025e9.1.1795012346150;
        Wed, 18 Nov 2026 06:32:26 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2aad96sm58360485e9.6.2026.11.18.06.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:32:25 -0800 (PST)
Date: Wed, 18 Nov 2026 15:32:23 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 08/40] sched/deadline: Do not replenish a boost from
 cleared parameters
Message-ID: <av2295tJMdwRp3wK@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <cefacab5f1c0e7617f17e050af4ef5f6db01700a.1794922146.git.mathieu.desnoyers@efficios.com>
 <av2k8JlLvUcBBOhn@jlelli-thinkpadt14gen4.remote.csb>
 <ddd215ff-d6de-4dea-b12a-80948a9b5ea6@efficios.com>
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
In-Reply-To: <ddd215ff-d6de-4dea-b12a-80948a9b5ea6@efficios.com>

On 18/11/26 08:44, Mathieu Desnoyers wrote:
> On 18/11/26 14:15, Juri Lelli wrote:
> > The above paragraph is a bit hard to decipher. :)
> >
> > Maybe something like the below?
> 
> Yes, thanks. The next version takes your text as is.
> 
> > Also for other changelogs, I am not sure this kind of info adds much, as
> > I fear it will be hard to track down in history anyway.
> 
> Agreed. The next version drops the sentences that name the review that
> found a bug, in all the changelogs. The credits to people stay.

Hummm, now that you say it, crediting Sashiko for findings might be
worthwhile (for usefulness statistics etc), though.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506979;
	b=unTYNtiTpqkoVeyZ7HdPWEiGcBgp42GvWR3uxgG3DPXWAywwFGd1+YiQBMaXbBPxRQGL
	 8Io0Y5ehgAZmq5npw9QUTBghAj/IkD0jFoMwCUplMWJ/+yhZQ1cqkh6VTymvkrz1vlpr8
	 IqB12p14iFWnPiAnRgzMucgXkzBNYwxM+dwnuO84qys+PME2Uib7ipa1fj8w8ix0pKtmm
	 vwVd7UvpUD54c9HYPr6c120EEAD6AhmhudI4a0qcXkwhACPwud6GHCAPD54Uc97FfBjoQ
	 KPfAdarQYEm4ISCzvAh2Ge420IYA9gZTBRL292mrG2KVEdphzRWdx6B7Ke3+iuqKpBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506979;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NoYyv4wajWc0F6aGxtmlY+0UYbCgY2jiNDwc0W/rZK8=;
	b=GbtszxEGXu/bOhS9ZMx6SXvb44+i5vkX/7mPTwT4F3Z9UZNcVNFhWIqMk8GZ9ULJSx2a
	 v84DEZNpInPv9R7K6RvkJd8xRznJJrOlAd+QnuvqcEROYtyNYnUjC9gErGzVDL08EQt9F
	 Q8GgiD18N5j8+OnisZDJ6LC3esNbOY1PI61ThgoCnw1H/iicsFdOcgv2m/ymcrkjIF2/5
	 Zoe/QGiYq29gq52kNjwT5kdH9Fq82J+wbA4FKSZcyvNeVqqKJYbsetFylosqPsYmYIIZa
	 RtNIAyzjQMWZbtprPnssLEAYI/tApkBi1sCT31uWRhfA+l/MzqTpRlvU/DWgBg6d6Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrcsbKkT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="r/DjBX/o";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7BE7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrcsbKkT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=r/DjBX/o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795506977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NoYyv4wajWc0F6aGxtmlY+0UYbCgY2jiNDwc0W/rZK8=;
	b=TrcsbKkTU113+vqVGmCr5F5agOo6nLp5iarHo6rNrwbuzNoOv+6omaHtnIeIxPatsFxrnt
	c6eZfeAV6aGKYwAJYTDYq0ZDce+Vy+n9HKfbzE1H2aTGJXP2dKew/q3/yjAd0zLJK18eTA
	f3iMnVaU1x3Ht09E4RsRkGLR98hhkCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-VZD9Wui9PIir5zee6Vwu5g-1; Tue, 24 Nov 2026 07:56:15 +0000
X-MC-Unique: VZD9Wui9PIir5zee6Vwu5g-1
X-Mimecast-MFC-AGG-ID: VZD9Wui9PIir5zee6Vwu5g_1795506975
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so27931095e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795506974; x=1796111774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NoYyv4wajWc0F6aGxtmlY+0UYbCgY2jiNDwc0W/rZK8=;
        b=r/DjBX/oGoNUP21ZIsDVfw9kls8GLFm/CH9WHNSLQaw4tjukZxu9U3Ugimu7Jz6lpU
         vdhhX9zqgU2QzEnogYGKJZ5LGMYF0aHppCYp/lFEIucKYL6uCS6xKUbzExydIk1AKqK3
         Pa46QkXbUwRFI6H7hLIdevQyhqMNVCJosVTVl0LH6L1z0jLkh+hVz1iBGdRCV6C0DN92
         oKbIvs5xu5BR95jq47vSoe9X9heAxafnM3qa4sD2pEUD2ejPPEfOKzCqLnCfga2fYEyl
         CZy78L+9fAZck97V0/X8Uz4mYJO0nsdJtGmuUOcYKkWX6NSFQn4YZdNar3av62DaLLYE
         8MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506974; x=1796111774;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NoYyv4wajWc0F6aGxtmlY+0UYbCgY2jiNDwc0W/rZK8=;
        b=OnFgQTwNmDjczwBd4N1iry/09fWQRB7Kco/e75kfUmwUNpEnZS9jx/PBKXKzcm/OVA
         U2SAaVqxmbn1NhE9AyFGBuZ/ofy6JbsqQkv9x4vHOisZocSmyX+Nnpqx9ocNrL7CvJsZ
         ktfPAbrSQxt3Ct7uKkjV9yPYuHndijXFJb77u88el0+E0WYzBB1k6WqIdyCJcEFV8Zho
         UV/mEqKR/FQ+pL6EGRhU1xJ+LOoQrKhYn1cBmbfLlVTG1AgAqXtzUmIdDuLeZNhnqQjP
         MFEeMGvqKtI+hRFZznZeKIGuseQ34LexRyxn3sFbjsvcLzzGvuuDVsglcgV9I2j0dDEt
         s6PA==
X-Gm-Message-State: APuU4Z9tJJoN1LamkLh1Ux2+20L4hMM2DBIE9MjbTvPpY5+GEkxPWghq
	a2S3qjiuCvLtw6RO0V3dkmv83nyDVf6iSy437lQgXsCgSaa/haOhkwZsnNdjAXH/cPqeCXMhrYP
	bfICxAmmLYYUZwORiB+PHYoDR+OAKjkbtic8wBcx/TxlfZh610TtNu8xZUcn4akzBXQ==
X-Gm-Gg: AZFdTZf7+LrErPPOqfLLMf0ksuemoKA9PUqZIj/nafikRyWKdpiGQkCvKK8pCgyRGHl
	JY3zCHwF/KvvxKWpMqR6uqeIFFy/3WsdSwYxbBwPdnGjC5XNkltSB4akXC3emj4aYrd3hSn+VmL
	iN8I3M6NFZ4eZPRaPbnnWVGTN6VZxcvfiE1H1MXjlAhqtRfou0cvToiV7nxmAxrWORqg1GjNEuq
	n/pmGrG6Z8mxBd/T8vn3WxeSpLIruWKVDUaG4IPJbQd/Euui9QpYI6sXyh3+CYvMZLwP4slG/Vp
	xl1B+Uc/NOrnz9z2UVRnHLV+9MvV80uGKbo3XNJJu32viHrmRCIWn6Nd/Kl+vUPJ6G4Otr8ixJq
	roqJJUJvrKdWp6aYNNESsrmT+d46Yno2ow9oFYxcK3sYi8xlvAd5F608h0aFc8EXK+2EIOK+Sgr
	lypuE=
X-Received: by 2002:a05:600c:1549:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb8880abf7mr268983765e9.11.1795506974665;
        Mon, 23 Nov 2026 23:56:14 -0800 (PST)
X-Received: by 2002:a05:600c:1549:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb8880abf7mr268983605e9.11.1795506974353;
        Mon, 23 Nov 2026 23:56:14 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm30623656f8f.55.2026.11.23.23.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:56:13 -0800 (PST)
Date: Tue, 24 Nov 2026 08:56:11 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	rcu@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	luca abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yurand2000@gmail.com>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Qais Yousef <qyousef@layalina.io>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v4 3/6] sched: Add sysfs files for the per-CPU
 fair_server knobs
Message-ID: <awVDG-ABOvj7zGRg@jlelli-thinkpadt14gen4.remote.csb>
References: <20261123-sched_dl-v4-0-d523e4d960d3@linutronix.de>
 <20261123-sched_dl-v4-3-d523e4d960d3@linutronix.de>
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
In-Reply-To: <20261123-sched_dl-v4-3-d523e4d960d3@linutronix.de>

Hello,

On 23/11/26 14:41, Sebastian Andrzej Siewior wrote:
> The fair_server exposes the runtime and period knobs per-CPU in the
> debugfs folder. The debugfs interface is not a stable ABI.
> Make the /sys/kernel/debug/sched/fair_server/cpu*/{period|runtime} knobs
> available as /sys/kernel/sched/cpuX/{fair_server_period|fair_server_runtime}.
> 
> It adds a struct kobject to the rq and exposes only those two. The
> per-runqueue folder is named `cpu' rather than `rq' since it might be
> more intuitive to the user than `rq' or `runqueue'.
> 
> The set logic is pulled from the debugfs folder but it is still shared.
> That debugfs logic could be removed (after providing the same for
> ext-server) or symlinked for a while.

...

> +static ssize_t rq_fair_server_runtime_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct rq *rq = kobj_to_rq(kobj);
> +	struct sched_dl_entity *dl_se;
> +
> +	dl_se = &rq->fair_server;
> +
> +	return sysfs_emit(buf, "%llu\n", dl_se->dl_runtime);
> +}

Since these files are new and meant to replace debugfs, how about using
ns everywhere (you partly commented about it in the cover letter), as
sched_attr and the dl_server parameters already do, with the unit in the
name? I.e. fair_server_{runtime,period}_ns here and
dl_{runtime,period}_ns in 2/6, with only the procfs compatibility path
converting from us. Right now /sys/kernel/sched/ has dl_*_us in us next
to cpuX/fair_server_* in ns without a suffix.

Related, do we need to add Documentation/ABI/testing/sysfs-kernel-sched
entries for these and for the 2/6 files (units, defaults, limits,
what 0 / -1 mean, -EBUSY on admission failure)?

Thanks,
Juri


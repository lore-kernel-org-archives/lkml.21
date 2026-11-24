Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515101;
	b=KV1sih2efZod9guc2wOY6eYd/Uv82dwYF5C+NcgN+Y74zOrzjT+ZTu5BNEqDP0WAUs/A
	 5mQF9pGKkjLMTlZ07ne89nkc+AgGnPx1odIVB3FlH9Tbo893n0zOx/VkHwWkgNa1Orfu+
	 vvTHQC70WMLOblxk4T6HKfx15t+h8MHfKac8nXm3SIOm/58YcbM5O6xdwdohc0OYUKxdX
	 AUW4guvf3wR2NEyyM+nEce72voGp2b/bN6+Aj8YOtVW8Ys7IX+ViK0ide6B86HF088qua
	 H6MrQ6q6zjU2pPAiTaHK58MIQ7Y/rkRUg3rvhMLzTbDO+8Eo8NrzjpKKZcHmgh27Mxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515101;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
	b=xqWeuqDvHcJ2srpRykpRzg5UD4rm11gVGC+ddLc772RsDSvf9v9fwrRCGIhYczgNwOmw
	 cuKCS0yC9WB0nStSdSV7xBMLMXCZjALsBuQMg/IjLwircIRhZ9bOXg8luttoFtE3VOc4f
	 lJ5mpYPDw6D5gKFsAw+fKQ/eYBeYVZOnDH4PfjnIhDWligPCAhfAIdlJjZ+QM64htOD59
	 h6JqnZclnE3xBH33lSD9USLEflT152LopRaNfNb6zcBAES0BdTwjGbhlRLmrfQnsONBZv
	 1F7bHjEVXsKV1JLWo7i2xYJ1r/VGJ5dLDJwTMTVZKBwC8SMiWQ1n2UTv/xoYJrOLb7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IbXHKoo9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h7gEJN8O;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 258C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IbXHKoo9;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h7gEJN8O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795515098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
	b=IbXHKoo9kVj7k2Kc6ZfodAo01YUD0MCHr5NRBhyGiG1RrOnQ7FiyHJTwZS96VlEOsA8HI9
	mbnoFPjCv5hKKFKfhbiKjToUFsgzMyDMZauTlh3VpCLdEIQfL4UV8P0AxGR3/FeOLjNb9i
	iWxdb+/Cdan4UgN265dnWeOH3pawMF8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-FAec53xaM82Rs3O9RrfvPw-1; Tue, 24 Nov 2026 10:11:34 +0000
X-MC-Unique: FAec53xaM82Rs3O9RrfvPw-1
X-Mimecast-MFC-AGG-ID: FAec53xaM82Rs3O9RrfvPw_1795515093
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so27803095e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795515092; x=1796119892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
        b=h7gEJN8OBgFNUHMdvcvxCov1aoor2h//nVUcZ4O1IeANH5Uw9lTCw81D8dSFXQYQuI
         TlFGbh5jsTUr3qC9NYY48D7BnE563i6L1gwsCg9YhdYf7Jzd+TpwNdve2e1UufSUTfva
         A+0M1ayAJ70R1B6OGnMQLNUYZoBrNcfGhTH/xQIH0rdcBiY7+0fYEGzzya8Jye5F4nvW
         d7MaqcsOAhuqmC9y24fkr9lszPYSwZMLlqWAPxhCCwAMAnWUvD0guVB9/JsSNKWHwz36
         L2y4QQIiLlJu1kz76Rvpo2bVQIZrTT3QQhZ2FwhtkjVFMM0Dn+cGWemtLuAYiZjR7SZB
         FeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515092; x=1796119892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
        b=W73pzWHbpjuydJ7yhM8XzDbo5UUZ+8EZHC/vYytB0w3KzozPyezk0Bvzb38tnP/DDQ
         AgaABBrAeDTyTsFg3NIY4lcIwJBk79ylP2aHlum86A6PPdpfgDrVG9CYqTvEBIaFwOoR
         smkYmEFZADoSRCAcOOVgfL2qqiLaMgx7/dxGHI1s+FlsNFBl/CfBxEioqpcQG2cpEPdI
         URs1Ndu1uBd1k6ketxcWFfniadWYN6VyKZ1We8qAP4aC8YHkTASuVwJ2KIkHkVQVddnm
         mEZJRENoemEDqyddZFiycwxDCngCKlb11/MqQDseuYZEAJfXmJcfs+urdlMsz0UJBfgb
         ZngQ==
X-Gm-Message-State: APuU4Z9SKm0kR7aX6jWIHMfeQU1Op3tGqlZ1VTzEvXM3NDiQl91WBOby
	A6wlXRLoHUmUwKBxqmTlxBphlt7kMXFe3+gCE8c+fWELwd1ebS2YdQz47bc0LIT4UsHmkZXvyiA
	TrWS3mIKZNtBCvgGdKcsMcDhcQlp+DhRDiQiZ9sBqIlkSG9twx6ZuQPyrqEn6iEMXNg==
X-Gm-Gg: AZFdTZf8MVuyEBt3RpBRaGjck1o+89j94WY+niZx3R1x/rSQViQs2jkynOV9e4eEaxr
	ZA4fFOLOZacvU6gzL6Ln8tF2I5rBUWINmFy0Gm0TMpUHiF+XHbvEvU6RfHgVVNepLgmxfXJ+GBg
	yaaXF83cXH5jZTkoGsZdf91XS/QtbLfg1Xc8EWHtCUaxEuS8QWNMfgb5YBvimq72X3QJC57y156
	JqdJqzd6Zmj0skZOJ2zAJDpar0GKVoGViZI9weK1Wu/C0DeMHwK0IW8dj6FvsHezztyncMjnJB6
	Uhvy62UZAI7mvkUDZvviQKRBgMVSMdrz/G+/neg8KnqPY0KrkbCQqSZSh3lEwgewaf6z0ywNLO4
	P/bK18tQxQs6tca9i/8KIORCtOjwgh5knw0iQ2GP+aodGyLhU7ODHwRwoJEmCnjyTZPfQPqK2Ku
	/3R8Q=
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr294991755e9.34.1795515092664;
        Tue, 24 Nov 2026 02:11:32 -0800 (PST)
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr294991115e9.34.1795515092291;
        Tue, 24 Nov 2026 02:11:32 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm28093795f8f.59.2026.11.24.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:11:31 -0800 (PST)
Date: Tue, 24 Nov 2026 11:11:29 +0100
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
Subject: Re: [PATCH v4 4/6] sched: Limit sysctl sched_rt_{period|runtime}_us
 to RT_GROUP_SCHED
Message-ID: <awVi0VQJCBNYc8u9@jlelli-thinkpadt14gen4.remote.csb>
References: <20261123-sched_dl-v4-0-d523e4d960d3@linutronix.de>
 <20261123-sched_dl-v4-4-d523e4d960d3@linutronix.de>
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
In-Reply-To: <20261123-sched_dl-v4-4-d523e4d960d3@linutronix.de>

Hello,

On 23/11/26 14:41, Sebastian Andrzej Siewior wrote:
> The admission control for SCHED_DL has been moved to sysfs and RT
> throttling has been moved (long ago) to the fair_server and its debugfs
> interface.
> 
> This file remains to have an impact only on RT_GROUP_SCHED. Keeping it
> for ABI/ compatibility reasons makes no sense because its original
> purpose (RT throttling) is no longer served. Anyone changing this file
> and hoping to change the throttling behaviour will be surprised.
> 
> Limit sysctl sched_rt_{period|runtime}_us to RT_GROUP_SCHED so everyone
> using this outdated file is aware.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---

It looks like subject and changelog still describe the previous version,
as we are not removing the interface anymore?

>  kernel/sched/rt.c    | 8 ++++++++
>  kernel/sched/sched.h | 5 +++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index bd37dbf2bebbe..258b187459bb9 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2877,6 +2877,14 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
>  	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>  
>  	if (!ret && write) {
> +		if (!IS_ENABLED(CONFIG_RT_GROUP_SCHED)) {
> +			const char *msg =
> +			"Please note that DL admission control (via sched_rt_period_us, sched_rt_runtime_us) moved to sysfs.\n"
> +			"This update will be mirrored. Controls for RT throttling moved to the fair_server.\n"
> +			"This will not be mirrored. The fair_server settings are under /sys/kernel/sched/cpuX/.\n";

I am not sure a user who hasn't followed this thread will understand
what "mirrored" means in this context. What about something like (names
depending on the unit discussion):

 sched_rt_{period,runtime}_us only control SCHED_DEADLINE admission control,
 now also available in /sys/kernel/sched/dl_{period,runtime}_us.
 RT throttling is done by the fair server, see /sys/kernel/sched/cpuX/fair_server_{period,runtime}.

Thanks,
Juri


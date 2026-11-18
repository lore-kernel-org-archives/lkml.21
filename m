Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012077;
	b=sDC3zsHOlcxtDJmQjd5o8aQMJz76Fi76f/bfjSeazhUAWDZOZw5dk1EcN3zQSM+07BBx
	 Zof+eOYaoKJAISxUjiAFTSJUh+W3d93MvykubW+LHxRnUSdprhzlODCmuQkg4XjbREnw4
	 3z8KHkI2HZ3jEuaw03SP6jUk2GAiqpPfqg/8xNfemJe6UqbE7/viD7jsayiaD8yMrKxce
	 p2Wba5atNMhc4NGR4BFb5GJEda7TFp5Olap3whEclm03Ta1N1nQJ/FHvo4EPV4NyevywB
	 s7wuQwgsPchMihY8znovExK6CXSywvzqz8Hsnc7rUhm86pcOCz7oayyvjGEMFfh3IFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012077;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
	b=Y9ceElVxzU2paHEznrt27zpU3+COlGVkfSfuMUd2328vOy31T/9+zqwNTivCxvopmDSM
	 Itj27Y4QD0gY/Z7KJJt4C7WbA+SbCeAH5eqKlK1oJMa+tAGWzn3AMpGMAX9C++Ao3Y6vo
	 2XBg9oLsCcw0IJTjE/+zYVwrsswSmuFpTiqm01bg6CYeQICS3JGUSd3TrjXYVGdoAsjzr
	 RdttahI+nxUW938U/6GG986cX/2N5rUsTkTFBdUWAN4B+OVRTqhA3ugDssqK2XLo7xNDi
	 ax1iR7bhFUaD7bM/RGPXZf1brm8JUO7BxefqlXx7lnAs3kmYzykgmCX4x+lRPF81BQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkYNVbFy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovW6qsQm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4493960A2602
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4493960A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkYNVbFy;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovW6qsQm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795012075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
	b=QkYNVbFysbtyTo4AxL9B0KwDuvSpfKKsbLodLqm+JE17yhpqM0Uc1uPV54vOxQ2dt2R8Mp
	DR5gWNMiUB1X7iZeh1X3GFSnqhRQITCHNkf1td9SMRIMjElUawN3/Z15TV4NKlFp/cpIEF
	H5TGVjuYC28MEq+4aildZ7y8A8b27uc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-JZwUMDlQNeeDOU-D0YIrBg-1; Wed, 18 Nov 2026 09:27:54 -0500
X-MC-Unique: JZwUMDlQNeeDOU-D0YIrBg-1
X-Mimecast-MFC-AGG-ID: JZwUMDlQNeeDOU-D0YIrBg_1795012073
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a3052225cbso1017239f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795012073; x=1795616873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
        b=ovW6qsQmxXVAihs5E/C0Up2koWSJwl97J3RlT0gDjxNl/3ewPaKcGrXV6X/pbbBTw2
         xi9g//5llwdtKmaJLelowcrxl6y2x+sSq/SIaGXuPrGIx7XotPDQPhf3iy6TPJp63kL4
         z3BSDoag6uBYVTcj7pKhffpS/T6Nx38DFBhbvGqc6b472iaOq7TrkQ4AqGzbrwYncE6F
         24mDqAPo/P1px0V9gCwDqrbihj3uE9zsWEh4eM7S8K66PxOvWYx6UwR6BnOD5nLDovKG
         ZgBLNUOY7akxZNQFRg8u9y4rWNLBdBE+JiRdlM+VlZqGrz+8T5aX1b4vTxhG8aQYZkGP
         G7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012073; x=1795616873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
        b=pgCt5TYBVF3GWPXtc1liPQ3jftOpGHorRZnDvaq0M+i8vmguEIx6hhEoGi2mV0ZQXG
         68C8ECqvoBaJ2c6Cpvo4+2zkBaAIxPpoSN4U8HH2xIF7XVL5lI8CdEfeGNwAYJvWzy6w
         Hxfwt4miijBs4bYLAtYqfkEhGluFR5bLSq6jm6JYRBcn0gh1y/dfplf5n9roXH3hXzKz
         d5HfJgoujC8urw2LoyPcDQdAbvSYR716Eb2D1fKYh+dTQABZxwkWq6Bz1dXFFcqtXFpU
         pI87Z5r35ovFHBThzP8WMrwFBt7IIrbRoFfdnkePBQGPf5KhRinv6UJqY2j/wP/XVCIM
         0xHw==
X-Forwarded-Encrypted: i=1; AL+hErE+S4b4S/MU+SO8MmrtqIU53txTm4SeCvPko6SvblB+LJ92BSAPxiCR2giPLTgqDvlj391tuDIavX8462c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oa/1tkspUW3BuvpujFZkNbqHQEf0vsLnyXCWZqzYgPReGfBfS
	B6qWuEqHQsWGVsfEjfNXIe8aGGGOQPKime0oo8vVBobblOepJBCXXTwz4mjnxI+NC9814XkWBLR
	xP3Hd0zx2dAQ1wbKBOiaymom3w74j3VZSv3zk+Glqsw4axve7joct/1BP7+xawqXryQ==
X-Gm-Gg: AZFdTZfbF6dWt79DkYTGPA8/2WjpYGKx9wrLYvV85dKoNvsfdlL7Saclbtg7xDboRZ0
	GPlJgfKPxpyrFR2XymVwkf7JvMNPeSH4UAEi54jbnjCZUqSp+Pdt3o8s9z0ROG4CjADXMiTLXEc
	UzX5CyHUKBV2sxGTriMGahNX6FtTvh8uXs5EX/uyEZgXdTeGGDxG7IvI6keZ4bxv7Ey0hX+Vbpn
	vjsEzm/xpi1FGMVVunkndVZDcwueAJsTGbSaBts0yMVcZu/GBaEIYzaiPk++hCktoj5zH1WGFtH
	IioCBRdcJGc3GgxcKX9BFE8qagTc37uj+wCAUlS8r4O1BnrHOt/iYULKDw9GlQzwC5RS/qOJWa2
	cS6TRNukqcxA1vjklTJYijpPDCHyAzsBgzC94M7etxkrcDcj3Tzp5HTfX1JSqryjJxlcE6dh26/
	+a4HU=
X-Received: by 2002:a5d:5888:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4a639475750mr5574858f8f.17.1795012072827;
        Wed, 18 Nov 2026 06:27:52 -0800 (PST)
X-Received: by 2002:a5d:5888:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4a639475750mr5574789f8f.17.1795012072412;
        Wed, 18 Nov 2026 06:27:52 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656933961sm5275395f8f.46.2026.11.18.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:27:51 -0800 (PST)
Date: Wed, 18 Nov 2026 15:27:49 +0100
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
Subject: Re: [PATCH v7 09/40] rtmutex: Continue the chain walk when a
 waiter's deadline donor changes
Message-ID: <av215SnBF5GShg0J@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <c8b228501d8981454f63843b394019fefd4002f3.1794922146.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <c8b228501d8981454f63843b394019fefd4002f3.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:

...

> Fix this by recording the donor in the waiter with the sort keys, in
> waiter_update_prio(). rt_waiter_up_to_date() compares both. The walk and
> rt_mutex_adjust_pi() use it. A new donor then takes the walk on to the

...

>  kernel/locking/rtmutex.c        | 22 ++++++++++++++++++++--
>  kernel/locking/rtmutex_api.c    |  2 +-
>  kernel/locking/rtmutex_common.h |  3 +++
>  3 files changed, 24 insertions(+), 3 deletions(-)

Thanks for confirming the Sashiko finding and for the plan in your reply
[1]. As you note there, a window remains however the walk is changed,
because the donor pointer holds no reference on the donor. So I have to
wonder (and ask for Peter, Thomas, etc opinion) if we'd rather not keep
extending the chain walk for DEADLINE PI, which is known broken and
proxy execution is going to replace anyway, and leave rtmutex.c alone.

It looks like what we lack is memory safety, apart from accurate PI.
It's an hack after another, but how about having the owner pin its donor
instead: take a reference on the task behind dl.pi_se whenever it is set
to another task's entity, and drop it when pi_se changes
(rt_mutex_setprio() and __setscheduler_dl_pi() are the only writers).
The donor then stays allocated at most for the owner's critical section;
its parameters may be stale or cleared meanwhile, which
replenish_dl_entity() already copes with after patch 8; and the owner
may keep running on a stale donor, which is no worse than today's
DEADLINE PI. Thoughts?

Not against doing "the more right thing" of course. Just evaluating
alternatives.

Thanks,
Juri

[1] https://lore.kernel.org/all/f535fbbd-2247-4d0d-9771-a67116fda1a2@efficios.com/


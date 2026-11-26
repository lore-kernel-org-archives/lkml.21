Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725581;
	b=3ue1oPmVw2GyL3hPTuJpmYbdGC5lnXt8zNkwttFTC2puPfgFnCgTf5OVGtF1vbSTZgfs
	 NwPhE3/B0Ce9knCLOSkRB43683AxXiJ2WVHqIbe3VCo74iRbkuTDa9Olo4uF3Jxl4tEfF
	 f1YXAQUfrXTsrnxSTc03VFyd7vWHZNtdylOfiQwXdVClW0CfJkyZz36kTir1SRhS/AjnQ
	 JBOd1xOaLQzhzKiGid0yTnklhV5zaNTHOhfWh20ftkEX0x0zxef+DEmiV29OGbqoWplD/
	 t7NMr8zEmOzHy9nyRzO/m8kGe4DbZG27TspFt9IvJ4YR6kcyf4t0XTjGYeZChCJrviA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=1ULurqX3SBBqjAdy7fFaPWDUCghKvLpjXthTQufVgQQ=;
	b=pNVZ1w9wvaI+q6vJS1AvrPwwc6mqUJKbtovM1qSSt4NKAw9iMOxxN7Dn1fLiov9WTXv2
	 qRwZWgaYm3QwZGdhEDLp1riUclgMYPnjz83DCxVG8yGwsR4CjCzIJzW/kt+iSsFsbuKOA
	 Jg/Id176m90CYe9BkMLw088xRpGdRNFOQhjvdJ3OZZpKl1E3iteprhKuOUEp2qJSPcKK4
	 4MWB82ZiBiTqITWjm+huO4yWgI5rrmOkkIrQRLmfAleHOkmFx4yGO0u54MUxMzfEC6zA+
	 GwrlwaznFNih6hnZ02B14IB12VUdd3SjC3l73bT9R5ngZWYo+DbKIu2bAN7MTduGsDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=decMy6mI;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E876606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E876606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=decMy6mI
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0a0d1a1e5so23516355ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725581; x=1796330381; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ULurqX3SBBqjAdy7fFaPWDUCghKvLpjXthTQufVgQQ=;
        b=decMy6mIngbwbYrdEb3XYeS+NQ4EySEQf0DNiQq9vS4bfEoI1ftzY5klrUE/UYoZpl
         UJTEh1N9WBu+1uy7ktAYMpGHWGdj9YaPpaMtz0xCbw18tuoAGODHZ3U8GmHb64nLa+7b
         kYCxJ4+yu9fYrkvdOKV6/BHnMiXQLY9AH+u6kmDneT1d+7AKLLg23WJ8a6Ll5yY0QeBv
         4WXmn4PK1NHFfby7xDDtCG6MAN8EpYHTumAQ7lNIeDxrSVbru47az0IpHD3iAGvnuleG
         WdVJwjHlLtg2ey9qVGk6ercNXpoECLfuAFg1WnEKIAfElgLu9pLLnVZ43TQCw8mUzStX
         hbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725581; x=1796330381;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ULurqX3SBBqjAdy7fFaPWDUCghKvLpjXthTQufVgQQ=;
        b=k0UF5xLKAP3onHwde3V9OVt3FJHzjiinl5amxIUueyaAFhcJINpb1iEEfApCb9nv2x
         8UUw5XFbs9ZQHE9KGp4UFB6HK/hBfS30wLwe/efhisosL+GWkbTYO3o/ghUoPIjEMztD
         VmD3+cqVNP8Uk9tcysbfrCYquh3TWmbsWUdPZP9ww47OI/OX6ONiwA4tTNQCFPjUg6Nt
         wgLUv7u9sgaA1dDQBYbdQpcyCkWY6QExz0vXCvK2PL17yMX/MvYZWD5nNkuL8mzwuCjU
         z8M8bQgA/FUbT9kqwH5nz3omNlTDoP8oS8aAO8gyFAxnGpB5Fbsazx4vWBxeT1/TuVqs
         pgmg==
X-Forwarded-Encrypted: i=1; AL+hErGdseyYeCevEOkmr0ideyFqdMJOcwoUyn5etHHImHhSwkVwBvwVo7wXh/7Z2g6OVn27BnftOC+7aXUIdVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dW4fLMX1Z5b1orl3FyFZiqngfdQGaCmAxOLCZ9ZDt2OZC5WFA
	2nadVTdH5o18hIkU0Wp6bdqkwrjWWiccdse4RWzCaGQOhCc6ACfCUYFK
X-Gm-Gg: AZFdTZdkX2VkyxPa8D6ueIEFq1SnEDIXl+gKux78S5JzjS30WMv+OQE7pdJ7TocVMCD
	XZpMG9i+B08CF9Z1F4NYihuAA1IZyi5KmHgihfIPIahts1u7HOFhOgjkJvaZZfGmOwznjWhS7m+
	4mRM4NknIGyFwN0bQ6aXGdQEg3X4ja7FnEIJkprSSfWy4YDazbERTGtkg8xcqSF/bh/HNqjDAYq
	4MFmbNJa574Syk/WrAZAiZcAvRYPTGYbSRhnB189hCVOC0DmoEdUvCgYwyAQBP5Fwj9SdAE12ag
	euGJZbtCWDGI7dIWEjuQ64TqSPPIuIFtt7sLWITBwoAvInwEsl/h2IBtKi4VVbifHxvgFexyMO1
	Xeg5CWhXCkOBKGiorPeYbT0A19YgEGnCJJFjEq94NI5fN1ejxrakKr4zi7uZgCSe9mPMEV+zMOG
	60pJhofg9ViCej1e5E+hsqXqV26DytAoIDCUVomqn816XzcUtqTSwaYnrEaYFRUXPVH/U1xjUqa
	dwTprrWeBh9hWNUYy4ZRMpooAGmyhTc9KNxv1c8B3mjEDvnLbKDHpNxQ9ujpDFtJ7n+UlOkfSD/
	gxSv+cXtgrEdE3P18AuDOmpW2MEnEX9vwodrPyJtx2/kKCJo81BRT1DI0cMoARW+zR7Tzpqycry
	4zCe46vqDOVLp3wlCQ8EPh8tTGO6LkScrJA==
X-Received: by 2002:a17:90a:da88:b0:3ac:a11a:7c84 with SMTP id 98e67ed59e1d1-3b41c982dafmr20430646a91.65.1795725580807;
        Thu, 26 Nov 2026 12:39:40 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm11352777a12.19.2026.11.26.12.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:39:40 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:39:39 +0000
Message-Id: <DN5FLAUM107A.TFWY9O1V23F3@gmail.com>
Cc: "Harry Yoo" <harry@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <bpf@vger.kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <daniel@iogearbox.net>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 <linux-rt-devel@lists.linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Hao Li" <hao.li@linux.dev>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Brendan Jackman" <brendan.jackman@linux.dev>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "Zi Yan" <ziy@nvidia.com>, <linux-mm@kvack.org>,
 "David Hildenbrand" <david@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman
 Long" <longman@redhat.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/4] bpf: Add call for selecting kmalloc or
 kmalloc_nolock at call time
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>
In-Reply-To: <20261126094403.GA49833@noisy.programming.kicks-ass.net>
References: <20261124060357.11700-1-emil@etsalapatis.com> <20261124060357.11700-2-emil@etsalapatis.com> <DN38HGVL8JHQ.2ZVZQCKFXVA9T@gmail.com> <awWRZ9xCzWLnj_R6@thinkstation> <20261125140902.GE2668804@noisy.programming.kicks-ass.net> <DN4QLI2XAGO1.2DDIFJ49PNRPS@gmail.com> <20261126094403.GA49833@noisy.programming.kicks-ass.net>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 26, 2026 at 01:44 AM Peter Zijlstra <peterz@infradead.org> wrote:
> Allowing this on !RT makes people think this is 'OK' and then the RT
> people get to fix endless crap again :-(
...
> You're actively creating something that doesn't and cannot work on RT.

There is nothing for RT people to follow up or to fix.
The diff doesn't introduce any new failure mode or a path.
alloc_pages_nolock() works this way since v6.15.
On RT it returns NULL in NMI and in hard IRQ.
It allocates in all other contexts.

The API that people call is kmalloc_nolock() or alloc_pages_nolock()
and the contract is the same in every config:
any context, and NULL is a normal result.
The caller's code is the same on RT and on !RT.

> Locking constructs should behave identical across the configurations to
> avoid divergence and create problems.

Conceptually I agree, but my bot points out plenty of practical
RT vs !RT differences which are way bigger than
this internals of kmalloc_nolock():

  where                      !RT                        RT
  -------------------------  -------------------------  ------------------
  debug_objects_fill_pool()  allocates in any context   preemptible() only
  printk(), legacy console   spinlock_t under raw lock  printer thread
  vmbus_isr()                spinlock_t in hard IRQ     irq thread
  kvfree_call_rcu()          uses kfree_rcu_sheaf()     skips it
  local_trylock()            works in NMI and hard IRQ  fails there


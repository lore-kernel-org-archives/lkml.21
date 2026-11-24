Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543670;
	b=v3uuQiH/n56HJi3tQ2OtpWycdc2rluIxpv6ym3ZHaJH7MI7vZiBFzCc2tl7nqyCAqxcy
	 sShfHVYQ1LIFHePGyuYa9ln9wx1fvt7IBWWJlJAyY2RVf64ks9RcGR8S3j2ViPTvBmLZt
	 ZHG4MvE0ukpoKmFuYdtS60RNa6in5bhIGA7NJiYBwVC2HwrkFO2ibhPxa0AoOW6kCdzjs
	 av5J3n4RKD+HQQ7mPySu3c0fupO142mzWsjBsUlrjP0Gxdr0bhNUDK1R/rMiWhL/zuql4
	 6Wt2FvVkILTdZOe4IVF4K8E5lYfvx7Ct9jCkDNfJ2Ifxhm9tiWF9UduJzu2zLekRCqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=VsP8MXxfo3SZdbWSOQKBU/IrTFvBThmLY9Ku8DE2rr4=;
	b=3R0KybpPTeC2A5cOYAH8nBkOs7WkhHMOKqJb2xSj7NrvVXsAzpXI5FhAE7T+OYVhgskF
	 t2EwMvPrpGVtaUXw7BSwyiw21flO04A0s6Evxa1ZofX0rVH9uV+oFjCO0zTZaPH3g0+a+
	 xfCmiR0+gOiBL+V3QPTnGnV/8N54LBbwuRWLk/oo6NpAcTQI+GtDD6Xt+OnkLnK8bnp49
	 iOxVKtrMmrDJtFKaLWEa6GF3VSPYJsJ3kjxcILWsoNfyJ6h1YKOhBn9sgw+C0s6LkM7N3
	 wtvgURVFUZzL8DzLa3W5d9dZ/bl5txTg0O+Dmez4O1t6Ne7LtzroQwO6oOIrma+Rryg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=m9Gg7CuI;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF154606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF154606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=m9Gg7CuI
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso3399484b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1795543668; x=1796148468; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VsP8MXxfo3SZdbWSOQKBU/IrTFvBThmLY9Ku8DE2rr4=;
        b=m9Gg7CuIG+jD0F4py9j/7S33KdOQKnj1BFeWFS7deXWSLRTSpi5axZOyScB7q6h6Jh
         cmKjd39TdnMesr99sl4PPEOr3evNY1EKBME81qLW7WSlv5c8a9SCm/S6X6hHddaB08yv
         2MSNmuhbAU2STpzoHFA4wmXjjadDndtxEzyBGzgYkx3G3ufBdWxE1PZcF0WKZvimIqu7
         sfsDDLZnEf6RXQu5S1mXmLeryVmpwDINaqvOwVKxHrqoD3bpyFgOJZ3A0Cx8CEkUtGFD
         lfIqZ2QmJJYn83ctLX6MeJ1Q5K9jynH26heEoTBO1/VHsAWjYFLbjL1/xWLlK6yE22Of
         eL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543668; x=1796148468;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsP8MXxfo3SZdbWSOQKBU/IrTFvBThmLY9Ku8DE2rr4=;
        b=s191ayAGdAxcxoXXx3OCccQPpi0NU8juS8uhwiUSHTmufFcFmK0EqX6MJqqR7Zg9W5
         Uv2Roq+OVWfgOHXbjqcYljdYwQT7sRo90Puo/vfdXSf4qoR3UXEhqX+HWUDyBRCkwdfc
         aIf3lgGuGEh65frzZyiNtkcCZROjkFxt6QbLuWqTfasjuI5lUE7e2JufQMaYDLqtrfX1
         DWB0iieL7heSYzFBoslheaLc2sSYwmyEpslcN1ck6faDxCc1li/rMiamPpbWaXqKzEYs
         rRCRQ+DAdNaJKBFrV5wDMxDJC0iwjDUsbCDooVtDkKtOGh5VBkruezLY8WtIKuCtLyn2
         IJaA==
X-Forwarded-Encrypted: i=1; AL+hErG5hLOISglKHhLhrXQR6c7ygEL3Tf82Gl2kAN45iP7v6XKv86/INShLRzCZd7MCSLKlJYs5RzjatLNC85U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LdUsPrKPdN7o0R3gKVeojkmxoV9/bf/zTdw59vVdLvI830bFY
	6P6pCVQHKpPoFBvjCL0gjgVLVl+00BocpXVgl8B9CEf46q5nW1BuurAzHEiH+2lC/OY=
X-Gm-Gg: AZFdTZeeYUzPCPw9a32Gm2lCzbFWoB1RkxmBX/P4p7ANU+eft2agYjAFxgntWiFCAx0
	5qgh4NE5/3EYJnIcVn05dfvO4rcW+UXgYkDQGIFAp5/QDcXDbmpol+izjWJEj7h2Ja+jYqW2wh6
	JSYhKngmZAWIDL0VftTU8+Uy0FsjMFOQJjfwsqcv9V39jaNAzjoSqrJNjKDZKzHEmuMKyRjPcDR
	3v59ikxXEf7GjnNWae8U3KQAHjmKkibZLM2w5V1t+tMACO9NnW8VXzA1P9oZJE002w6u611+HLB
	SvZcHrwK0sr6lHlFXOcxeLSnojMsifysu1lwTggTWsdCNZozFrD+Nt/4iUiM2m57fY+MMoiBXUG
	ftbaeRhnNdf0C8FC+VCor+9m/QpVwLLvAR8kyMDOtxe1GFWYJ2UMxcTFw4Yu/KgznnYdPLrc+sZ
	XCZdHLqGMoUjtghpdM8TpqwNtyWggWbk0ho4rkkB+3G9YonRbG0Im8nr+71CPnGYfkA4g6HVa0B
	8HtymjGlwmiImYrUUeuLj3/3JKv3yy1FeT34pUa4mKLDCjQKA5VQAqaBNB4uzi4fWpTiTXybk/0
	ACxORauM22HqPAH4VdH8hFBYo5k0+O+TtPjee6bZrQel/DrSB06qLt73KTYzNVMtLeJe3WmoTQT
	gDKA5nhxkGUgRoFSH4/Az5vBeeRVL9OCRD+lig6c=
X-Received: by 2002:a05:6300:492:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-401493a61ecmr13003503637.9.1795543668120;
        Tue, 24 Nov 2026 10:07:48 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm7283156a12.15.2026.11.24.10.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:07:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 18:07:46 +0000
Message-Id: <DN3N3WXWFO3J.IQPVUAFZKE3B@etsalapatis.com>
Cc: "Emil Tsalapatis" <emil@etsalapatis.com>, <bpf@vger.kernel.org>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <daniel@iogearbox.net>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, <linux-rt-devel@lists.linux.dev>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Hao Li" <hao.li@linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, "Johannes Weiner" <hannes@cmpxchg.org>, "Zi
 Yan" <ziy@nvidia.com>, <linux-mm@kvack.org>, "David Hildenbrand"
 <david@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Waiman Long" <longman@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/4] bpf: Add call for selecting kmalloc or
 kmalloc_nolock at call time
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Harry Yoo" <harry@kernel.org>, "Alexei Starovoitov"
 <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261124060357.11700-1-emil@etsalapatis.com>
 <20261124060357.11700-2-emil@etsalapatis.com>
 <DN38HGVL8JHQ.2ZVZQCKFXVA9T@gmail.com> <awWRZ9xCzWLnj_R6@thinkstation>
In-Reply-To: <awWRZ9xCzWLnj_R6@thinkstation>

On Tue Nov 24, 2026 at 1:59 PM UTC, Harry Yoo wrote:
> [+Cc Relevant folks]
>
> And a bit of context on the underlying problem.
>
> kmalloc_nolock() could fail when there is a contention on locks
> shared across CPUs (e.g., n->list_lock in slab, zone->lock in buddy),
> or there is a decent amount of memory pressure. It's more restrictive
> than GFP_ATOMIC.
>
> Unconditionally using kmalloc_nolock() in BPF local storage is
> unnecessarily restrictive when the program can sleep or spin, and
> Emil's patchset teaches the local storage whether the BPF program
> accessing the local storage could sleep or spin on a lock.
>
> Answering the question "Does this context allow sleeping, or spinning
> on a lock" is extremely tricky in the Linux kernel as BPF programs
> could run and call kfuncs almost at any point in the kernel code and
> the "context" is usually encoded in the GFP flags or the process flags.
>
> Tracking whether certain locks are taken by current context is not
> ideal either as it adds unnecessary overhead for everybody.

Yes, we considered the page_alloc approach with Harry offlist and I think w=
hat
it comes down to is that one approach is the most turnkey for users while
the other has the clearest semantics. I went with the latter because
making the selection straight in the BPF code makes the behavior of the
top-level local storage alloc call ends up easier to understand and
explicit in the BPF subsystem.

>
> On Tue, Nov 24, 2026 at 06:40:11AM +0000, Alexei Starovoitov wrote:
>> On Mon, Nov 23, 2026 at 10:03 PM Emil Tsalapatis <emil@etsalapatis.com> =
wrote:
>> > +	/* Only try the spinning allocation when preemption disables are tra=
cked. */
>> > +	if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && can_spin_in_alloc() &&
>> > +	    size <=3D KMALLOC_MAX_CACHE_SIZE && !(flags & ~nolock_flags))
>> > +		ptr =3D kmalloc(size, flags | GFP_NOWAIT | __GFP_NOMEMALLOC);
>>=20
>> It works, but I after a bit of brainstorming the following
>> might be a better fix, since it will address the root cause:
>> Pls run it by Vlastimil, Harry, Sebastian.
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 2fef409..4368ab5 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -2536,6 +2536,24 @@ __rmqueue(struct zone *zone, unsigned int order, =
int migratetype,
>>  	return NULL;
>>  }
>> =20
>> +static DEFINE_WAIT_OVERRIDE_MAP(zone_nolock_map, LD_WAIT_CONFIG);
>> +
>> +/*
>> + * zone->lock is always held with IRQs disabled. A caller that runs wit=
h IRQs
>> + * enabled is not nested inside of it, so it can wait for the owner.
>> + */
>> +static bool zone_lock_nolock(struct zone *zone, unsigned long *flags)
>> +{
>> +	if (IS_ENABLED(CONFIG_PREEMPT_RT) || irqs_disabled() || in_nmi())
>> +		return spin_trylock_irqsave(&zone->lock, *flags);
>> +
>> +	/* The caller may hold a raw_spinlock_t. */
>> +	lock_map_acquire_try(&zone_nolock_map);
>> +	spin_lock_irqsave(&zone->lock, *flags);
>> +	lock_map_release(&zone_nolock_map);
>> +	return true;
>> +}
>
> I'm not sure this is a better solution unless this could be generalized
> or abstracted further.
>
>>  /*
>>   * Obtain a specified number of elements from the buddy allocator, all =
under
>>   * a single hold of the lock, for efficiency.  Add them to the supplied=
 list.
>> @@ -2550,7 +2568,7 @@ static int rmqueue_bulk(struct zone *zone, unsigne=
d int order,
>>  	int i;
>> =20
>>  	if (unlikely(alloc_flags & ALLOC_NOLOCK)) {
>> -		if (!spin_trylock_irqsave(&zone->lock, flags))
>> +		if (!zone_lock_nolock(zone, &flags))
>>  			return 0;
>>  	} else {
>>  		spin_lock_irqsave(&zone->lock, flags);
>> @@ -3237,7 +3255,7 @@ struct page *rmqueue_buddy(struct zone *preferred_=
zone, struct zone *zone,
>>  	do {
>>  		page =3D NULL;
>>  		if (unlikely(alloc_flags & ALLOC_NOLOCK)) {
>> -			if (!spin_trylock_irqsave(&zone->lock, flags))
>> +			if (!zone_lock_nolock(zone, &flags))
>>  				return NULL;
>>  		} else {
>>  			spin_lock_irqsave(&zone->lock, flags);
>>=20
>> pw-bot: cr


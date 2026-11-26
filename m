Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727047;
	b=x9PC4yHdcm5iWVqm9JBJHi12opwOD1MyOumZ4UUndEQPY4PyGJRl4/otVj2LbTucMg8E
	 i+BuaEljVyaAludWqQ32iWwbeDqCS0qAhCPDloNZ2wPxulHavqPknopNe5d+u0zFDRfh7
	 uVd+AuljDoKbWcPYCVJM77R+SJ3FwfswFJbZv7ZedGv21msrDJXkBxpqlmkZuXIhdyLtC
	 CbbaFiI2ssFNf0vWj64XmzqDE8Zrpu2cAuNp6wdjz5shFiCI0Bke+xp5e8N0PUcvhBgiA
	 P5o73HpuxgEUZ+0vgCsaVeinl/P6VSu3EQPHakT/T3h3OsTFsbwhBPX52PK7/kVoSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=NzQpi5zLFt48IXOc9gm2YIA1Vaa4QZ9J+BdHMrNcKwo=;
	b=bxMzfgdotMVkwVKwSg6uzxP5YQO3sB/tPJTtA55SA1BNDUhIwg40Yg0o6ixpzVoT5vwv
	 uu0KhZEkDrIfTVuKWfKhCX91neQ76FaAQb7vTFCj3GkEUA7hvKxtVx4T6J3EFu1JfwU/p
	 4E5VWDpAh81UuWFRvhzFn3iVilHrQM47vOJRM6xLLYxJnJuN7sxbY74Dzz9cIxHMpAIfz
	 woPv/4xs5rv5tQaZf7nbTv6+WXM4Qf2iaJj7sQXq5BfoJtjS5/bFrIpU4z6dQ7guTUbDc
	 hsgG7vAFZLRFxcdrW4iYCNxJjpa6Yb9g668GRFcfNJimPbQuZn2zV0V82nHpxxcoAMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4FG2nRb;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DDE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4FG2nRb
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a9f9473029so5571375b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795727047; x=1796331847; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NzQpi5zLFt48IXOc9gm2YIA1Vaa4QZ9J+BdHMrNcKwo=;
        b=w4FG2nRbTI6jBZB8IjIqFjC4oooCxLJV/E4h15HyzKjb0v2HKu35ERPi+n9hRuvPvi
         4DAnrKagzYWi91YvbQ4Wuk0m9yHTJZ4ia7iKOZfTkAHfMkNBIayETrEB/Qd4v3PY9WVv
         KzgKa3QSLXU5B8NZfvH11HegG6bU0KYBRtEsL4VwbKCbYwkh0wIN85RMq7vMDQjdRynE
         XBXLdZd37ulr7YnJ0MK70RksSxad5Px8bTkTRKfWBgLtQMzkAHNKWI+lHWgC3K+pFG/X
         3a8njtoVVEQYpGxAd47TPeuZ0lNnT5CCzy+iypISiWQ13ciwt+DPTCiTo5xLdm45ctFg
         Csew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727047; x=1796331847;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzQpi5zLFt48IXOc9gm2YIA1Vaa4QZ9J+BdHMrNcKwo=;
        b=QQJuoi+sSJ+gCwSeTZEI6IlU2MCNSx3j29ql5H0N5fmOSAE5GT1MiWiGLbwTKphh+a
         0/7hYQJEvejJY5woo2vL27LIOyYIRX4YxKAOXPGw/lZnFKOqoLzxwG+6k/GnraCWOzf5
         DWYJ+P35+DBbWBYxHaFRnjPI+keRbjw3crXU6qbc2TjvQvq+4Veg+A+8qUjZKV/NR2Ql
         ir1SpqhziQtPtbYECRQZh3cdhsceY/Du1siHclt9QWX1lcFZIFhl9ku9dVggj2AkP0Pd
         Xy6/hgoM9OaYYoBt1ArrPVoQWz/s3XmTvC2WoC67bF4pb4fkL8iW21lUYBaEMRttPZn7
         an0w==
X-Forwarded-Encrypted: i=1; AL+hErH2tJsRPBSlSmA6oBA4WckgOmNwGW0e0yBdWr2BxFxZP4SNqiDkSXFv9+eLUYbqsItU1/f8KnMl/5fxWKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z994hknQz7I1Et+CtfmZOgLEryWUtnhOoyhzD6xwcTYRxeMUMtp
	5MNqVF8Gp7AZVghKZq8cxb2fJyxzPzkHVRI+513L+4B/MTRb7DFiC/2v
X-Gm-Gg: AZFdTZfQSmdSx9oQ2Xd6ReRtqGe4eoqD+xI3+u+Bt1epcx26dvmcevf7OGgwMxOtrJc
	1IYBD33MOF8NT4YdqrtD7Ka46ZboGfLXmzQWZC7/PkWEkmBeahq9xxyC00larMO3gEEPrQpRSW1
	gBlygCGwGR/hFAXZtmFb/s1vpdltpmcYFlRjwyvd36eGjNwEYKdW+b68rrSxLhzQSDss9M7YaCR
	p3Kk/UPnDRHkzV9hzZlo+a+atEUD+SptB36eM+2rL2yAlaY5jkszJeQNbMVIIveET7EH0hySEHp
	M3bDPGQzbufAs1KBsiZu9PidZ8BIU7PheQmBP0SG/sB+QcOfUEiXgzTozBS5IiTdZw6K7svJxLm
	efYlFYVwWYSG9LfwkRMJkWr6bHd+xSBcQ0Ag1HKcalExSfX3vEzDQ5iwlrx65zRDZO7Kuf2ydNr
	abPfYUCmn0IJTid/JCsHNvEVj9nyXcZqHdOQI7PkUlTLwQPD1X2JEDKY1TdxovcwEHb7IvUvpV+
	6oSWPsLArcmVrFdAPONL8obB7rtmL1d2HIC726Bd1vY81fuu2u+G7kT9nSYlnS8x1q6T3XnqJZM
	TYm8FNOdGb8v3oXSXzf8VvNJddHYutudnZ0KUrNmziAgK3CPe5uBOk7COCOikE+TFNJxokOAjqy
	M1V+W78Nm+8JK3UZBN7rOovZA3N+gWqAOI9s=
X-Received: by 2002:a05:6a20:430d:b0:3fb:1640:c525 with SMTP id adf61e73a8af0-4014dd5bab0mr24693403637.67.1795727046733;
        Thu, 26 Nov 2026 13:04:06 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm11430391b3a.28.2026.11.26.13.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 13:04:06 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 21:04:05 +0000
Message-Id: <DN5G409Y1VV6.FWWRMP1I8IB1@gmail.com>
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
 "Ingo Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Waiman Long" <longman@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/4] bpf: Add call for selecting kmalloc or
 kmalloc_nolock at call time
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>
In-Reply-To: <3a44dbfb-265f-4749-b411-9491a0bcf8c0@kernel.org>
References: <20261124060357.11700-1-emil@etsalapatis.com> <20261124060357.11700-2-emil@etsalapatis.com> <DN38HGVL8JHQ.2ZVZQCKFXVA9T@gmail.com> <awWRZ9xCzWLnj_R6@thinkstation> <20261125140902.GE2668804@noisy.programming.kicks-ass.net> <DN4QLI2XAGO1.2DDIFJ49PNRPS@gmail.com> <20261126094403.GA49833@noisy.programming.kicks-ass.net> <aecebb39-47c9-4b0f-a076-ac0ddc7724d9@kernel.org> <DN5FM9P3X2P0.2IFD5DFBRELP1@gmail.com> <3a44dbfb-265f-4749-b411-9491a0bcf8c0@kernel.org>
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

On Thu, Nov 26, 2026 at 12:45 PM David Hildenbrand (Arm) <david@kernel.org> wrote:
>> Which part?
>
> kmalloc_nolock :)

lol. Agree. I guess it is in some ways :)

>> I don't see any new concepts of failure modes vs existing code.
>
> I hope we can sort out the rough edges.

100%
That's the goal of this diff. It removes one of this rough edges
for user's of kmalloc_nolock().
Today it can return NULL when another CPU holds zone->lock
or n->list_lock. It took long time to debug in production,
since it didn't look like lock contention at all.
With this short diff that rouge edge/corner case goes away
and spurious NULL returns disappear.

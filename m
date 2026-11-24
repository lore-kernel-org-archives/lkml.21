Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795535516;
	b=Q6IeFb2VkJ58Zr+QQqT7hR32ll4jV5s5E8xZIVXSz2mbEhTZkJgBQFXX3RN1A+kISe25
	 EIbZNSXaWeewR+IvxUXBQBQu24Aqet5gPNTJKvahBP2nq5W5mOzbK4taC9hBq5DJntpOz
	 IaswuU1M26ZIdzSccFrwlyPIEf9LjwUKKpCKa+CVywHDi8liNe6O4D/jqlZxxzed+tluX
	 ZyPi3bhsPbHs/ZbEplUA7gjoH/+wQbhIc4cfWHeQrR1NIIiCsGNnqWQ+HKEIh9kU1lg+e
	 iJwFfU8kCXGuimRP+NrDBbCzXMEZPmVM00RnylI5gXfOcTKF84jtHiZV8KFScCWKKIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7151zgqNmppt1FWLTyRdRTu2s96pKFEly/RuS9gjWeY=;
	b=biE3qNIq/cCCOq/GjxE3B8BPURzWAadSq3DKNuxbTgVGc0xV+CgOLvb5orlKPnla1mr2
	 S3wN8PzecdsTp5OHA3pxOtZmJFAaZZ3UjV1FjOPJ3g4/ruxiHvxjj9MInJKmj4hLF/AEz
	 zGesxXWE4P01iiKADBQ+swFvwp8joAdnkqx9poighHC70F27ec5E3wWSREAxWujm7VSZ6
	 X296s+5Rvc3N8qykatVKxOw2WQhO6BUX4oY1IF2E9tUSoHIGLO40t1Qh/vx8GACEux9qF
	 G0nU4/TTc0syYogYy+5waQqFvXmWLc1jFQwUK3Xd19d6vDyFoxwgfbU2d40Mcu5Q/DA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gYnNBYPL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0737606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0737606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gYnNBYPL
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55c7445cf85so844571cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795535515; cv=none;
        d=google.com; s=arc-20260327;
        b=ScBphjWnnz3y+2XLnD/Z2Je1TLfz35q2kwqJ7nTnBLybgZpwrA0c2rm2AdqF6yZNin
         rK1Y4PuB7zZAOwtEoWWwQw1xXua30+wJyeITe5/gZsez5HZoqpFUsJAZoVSnB3oCkxsK
         KbKZvvoyV3QwP2BBbLwS7tFxdXQSKiZt88n12XegT7dbAInQuNzsVWYX0sCuwTYwED4W
         x1Mr2jtsGgCdHvg/LNgxget3hZHcIwheUJO84cqZxPGUwSsBMT0OrPeHdebNCrDLQTUp
         R7CLNIuq7muizqVabgOsJMk2BleFzFKtmkQR1km1m7962NjV9BC50vWAQUdKem81cN4Y
         R+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7151zgqNmppt1FWLTyRdRTu2s96pKFEly/RuS9gjWeY=;
        fh=+stnpNXbiMsxtxbLre0qCp2gcu3OhWIrG92VBaHLQaU=;
        b=RDcOqlBqL1o8oiK8qODbR0KuhpUjOaVjlEhaFnyAlRDlduLtZrStftT4w/aDtNhqPn
         lFF1QSXVJEs0wQTkVJo76NwZf8iT4y2b/LqgdsCMNrzHg02pNIj9nTGcDYLs7JVTwYOe
         EZQTe4TInQbgY9dbO6zKusMgUtFbdjKwBOqZuLX7tUceJ2MpfXAEvCcsRaf3We1YMyiU
         4RUT5DK1mcGWzZoXk+8fegOOn8Fmtzo1vxPJm7EyHRn/B9PAdArReSzEYm/fq+T820h5
         QuMod7m0R487i1nbIyCltL6bkwv7/X3RrRawnZHdwVV0IpoB3klK8I+SGWAaiGCygthW
         cdOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795535515; x=1796140315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7151zgqNmppt1FWLTyRdRTu2s96pKFEly/RuS9gjWeY=;
        b=gYnNBYPL7+Vso9fth4O30mUOQnoyOn3TOxaH9pHwo3lJTeahoBTFFJ5Q4/9eecco3H
         Ei5saRYpH5syTy8Ucfen49s3IrZ6ufTDp7Jou0Th3k2HyFxIJKuquydsppJKH4SGMEjF
         HTZubH7A6s2bHrdMaC4HirlYiCHKQcI902r4H/ZRXJY6fz8xJvDKDtYJePSACZsBHv14
         bMjd8WVjudy7rk63YHILKKkSr7ncJl9G/Xme/p6omTSsGdT9GmVnoeXf25YlOiog8Woe
         rWBB4pd/bzw+HjhbkCcGqhITw0ZbFKeDkdfijEEYca3CYnWtfdJte6D3j1fC27fTgu9B
         zdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535515; x=1796140315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7151zgqNmppt1FWLTyRdRTu2s96pKFEly/RuS9gjWeY=;
        b=vv6+5fy4uc5B1gaJ08/erecRfp31FcpZc5Iuw7EUBM5DbpQ3bWcR+gPkK2uSt4E4zJ
         /btpJOpexWrxRHg3gd6caJqM1BU8t1N4ZNAOFrAI6mGYsBQ40hq1pl+O2WGGpRY2AIxC
         Y7+Tyo3u+YA7iPYx5fPl5xln6q3eDu+FxCkfKiogaRq0NTtpmjUdmiDgCLMzhR16VfK+
         3NM037VdbUk3B3RxZA0NgLw5ImX5K8V93JPHh9XtMixzCOKis2u16QN2i0mFT61xFxJo
         rDuLa9j6fL2uZQX2dpu1JrtZCNXda3cMrEfHWzFGLy5ljBnilyA7xtmmNdi26sLiBBkR
         X3NA==
X-Forwarded-Encrypted: i=1; AL+hErEDJ7vIUCsOfHGINqru3KmI+kg+3JHnGbg9penVsRCFup8jCtVM6UIWCaccDqvVuTh5VnLi+uA+SyZRURg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SFxYn0ao2kKhkDQOgwppf4RlhyDtUOJlQqOhKrpAJxd9i+mPk
	meJpZ81CpoHHNNr3DL5dEKbdcwURyLkiMQ/pha/1OYkJjJUhfNcMO/FyT2P5WCM4OMu1a48zbz1
	5wv4SLq0NQMImkHb51UmRVyNulx3nMa8+rdmRX0LK
X-Gm-Gg: AZFdTZc+rAoxyeQ41BLCgaLPOoreMTl4X+NkyuejfvvBn+QU7iwbofNTtUK7XWqHoqH
	HxA7pUy0jL4KrVEnaAU3d28OOQyzrCbcnE7P7QKVE6gZA3SBCypVdE/RjDXUGgAe9n67puMPo1C
	J+hnt4hrxyjF8apNytEa9ZvGE9LSlGjbVFCTszsNGuqAyUM/hIzfq9DwTAE/SpVfTu0aq4gRKLb
	818Lsn9r2Z7DxoQYj3fn0hZfr4s1UyLPbcyiICXXYMDezHh+pOUMkeS/MlWUZVCOzp/bt/v8vj3
	QxT6hnkllpfGn4K9hA2yGL3amQhsdfVs15MvGHaBt3aNsXjNJ/M2p8ApTUW9NobI4FrrW1jWUX1
	5VPx5JqXxgYqyxf+Wp9bg9/P8/lw/Auqrg1ruemSvEexEAqEU5xQB4/C43CrIfWO3xyTaF9OZWA
	0ev6aPTN8uwhM7xoVip+GidpfeEHQ=
X-Received: by 2002:a05:622a:4819:b0:54b:648d:9ab5 with SMTP id
 d75a77b69052e-55d8903863bmr55786151cf.11.1795535514050; Tue, 24 Nov 2026
 07:51:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-vma-read-lock-mmdrop-async-v1-1-257f99f551de@kernel.org>
 <awWLCZ-jBjSD7V3M@pedro-suse.tail5790ac.ts.net> <CAJuCfpGk6eYK43Unxo+O4ML5=GM_siZ9owp6oa9fO0ipZXVg-g@mail.gmail.com>
In-Reply-To: <CAJuCfpGk6eYK43Unxo+O4ML5=GM_siZ9owp6oa9fO0ipZXVg-g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Nov 2026 07:51:42 -0800
X-Gm-Features: Aa3M54qQPEWg8Xv6M1FeAv2Yk0G2ClZoOWgLEIXc3iRWC6ZsNwo9TmRawceulIU
Message-ID: <CAJuCfpEd1rz3P7fB7W_mHkyzbpq9TscRE+QNwvHdYME=WJj6cw@mail.gmail.com>
Subject: Re: [PATCH] mm/vma: drop mm asynchronously in vma_start_read()
To: Pedro Falcato <pfalcato@suse.de>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 7:46=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Nov 24, 2026 at 5:04=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> =
wrote:
> >
> > On Tue, Nov 24, 2026 at 12:26:19PM +0000, Lorenzo Stoakes (ARM) wrote:
> > > Commit bee9ef4a40a2 ("bpf: switch task_vma iterator from mmap_lock to
> > > per-VMA locks") open-codes a lock_next_vma() implementation that does
> > > roughly the same thing in bpf_iter_task_vma_find_next(), only without
> > > fallback to an mmap_lock.
> > >
> > > This is because bpf_iter_task_vma_find_next() can be called from
> > > non-sleepable contexts.
> > >
> > > However, lock_vma_under_rcu() gave no guarantee as to which contexts =
it is
> > > safe to be called from, and indeed it turns out this assumption is un=
safe.
> > >
> > > Since commit 9bbffee67ffd ("mm: fix a UAF when vma->mm is freed after
> > > vma->vm_refcnt got dropped"), this call chain is possible on x86:
> > >
> > > lock_vma_under_rcu()
> > >   -> vma_start_read()
> > >     -> mmdrop()
> > >       -> __mmdrop()
> > >         -> mm_free_pgd()
> > >           -> pgd_free()
> > >             -> pgd_dtor()
> > >               -> spin_lock(&pgd_lock)
> > >
> > > Thus, a plain spin_lock() can occur when lock_vma_under_rcu() is
> > > called. Since bpf_iter_task_vma_find_next() can be called in softirq
> > > context, this can deadlock, for example:
> > >
> > > pgd_alloc()
> > >   -> spin_lock(&pgd_lock)
> > >     <softirq>
> > >     bpf_iter_task_vma_next()
> > >       -> lock_vma_under_rcu()
> > >         ...
> > >         -> spin_lock(&pgd_lock) [ DEADLOCK ]
> > >
> > > Alexei Starovoitov also pointed out that a BPF program attached to
> > > trace_contention_end() can similarly cause a deadlock:
> > >
> > >   pgd_alloc()
> > >     spin_lock(&pgd_lock)
> > >       queued_spin_lock_slowpath()
> > >         trace_contention_end()          <- pgd_lock is held
> > >           tp_btf/contention_end prog
> > >             bpf_iter_task_vma_next()
> > >               lock_vma_under_rcu()
> > >                 vma_start_read()
> > >                   mmdrop(other_mm)      <- last put takes pgd_lock ag=
ain
> > >
> > > Resolve the issue by having vma_start_read() use mmdrop_async() inste=
ad of
> > > mmdrop() so the work is deferred to a work queue.
> > >
> > > Make mmdrop_async() an internal mm function, defined in mm/internal.h=
, to
> > > avoid abuse elsewhere (kernel/fork.c includes this header, so still r=
etains
> > > access).
> > >
> > > Commit 0b16f8bed19c ("mm: change vma_start_read() to drop RCU lock on
> > > failure") accounted for the fact that the RCU lock had to be dropped =
for
> > > this operation, which is no longer applicable.
> > >
> > > For the sake of a backported fix, retain this behaviour, however drop=
 the
> > > RCU lock last and remove the now irrelevant comment.
> >
> > Is there any particular reason for unlocking the RCU comment last? afte=
r the mmdrop_async().
>
> Yeah, I think moving the RCU unlocking was unnecessary (unlock as soon
> as possible is in general advisable) and we could just remove the
> comment. Both versions however seem correct to me.

Actually, VMAs are allocated from a SLAB_TYPESAFE_BY_RCU slub. With
that RCU unlocking move you don't need other_mm copy and the comment
that comes with it. VMA won't be freed until RCU lock is dropped.

>
> >
> > >
> > > Reported-by: Chris Mason <mason@kernel.org>
> > > Fixes: bee9ef4a40a2 ("bpf: switch task_vma iterator from mmap_lock to=
 per-VMA locks")
> > > Cc: stable@vger.kernel.org
> > > Link: https://lore.kernel.org/all/DN267JUKDRNS.2VMV07CQ58R4X@gmail.co=
m/
> > > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > Acked-by: Pedro Falcato <pfalcato@suse.de>
>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>
> >
> > --
> > Pedro

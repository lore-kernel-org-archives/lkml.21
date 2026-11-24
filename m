Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795535178;
	b=ddv5m5u6jT/0yp8It143WjLF5aY8UQ38lw1oFcpAgcTgwqzK2n6Pl1a2OEzPD//vGw7k
	 cjwQNGvvT5MfCe8doUwjBaUeSbQI7y5NpFw+u3fqSM2E3XI/+iklUFOKxsb7H0sXG125c
	 T3+/mCWQh4KvGNdYxOE2YTzTYXxMj1fW4r3ZSMnCiuE3QAzOVKsHqqDu7qdjInpV4QH1D
	 nj1OHSrMNtYdkNvyLU2Ve6Og5STju9iDiNkCl5QqzCjFvjz9DXDXThG99OadZuh4k4Nqo
	 IufDkeY59n2mz6YCQGzCYbq47PukfWBF/7xn1yMepTbevYBS/vSxFcd9rTGe81hBKbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SOapY5CEQdlHxqSl9JrLPR3I2czhVi36uOATqS9W/YU=;
	b=krn97z9GvjoxgwN1bPHFC3PJfNRVHIIqkUJyOGHyHb4EnLf+NRgXayKLzVYzLHpOFx1W
	 51a8kn4iNZd6kCHq24XBg5SPWfFX83SDNNwPG++NZyMThmK8RwzBilTj+SriDLfQS0v9o
	 uRkKBWlEt2wG13UPlJAZg5OWJoD4rJMQNj3LJjideeiZI/REqOAGr2LtVeflJSM3M4iw0
	 AgPI5PvXMzocfdkkVpCqB1urK/eGrFmQjh8dm9wI8DONRzZLuYRFXfdInNCLxTOaNWCVd
	 D6zskKLF+iDMHov8d7kLJaqcUGZxcCCBLDYWnvOU4YfxvQJ+WEStyjpgdwo62f3tJeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=esU7yeLt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D64D606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D64D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=esU7yeLt
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-54492d8a988so914881cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795535176; cv=none;
        d=google.com; s=arc-20260327;
        b=f1DqpFT0UqFPXcW8SDSHcXXHV+qGWJGrznJcxPn2tCPKh6veM69r5cALtjBzroAwL1
         rd30NU9YY+m+M7EU0GE59JvdLaw8j55KT9l88XUopFfX6/pgl5nRcHAus2bFax1VBFVE
         3z7VoNYsYjo92WlFGv7xUH/NfkXUKdc5U0y0NweToUgTm7ejJpuSKY4yfhxnCpBIkI9c
         cX4Df36MMFev35q8HPqip99zeCH9sZLYnpR63YK/7qRWdUTVkZFB5vpCv90uAVF0kr4r
         UYj8jymOWjwlPpwuHVgUbufGseAZ/U/Eju6ZjhGkSERZZ4GUyvdhA846ANnJr5XcU/T9
         vCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOapY5CEQdlHxqSl9JrLPR3I2czhVi36uOATqS9W/YU=;
        fh=u0bPijAtX+SSeaU2LoOUuDJG+Vx4M8subGJPah7XsWM=;
        b=IfeykNLrLV9HsS5xHxr8ClEBra5yRf0h3C/DZZPOEc7OhzJLdZdQb7bMUL+Qsei2mL
         P4NlpKMUSoOl7Bj3flAkftlkaM2612sA89kIjg+zpT6xQhqspKbJn0AbXmj2xl5V8lgD
         LCztzxJy2F0LCKEnSs19NRwWJPKDMiQVR80zIgHl8IUQS3ndhA/qpBfkvwx3yLThsAip
         g8tXwmYOzr+JClG/cB4yaYY4KqKifL3QNHesiJhqncgq7jBN0vEHaLxYhl7bygJCIr2P
         b7SEMIYMWr6MFO9JC3JABrlL0qiiSAe0iGMrVODSsCyXrdlGfiD9wPbqP+5/Yf1IpjY9
         qvSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795535176; x=1796139976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOapY5CEQdlHxqSl9JrLPR3I2czhVi36uOATqS9W/YU=;
        b=esU7yeLt0A3qCM3mlu0xOTw9SC/PfBCz4ES1uqtiBgcLCvu8EPdvhhtkENZswX2dBI
         27GCY8pkJKMRd0c5rHWF/Ly2PldBkEJbr2gcWMljLkNqA8b1hmoK+PHKq7XHF+9mhMPB
         H8gh5cDxN/lslmNEGaOlJTY3QXCtheFFH6zeB7MsY+gU7FvozzGXEjtZGdD6/xodTAWt
         vjIBiKTI4wrMjNx8VUdzjJFyi6wV2w/wIRgNaZpMBUH9d/se0fv/7uS8CBIsjfl6MDyl
         qefokasVhLMvvDvqh4fXI/Ucp+TWswTqzpRDvje8XylCUqIC568nsIlArQ+mQXOxJwXK
         gIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535176; x=1796139976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOapY5CEQdlHxqSl9JrLPR3I2czhVi36uOATqS9W/YU=;
        b=RuUxbxl/Ofya6SC1YTB3V4GLERVYZ6RPSRDVhOWrDhLGo+twbH/V9yqq7lEPfQL6xv
         vbXJzznUJmo/mwpfbHHqpKe35RnuyCbipfmvngqRWAAAUq6RpqsT8USfqv5ASlgCXT2C
         3aQyA9pwaf/pm4RqK/f5Z+PWZJO2QC5f2uA/9S9YTUy+9w91zmoxYP73zuDX9GlnG1HT
         HM6WmCsQT++uHcsKxFMG/Sj/O4lNnjXDttd5fF8D2GvRvpmVWGMWu2pE16Y9eRaR+Gr4
         wdzXEZJWlXW30mDC9bWW9+i7DvHUNgQBKSoEjV5qBBOdSeuHt4cMo8jooY44qL4BJJ0f
         frZg==
X-Forwarded-Encrypted: i=1; AL+hErHshQtcADpxaDFQWgJupyZP26Ytyf40seTu5XH6LvnGD53NoTIdWsLgkBR+n3DsMDE6r73krDHAyw7qXO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wE/4uGnecSDOCM4dBe3Mw/rdB8uwiUWlPq2kYISIb9dUpPnux
	R0QAIeiuvVNJDfDN9zV0X3HV7x9odIBUiHs9aTN7tyvLkT6BUkG+GLrU8IVx99HtUp/dkFRNtNG
	U5Vp0L3W9TXkDrMW3lm2pvSJKgZZfu3YSzMa+WDmt
X-Gm-Gg: AZFdTZde07qFcxm0IJYybrqJ6gxssOhDY0jFAB/NO4dY9Z5fwmfgtiSGNps7+GbZNEB
	lww2ltfRmaj1K656tEO9egs3nkeZ2nm5dR6a2aKt3fMqSxCr0prEExv5LE4kdr0a9U21nBQYxUd
	FXN3P56Y/cTZQl9FBbDaDRrCBKi7Gbn/v2/uzm7mKzKX5wTIZBkHvJXWrl1H3WojhEdyptQ0wFY
	oZn2q1Sp/EMt8tpaqI4m1lZLBdoyz33uvKhhsWipjATbuw+PZYCzwzzUNvBbwfPmWNpZWbByHpa
	FjyrQMPTUi+khaD7emwbUCsyBkPyu21qNHwZw1TUSHmdCKS9fbVwzPqiCGns6O733Btr9jcWKBd
	GWMjUIMmR0v3XIyPBPq7WZ5E6F4eTLlib/f3/3b6ZMcBt0LAPpIRvChYu71yLubouDH3j1JRwdE
	Sav18JHdrCOuRzoAImVrkRTBep6yQ=
X-Received: by 2002:a05:622a:1dc9:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-55d87fe2e61mr49432961cf.1.1795535175538; Tue, 24 Nov 2026
 07:46:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-vma-read-lock-mmdrop-async-v1-1-257f99f551de@kernel.org> <awWLCZ-jBjSD7V3M@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <awWLCZ-jBjSD7V3M@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Nov 2026 07:46:04 -0800
X-Gm-Features: Aa3M54rJps960eQ4ANiw2FEhSY-XIlXfbwKX87yDblku-U5-CQ5DzHJjVlODTLI
Message-ID: <CAJuCfpGk6eYK43Unxo+O4ML5=GM_siZ9owp6oa9fO0ipZXVg-g@mail.gmail.com>
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

On Tue, Nov 24, 2026 at 5:04=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Tue, Nov 24, 2026 at 12:26:19PM +0000, Lorenzo Stoakes (ARM) wrote:
> > Commit bee9ef4a40a2 ("bpf: switch task_vma iterator from mmap_lock to
> > per-VMA locks") open-codes a lock_next_vma() implementation that does
> > roughly the same thing in bpf_iter_task_vma_find_next(), only without
> > fallback to an mmap_lock.
> >
> > This is because bpf_iter_task_vma_find_next() can be called from
> > non-sleepable contexts.
> >
> > However, lock_vma_under_rcu() gave no guarantee as to which contexts it=
 is
> > safe to be called from, and indeed it turns out this assumption is unsa=
fe.
> >
> > Since commit 9bbffee67ffd ("mm: fix a UAF when vma->mm is freed after
> > vma->vm_refcnt got dropped"), this call chain is possible on x86:
> >
> > lock_vma_under_rcu()
> >   -> vma_start_read()
> >     -> mmdrop()
> >       -> __mmdrop()
> >         -> mm_free_pgd()
> >           -> pgd_free()
> >             -> pgd_dtor()
> >               -> spin_lock(&pgd_lock)
> >
> > Thus, a plain spin_lock() can occur when lock_vma_under_rcu() is
> > called. Since bpf_iter_task_vma_find_next() can be called in softirq
> > context, this can deadlock, for example:
> >
> > pgd_alloc()
> >   -> spin_lock(&pgd_lock)
> >     <softirq>
> >     bpf_iter_task_vma_next()
> >       -> lock_vma_under_rcu()
> >         ...
> >         -> spin_lock(&pgd_lock) [ DEADLOCK ]
> >
> > Alexei Starovoitov also pointed out that a BPF program attached to
> > trace_contention_end() can similarly cause a deadlock:
> >
> >   pgd_alloc()
> >     spin_lock(&pgd_lock)
> >       queued_spin_lock_slowpath()
> >         trace_contention_end()          <- pgd_lock is held
> >           tp_btf/contention_end prog
> >             bpf_iter_task_vma_next()
> >               lock_vma_under_rcu()
> >                 vma_start_read()
> >                   mmdrop(other_mm)      <- last put takes pgd_lock agai=
n
> >
> > Resolve the issue by having vma_start_read() use mmdrop_async() instead=
 of
> > mmdrop() so the work is deferred to a work queue.
> >
> > Make mmdrop_async() an internal mm function, defined in mm/internal.h, =
to
> > avoid abuse elsewhere (kernel/fork.c includes this header, so still ret=
ains
> > access).
> >
> > Commit 0b16f8bed19c ("mm: change vma_start_read() to drop RCU lock on
> > failure") accounted for the fact that the RCU lock had to be dropped fo=
r
> > this operation, which is no longer applicable.
> >
> > For the sake of a backported fix, retain this behaviour, however drop t=
he
> > RCU lock last and remove the now irrelevant comment.
>
> Is there any particular reason for unlocking the RCU comment last? after =
the mmdrop_async().

Yeah, I think moving the RCU unlocking was unnecessary (unlock as soon
as possible is in general advisable) and we could just remove the
comment. Both versions however seem correct to me.

>
> >
> > Reported-by: Chris Mason <mason@kernel.org>
> > Fixes: bee9ef4a40a2 ("bpf: switch task_vma iterator from mmap_lock to p=
er-VMA locks")
> > Cc: stable@vger.kernel.org
> > Link: https://lore.kernel.org/all/DN267JUKDRNS.2VMV07CQ58R4X@gmail.com/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Acked-by: Pedro Falcato <pfalcato@suse.de>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Pedro

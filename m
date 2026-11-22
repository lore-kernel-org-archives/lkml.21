Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332607;
	b=SCCaF6Rt5+jNAgbGHn6PVWW6SpSGJN3POKr1pulSTHvKVaJxX5IO/aANVqU5/ly1CU9x
	 HiC4zD8GWpnKWXW1P8Nyrz10PlZnt5torDlRmqNJV4bGtQEWCa/VGoYMSEBxRuYOQH7dD
	 s4Z71ArOLhnmd+WXiXw8HP/lZLdhwGriCpRdr/oB80BvUhtu28BR2W8whjf/2Bp74oO21
	 6lZjHOHtvCapC62RGaeLO9aoyliULv01spCI2xlwsjW81mVyvelr4GZy9kAeEHgf4m4Qg
	 AYOYEsbv3Kag7rRgAnTsCwV+mTNs1isFJDTRYggC5dAFbMBAR+wnr5aBg5rIr3DOU3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332607;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uXWNYjPxX6wVtAP9DzJE75Av2qUwSEdpN8RkrP8QOpw=;
	b=gwyhaLuro8KD7oI7z5bLIVJzE+q7+nvFeyaZCFYvryTspVVnjkwegGlr4DDYTNRXm3cc
	 ikLgl56SEJAOIL30TL1PV9UkgOLOOkv/ourDYdFw8BL2esDIkfAng5CDNQ1tufCWtSp/H
	 QY35pTQ+XupdJo6J3ZM3rKZfkbJLyfI23pz7ui5trJKiQCCMW5KzP/ti0GeF94vg8COY4
	 0wJOhEyTKttb/lU6rrcIX8cEsWWLoJv+Kr+MUenJwVgALER+pYAoQ0UNbHR9BOzAwOo4W
	 QJa0Mvr0HrhL4ZMB8qcqea/A7jlsYO+vjdRTbN6uN8v/E+tcXLckv1Iv5O7nds/veJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=BTAmTlEP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4E3606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=BTAmTlEP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB921F000C4;
	Sun, 22 Nov 2026 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795332607;
	bh=uXWNYjPxX6wVtAP9DzJE75Av2qUwSEdpN8RkrP8QOpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BTAmTlEPmIlgFRIx7pww1JhEV/sRwv8Ng2+2iKg4j6PzgRMqGv8JHOaw42mKXj1PQ
	 sM7+AGtDcm8o9O7CfamNPvuyk5C5YNACkYV+YjlZkzN0zYEwAYTR+9zcTmLWp3Dv7L
	 s+bN1UUxXk1Y7l9a/bXUa2cijblzhbqciIoFoE7s=
Date: Sat, 21 Nov 2026 23:30:06 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Shivank Garg <shivankg@amd.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Borislav Petkov
 <bp@alien8.de>, Ankur Arora <ankur.a.arora@oracle.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, "Thomas Gleixner" <tglx@kernel.org>, Bharata
 B Rao <bharata@amd.com>, "Hrushikesh Salunke" <hsalunke@amd.com>, Ingo
 Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, David Laight
 <david.laight.linux@gmail.com>, David Rientjes <rientjes@google.com>, Linus
 Torvalds <torvalds@linuxfoundation.org>, "Teja Vojjala"
 <tejavojjala@google.com>, Huan Nguyen <nhuhuan@google.com>, "Pedro Falcato"
 <pfalcato@suse.de>, Peter Zijlstra <peterz@infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v3] mm: introduce copy_mc_highpages() and batch copy in
 folio_mc_copy()
Message-Id: <20261121233006.bc03ca9b7889c93a482791aa@linux-foundation.org>
In-Reply-To: <20261113-batpagecopy-v3-1-297f5b2fd28e@amd.com>
References: <20261113-batpagecopy-v3-1-297f5b2fd28e@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 17:09:21 +0000 Shivank Garg <shivankg@amd.com> wrote:

> folio_mc_copy() copies a folio one page at a time with copy_mc_highpage(),
> so a 2MB folio makes 512 separate copy_mc_to_kernel() calls. Each page
> pays the startup cost of the string instruction ("REP; MOVSB" on x86
> CPUs with ERMS) plus a cond_resched().
> 
> Introduce copy_mc_highpages(), the page range variant of
> copy_mc_highpage(). When copy_mc_to_kernel() is available and the pages
> are in the linear map, copy the whole range with a single
> copy_mc_to_kernel() call, so the CPU can optimize for the larger extent.
> Otherwise, fall back to copy_mc_highpage() one page at a time.
> 
> On a machine check, queue the poisoned source page for memory_failure(),
> as copy_mc_highpage() does, and return -EHWPOISON, as folio_mc_copy()
> does today.
> 
> copy_mc_to_kernel() cannot reschedule, so only take the single-call path
> when CONFIG_PREEMPTION is set and the copy can be preempted. Since commit
> 7dadeaa6e851 ("sched: Further restrict the preemption modes"), x86 and
> powerpc, the only architectures that select ARCH_HAS_COPY_MC, only offer
> the full, lazy and RT preemption models, also with PREEMPT_DYNAMIC, so
> they always take this path. The per-page fallback calls cond_resched()
> before each page, as clear_contig_highpages() does. Other architectures
> keep copying one page at a time.
> 
> Switch folio_mc_copy() to copy the whole folio with copy_mc_highpages().

OK.

> ---
> On a Zen 6 system with CXL memory, move_pages() gets ~1.4x faster for
> 2MB THPs and up to ~2.8x faster for 1GB hugetlb pages (numbers below).
> When demoting to CXL, kswapd uses ~31% less CPU per GB demoted.

But that's the most important part!  It's the whole point of the patch!
Yet here it is below the ---, which means "throw this away".  It
should be the first paragraph, in all caps.

<edit edit fixed>

OK, thanks, queued,

nit: does it really need cond_resched()?  That's not appropriate for
current mainline kernels.  I guess "yes", because this patch looks like
something which downstream people will eagerly backport into older
kernels, even though we didn't cc:stable.

And we care about downstream people.  Globally: "Roughly 60% are on 6.x
and 30% are on 5.x (with the remaining ~10% split between 7.x and 4.x
or older)".

I'll take a look at that Sashiko thing.


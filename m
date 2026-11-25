Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597206;
	b=s8bgQtjKoVISI9TDiRstKTakS0NnryjxgKKgenJqJWxFTjs2UmjJAo9grJbEpx1fIfOs
	 SovWgZdjm/CCNSKwL3vpmyu+gW8m+qmlb/yE+tDXzXo/im0e3eQRIvCRsr5BgwQl8IS88
	 5Y0Q9sqIViG57vKXT8FuCgGWetGbZojpW+mFtglgUijqebhdh9VTiy0Wc/RSPKb2E3IQq
	 7dsBStaEK563t/GaEQ24qKvmE8mwzvkOrwLF0R2dsklQ3dscgCASyo5v86q5GGySnIphk
	 UqAm2294m1lIpHZJVk2ANXbLh44cd+XiaUbI8QUjsY2Jc+Er+gRhbxgzC6MVvpqAQnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597206;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xkYQlTjTpR+Tckgmur2SBpexpKA9T0u+v2Bvs9xCavA=;
	b=5pUFIAJN8zPEtWPieU7wuL5KU4l+OYUkEVEaEHNu2KVXQEPu2sUi8X5Z4v4aAzWY5M7A
	 hwzTp0nYhpUQzJZV7BhGIOnRi10j6eaZEZhzVjYX6vc07EtCctogtMmL5a2Ot+EN27h9x
	 DAhzcbmIWBb87/eohljdBLNwfLBsyKgQNzu6tBqsIMXvb6oaLrRCPDRu0uZiV20eh+noh
	 He5ALjMIf0VyTh0ILqgwo0DpZdf3iLtN/2QTfxSYfltzXAVmmcTV33jtmKkK1ZnZ/LKut
	 XYEeIv5OvVACf3/9WfDcEX4I5TajcZWH7EErjVIq6QjAlULjmLiaHqPZR9xdyiV5i4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GOWJ6p50;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B5D606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GOWJ6p50
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16251F000CA;
	Wed, 25 Nov 2026 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597205;
	bh=xkYQlTjTpR+Tckgmur2SBpexpKA9T0u+v2Bvs9xCavA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GOWJ6p500oxIY0fNCTQ95TKAJlCegS/KWKLzA78YzhG6MfdF8zwaGLps3lYol4jsJ
	 jMwiG+jFu5pulTdXruC9K98deGk5H8zjf6zbstB4Fq42gxVROK0MrGuxzGmdrtq7Ji
	 MTfuIdeB8/3UufYvHJ8SuRl2w0k0uunrFpZmFGxw2XIsqRgoZufV2wDXuy+jVG8IW+
	 r/bFOeHU907sJ+x5KDgsTB+l5D3uxTq+NL8ADHXgNjBYeuX+hPboIX7xBxlXfgdA91
	 TdgVaY4jkJbRJomCJiXoGGV2QbatDQSoKxS5FVxkon6NUACPli3KdVbzd53lHdJ13b
	 Wl9mRO7VkaFdA==
Date: Wed, 25 Nov 2026 10:59:56 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] x86/mm/pat: flush the TLB when only an alias mapping
 changed
Message-ID: <awajjPwS-dKPnsKT@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-1-791adb8d6670@kernel.org>
 <b7bd4a18c420fe65728f4d50b69e2be0d1d39aaa.camel@intel.com>
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
In-Reply-To: <b7bd4a18c420fe65728f4d50b69e2be0d1d39aaa.camel@intel.com>

On Tue, Nov 24, 2026 at 10:49:28PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-11-12 at 18:31 +0200, Mike Rapoport (Microsoft) wrote:
> > CPA flushes the TLB only when CPA_FLUSHTLB is set. cpa_process_alias()
> > sets the flag only in alias_cpa and never in the original request.
> > 
> > When the requested range already has the new protection and only its
> > alias changes, the alias keeps stale TLB entries. For example:
> > 
> > 	/* the vmalloc mapping is created read-only */
> > 	p = vmap(pages, nr, VM_MAP, PAGE_KERNEL_RO);
> > 
> > 	/* only the direct map changes and nothing is flushed */
> > 	set_memory_ro((unsigned long)p, nr);
> > 
> > Setting ->force_flush_all in cpa_process_alias() does not help: it only
> > chooses how the TLB is flushed, and cpa_flush() is skipped entirely
> > without CPA_FLUSHTLB.
> > 
> > Worse, when the alias wasn't changed at all, for example when the primary
> > mapping changes from ROX to RO or vice versa, ->force_flush_all in
> > cpa_process_alias() causes an unnecessary flush of all TLBs.
> > 
> > Propagate CPA_FLUSHTLB from the alias update to the original request, and
> > flush the entire TLB only when an alias actually changed.
> > 
> > Fixes: ab5130186d74 ("x86/mm/cpa: Flush direct map alias during cpa")
> 
> I think this^ only added a flush where there wasn't one before, fixing a
> different issue. I don't think it is the origination of this behavior for the
> case of when the primary target already has the right permission, but not the
> alias.

Right, it was c31c7d4844ea ("x86: CPA, fix alias checks") that moved the
alias update into a copy and from thenn the alias's flag never got back to
the primary request.

ab5130186d74 only adds the unnecessary flush when alias does not change.
 
> BTW does this type of permission change happen anywhere in the kernel, where the
> primary and alias start mismatched? How frequently does it happen?

Like the cover letter said it's "unlikely to happen in practice" :)

Currently there are no callers in the tree that could trigger that.

I'm working the generic set_memory_core [1] and the bots keep yelling at me
whenever I touch anything around.

So while is a defense against potential future issues, the change is simple
and I think it's better to have it. 

Might also save us from reviewing several LLM generated reports that would
find the same thing ;-)

[1] https://lore.kernel.org/all/20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org
 
-- 
Sincerely yours,
Mike.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045567;
	b=V//O4hKgSe7kUS57DlXBj82uUI5ouQNxffAl1oRFdY7xyYHyPbqtlyd6MNsX2W2RvbvZ
	 6B7NBTPw2+7NBIlEgtRdFjJjB61WbmO/DdxoLAicdJY7cwYfY4e8RxNM0LX+kKrvADERL
	 ctx4mMi6NGX+DNUCShFbtUo6RljR9+/ujV+VwXaF15EniMg+849/utOfcczEFD97ASbuR
	 kxzAFpBXIRL4yq0WrnQPY9BCUc5ooJnqnh2VoOAe4K/U/fy6jAweS1/Kef0rkCOWr/tKG
	 fkTGKscTOrSWEVo8akkjk8Ijr1LsYF/76/BhL3qgYNbsaiFnx1F4K2/i8G9ReuhScNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0Mlcn6Z7k5JuV2YJbcakE860i/4laekzSJhBTVmexSI=;
	b=zORMYHnzg4CKD0GDoFuF4PxWjxPEkZFduVV5sw7OP1IshfHLd9GR6zuo6BAstcu4I2HY
	 OZE4tScqC5wYqezhAcvPIIF1AYybS49qLRCqUFYTaHfCT9CYwtWUtFJJwn0MaKQ2im++H
	 b0jMOYnVGnZlXNIFOhtJPBl/ZjUH7DMp7BfqlgM24eYgpTdZWIQ5tLyJYONta9UfCatJd
	 Ki7q4dL1v2FHe23NFkDYZlM65oB66pzdlYTrQhhuBOamcLAa41qtfTF2f63B8QPYqSWmU
	 tJm4qtMceVtsP4+IqDXiXzCc1oXfp0soOVTlHR/6Qnc8twbZ1bk+Y+XGUYeXGcrZsxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4ktbm7q;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF05606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF05606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4ktbm7q
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so1620157f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045565; x=1795650365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Mlcn6Z7k5JuV2YJbcakE860i/4laekzSJhBTVmexSI=;
        b=q4ktbm7qImk63D/Ft9pDrbS9cP9qbDg3T4nQgBCMAavtXYPCTjbVJFjKYCE7xGfAGG
         6UGmllXVPxLY49GOi4Idg2gx9ApVd43Lii0M/eM0I0DkBfHNrtGwUKsRv5og26V56nzZ
         dg5hxyAg8oE0PfkkO9VQyGznFjHR4nWH0+/xH+wFq8CoMziQ8mJ3qV44bmL8Vav7Yd3K
         y+PLrkH0bDdTihwXKh1zUfJJBJE5QtDkUAmzBp2a0ZbbgCRkDYxMBl1OZqN+PPiCcBW8
         z7MYy7bCY91zeTWgcFwKtI6sEltzSGDy5fnBcGaJaDjcCqfTRYjtX3Fjlkj5WPTLvgNY
         YRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045565; x=1795650365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Mlcn6Z7k5JuV2YJbcakE860i/4laekzSJhBTVmexSI=;
        b=o7gZaj78RiAltAa1SWKPuSTsRox653vp4Uj0ue8VcjWHb5zqkmuPRS+M3CGrbeFVk/
         BRiILK8CG3Ad5LuI3BZQ7pUl/t8JM8Od1vzYYfmtjmO7JLnx6q2RrhT5O75T9ykyCQ0l
         BSgskJvMM4wFTCdvg6Nzyi5mUv9RzQjda9VSUsP5CsKoVK9a1jk1NGPLBRAYKOQ8d7n4
         suPoPyoiGYVKy2puSHjBwZCTnkiFYxC20htIyshOtG9lG21Frf/c59ecGiSlfHMgJ5Dj
         k0amJ1Ar4Tv3nTjQy16J+eyQcs6dft6iQVfIrWUmhy8KJAMcsNML25MfBRZAQYsI/i0m
         YglA==
X-Forwarded-Encrypted: i=1; AL+hErEVixUFsZmgHzL6/T0bpHaoBVW0AP4r/YY6hRGj+/Bz2mCcIr26DvWbN4hean9nUhqjlaDu045ohXli7xk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8giJPAaNG1oakJfQuQwSBrUTZ+lq8Q8KBqf5LJ5SHe49b5c0nA
	XoEetF75M2i2N3qz5M+Hu5R3SzoE701H8HC8uORhBPF1uC8rKyJQeDXm
X-Gm-Gg: AZFdTZehrmBIqXzxcFY12I9yHpXyclfEiEuRAbHO8z96Uhv/UpAwGfNAU95s2yvQux7
	LNMG7Ubu8/1MO//Gde5LRAJvS8gLcqz8lc0IlKX1iOzs+sj2nw58Xq9y1RHHmQ0inEiySlsGaw8
	GWIpNMO6G6s2pXn/F7oyxM/5sB86/PyBwo01htR8n9/F+0Y0/2jfZ+f91v4+Ko2MyuLz2K/sf65
	mDJ/mRrIcyQGG7lO8Vy1zPQq5XqieyjtvPUoOlufjwAj4PI62iX1EVFSCsjifIBYMOW/dytYZkY
	A+CxteAF6xcQptm3YwbLI5lF2mhvT3dsVUpjYUjMUZl/M64tjw7gfU7d4X+SeUMYXObPhUYThJh
	iEFynI3s8ZvKCmB+nV+uVn3z0I2gvwiXmi5PZgyhp+JpmBOAX9VAaKUIJWuYj+kWh7b5Fs3QLdR
	TqHcVMqRo3lPisoHSgAeUlrkQ0aum6iPQuRv0tTax8dYlNtg24RmENFjRaJGdx+SWURygXfC4FE
	MWRWP11oU8wyyQB45luDz7A2u/1YX5qv7M2RCMPp9zLd5/fslbgU48lsqe23HeuX/UbRoNVSPls
	xNyC4Ne4PDxrQpU+zynTHarr
X-Received: by 2002:a05:6000:2406:b0:4a6:a5f0:be41 with SMTP id ffacd0b85a97d-4a6a5f0be8fmr7445862f8f.54.1795045565105;
        Wed, 18 Nov 2026 15:46:05 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6575a5c28sm7553171f8f.59.2026.11.18.15.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 15:46:03 -0800 (PST)
Message-ID: <09a96936-795e-43f6-a6db-03f30f20b5a7@gmail.com>
Date: Thu, 19 Nov 2026 00:46:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/userfaultfd: check exclusivity of the page being
 moved
To: Eric Li <nakixii@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>,
 Kairui Song <kasong@tencent.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261117212400.1890820-1-nakixii@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261117212400.1890820-1-nakixii@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 10:24 PM, Eric Li wrote:
> move_pages_ptes() gets the folio of a present source PTE and then checks
> PageAnonExclusive() on the first page of that folio.  PG_anon_exclusive
> is per page, so for a PTE-mapped large folio this can give the wrong
> answer for the page that is actually being moved.
> 
> This happens after fork().  fork() clears the flag on every page of the
> folio.  Once the child exits, a write fault in the parent can reuse the
> large folio, and do_wp_page() sets the flag again only on the faulting
> page.  This case only exists since commit 1da190f4d0a6 ("mm:
> Copy-on-Write (COW) reuse support for PTE-mapped THP").  Before that,
> the same state could already come from fork() after MADV_DONTFORK on
> part of the folio, or from reclaim when try_to_unmap() replaces the
> earlier pages with swap entries and then fails on a later one.
> 
> Moving that page with UFFDIO_MOVE then fails with -EBUSY, even though
> the folio could be split and the page moved.  Callers that fall back to
> UFFDIO_COPY on -EBUSY end up copying instead.  It also goes wrong the
> other way: if the first page is exclusive and the page being moved is
> not, the folio is split for nothing before the retry sees the shared
> page and returns -EBUSY.
> 
> Check the flag on the page mapped by the source PTE and get the folio
> from that page.  Locking, refcounting and the split-and-retry path stay
> the same.  The batched path only handles small folios and the PMD path
> already checks the page the PMD maps, so they don't need this.
> 
> Tested in an x86_64 KVM guest on mm-unstable with only 64K anonymous
> mTHP enabled: map a 64K-aligned region backed by one large folio, fork,
> let the child exit, write to the sixth page and move it.  Without this
> patch all 20 moves failed with -EBUSY.  With it all 20 worked and the
> data was correct.  Moving the first page right after fork() still fails
> with -EBUSY, as it should.  Writing to the first page instead and moving
> the sixth fails with -EBUSY either way, but without this patch the folio
> was also split all 20 times.  The move tests in uffd-unit-tests pass
> with and without the patch (the two swap tests were skipped, there is
> no swap in the guest).  I didn't reproduce the MADV_DONTFORK or reclaim
> cases and didn't test arm64.
> 
> I found this with Claude Code while debugging an out-of-tree swap
> backend, and it wrote the first version of the fix.  This version, the
> changelog and the reproducer were also done with AI help.  I've reviewed
> all of it.
> 
> Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
> Link: https://lore.kernel.org/all/20261116110122.309748-1-nakixii@gmail.com/
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Eric Li <nakixii@gmail.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a

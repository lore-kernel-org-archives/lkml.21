Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045554;
	b=Hgvg4O8sFGr/rYXZn43jE3l2SWYsJldG38e85U+tsrPhkfyWwLe/y7lN94DpGwUYa1R4
	 Z4hJEHqFGqBYDTmR8Izgxs05SK4W4VvscZTkrz/U5agINC42QzS/8RNE22/x2mDVH6MOF
	 wm/kfHLdm9jR6ucv7HSt2b+2dl+Dpjr7lTCewbTNUslFRlxRfgKWgqwTVGzhAzA47pDzb
	 sd+hHclL7m6Ma0xE4eTH2au3Ph6YI8v0jCzG9cKVrZdVjlQnyWIen7RsUw9GfQ3v1th0F
	 VIqnZQewSofh226tWPK8GvNrKI4C7Rm7gPrVSmNIR/EQbp4CjHftOOEZukCBcsTUcQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0Mlcn6Z7k5JuV2YJbcakE860i/4laekzSJhBTVmexSI=;
	b=LJE3icRHw24R4u4Kgs/WhX6PcDsUVQBZn1+b1WPhDcUOsB0IWO6dUVZFJRGsjhuC9zdM
	 erzyFCybzPxOtOh5inEN33a329x6N0+1soywCuCWc3NmtL2DwyKjibJnhmIf9vJ8+4XXp
	 KkQQqYxZ74CW4ilm0aVfuzeZrRHL06Ob3GFum1XaUFXfzVRTgkfL1xB+zKjAfoXTmTcsf
	 iYcrcOYQYFk9a7kJ+VG/7kBkB8ZzoJXnJiHWVVFzsbx+r3ioaoTRm/K0RRIsIpmYQpJT7
	 7IAIKp4rEI7R8xDBOY3SJsqtP+OL5J+LbRdDm44iOHwer59l2UwfWFbbn7ec6PdppTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uieIenaA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C2606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8C2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uieIenaA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so17149885e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045552; x=1795650352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Mlcn6Z7k5JuV2YJbcakE860i/4laekzSJhBTVmexSI=;
        b=uieIenaAX0bWGmehxX1DEj3xxjzZtqFFcVtd6W34Y0wXANg7faZ0f8/+sKg/qJlVL+
         HQh5s50qwgUjVUdfOwQidAzobKIESKHqOmL+vi9NqIlgO3l6t2BhMquS9S3HLepQwfSu
         wT93JNCBVEnXEr2oUZWLOlINxnEUG7wrItljwkjUpRUskAhD+9Mx2hEXgD5U/d70L4KS
         zJN52xfDAsRKgW/isd11mAn2u6idqvgnnYoNxnx1qBgaL+UaEXjJSExAdwvzSL6pfDaa
         WOqP9+dgi9UPldArJfqDyHR/EvU5i2l90fqOBtlWhE4GvhG7jiLbonnTlS3+SUD/0EiV
         f6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045552; x=1795650352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Mlcn6Z7k5JuV2YJbcakE860i/4laekzSJhBTVmexSI=;
        b=gytIu0ZU3MoNyYbJgt2oecEWy5b27ut8RP3O3xwfFp8YF6x7LYSMq05eHBSyD8GRRS
         xET/i4mgHNIbEL0o+xQ8Th6+fSsEXWM1wdyNbI7j7YrSurB0YR7YrhhOc3HZsDiqaNXh
         YBKCGiK5/Kvm0zUdbXew+cP/B6Za/fLPKOIB8Y8vmfVYj6tS0oK4V8IVyJCMBhhnWR94
         gS14JrE/m9CqT4pa09zzTBx262YJsFpT8NJjzXgcOHg03CVrSkdfZ1CGR1smB41qdOKX
         1AOhOE1JmbPNfNRNkVruEC6/i5naS+/ibi18O6AT7A24QPMmY+tdJQE2W2ofBqXV36zb
         M+uA==
X-Forwarded-Encrypted: i=1; AL+hErEDCOXR7527pCxGRjVRgyQk/e3d9eKDt96gr06FPRyO/CIVe+Bh/DXTdvthelC/Qd/Pd/kCnZ946/25SFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uxqD0zzLg0adB+3VCTIit0IBNaKfUgoooU4kgvY1dAbTI0xmA
	YsL7gvlJSW4QkZIOOBRVpyxfs47P1MtwBIIiaIxSbAY1UAaPGzm/ZWqC
X-Gm-Gg: AYBFou0WnizPWKaavMNDBjLOfhgux5n6MjUhBKb9zCX7cfYRmZnopdPQ4UjnpSPMQWR
	lHtajo+LtTN8Szlyy/nkCFIFYPnaQFstWJnB2GCjBvps+jp4FrsXoJgf+YhrolYUpUmhBt/UYkx
	Vae99AKnKyR9gdZ+Ub9kWddSVA369gNvxCYndy3gciiUhpgtW/mSRqQnEycPV0XpfeQxBH45ebf
	s0M8e0Ra5EdaXomdqYmafdh1JGNvlV+/GVHbQW7ccoAregdfbu+4ibiOP8hPug9G65xUL2cbxIY
	5h6IP7TfZCwkSDPhHQ5rCplQcVMY2UbxM7236Xi6bgbEsJprzuBoFZT8ECyYOdXp2yxd3dRNtgP
	vsjioyy7RYIGXio1vVKDafNhiuzkTNVnm5EAEhmKnrjMyAck2ICbONJekvxbKK4YEJlEbidz2Q+
	Vi/rWPMahQ540iWQXtx2Y7hYzS/4JMWT3kssMMkHFYJCEeFor+6UgjBUepCH/XMfHmNIxDsA/jj
	w4nvTEdkV3iSE44gjN6c6tXHlpmoTxeQHxgMFXKnLzrMLeXxQDCngWVWVSbaoohrpjgv5gp7GdP
	Qf4KU6GE+sl5e/olstGClXLx9xhGgVDqH2mmTXGm1a/rXQ==
X-Received: by 2002:a05:600d:82c5:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb7da270bamr99102465e9.21.1795045551572;
        Wed, 18 Nov 2026 15:45:51 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573baaaasm7674415f8f.58.2026.11.18.15.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 15:45:50 -0800 (PST)
Message-ID: <20a03718-bd72-4df3-9563-1ade7747ae21@gmail.com>
Date: Thu, 19 Nov 2026 00:45:48 +0100
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

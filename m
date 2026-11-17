Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945155;
	b=b6/iqwucLjPMXxkOJgeD0s2LaGlYmz8SUkXxNW0fwCKBo0Jc8TwwK34R0emt3Almn7KI
	 nUWOwLfKF/ty1MLdFbwj2+yKMQhS12JFEDX/cykrrz2MotRPl8+1gTBYc4ixDTLRkUVVu
	 K9PNtgFSxc2DUbq+6yWtoykOqB2npUMJ7xn3UkrJz37HF/WmIfBU9rzzvia5jY1pr2Npr
	 Osa4tPtOvAOqhnoPIpySRtiPGwliLh6xsDmJY0fbjDyMlelyTaWTs4bc1qWYH6HAgimcj
	 IU74ubri4bGH83cQKKNE3MXnVlDgo9VM5y2f0GKNkLUwTPc2+xOf12YGq3cDk/YEoOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945155;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nq24JFvtPeVmX5op9gSmyrNH0NFQEiXDbSwSG7EFOzI=;
	b=Htfqa8Y7nZ+etmB0GraT+jvb9vL1vZZeKmJbo//Y4V9HITpHyU/3sQH+ZXkceTWSSGOa
	 c3FF7dYX2Af9vwJl3Dmzl1lgwpYeLNuSC3F96Qe9FW/QBpgv6FdE5ZdvqUQmzHQk8T2Ek
	 0PsKGpG+tQe9AAloasz+kk3V8BlydRYqc8n7lBrVrMJaSyjCnUu71/QjjfjauJddoY1wC
	 zCLg6BpIPUa32EV4GdYdfek0QcDwQNJvfXLLr46u3wLruS2R2X/e+GrxUOEZ/UXlE8890
	 aJOzBztmah5Quga2fczPI0ZP0oSOxGgx+VYUN9mWZzKd4i4IOntP252Qd1COPYCWgTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1mGiwCF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1mGiwCF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97421F000C4;
	Tue, 17 Nov 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945155;
	bh=nq24JFvtPeVmX5op9gSmyrNH0NFQEiXDbSwSG7EFOzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P1mGiwCFKV4d+Fw4XIhqwyyL1Q5kkP1ZUd81/LGZyhXqvECuA4m9WMGWDnjQiN5ZH
	 czw4TxxrdYKdaE2EUxve7KTWze3y/6vyhOYk9tmRA0Wc2j+HxlsFJqEsq0IYTvXRFO
	 Kb7D0C0H2AljIoxwufbKo2L4ZLzhmBCaHRveSO+86FggcbVnR45ZoUm5isDi3EL8kE
	 DxfDXsJEaLpH1LZzB5RYQk8gnJ4LGZTfopSeR1E2ds+eHtVNW0IextsRV9ngORXWYd
	 ShA/lCouuq2O9pYU3LTb5h+/CNegq/07vD65wX9RAFmjuyZN5uhpSpoWfCrcThIQNI
	 4hXmKKcyDvRDw==
From: Mike Rapoport <rppt@kernel.org>
To: nakixii <nakixii@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Kairui Song <kasong@tencent.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/userfaultfd: check exclusivity of the page being moved
Date: Tue, 17 Nov 2026 21:52:27 +0200
Message-ID: <20261117195228.2675563-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117191853.1314834-1-nakixii@gmail.com>
References: <20261117191853.1314834-1-nakixii@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 03:18:53AM +0800, nakixii wrote:
> move_pages_ptes() gets the folio of a present source PTE and then checks
> PageAnonExclusive() on the first page of that folio.  PG_anon_exclusive
> is per page, so for a PTE-mapped large folio this can give the wrong
> answer for the page that is actually being moved.
> 
> This happens after fork().  fork() clears the flag on every page of the
> folio.  Once the child exits, a write fault in the parent can reuse the
> large folio, and do_wp_page() sets the flag again only on the faulting
> page.

COW reuse of PTE-mapped large folios only appeared with commit
1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for PTE-mapped
THP"), so this scenario didn't exist when UFFDIO_MOVE was added.

> Reclaim can leave the same state behind when try_to_unmap()
> replaces the earlier pages with swap entries and then fails on a later
> one.

This one, and fork() with a single page of a PTE-mapped large folio
pinned, could produce a mix of exclusive and shared pages in a folio
before that, so the Fixes tag is right, but please make it clear in the
changelog that the fork() + reuse case is a later addition.

> Moving that page with UFFDIO_MOVE then fails with -EBUSY, even though
> the folio could be split and the page moved.  Callers that fall back to
> UFFDIO_COPY on -EBUSY end up copying instead.

It also works the other way around: if the first page is exclusive and
the page being moved is not, we needlessly split the folio before the
retry notices the page is shared and returns -EBUSY.

Worth mentioning that as well.

...

> Signed-off-by: nakixii <nakixii@gmail.com>

Please use a known identity in Signed-off-by rather than a nickname, see
"Developer's Certificate of Origin" in
Documentation/process/submitting-patches.rst.

...

> -			folio = vm_normal_folio(src_vma, src_addr, orig_src_pte);
> -			if (!folio || !PageAnonExclusive(&folio->page)) {
> +			/*
> +			 * PG_anon_exclusive is per page. The first page of a
> +			 * large folio can be shared while the page mapped here
> +			 * is still exclusive, so check the page being moved.
> +			 */
> +			page = vm_normal_page(src_vma, src_addr, orig_src_pte);
> +			folio = page ? page_folio(page) : NULL;
> +			if (!folio || !PageAnonExclusive(page)) {

This would be simpler as

			page = vm_normal_page(src_vma, src_addr, orig_src_pte);
			if (!page || !PageAnonExclusive(page)) {
				spin_unlock(src_ptl);
				ret = -EBUSY;
				goto out;
			}

			folio = page_folio(page);

>  				spin_unlock(src_ptl);
>  				ret = -EBUSY;
>  				goto out;

With that addressed

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

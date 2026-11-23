Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425842;
	b=EHPRwKVedUkeugAxjUyvGS6pd71iPtV/8XaOBJjJbSJWCkd4Z30rpKtVcS8zLU2aTxiZ
	 NlyMrOawNtDGcXhg23nrubQNXa026ES+YK77KyY6268Dcul6gHJbUPmspbk1vYzyPazA4
	 A90KYmB75RttCzMCtgLNL2Q/dl33nzfXr9qFQjCw45c3GMD2CZJ+Ukv6wyIQ/kDyLzHAa
	 7Vulfs4ixhBQ13cD9XafKyiZs7tWO8tkT3HV8yty2ai5sTddMCUYnppQ0tyaDnnhM+4bX
	 5c2MRR64F8KvVZXWUokMsbZIXgNrWxTbr7CjXKJT75HGrM9HROS+q1sJSFXIOUKE4tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425842;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4SASklNkTeizD/6hspIoB2DzJc2sRiMDkEkS/nt+fz8=;
	b=lybxBIe0GYcUUZ3mc+j9BKKGtQJKSaNm8OlrNR5CPJ9ixAgefz2xc0xERouwM8L6Kpti
	 Rm3rBUywYIQm6XWw+WHNzbQdlsOygQyCU85bZcbm4pnJzq7dUU36jrqPTloDSRBkgJLIj
	 Vst1ZifOgmFU5w8Ekc4cuS5BNcUBHfSydQ7ciwQzlHgXAj/ga+w3QUkgXS1BhFcJ7LCDC
	 rQKu82m6NFc2dZxbBCJpdMjsyvxPjznUajoH5cI1MX2f/IZttabdumZoQqOHPzYNRM7/X
	 FfbwSFHhvwjMOKirZ2CDjM+ouBd0opQyFc7YkJmvySQV+oi+LXoMFQ/+LgFcNYXOYMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAJGWU5M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB21606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAJGWU5M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B1A1F000C0;
	Mon, 23 Nov 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425841;
	bh=4SASklNkTeizD/6hspIoB2DzJc2sRiMDkEkS/nt+fz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CAJGWU5Mj8DNCGd1IqPkhWlrCz1pUjiEUVbLxxl8HYLdf07aesjbLu6k6ye1cYht6
	 zqQNaVjbsjEsLR9fIJpDclLyDA/PGC71k4k+h5DwSKgZ+WDabaB5c94hiDmBxRHKKu
	 ViPVuJ5OmKU20U8yl/zGf1e+d01ycrVpkZSWbbC3+igRrCgr1xs+zWfaYSX0qpAth5
	 CmssC7VCkdqQu9RtjLKIFYQJPMvgX/1etsvL5ER4mXOEHnjqvsLL9mzHCqZnT6hRa+
	 Vsju3S8tZVm+BCSKj+ysWbq+bsgIqRKzbqRj3dlFP9TLGFG4blS4mZfGhtPpZOspQK
	 FK9nM5sJlBjPQ==
Date: Mon, 23 Nov 2026 10:23:54 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>, Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/11] mm/mm_init: simplify zone device page
 initialization
Message-ID: <awQGKjbQzKtuCgLO@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-4-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-4-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:48PM +0800, Muchun Song wrote:
> memmap_init_zone_device() currently seeds its reusable head and tail
> templates by fully initializing the first real struct page and copying
> it back into a stack object. This keeps the first page outside the
> common loops and leaves __init_zone_device_page() only for template
> construction.
> 
> Build both templates directly from the PFN-independent state. Add the
> head-specific pgmap and refcount state to the head template and the
> compound metadata to the tail template, then initialize every page
> through zone_device_page_init_from_template().
> 
> This removes the special handling for the first head and tail pages
> without changing their final state.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

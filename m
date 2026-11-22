Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362320;
	b=0vbNfO7k8UMCUvHC0eb0LxrwPmg5TfmaAusMW7zFVOABj5uHZ8Q9VNgsuoLkhF3X643W
	 24nyFGzzQuJyr11SsQeAlQp8mM7rhVzJADdKG3iWNb1ydJGSuSMlUVhZS30qnn9yeuQaF
	 kM/7RC/gHvvhg9rVZ6Gpwu5djZabnFOTTD0TpBV1PJZ3JqoM+QTSwUMaWlMtniJQgw/3b
	 Zw+vcQNN08fV491PU6vQ1TSz7X+NvtfZXD2O7oV1neSXW+d6FXQ6SzwBSpbDsHOSMqnV2
	 TTml6eydSP5ixe26XnRampiLaj4e7hnmnzpA1ms0HOSYDLeP/3AOrpeklSZnCJl5wFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362320;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=n6HyvgrVnoNLeUBk5MVuoXgI9Ikn/Hd+Z6Svdu4Eqt4=;
	b=Cic8gqz9zCTSLKFcfhBRK0DnUf1VnxlEZ9n2/9ZhzZx6k/3GwdLNlAtDNdylpqy2iH53
	 2GyBpo1wO4xI4UYiUr4ucGezZGoG5EjS7Yd9hLs/gYQlelM3zQhv1WBR/rWvatjGPmMVr
	 S+KqNearV51icm9sqpZpmri6YtEctARiqdHLvhNa77bahubIOp51GN/frdXYqYbHftwBe
	 y1CPBKJO/KzgZi4ya2GKgZHhZSys5ZpNPpIW2rX2kiUaE2bx3xsaniGC3ZaxrWxxXODwM
	 TDMs+0e0r8NrR21pi7hwq9zWG6WKtQAJLzuSGGiSS+laUhCOWkiURwlWgEBnU0rjccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqDHEe46;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EFC606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqDHEe46
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432561F000D3;
	Sun, 22 Nov 2026 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362320;
	bh=n6HyvgrVnoNLeUBk5MVuoXgI9Ikn/Hd+Z6Svdu4Eqt4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hqDHEe467lkxllXKMfbQqPDyhyP0PHHokQ3jYE12AG9DdEq7KUvz/RgsfttvAr4EI
	 wo6U5T0oq2ptRRRwTkJcTMeJIrOPaoXP5erSBcH/BbSP2cDylsg9HkksiAqVx/uG0U
	 zRdxJ6ijIuNAm+rvtKZtEfQZrX1zeG9pCfAfwZ/KZ8KgeAgOk/XFvwoWuHMmUuEcKo
	 tQUVqf7Qaw5bIojFMsvhCOoARSApRTPZWwlvlxOU3Alqdkuw6kgrJFRIqlUefprnO0
	 fWkOLC6ebRVBiYe8pHiVj29sngSNKcSToNo9PQriMaFEu0LKzZctIGGH2duEsM+BPA
	 RZEzLV6+vmwEg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 04/11] mm/mm_init: factor out compound page
 initialization
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Mike Rapoport <rppt@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <muchun.song@linux.dev>, Li Zhe <lizhe.67@bytedance.com>, 
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120100856.16929-5-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-5-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230137.3933282.14696783498187127744.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:49 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> ZONE_DEVICE initializes compound struct pages while their refcounts remain
> frozen. The setup is open-coded in memmap_init_compound(), including the
> per-page initialization and compound tail preparation.
> 
> Factor the common setup into memmap_init_compound_page(). Keep the pgmap
> association and MEMORY_DEVICE_GENERIC refcount handling in the
> ZONE_DEVICE-specific path.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


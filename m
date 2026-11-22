Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362326;
	b=vOA5KRkZEyWuPEWxhzDsJ+mXq7P8me7nD49KAtPv/Vv/r2rJ+w/t7bQa+7Vwm/nOzk93
	 zRQx+iw590eVk8ihitWraJ7ZAPeWoxhQo90n80qMV/tGByh6zl6kLhMeGplyjd9uHtfud
	 hNUT1GAXralC9yF/1bTEKUVbLqDRcftcaScZTLGdktd9oe7lRCFVqo7ZGeNIge7bsnjKG
	 GEfz3gCAuiQFxZgPlQXkcRY3iPQmNDEt2nW2WWlLSdJlcECwXwmGGPSCGZ+e9coyGM+c2
	 6FlYa5it1ozya5iFI35DvVX9QOg1M6RgIai+kb72lcTvYg6TtoDYcb6XloXu5QbMqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362326;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=nquhKD3WFj0Q0slxNAWQdsEwMsCitNqMkLuN6iD9q2E=;
	b=xGlnQEgQXiOEvujmlIvx7I79+LOcTfpIPLjPpf9g+hNpbwAT6cxIYO4nim5cWX6b8ve/
	 aJzkYUmpXJH7sgijS6IZV9kaGTO1BWJ6SHgZTq16IXw2+Sz3j4yCsKM7PDK6Su8JEfmUt
	 frq+uCPpfYbVCjaNIxVho60DUYVBcGl8vH3bohjxqwlQwi+g4uDkgXPYIjrRcRqvKjEyR
	 EijDgBOpP3WuYGR4vnb8BfAWycb2q6ox2EI46ULLerY1laKwNbJpA3MHQ9rIFhHRUXeEl
	 2nQZVmo5d5kQoBc5KgWxhfXh+RuwoLIRHApxDHhd2fzaDvJFxiI/WZYI2cD6N3OuKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pve4ICZP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8BF606A336
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pve4ICZP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404051F000C6;
	Sun, 22 Nov 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362325;
	bh=nquhKD3WFj0Q0slxNAWQdsEwMsCitNqMkLuN6iD9q2E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Pve4ICZPakxFRaJNuPeYHC++gCBHCHSv6y2Gn19Gt+4GZyJEqchbBg95AwqZIfOGl
	 dA4oNmUxorGT2sSuCSaxQDu+POBKnvd9ndkzAmcMWdTYd6j/VoR9zrMxxn7GPRYKrH
	 U6WHQYi+FADFuP16ploUoEI/ZWpldKACroDQvY1epAlKBheDoYLcR9HqRFxgYPAfba
	 CN0xbnyA93VcIrrWWupu/OaiBY5GmUUp3ocSREYAjYhQNOZ1CkZ7o2i6PeB8QuEURG
	 CBg7OwayAyf5QpmISziUYUQZlGU5YzlzZgDJLAV19iJbbWkNlX6OyrpjkC+jB7CbTS
	 EQezWZFfmvDqQ==
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
Subject: Re: [PATCH v3 05/11] mm/hugetlb: drop boot-time HVO handling for
 gigantic folios
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
In-Reply-To: <20261120100856.16929-6-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-6-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230137.3933282.6452527781490950704.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:50 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> HugeTLB HVO is currently supported on x86-64, riscv64, and LoongArch.
> On x86-64 and riscv64, gigantic HugeTLB pages are larger than the
> section size, so the existing section-based vmemmap optimization
> infrastructure is already sufficient to cover the whole folio.  On
> LoongArch, HugeTLB HVO is supported without gigantic HugeTLB pages.
> 
> Therefore, boot-time HugeTLB HVO folios can rely on the section-based
> vmemmap optimization infrastructure directly, without the extra bulk
> optimization and fallback handling.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


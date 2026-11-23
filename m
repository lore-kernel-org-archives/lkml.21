Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426444;
	b=ALrlW4APNSHbjNLkCwK2AvMWEbZ2dBdY214kp93ZGBlurwZvPru49u5xHkyavlJyICXI
	 PfvAyL4flJq48UNwP0fw5gTKnb2x0BF5ZEdA1a7tK7enH43qr4YdXz/E2STWXhyIVg76I
	 UZ1ShujOVx20PUfDSB2ibWuZz61wZ8drhKGPZtAHTCIuwN5aTs2t9u2IkZcosod9NQ4cp
	 P1Mpf+dA4DlVHw1NVQQhJ4f0A1hy0KOP9mPjmpvX2NVBOu/oldrbpnzhkgkQdQ2Z9LZNL
	 Kiv/FkxdYkar97sCDHbgWhpdQnAh10r2UpEUWOn90JN7wg0zhxJZgYle4rt/McFXrvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426444;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FN3KYiDiUd/Aok6rWfJQ/sT48Fgv4cxk4kzvyIKO+ms=;
	b=MRID9O6aUe6iauRW9qdQ2ygv1xP22DY4HmLAZ5VOsqb/6EyX9O8d0xTcQGmDRfjnzn9H
	 mXwgTlGDrpp4NQdh3pE2ztHBuYWp7PZ0RPgGs2hiOmpk6H6R7qx63s+dzyyN25q+4+8Wf
	 D0IU376PDbuzsLVb5L8PwU3/Nc4G8gKsECF7fvApZSt9vZ2+0wIxBLbqOMnycZhXrLmUr
	 YI0iP0jLnRkYgHzgyr6vAioiWH36a3pHb+dCs8k3icoxzLRdwSTW+5+ayBHRfHAfw7JFw
	 c1pA91/DhI61zHgkyq8eQp3kEuyf85Ph+OaW/rHU8MuJ+h4MqkfS0LX/S/OhugyIg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcmYv+u1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A23606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcmYv+u1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE351F000CA;
	Mon, 23 Nov 2026 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426444;
	bh=FN3KYiDiUd/Aok6rWfJQ/sT48Fgv4cxk4kzvyIKO+ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RcmYv+u1AiLj7FRFnV7wL1httPiUg2brQjo6BWTq2t6Eai7fk7aM+MYZyLArmNWVH
	 E1xUQz0d04Q8oHD/c2B5qT5Q1LePOjhpEZWuq5hGtOqf3jpN4xwIEZotyIL0zGxmRr
	 OBBPkv2ElYbk/AY4FhoXCpQKOyQ0EdI4kddQVbrRYBFyrhl/NJafx7lqz8/CWBwgbC
	 PLgq0BeV++AEKbFddn/wz8atTqsxfGFQKqGepzkb84Mwp7W1uoPlaNa7O2Kkjl2zuS
	 5okVlDmP0vPCMRKBCgbNF/QJNHO3hobijm9yaGU9KkDFwDOIDkIgEd7DSg0POow8xj
	 Ayf9Xg6ETIy5A==
Date: Mon, 23 Nov 2026 10:33:57 +0100
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
Subject: Re: [PATCH v3 06/11] mm/hugetlb: initialize all struct pages for
 bootmem hugepages
Message-ID: <awQIhS9P8JQ_48mz@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-7-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-7-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:51PM +0800, Muchun Song wrote:
> Boot-time gigantic hugepages currently leave the head struct page to
> the generic memmap initialization path while the HugeTLB code
> initializes the remaining struct pages itself.
> 
> Mark the full hugepage noinit and initialize the head struct page in
> hugetlb_folio_init_vmemmap() as well, so the whole compound-page setup
> is handled in one place.
> 
> This can also reduce memblock metadata overhead when many boot-time
> HugeTLB pages are reserved, because physically contiguous hugepages
> can be covered by fewer noinit regions.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362357;
	b=YYZCdq8AbjIjffQlI4clPOsBNgdCIod0VHElll++5rkjB5lGSvP2X4itkEuU4i7XgT8x
	 ZOddXO2QxEvHmYm0r/753qNkV27pMmEAVVHkYvFyOBaKIs1PnvL2Cgrky/51O+HGiZbda
	 gDHItgH2Ipa4kdQJuyPf6WSVSS3dR1RSoTgUK9qjtMBHW4OaBdzJw8J782u3pr7KRtAeS
	 oXRhGtEyTy/axOx43bdY7bWMAQfFnWnT0MaCeax8ilv+a7ySgVVP5nUjEwWV78mLkRHe4
	 7G+sm/ZT2EHcyyi5Kz+8mbHrsncaKzcKHAxJTpQ0RtifNLISYKGqpe1Ir88jj4/W3xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362357;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=5qUTcdUqoqYYz/SsteL+pOmg3FB4zklLKIQLHT5osUo=;
	b=tXOsLlMDAPxdHbxYJzRWQXokznBsyMia5+K2qyFBOrTBbogztUy0zEGAIV/8F1MvtkQE
	 sRyWMV+gxCTJ3wFz63bKLeSypArL6wtt16IWVQ3nfIL2wS4uKpIL1FgS54yKj/vriGYCP
	 xi9mSFMZjw9yYUQgnqDScHRwnEjMWxFb21qTUAUnRSYpFY6JQ/+FCFq64eKK1+hOt+U+F
	 6SHN2lGpUeY/u+Pq4v6zesBFBmEulbR9We+kVhZc91ff0KeXpECB0VmsTqKfMkTxoSMzV
	 IVRW5wHdH18PQQxvEgvt7W6ALWYyg4lb/tgQs7AGT26UvBL9mzd3ZuBtXxlchoPZZbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ha6fN7S/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A4C606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ha6fN7S/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DA51F000E6;
	Sun, 22 Nov 2026 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362356;
	bh=5qUTcdUqoqYYz/SsteL+pOmg3FB4zklLKIQLHT5osUo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ha6fN7S/3BJr6XmbYQao28niAg/XvimgnMNeZc5BOUyZcblWR3JSYSvOcSXvU8aH3
	 8bPaEBBg2ITzfwQwnnzVRZP63We/Y6nLUgpQiquoL2uCteZwVOQvmWuN1vYZ0GRqyo
	 rYs5GvMLRRha6Cg3UjIIaXwRyZWDDn8B2EpLC9kvCc0R1HHfTTwNea1hwG75iwmCQn
	 5XNReQBmbluL7DxrMz1JNUmwQ+gJyeTEWVmXtmSZBD7DE/Wxq88y2vWFJAydraJJ2j
	 GDpBv57hfDsY61XD90tto98VlHj4xwp1ZUjyq+190zixNFL91P08nFAUWQ9/xQ56NL
	 SwyxkT7t9n+IA==
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
Subject: Re: [PATCH v3 11/11] mm/mm_init: move pageblock migratetype init
 to memmap helpers
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
In-Reply-To: <20261120100856.16929-12-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-12-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230139.3933282.1358905817325491581.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:56 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> ZONE_DEVICE memmap initialization already initializes pageblock
> migratetype after all struct pages have been initialized, while hugetlb
> bootmem folios have their own duplicate bootmem-specific initialization.
> 
> Move the MIGRATE_MOVABLE pageblock initialization into the frozen memmap
> initialization helpers instead, so the ZONE_DEVICE and hugetlb bootmem
> paths can share the same initialization.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


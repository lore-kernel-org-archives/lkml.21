Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362336;
	b=xoHNC5v+rO9yNgDPgck/iKTcziurAH7cznenqe7zNd9i7t7qD+1HRx1De4xBNieJIoJT
	 xakg/hdfi1YWbD368GwiQsNzU3+gZBphf5h5nwa7lRbI3G5jcKWZec6IENCkUeTPi5DJY
	 ls1kZhRTQrj7oFRxTvc7P/gP2RpSkDthDie5eTTKm285e7H4LiDtx5tmPDm/ToFJ+YDVW
	 eo0tdUS6jwVgvkd3vzLOBIfQHBcIBucWOng7mIDDhrH8A1Tb+0zcPJ47TbrrFFSE2DYxW
	 21IsyTc7h5/Z4p5/84KoAWopuMIyRLm5vAHYPunOBJ4LjYBVol+qIaY1R9RSmfUhDGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362336;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=kprcO3EcHS5yezRWk5WPgNPWPyESEQitcOPrSumYn+s=;
	b=XIaivRLC2dNT+jKt9YMXJH4/MSqyj2b/JRUdv/YlBTkw0sFwhg6j0GsdGpy4n3DqxUe6
	 fNKaEu1U4tOvhqdpSsXoskBqzkfW0NAI+37hn6Uz7sxW1MY62uYkr2pas7F5FOMs+slPj
	 YoujUeW3i2JXIw24WpmEJThpekVZX5T24hRO5FZZqMSB8p5AvU7ASm3fgrpSj5xcuWxCQ
	 StqZh49K8HkZ7+e31iLuzBx3tIqjw8P6Liht80HlMKYjXnbCCFcRwZSUrDUy/HJ4emN1Z
	 jRbm72VjobCWtxL9Hi7smrtZoqjr8FWudQ/hnacwG/LVlyXow8CgVsLrizrVLRzByKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=djg9yD9K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C08606A338
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=djg9yD9K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F131F000D0;
	Sun, 22 Nov 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362336;
	bh=kprcO3EcHS5yezRWk5WPgNPWPyESEQitcOPrSumYn+s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=djg9yD9KHZWm9IJUHvwxqlrfyvd0n3bS+F1AajcxM7sXzzuMBzIS/Ltl7pDrpLyeI
	 h9xS3hpFxroIMTLUxmUWZgp8QrwPr1cCHX6yY0vzBqL9RbwD5vCj+vED2mrHkz6cie
	 2qQImN4ea/RuTmKmuJdny8Wvsa6XpWwnmyANNFjdLcjZhAB9axX23DGml/e1Iz40hb
	 Eo+cYo6QT9q4n+t7t0sSqUzttIv8sdxekY28KFFhc6NdGK4TitkcrkrFxlrbaXM+z0
	 MnNW34rsWKejefcsY45mbhOB6fIAFqketvq0YIWeQn7pjE6H7g1Wehj64bZjImDPuJ
	 aI2fjGgnvAnLA==
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
Subject: Re: [PATCH v3 07/11] mm/hugetlb: use common compound page
 initialization helper
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
In-Reply-To: <20261120100856.16929-8-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-8-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230138.3933282.12771618654272468300.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:52 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Boot-time gigantic hugetlb folios currently use a separate path to
> initialize their compound struct pages.
> 
> Use memmap_init_compound_page() for these folios so that HugeTLB and
> ZONE_DEVICE share the common compound page initialization path. This
> removes the HugeTLB-specific implementation and improves initialization
> performance.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


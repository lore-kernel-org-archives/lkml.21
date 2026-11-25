Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650271;
	b=3Z96jT8qunAPcSpjKtSSEhrjupZR0PcRSTVhMDB8C7XLymnWe9B2LxH2r7wNFt+rWYLE
	 OwuXrqOQdY5QGFCrA8PXzKSs8g/iDoNux6RTOmiiKGcnDdBTbN+2rC8ak6m665XTPnAtg
	 /hE7kHwZzj6hXgOtA0BJQ0LBjPUYRty72loTGp49Cc/8/dO/K79uqoVuFLA4EDAzsUvrO
	 vZZvJZxVjf96tB9V+xu4Yv8dVngYWmQ8NC3KAFLo/TjI8EsoT2eglMhlqOxdrw51gesdo
	 Uw57XyA8gIiPCZtrSKwUPs40djLmovA3KPQsuT7d/29q1O5WOGFmimxLltszQhpFpJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650271;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f/ATAjGGuvCnHn352ejN1uMtKhQ6IIrtwCiWm+JOgec=;
	b=WVIP53xtIgPAe5MdXR/GfgISb1bvc7qvW1w3YHI/n8tsL5C+W3CVbCEFg4kq6qZc1H5h
	 SLnsqqee3wW9rp7+VoVdJenkhBf06sIMEm5LcfRNm6K6rXksPf580AnT4uNJuFB+bv/Rk
	 DVwbhoVlV7q1TJc6TznyTPRnDIK7bzoBhOBe4DfzBavfErkNQIu/p9lVbBnfyPNMkVesM
	 cdvnsTMN7t3V4hBjyg3na8qke+8TJFg31AFPxb/EZKrH1Cko3gIo+wybDXLDwWLm6WUgy
	 +5eyi8ZrgwQJ8RQCQ5YWEAgr4pSHjtDVDW2hSgcyMrRtI5FhTSZ8GR/6AkVOc1/If2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OfkTtSt2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A6606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OfkTtSt2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C41A1F000F2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650271;
	bh=f/ATAjGGuvCnHn352ejN1uMtKhQ6IIrtwCiWm+JOgec=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OfkTtSt2xtBQR9UeimfOoTw6v3sL+yc1TRUwElnClmYZrlwHdJanGTW6e4tH5HmCu
	 /ssM52sxD1/MhEerP68lHHZ2OqaasROIYX1xjwuQ6HHzNYlUZjf64/GqfLW5GZdNey
	 8NDu78Zrgxpy1RRRhqMjMcGGez/CPEcafU2I5r4u998bsnBDVTJNGADkdyqGonNP0d
	 8rY0clo9rfZHjK/mgu4HsuJwHdYmocLmWHimVsjmnkejjtqbC/khs90dLfWPk3USLN
	 Vg+PjAWb+XDt2QrKNk+9tb9bIH62ElwnS3HqSHnCpzgH0FC2MhIY/+Vz90ywivXVIA
	 3iXjXHfmqz9wQ==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94959217274so659218785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:44:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFtm9BOKKYnZVJdR7wnEooDdXgjW2JjCJITUz2HC90Xuk9vO3fqjy3AyQUv1ZCWQsTU3qZ839ja3HIV1GM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GNFzzJwhw6It0h2iZW3RZHCnfvHR1HrlAdl5nY2DOAPzLqr9L
	+Fcg00cffsrx6CdXyyuGwRqIhk1X27XksBHF2D6iCunNqTttzf4UThtv6GFJuAaZRQLgTFki2V8
	p9MY8eiFm1xaBI7Ssbb3wk+ue5Wjb3SU=
X-Received: by 2002:a05:620a:3188:b0:93e:869c:43e2 with SMTP id
 af79cd13be357-949baa0d797mr3140085885a.50.1795650270349; Wed, 25 Nov 2026
 15:44:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125113518.1207280-1-hui.zhu@linux.dev>
In-Reply-To: <20261125113518.1207280-1-hui.zhu@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Thu, 26 Nov 2026 07:44:17 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yTx+vQUQ44iLg8MNA718dY9Z1gAdnz9vvJnZWzVZx-4A@mail.gmail.com>
X-Gm-Features: Aa3M54qXmwUVwHqi93lcxb96GVJpfnkGS49EGx9GJPqC8qElTspz68Xy-8zCgLQ
Message-ID: <CAGsJ_4yTx+vQUQ44iLg8MNA718dY9Z1gAdnz9vvJnZWzVZx-4A@mail.gmail.com>
Subject: Re: [PATCH v3] mm: mglru: reset the mm iteration cursor in try_to_inc_max_seq_nowalk()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Harry Yoo <harry@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 7:35=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> try_to_inc_max_seq_nowalk() advances mm_state->seq without walking the
> mm_list, but unlike iterate_mm_list_nowalk() it leaves head and tail
> alone. If it races with an ongoing page table walk, the cursor is left in
> the middle of the fifo.
>
> The next walker reads that as "this generation already started": it skips
> reset_bloom_filter() and resumes after the cursor. The mm it visits are
> the ones the aborted walk never reached, so they have no bits in the
> filter being read and walk_pmd_range() descends into none of their PMDs.
> Those mm miss a generation of accessed-bit harvesting, so their aging is
> less accurate and hot folios can be under-promoted. Eviction can still
> detect their references via rmap and lru_gen_look_around(), so this
> weakens aging rather than guaranteeing reclaim and refault.
>
> Reset head and tail with the seq increment, as iterate_mm_list_nowalk()
> does. It is safe: get_next_mm() holds an mmgrab() reference and a
> concurrent walker bails out at "walk->seq <=3D mm_state->seq" before
> touching head again.
>
> Only reachable from memcg_reparent_objcgs() -> max_lru_gen_memcg(); not a
> memory safety issue, since lru_gen_del_mm() repoints head and tail under
> mm_list->lock.
>
> Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>

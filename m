Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398814;
	b=JfC/GImV8zXnPdss1hH49DTNnq+9Mvmej7jVe4wlmROfIEPaEzgBb6XnJ4glCOtzy+9u
	 t1SyaX9uYdwb0Un6QG9fM92ucL0Dlb6JEZYqQCeMH23GGQboISHjcDxtCux7cn759/1/z
	 dmNihsfYVhMmZVb5WHxBRM6FPzz+queOLlr+9eAgjCVWAFWU/nGqpe1j2bMScMBv9Rb4f
	 lCfnODZkTJZwRlWxHlP4t0AGwklukEK4WwXoG4uUqUxuAEL/ktowL8wHdUXCNi3TGZKnv
	 a0HuWzLUazCC5CKabQN/WGmtAtcZFwZFkSH6+7OPe8cIXsMkBlKvAWvcQurZRJDdRog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398814;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sPv41HsofzT9QRCIlHB+B+IXmly/SiBKVbRaSebsetU=;
	b=wzjunpSLlBv4h4T45sx+zmoc7vX2sJw1vZSt9ZooONSDssev8P0QreePDz8SajPNGuf7
	 ez0oFncQCpN9Y2ryxvC9YCI6vDCs7vUIXLmbvospNE2JGPCecZJoDMJ6nf/l4r/v4dSbI
	 3b7Cs/gAMuWRgsa0HDTDW97Dt1OqxpsK0qipHflyvdW6gdU9sIRXL+neXQur7rfJEYZoi
	 iLioQH14lhgOwwD1WjVN7o8+VjQ4jVlFf2roAr/Lg15Z1cA5hLHH4bwIcnvt1iZ/tHfG3
	 JTrWWa4Zpcqe1Fb4ZxKcsX6Ip+zGHRwjd5G/37TdG53To5nJu+uOg+zBfMR161ADcCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoPYA2G+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B67606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoPYA2G+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381261F000D3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398814;
	bh=sPv41HsofzT9QRCIlHB+B+IXmly/SiBKVbRaSebsetU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FoPYA2G+J+zjXF9qLqIyuvD8xy0Su3rqhmySBnSdTR8Ne3tlX8n+AFiI44Qih0rbp
	 enBI41GL9ezrXnzGOiOWSjFgm1XUwjzlqgi12Z8Z+Ae1st55Qr++vdnyh01TaE4jAW
	 Cx1h0mie6siLYbJTaJPya6Kss7+XJZQUXVEBgEh04GQBpjXWgjBdZRssK5nYL0J4zh
	 ZKIRBcyj2iShj8v9STSc4nrzWJZSKQlQhFIg4wNmHGxDl+jNe/F3+u4DhopnlVgXNj
	 4Kxjy+drvdEis87Bn8WaGmlVpe6Tkdk6XJuHgPPjRDawC2mHOjRt+UJoS1Zauyui6j
	 1SuONatwyRUgg==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495d543c42so296646785a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:53:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcYz2Ul91AeGkBPdbwfBBlNG2l2XsbCAFkqPqz59pLZ3Yu3TVgZMvy1KflsS7+jp1znd86Okn5jndpBSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iOEyCMHvm53cmy2mhQHxA1bvW9nX5QL79iVUm0fDSWunWZa7o
	jwg5/bXf/aceO9H3dyCAN/wqintoLCkz+g0b/qy1tYKk3ClVSL968jbGE9SaBuPOURJ98h3iqZh
	tFAIrje7Um2S19vKfesGbAwvGPk9ATYs=
X-Received: by 2002:a05:620a:130f:b0:949:7b40:5678 with SMTP id
 af79cd13be357-949ba9e19a8mr1736245285a.53.1795398813620; Sun, 22 Nov 2026
 17:53:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081403.216452-1-max.kellermann@ionos.com> <20261116081403.216452-4-max.kellermann@ionos.com>
In-Reply-To: <20261116081403.216452-4-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 23 Nov 2026 09:53:21 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yZznwxOZmfeB2SpgT1enRbQMyKnN4QjEFdoN-PJi7mkg@mail.gmail.com>
X-Gm-Features: Aa3M54qK4wPWc_XdvESaK_X96UC5ef31iB9G90RGWdgsH-87Oq5vyoTtWFtdPXs
Message-ID: <CAGsJ_4yZznwxOZmfeB2SpgT1enRbQMyKnN4QjEFdoN-PJi7mkg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm/mglru: cache the last memcg node, make tail
 insertion constant time
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:14=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> Rotating or onlining a memcg currently uses hlist_nulls_add_tail_rcu()
> which walks the destination bin to find its tail while holding
> `memcg_lru.lock` with interrupts disabled.  With thousands of cgroups,
> this takes a long time and causes severe lock contention.
>
> Cache a pointer to each bin's last node, making tail insertion O(1).
> This requires remembering the bin number (but the new struct field
> occupies a hole, so it does not grow).
>
> In a micro benchmark that creates 1500 cgroups and repeatedly writes
> `1024M swappiness=3D0` to `memory.reclaim` in 8 threads, the request
> rate increases by a factor of 9.5 and the average duration of each
> write request is reduced by 89%.
>
> All writes return EAGAIN in both runs; the benchmark measures the cost
> of reclaim attempts that cannot meet their requested target, not
> reclaimed throughput.
>
> Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  include/linux/mmzone.h |  4 ++++
>  mm/vmscan.c            | 24 ++++++++++++++++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index c161d563ce8f..8382fc86cf0d 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -570,6 +570,8 @@ struct lru_gen_folio {
>         u8 gen;
>         /* the list segment this lru_gen_folio belongs to */
>         u8 seg;
> +       /* the memcg bin, protected by memcg_lru.lock */
> +       u8 bin;
>         /* per-node lru_gen_folio list for global reclaim */
>         struct hlist_nulls_node list;
>  };
> @@ -661,6 +663,8 @@ struct lru_gen_memcg {
>         unsigned long nr_memcgs[MEMCG_NR_GENS];
>         /* per-node lru_gen_folio list for global reclaim */
>         struct hlist_nulls_head fifo[MEMCG_NR_GENS][MEMCG_NR_BINS];
> +       /* last entry in each bin, or NULL if empty */
> +       struct hlist_nulls_node *tail[MEMCG_NR_GENS][MEMCG_NR_BINS];
>         /* protects the above */
>         spinlock_t lock;
>  };
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 49ef29a86553..7cfaeca9a605 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4434,18 +4434,36 @@ static void lru_gen_add_memcg(struct lru_gen_memc=
g *memcg_lru,
>                               int gen, int bin)
>  {
>         struct hlist_nulls_head *head =3D &memcg_lru->fifo[gen][bin];
> +       struct hlist_nulls_node *last =3D memcg_lru->tail[gen][bin];
>
>         lockdep_assert_held(&memcg_lru->lock);
>
> -       hlist_nulls_add_tail_rcu(&lrugen->list, head);
> +       lrugen->bin =3D bin;
> +
> +       if (!last)
> +               hlist_nulls_add_head_rcu(&lrugen->list, head);

So this is the case where the list is empty, right? Maybe add a
WARN_ON_ONCE() check before this code to make the assumption explicit
and catch potential violations in the future.

VM_WARN_ON_ONCE(!last !=3D hlist_nulls_empty(head));


The patch itself looks correct to me.

Reviewed-by: Barry Song <baohua@kernel.org>

> +       else
> +               hlist_nulls_add_behind_last_rcu(&lrugen->list, last);
> +
> +       memcg_lru->tail[gen][bin] =3D &lrugen->list;
>  }

Thanks,
Barry

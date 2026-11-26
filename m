Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717079;
	b=PIYxXtqTDc0yScltY0f/RSR2PoN6J7lnMz2XrXhHrmJFIMLRxDCTA0R4Uj4lHaPXX+vi
	 xG6XOhkEUJdPh4rVGH2d1PYR2Vu6g7f6/8z6njqA57a0/PXgK500qWooiMss4xSmsfrPH
	 fkpXYFMe1y3vPzHTxg0FD3BaQKnn2JTu4cQsGkonnOzoCXZ9IRWfM67LU9XtUIhrYWFqz
	 kkFwolRwOl9cDVvJhVxbfjPXJL6eyUBhyJPzwLGcgfh2O/rZhGrrd+kgDit7LJoxBpI27
	 d5BurAiUKXLmCsyS7jb05Zc7lShE51qrL89rSuPLyANlcG+CYnGkOJ/9KFtZYcFFr7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717079;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1LyHnWvI1U1dvvPzbvZuUKBs+ym49gt0CX1mtWx4Tu8=;
	b=WOB42HJxIXaK6bqC/4vPgzEbxGZc0x/9r+6yCUz47ogrd+72DHKk11rS1V51elB/wOx8
	 WZFCIbm1KlPcLEzEdFcDBvhgg0BP++xCtS2aUIe8oIIOKbIo7wakwr8+IPoWTJri88cgW
	 8RttoHiM0WbHVfox56VbWHiB3EFJRGEHbo5r+ZGqRopppYr43cIJLL3jTwVW0VkpRqvqh
	 AdpR3GUrt5ZbGMuC0SXVyKwqkE1CsB6esx22MQv5/pIRrSneZN2UgtE59mckLtaHK8H0x
	 t5WmoOX6Cgpm3LVgnfUfVATI7a5rZVrd/jX2zD1Xyej+XAP8FAFQJGHVyO33xanMTlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2vg+II4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C529606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2vg+II4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3AC1F000EC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717078;
	bh=1LyHnWvI1U1dvvPzbvZuUKBs+ym49gt0CX1mtWx4Tu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E2vg+II4Iws96C4RRS1HLB+uyZxXg1QiKkPdqH/eQrO/elF6O03rxw0VQk87DjrVH
	 eSWoKhp8VSKe1WAxGd0K6IFJXWnmAJWZ7WUtNDkkCIRcRmP96hP4i+bIHz49ra9a6L
	 n9eD3wvzTN4/6YHXkjpcV6B0O8OTVmUumnnfJAXnMcr67/kQZEqzbBmPRT1/ikF/51
	 0EkG4dbUfN5unJh/Ud3zZ6UC1Tw0fGNhw/sQfnc4vdzUVrLM+5Qfd7+Y/+DY8RzTJU
	 6smhiWzLS6C6KnD7GAgEAyNrP5Y7A6pE5vt4MrB8bTV/pvXr3kgU7fXecLQ+3L4bAi
	 6X9F1tY2Ul0bg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so8780636a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:17:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE9M7nJTAGGZBff/VoIkCHFc8NP8L54C/E4BVlNlzZJFx4Uxg6+yBrko/wqk1sPKkQpj0vNxFyWW64BAl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sCJJZdrweGBlQE+vrifT8iX9nCDthXC1kVSFvijahd98nhGoM
	HahKmddyQPifWOpOJfNz02lBBhzcxysagIbl4CXKkPA7ubUA2J72LmZH2dqDfzxRWSEDhckclh8
	vxbgO1aPXwr47j1oR8QHFDjF45S2GOD+O7XIs/YiKVQ==
X-Received: by 2002:a05:6402:280e:b0:6b7:d55:87d3 with SMTP id
 4fb4d7f45d1cf-6ba37ea7696mr14339449a12.36.1795717076996; Thu, 26 Nov 2026
 10:17:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795439990.git.lianux.mm@gmail.com> <030796dcb2086484f87e2250d9cf9a04fccf54ab.1795439990.git.lianux.mm@gmail.com>
In-Reply-To: <030796dcb2086484f87e2250d9cf9a04fccf54ab.1795439990.git.lianux.mm@gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Thu, 26 Nov 2026 10:17:44 -0800
X-Gmail-Original-Message-ID: <CACePvbUYHBD+To2CGe9b5_zWbYVrYU6Mv-pxzhXEgB7r1DJrdg@mail.gmail.com>
X-Gm-Features: Aa3M54oD-0dMzQJxnqWDxuLcGd-2CJBzn2u3HBeQDpt3cEKIGogR7eta0L74Lhk
Message-ID: <CACePvbUYHBD+To2CGe9b5_zWbYVrYU6Mv-pxzhXEgB7r1DJrdg@mail.gmail.com>
Subject: Re: [PATCH v5 06/19] mm/swap: serialize swap publication before
 removing swapon mutex
To: Lian Wang <lianux.mm@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Kairui Song <kasong@tencent.com>, Jihan LIN <linjh22s@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:17=E2=80=AFAM Lian Wang <lianux.mm@gmail.com> wro=
te:
>
> From: Kairui Song <kasong@tencent.com>
>
> Move publication of swap_file, resurrection of the device reference and
> the writable transition into one swapon_rwsem writer section. Split out

For helping the reader, we can add what are the previous lock
protecting those data structure and what is the new locking protocol
required. That helps paint the full picture of what lock protocol
changed. Currently, this only describes the new lock behavior.

> a writer-held enable helper so initial publication can share this
> section, while failed swapoff can use the locking wrapper.
>
> With file publication and teardown serialized by the writer, remove
> swapon_mutex and use a topology reader across /proc/swaps iteration.
> Only expose entries with a published swap_file. Other bits in flags
> can already change during device setup, before publication.

The current commit message describes what changed. This is the most
critical part of the locking change in this series; it deserves a
better description of why this new locking protocol is safe to use.
This can help me reason about the new locking protocol.

>
> The publication boundary excludes proc readers from partially published
> state and gives the lockless live-reference users initialized device
> metadata before the device becomes an allocation candidate.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Co-developed-by: Lian Wang <lianux.mm@gmail.com>
> Signed-off-by: Lian Wang <lianux.mm@gmail.com>
> ---
>  mm/swapfile.c | 39 +++++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 7a97cfd8d009..24f301ef4e3a 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -139,9 +139,6 @@ static inline struct swap_info_struct *__swap_iter(in=
t *i, unsigned long flag)
>
>  static struct kmem_cache *swap_table_cachep;
>
> -/* Protects si->swap_file for /proc/swaps usage */
> -static DEFINE_MUTEX(swapon_mutex);
> -
>  static DECLARE_WAIT_QUEUE_HEAD(proc_poll_wait);
>  /* Activity counter to indicate that a swapon or swapoff has occurred */
>  static atomic_t proc_poll_event =3D ATOMIC_INIT(0);
> @@ -3161,9 +3158,9 @@ static int setup_swap_extents(struct swap_info_stru=
ct *sis,
>   * Mark a fully initialized swap device writable and expose it to the
>   * allocator. The caller must have resurrected its percpu ref first.
>   */
> -static void swap_device_enable(struct swap_info_struct *si)
> +static void __swap_device_enable(struct swap_info_struct *si)

The function name can reflect that it is locked. Maybe
__swap_device_enable_locked()

Over all the patch is straight forward combine the swapon_mutex into
swapon_rwsem. I need some time to process that why it is safe.

Chris

>  {
> -       percpu_down_write(&swapon_rwsem);
> +       lockdep_assert_held_write(&swapon_rwsem);
>         spin_lock(&si->lock);
>         spin_lock(&swap_avail_lock);
>         si->flags |=3D SWP_WRITEOK;
> @@ -3173,11 +3170,16 @@ static void swap_device_enable(struct swap_info_s=
truct *si)
>         atomic_long_add(si->pages, &nr_swap_pages);
>         total_swap_pages +=3D si->pages;
>         plist_add(&si->list, &swap_active_head);
> -       percpu_up_write(&swapon_rwsem);
> -
>         add_to_avail_list(si);
>  }
>
> +static void swap_device_enable(struct swap_info_struct *si)
> +{
> +       percpu_down_write(&swapon_rwsem);
> +       __swap_device_enable(si);
> +       percpu_up_write(&swapon_rwsem);
> +}
> +
>  static int swap_device_disable(struct address_space *mapping,
>                                struct swap_info_struct **swap_info)
>  {
> @@ -3340,7 +3342,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, speci=
alfile)
>         if (!(p->flags & SWP_SOLIDSTATE))
>                 atomic_dec(&nr_rotate_swap);
>
> -       mutex_lock(&swapon_mutex);
>         percpu_down_write(&swapon_rwsem);
>         spin_lock(&p->lock);
>         drain_mmlist();
> @@ -3355,7 +3356,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, speci=
alfile)
>         percpu_up_write(&swapon_rwsem);
>         arch_swap_invalidate_area(p->type);
>         zswap_swapoff(p->type);
> -       mutex_unlock(&swapon_mutex);
>         kfree(p->global_cluster);
>         p->global_cluster =3D NULL;
>         free_swap_cluster_info(cluster_info, maxpages);
> @@ -3397,20 +3397,18 @@ static __poll_t swaps_poll(struct file *file, pol=
l_table *wait)
>         return EPOLLIN | EPOLLRDNORM;
>  }
>
> -/* iterator */
>  static void *swap_start(struct seq_file *swap, loff_t *pos)
>  {
>         struct swap_info_struct *si;
> -       int type;
>         loff_t l =3D *pos;
>
> -       mutex_lock(&swapon_mutex);
> +       percpu_down_read(&swapon_rwsem);
>
>         if (!l)
>                 return SEQ_START_TOKEN;
>
> -       for (type =3D 0; (si =3D swap_type_to_info(type)); type++) {
> -               if (!(si->swap_file))
> +       for_each_swap_info(si) {
> +               if (!si->swap_file)
>                         continue;
>                 if (!--l)
>                         return si;
> @@ -3431,7 +3429,7 @@ static void *swap_next(struct seq_file *swap, void =
*v, loff_t *pos)
>
>         ++(*pos);
>         for (; (si =3D swap_type_to_info(type)); type++) {
> -               if (!(si->swap_file))
> +               if (!si->swap_file)
>                         continue;
>                 return si;
>         }
> @@ -3441,7 +3439,7 @@ static void *swap_next(struct seq_file *swap, void =
*v, loff_t *pos)
>
>  static void swap_stop(struct seq_file *swap, void *v)
>  {
> -       mutex_unlock(&swapon_mutex);
> +       percpu_up_read(&swapon_rwsem);
>  }
>
>  static int swap_show(struct seq_file *swap, void *v)
> @@ -3954,7 +3952,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specia=
lfile, int, swap_flags)
>                 goto free_swap_zswap;
>         }
>
> -       mutex_lock(&swapon_mutex);
>         prio =3D DEF_SWAP_PRIO;
>         if (swap_flags & SWAP_FLAG_PREFER)
>                 prio =3D swap_flags & SWAP_FLAG_PRIO_MASK;
> @@ -3966,11 +3963,14 @@ SYSCALL_DEFINE2(swapon, const char __user *, spec=
ialfile, int, swap_flags)
>         si->prio =3D prio;
>         si->list.prio =3D -si->prio;
>         si->avail_list.prio =3D -si->prio;
> +       /* Publish the file, live reference and writable state together. =
*/
> +       percpu_down_write(&swapon_rwsem);
>         si->swap_file =3D swap_file;
>
> -       /* Sets SWP_WRITEOK, resurrect the percpu ref, expose the swap de=
vice */
> +       /* Make the reference live before exposing the writable device. *=
/
>         percpu_ref_resurrect(&si->users);
> -       swap_device_enable(si);
> +       __swap_device_enable(si);
> +       percpu_up_write(&swapon_rwsem);
>
>         pr_info("Adding %luk swap on %s.  Priority:%d extents:%d across:%=
lluk %s%s%s%s\n",
>                 K((unsigned long)si->pages), name->name, si->prio, nr_ext=
ents,
> @@ -3980,7 +3980,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specia=
lfile, int, swap_flags)
>                 (si->flags & SWP_AREA_DISCARD) ? "s" : "",
>                 (si->flags & SWP_PAGE_DISCARD) ? "c" : "");
>
> -       mutex_unlock(&swapon_mutex);
>         atomic_inc(&proc_poll_event);
>         wake_up_interruptible(&proc_poll_wait);
>

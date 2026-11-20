Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147126;
	b=bp2TXkTsYS/qoJ7jiqdlstEAIyCc94YsqpIWMJL9Dqna8eKz3xhzmLZy795Q2GkFFSha
	 +FDYtlUCg8tq2AEqfJlJ1Mw3z/5MEAol8Ms/1rmq9D7GyciRBmAK0M7i+s64vPhTI4wtg
	 +2y3RgylYG1aNBlYDCjusRwUQEDCbAXgxWRn2wRo64vwCzoKO94XgVKWT3dmLp6jDA2gK
	 mOioWbGxdVP+z8KcQMhw/S02y0vLzf1LmjGIih7l02Z00NmfCrVoySVVH7XR5sdL2eYmO
	 CT1c02qRVytRRWDlkjBzLv2wEsECl2PZOYNXWeZ9+fX54C+xSKYtDZvIS5I7tIy2q0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147126;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=Jio4uIgMuytPJfF6ZS+JERlUcbyxNSqS9P089/L27R8=;
	b=tcK3T+8vPk4mnvGsn5H/zr7FMSf59Nu6C6KgzUM33ki39jjEtieEUCxOkHeWlAXdGYtZ
	 vr8dburdQTksiFOoy/JjMo7cs9NtAlycMy4amNvU4DgBzHwx7GW/S/iQkpcDTvIj4YTsB
	 uq8AJTA2liTo24ToLBIvT8Lz29s7IzGifkqZj5PlVjUZuftVuAlF6arGbONATCGLmZByI
	 26UShS9TD96cIf4KBqyFqc/kfMKaP6D7utFD+A1CiXA4/2e3SBpy8NAlkFbbmNcxXR48W
	 p3082ltlTLZF1lo5x0tqNWW/rN6t0TQIwbPp3g4mtbhqwJ8Z7UyR7F++hhplf2HqVtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uSG068Hf;
	arc=none smtp.remote-ip=91.218.175.223
Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4380606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4380606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uSG068Hf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b/fSIQZFwrE5Uc+itxH+nb/MB52XKcBc4lrlcDVReLU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795147122; v=1; x=1795751922;
 b=uSG068Hf46SIfg12eSeow/vnbnqaZU4RXw+tmuMDgMK4ENbgGvJyWW1thOKSYQSPMQf/IFMx
 ysOzGUdmpXFiN8bnHeHVKyVXPRtgDogoHsmiV8C8oqXwbX6t4myVs3ee7gkDhTgKn7cDR/0xocw
 JFPZk9hLuvD2Fz80USfba6m8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7afe05bb3670798f;
	Fri, 20 Nov 2026 03:58:42 +0000
X-Mizu-Trace-ID: 7afe05bb3670798f
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 03:58:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <fbde457e42a2776addb2f44e1f2f95f8df5b2c54@linux.dev>
TLS-Required: No
Subject: Re: [RFC PATCH v4 03/18] mm/swap: cleanup and document swap device
 availability flag usage
To: "Lian Wang" <lianux.mm@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chris Li" <chrisl@kernel.org>, "Nhat Pham"
 <nphamcs@gmail.com>, "Baoquan He" <baoquan.he@linux.dev>, "Barry Song"
 <baohua@kernel.org>, "Youngjun Park" <youngjun.park@lge.com>, "Kemeng
 Shi" <shikemeng@huaweicloud.com>, "Kairui Song" <kasong@tencent.com>,
 "Jihan LIN" <linjh22s@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, linux-hardening@vger.kernel.org
In-Reply-To: <517ab62dc9842b89c39f04f70d96bcc6717a884c.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
 <517ab62dc9842b89c39f04f70d96bcc6717a884c.1794666741.git.lianux.mm@gmail.com>

>=20
>=20From: Kairui Song <kasong@tencent.com>
>=20
>=20Rework swap device flag and metadata handling to make the writable
> publication and disable boundaries explicit.
>=20
>=20Introduce swap_device_enable() and swap_device_disable(). Move
> SWP_WRITEOK updates into these boundaries. Clear the writable flag,
> set the off-list state and remove the available entry in one
> swap_avail_lock critical section, before releasing swap_lock.
>=20
>=20Preserve the existing swap_lock critical section across mapping looku=
p,
> hibernation checks and the disable transition. Drain cluster allocators
> after dropping swap_lock, retaining the device-identity protection
> without holding swap_lock over all cluster locks.
>=20
>=20Document the flag lifetime and locking rules.
>=20
>=20Signed-off-by: Kairui Song <kasong@tencent.com>
> Co-developed-by: Lian Wang <lianux.mm@gmail.com>
> Signed-off-by: Lian Wang <lianux.mm@gmail.com>
> ---
>  include/linux/swap.h | 29 ++++--
>  mm/swapfile.c | 205 ++++++++++++++++++++-----------------------
>  2 files changed, 118 insertions(+), 116 deletions(-)
>=20
>=20diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 4f686709d71f..0fa77f5679a2 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -188,6 +188,24 @@ struct swap_extent {
>  ((offsetof(union swap_header, magic.magic) - \
>  offsetof(union swap_header, info.badpages)) / sizeof(int))
>=20=20
>=20+/*
> + * Swap device flags, except the ones documented below, all are immuta=
ble
> + * after exposed by swap_device_enable, and until the device is freed =
again
> + * (SWP_USED unset), except that teardown clears SWP_ACTIVATED after d=
raining
> + * allocators and live references. The other exceptions:
> + * - SWP_USED: Protected by swap_lock. Indicates the device is inuse. =
Once
> + * set, won't be cleared unless all reference to this device is freed =
and
> + * swapoff finished.
> + * - SWP_WRITEOK: Protected by swap_lock, si->lock and swap_avail_lock=
.
> + * Clearing this flag is followed by waiting for all current cluster l=
ock
> + * users to exit, so
> + * checking this flag while holding any of these locks ensures the dev=
ice
> + * is safe to use at the moment. Note: clearing this flag doesn't affe=
ct
> + * pending IO or async requests, it only prevents further entry alloca=
tion
> + * or new async request (e.g. discard) from initiating.
> + * - SWP_HIBERNATION: Protected by swap_lock. Indicates if the device
> + * is pinned for hibernation.
> + */
>  enum {
>  SWP_USED =3D (1 << 0), /* is slot in swap_info[] used? */
>  SWP_WRITEOK =3D (1 << 1), /* ok to write to this swap? */
> @@ -256,14 +274,9 @@ struct swap_info_struct {
>  struct file *swap_file; /* seldom referenced */
>  struct completion comp; /* seldom referenced */
>  spinlock_t lock; /*
> - * protect map scan related fields like
> - * inuse_pages and all cluster lists.
> - * Other fields are only changed
> - * at swapon/swapoff, so are protected
> - * by swap_lock. changing flags need
> - * hold this lock and swap_lock. If
> - * both locks need hold, hold swap_lock
> - * first.
> + * Protect cluster lists. Other fields
> + * are only changed at swapon/swapoff,
> + * so are protected by swap_lock.
>  */
>  struct work_struct discard_work; /* discard worker */
>  struct work_struct reclaim_work; /* reclaim worker */
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c69a924acb74..6485c8020d3a 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1268,28 +1268,23 @@ static void del_from_avail_list(struct swap_inf=
o_struct *si, bool swapoff)
>=20=20
>=20 spin_lock(&swap_avail_lock);
>=20=20
>=20- if (swapoff) {
> - /*
> - * Forcefully remove it. Clear the SWP_WRITEOK flags for
> - * swapoff here so it's synchronized by both si->lock and
> - * swap_avail_lock, to ensure the result can be seen by
> - * add_to_avail_list.
> - */
> - lockdep_assert_held(&si->lock);
> - si->flags &=3D ~SWP_WRITEOK;
> - atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
> - } else {
> - /*
> - * If not called by swapoff, take it off-list only if it's
> - * full and SWAP_USAGE_OFFLIST_BIT is not set (strictly
> - * si->inuse_pages =3D=3D pages), any concurrent slot freeing,
> - * or device already removed from plist by someone else
> - * will make this return false.
> - */
> + /*
> + * Force remove it only for swapoff. Else, take it off-list only if
> + * it's full and SWAP_USAGE_OFFLIST_BIT is not set (strictly
> + * si->inuse_pages =3D=3D pages), so concurrent slot freeing, or
> + * concurrent list removal will make the cmpxchg fail and skip
> + * the removal.
> + */
> + if (!swapoff) {
>  pages =3D si->pages;
>  if (!atomic_long_try_cmpxchg(&si->inuse_pages, &pages,
>  pages | SWAP_USAGE_OFFLIST_BIT))
>  goto skip;
> + } else {
> + lockdep_assert_held(&swap_lock);
> + lockdep_assert_held(&si->lock);
> + si->flags &=3D ~SWP_WRITEOK;
> + atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
>  }
>=20=20
>=20 plist_del(&si->avail_list, &swap_avail_head);
> @@ -1299,21 +1294,21 @@ static void del_from_avail_list(struct swap_inf=
o_struct *si, bool swapoff)
>  }
>=20=20
>=20 /* SWAP_USAGE_OFFLIST_BIT can only be cleared by this helper. */
> -static void add_to_avail_list(struct swap_info_struct *si, bool swapon=
)
> +static void add_to_avail_list(struct swap_info_struct *si)
>  {
>  long val;
>  unsigned long pages;
>=20=20
>=20 spin_lock(&swap_avail_lock);
>=20=20
>=20- /* Corresponding to SWP_WRITEOK clearing in del_from_avail_list */
> - if (swapon) {
> - lockdep_assert_held(&si->lock);
> - si->flags |=3D SWP_WRITEOK;
> - } else {
> - if (!(READ_ONCE(si->flags) & SWP_WRITEOK))

Can we keep READ_ONCE(si->flags) here? pin_hibernation_swap_type()
updates SWP_HIBERNATION in the same word without taking swap_avail_lock.

Thanks,
Kunwu

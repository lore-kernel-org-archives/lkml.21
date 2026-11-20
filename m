Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149500;
	b=LVFlKu41N516+7aAS6zuDTRy+jtpa3scN2fs4OZs5jhQRCmSYT3vYSxyrZdGPW9/Ax/9
	 Py5T3QtdfRmX4FlB42hDRFb24wdAdccrqaBYb62+2XumK1x9K6qXTfg3++Y0Ej/9dMHan
	 md06kgoMCv2TeJuqss7/BzP2oOeEJShfiIGzzIMY1p6PKYsP3cVePwSC3d9fE9aqRKc1D
	 G1Ipt+XPKnut8n5ir1p+nY4tesKzNr3E2gPa9+5T456kFCtOs124KC30mklCSdSybX4xr
	 z2yAengQO+0BPjVQwZvhIplEpLOrM8PcVDk1HAuUymJaNWd+JEa96bNNipWJy2uPkUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149500;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=irA75ClnVJ+YMTbg6ex+HmOU4aK2Uha/DYvHWc5mkEk=;
	b=kxkKy42AF9AWhvpPu+bV/H9Du+Yc9qqLIs1AFSucwGsc3lqPSJPVpbI4dPDGUEG73tdy
	 5oP5kzajSbFLUvxS7UN9hNz8VOgF5W1p9dEq4AfuUi9VwS8j4U0WoygZstjrnGRnuI7ew
	 0oHr8fmLfMh7NCEPGwpj+qNc6pz/02dM2Ora4R8cOkAwyripkXCIfsuTNC1gPA34p2nf/
	 YUScCNFqP2TotVMFHWGJbqYUXLccdDs9scTaIlvSQ0d5mEubHONffRm+McVkfzLiPhQin
	 XKJkLTuZllAbOWqY5MYwIukrQm6pjpWVPTnPZxGEOMmdyt/48nVOowJYNptwMbJuWjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Fi00uIZV;
	arc=none smtp.remote-ip=91.218.175.248
Received: from mta0.migadu.com (out-248.mta0.migadu.com [91.218.175.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FE3606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FE3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Fi00uIZV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+0Kljhew2K71A2N5GrXQl5JxNv8YQpGFqu7PaOwFBDI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795149497; v=1; x=1795754297;
 b=Fi00uIZVuJdM7sXviSJNMPxkGTlDZpY8T24aCugw33eW1a7maI0G1h9vx5OTkN0rwYfAgKNi
 HFJCsM0Hi9AFUBncvG1f6CaMC61itRi118OnK5TIRVjATX45mqW6L5KFRdjATSseuSUrnHrMLOk
 TOjzoEnoVEVaYtaYEzzMu/zk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f87a44be2ecf5d50;
	Fri, 20 Nov 2026 04:38:17 +0000
X-Mizu-Trace-ID: f87a44be2ecf5d50
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
Date: Fri, 20 Nov 2026 04:38:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <1391b9e3f25f7f95aedd2b884a998a0d48b324ca@linux.dev>
TLS-Required: No
Subject: Re: [RFC PATCH v4 16/18] mm/swap: advance the global queue cursor
 directly between priority rings
To: "Lian Wang" <lianux.mm@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chris Li" <chrisl@kernel.org>, "Nhat Pham"
 <nphamcs@gmail.com>, "Baoquan He" <baoquan.he@linux.dev>, "Barry Song"
 <baohua@kernel.org>, "Youngjun Park" <youngjun.park@lge.com>, "Kemeng
 Shi" <shikemeng@huaweicloud.com>, "Kairui Song" <kasong@tencent.com>,
 "Jihan LIN" <linjh22s@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, linux-hardening@vger.kernel.org
In-Reply-To: <e72074ac198130494037e80655685cf25ff4bb5b.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
 <e72074ac198130494037e80655685cf25ff4bb5b.1794666741.git.lianux.mm@gmail.com>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

>=20
>=20The allocation walk previously passed a total retry index to the sele=
ctor.
> Each retry translated it back to a priority ring by scanning from the
> beginning of swap_queue. Keep the ring index and the number of attempte=
d
> peers in the task-local cursor instead.
>=20
>=20Snapshot the starting device only on the first visit to each ring and
> advance each peer exactly once, including masked entries. Preserve the
> large-folio same-ring boundary and the stale reader-offset correction.
> The selector's complete walk is linear in the devices and priority grou=
ps;
> device cluster scanning and availability updates have their own costs.
>=20
>=20Keep the topology read lock and CPU migration protection across the w=
alk.
> The global selector uses only existing priorities and adds no per-memcg
> device-selection state or ABI. Existing swap charging and limits remain
> in folio_alloc_swap(), whose failure path classifies allocation errors.
>=20
>=20The walk no longer returns an ignored internal error to that caller.
>=20
>=20Signed-off-by: Lian Wang <lianux.mm@gmail.com>
> ---
>  mm/swapfile.c | 51 ++++++++++++++++++++++++---------------------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
>=20
>=20diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 5e5c1aef010f..616339c5ae5b 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -195,10 +195,10 @@ struct swap_queue_reader {
>  };
>=20=20
>=20 struct swap_queue_cursor {
> - bool valid;
>  bool ring_only;
>  unsigned int ring_idx;
>  unsigned int offset;
> + unsigned int nr_iter;
>  };
>=20=20
>=20 static __percpu struct swap_queue_reader *swap_queue_readers;
> @@ -308,28 +308,32 @@ static void swap_queue_install_readers(struct swa=
p_queue_reader __percpu *reader
>  swap_queue_reset_readers();
>  }
>=20=20
>=20-static struct swap_info_struct *swap_queue_get_device(long nr_alloc,=
 int nr_iter,
> - struct swap_queue_cursor *cursor)
> +static struct swap_info_struct *
> +swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
>  {
>  bool rotate =3D false;
>  struct swap_info_struct *si;
>  struct swap_ring_iterator *ri;
>  struct swap_prio_ring *ring;
> - unsigned int dev_idx, queue_idx;
> + unsigned int dev_idx, queue_idx, nr_iter;
>=20=20
>=20- if (!swap_queue_len)
> + queue_idx =3D cursor->ring_idx;
> + if (queue_idx >=3D swap_queue_len)
>  return ERR_PTR(-ENOENT);
>=20=20
>=20- queue_idx =3D 0;
> - while (nr_iter >=3D swap_queue[queue_idx]->size) {
> - nr_iter -=3D swap_queue[queue_idx]->size;
> - if (++queue_idx >=3D swap_queue_len)
> - return ERR_PTR(cursor->ring_only ? -E2BIG : -ENOENT);
> - }
> - if (cursor->ring_only && cursor->ring_idx !=3D queue_idx)
> - return ERR_PTR(-E2BIG);
> -
>  ring =3D swap_queue[queue_idx];
> + if (cursor->nr_iter >=3D ring->size) {
> + if (cursor->ring_only)
> + return ERR_PTR(-E2BIG);
> + queue_idx =3D ++cursor->ring_idx;
> + if (queue_idx >=3D swap_queue_len)
> + return ERR_PTR(-ENOENT);
> + cursor->nr_iter =3D 0;
> + ring =3D swap_queue[queue_idx];
> + }
> +
> + /* Consume masked peers too, so every walk remains bounded. */
> + nr_iter =3D cursor->nr_iter++;
>  local_lock(&swap_queue_readers->lock);
>  ri =3D this_cpu_ptr(&swap_queue_readers->ri[queue_idx]);
>  /*
> @@ -337,9 +341,7 @@ static struct swap_info_struct *swap_queue_get_devi=
ce(long nr_alloc, int nr_iter
>  * iterator can move between retries, but the cursor must visit every
>  * device in the ring exactly once before falling through.
>  */
> - if (!cursor->valid || cursor->ring_idx !=3D queue_idx) {
> - cursor->valid =3D true;
> - cursor->ring_idx =3D queue_idx;
> + if (!nr_iter) {
>  if (ri->rr_counter < nr_alloc)
>  rotate =3D true;
>  else if (ri->offset >=3D ring->size)
> @@ -1847,29 +1849,25 @@ static bool get_swap_device_info(struct swap_in=
fo_struct *si)
>  return true;
>  }
>=20=20
>=20-static int swap_alloc_entry(struct folio *folio)
> +static void swap_alloc_entry(struct folio *folio)
>  {
>  struct swap_queue_cursor cursor =3D {};
>  long nr_pages =3D folio_nr_pages(folio);
>  struct swap_info_struct *si;
> - int nr_iter, ret;
>=20=20
>=20 percpu_down_read(&swapon_rwsem);
>  migrate_disable();
> - for (nr_iter =3D 0;; nr_iter++) {
> - si =3D swap_queue_get_device(nr_pages, nr_iter, &cursor);
> + for (;;) {
> + si =3D swap_queue_get_device(nr_pages, &cursor);
>  if (IS_ERR(si)) {
> - ret =3D PTR_ERR(si);
> - if (ret =3D=3D -EBUSY)
> + if (PTR_ERR(si) =3D=3D -EBUSY)
>  continue;
>  break;
>  }
>  cluster_alloc_swap_entry(si, folio);
>=20=20
>=20- if (folio_test_swapcache(folio)) {
> - ret =3D 0;
> + if (folio_test_swapcache(folio))
>  break;
> - }
>=20=20
>=20 /*
>  * For large allocations, try every device at the same priority,
> @@ -1884,7 +1882,6 @@ static int swap_alloc_entry(struct folio *folio)
>=20=20
>=20 migrate_enable();
>  percpu_up_read(&swapon_rwsem);
> - return ret;
>  }
>=20=20
>=20 /*
>

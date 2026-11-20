Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149530;
	b=cnTC1kuYy2Qwc+UDb+HPrN6SndNSPnt7ZGTuJ3tU85AGM2CJ2+MhPwsiTnZ3N2Qi80nX
	 thpIUvT9h+Uk0UEGqKy9H4c1NN7E2tzop+whPMg1oikOLcVRpZDIm/4FendxEPJUIXT3V
	 MwnScYChwPS4pnFkBo5LLD1OpMkyO5yJR48gpvIatWoAmFqRS3LHRz9moNMhcSH5C8JtV
	 lR1gWt4uqz42dsseg5S3PyBerC6QfNTEBfRtx6PNQG4q9Sqe36HhRKtGIErAVMaIJC6/N
	 AvoFjcMMpLfwnI2QecQVG0EeNlvNa+/NUiWi+B6FPuHtv/t/EoWVrnFltV9FyzuiSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149530;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=uzasxw4xqD3fvs8trR1Jh6kQdFHAglewV9gnHu+H+/M=;
	b=v9EXx/RN74O7Qj1nzF0sANgL/Qs/SzAD3JXvBTEb1IAbfK8+Vc3EPUWyLvCgd4VQv4nq
	 y17l1RFGpluhpHUclM5mh10DGCM6pu9TtYHZYKjLiS5x70lIFsrB+um8UTkK9LN+HfQSk
	 0qBPvPoAyP9pIupHB5OXc/QWZejrqEYGHsDrKMX0gxm4hk59psmunphgwYBPXxBkQFmKC
	 In2mOEviYqd0kzvEO0es52oDIdzFwORuDpTK/kEfPVWowN1hoUaq6HyHZ9qp5oNmMznG6
	 yqDpOmpJ6WNNX/4D7lAL5m9/ejnQ0dgvHAO4uC0fcIEkXb+3RUoAaJRm6verU5jc2gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bmKWrOdl;
	arc=none smtp.remote-ip=95.215.58.95
Received: from mta1.migadu.com (out-95.mta1.migadu.com [95.215.58.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45BC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bmKWrOdl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b3WBb0Xrdw7pL67XV6lz+KQ1Uw6QUh++E1jCIYS3bb8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795149528; v=1; x=1795754328;
 b=bmKWrOdlZC+vKBNYMM12cHGh7amn65+AFZLxJSNjTnweKsbUI6PyVKyYQhrXoAe7xrHxTQCs
 eRFRH1z+LbdaJ/BDIuhEdGYLTQkZzV61aIpQxv0KQDjsCHZJUTkMd6G1Om02lTqQJCPVBDGIzUq
 UJ21ccZdLpLhnCCniCLyjmb8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id caf988e3d507123b;
	Fri, 20 Nov 2026 04:38:48 +0000
X-Mizu-Trace-ID: caf988e3d507123b
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
Date: Fri, 20 Nov 2026 04:38:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <9d737a7fef0cc4f69b43014fa9371c914ffba748@linux.dev>
TLS-Required: No
Subject: Re: [RFC PATCH v4 18/18] mm/swap: redistribute queue readers after
 membership changes
To: "Lian Wang" <lianux.mm@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chris Li" <chrisl@kernel.org>, "Nhat Pham"
 <nphamcs@gmail.com>, "Baoquan He" <baoquan.he@linux.dev>, "Barry Song"
 <baohua@kernel.org>, "Youngjun Park" <youngjun.park@lge.com>, "Kemeng
 Shi" <shikemeng@huaweicloud.com>, "Kairui Song" <kasong@tencent.com>,
 "Jihan LIN" <linjh22s@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, linux-hardening@vger.kernel.org
In-Reply-To: <fbb87083afcc51fce533308d723edc55263bdf06.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
 <fbb87083afcc51fce533308d723edc55263bdf06.1794666741.git.lianux.mm@gmail.com>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

>=20
>=20Adding a device to an existing priority ring reuses the per-CPU reade=
r
> storage. A ring that previously contained one device can therefore keep
> every CPU at the old common starting offset after peers are added.
> Deleting devices or rings can likewise leave offsets and quotas that
> describe the previous membership.
>=20
>=20Reset the valid per-CPU ring offsets and quotas after peer insertion =
and
> every nonempty deletion. Run the initialization helper under the topolo=
gy
> writer, which excludes allocation walks, without allocating new reader
> storage or adding selector hot-path work.
>=20
>=20Use cpu-id modulo placement for a fresh best-effort rotation across a=
ll
> valid rings. This does not move existing slots or guarantee strict bala=
nce
> for every active CPU subset. Mask and availability transitions do not
> trigger the topology reset.
>=20
>=20Signed-off-by: Lian Wang <lianux.mm@gmail.com>
> ---
>  mm/swapfile.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
>=20diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 0c192844b121..eb2128132455 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -497,6 +497,7 @@ static int swap_queue_add(struct swap_info_struct *=
si,
>  spin_unlock(&swap_queue_update_lock);
>  memalloc_noreclaim_restore(noreclaim_flag);
>  kfree(old_ring);
> + swap_queue_reset_readers();
>  return 0;
>=20=20
>=20 failed:
> @@ -569,6 +570,8 @@ static void swap_queue_del(struct swap_info_struct =
*si)
>  swap_queue_install_readers(NULL, 0);
>  }
>  spin_unlock(&swap_queue_update_lock);
> + if (swap_queue_len)
> + swap_queue_reset_readers();
>=20=20
>=20 kfree(old_ring);
>  kfree(old_queue);
>

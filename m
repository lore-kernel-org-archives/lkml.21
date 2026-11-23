Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456333;
	b=4+k3rUnPPtHNgMaJhNKzVrGiNJ+/dBL8VGm/g6MyjajYHeJ292KIXK+pZUyRT4Iw5Rip
	 soMwCtvGAvd1mH4NFFqpViXFlu3EvUKpe7zV0t5p9SAqTSzbDkPBlJpz+tHObCXvyil/T
	 v4jrWYcxseGP8riNwvA8ofJaFGJqlJkrQLiWy6rxPTn7m7ajC1nhShL7m+okrDsnlZ5Qo
	 SL45AcgjpoYrsixb+0+H4wX1WKsqv5G+UdkAbh195xL8q3eQvhZ2KGDIc9YW6Qx+M4t3q
	 9JdWvBGBviz5YU5yBDyDtqhQkFyy4oauDfBJi8LyQwjDJRwWM7XzNHgT7SNQEdYc3ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MG9wth+FgKJUhgMgr0LKB7NofqtOeeE2/Q/8//33IbE=;
	b=CDNt4tLuhdrdZ8CaSMXsirrfvh5nzGe3J1+1xyq5on7ydpgcflqpsqBlPLDykK1ELF3T
	 pEaI9g6vkQ/29gtjekCcj/qpdPLcZrzFzPdyekz/vH0ViDu+tIcOfZP7VEEvBuocKA31w
	 RqCfGWNGiJtjanENsCCesPF75XWCtdbvlbgj7x8xA5W06I7Wvwo+mJMOkbX1Cp37CFO5J
	 aQ15XHmSsnT5M0G02gatOeIr1d6H4EBfWo2ccewWYuWKyeGt2C/byChfMwc4oo6oO55NR
	 F5eqIrRBZRKt7qh5FMViv/iZ2z6kbEew1976YT/YeyZDku7HrNxH3waJxou8exlX8GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VzVZdWLS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79580606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79580606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VzVZdWLS
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae85add4dcso24718061fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795456332; cv=none;
        d=google.com; s=arc-20260327;
        b=OL7o8Bp6YXOXawV6JKrZeY68RAphnxh9DalacDh7XSz+jn0k+66rDNm/ZDYGYCaIfz
         PHPDHY89e1xrcKd883RO6cuuBe2oiG7OYqrE8HNaKbk/LDv//YHkTTlmd6J6JpbFWIHM
         h7UNUoH6fVmKKmReoQttRGiiE5fIx4Y4hzAWGY5odO/kYPRJgSRh/ysFBLOFvvSrVqOh
         h3vZXYSG8Tv2NN8VJRDGOT05ekxncacYidDl7M/WrSKlUo70tkFSFQXJ3BkZpTzyG4Qn
         aUQO05QXHttd7VGwVqDasVNSf90eUPAd0RoNwf74dYjZB+9PQlgVCf4fsCvn3YmM2m5T
         5d/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MG9wth+FgKJUhgMgr0LKB7NofqtOeeE2/Q/8//33IbE=;
        fh=yEGBCVlEI8iYneMn9pqTYS5rAcBs+eadgvgEwMnU/3I=;
        b=FBO+uCKjZfbcyjhftsgm/yf/Gm+KrPOgUAU2MmZgCXFsWNBslqwDPDXSd1cJgvV00y
         PAqBxVESzUGGThoH3sbhqMJb6OUWzVw6D49QfEpps4sRYeQIBK7cq12kynh7ru8PbJt0
         J9pSrPKCM3HuDA5IlIOwda8sgo2mkMqZHJWCmxODbEM3fMZoKdRKnLtruOjJYi6HM9+R
         wnawVQBK8Ao1B9KVACHwK9qhXXmahyRDz1mgg3uarumFz8Iw5avbSqt8lsZoYNXu3OXw
         yqT465xo7YyHGVEOoXgkIL593hsRdx3jyTtBYThMSKLRTckrY8WvDmtPzuDf4krBu8N3
         0qnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795456332; x=1796061132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MG9wth+FgKJUhgMgr0LKB7NofqtOeeE2/Q/8//33IbE=;
        b=VzVZdWLSgKck9jnCpt5RDvw68VaJmr3oNxnGJ+6vxLUrggnEgO8oKD2bxPlSzauCyw
         1PHMr4dZgM/+M2EBeLNaRWmp/M8Rb4k+jyaFPASscR8yo2lKv3R3z4zrPqfQr3KuNbfu
         qJ8fudx1gpCSTCwYmjnaM10HDEkhnoCNCibUSVSiZfkbDa9jrdhMyqtIwPPXUsIye8/5
         fOSfKDGstpp45f9vJaoFV3ZedyWuC+wc2CXWnBgCmYm/6W0UIanqfYogNjMqej7k7RJA
         cRCIK6JPI/112hMpL8gNCkZ0UKbCjvX4TL8whDIb05sVFnwSdJB/U1hsrBCZkRS8xq+u
         vgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456332; x=1796061132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MG9wth+FgKJUhgMgr0LKB7NofqtOeeE2/Q/8//33IbE=;
        b=HqJkzBwg3A0st0pBqp9BFUEqzFR2/0ki8ofwRib2hr2P9oDuknLlvvuGmfBVTj7KvC
         H0MIXokAWYJTY2sDYG2n3nyQsyKMKk2q+f59Tv9kGVgFRU5XTtp4DVoTUzTga7ET71ZF
         9b+SA8E7ZhkLWzydzOMkeBn6aK8ft4i85wxtLesvUczhuu5bRcLgcVLSrAyAXEpgGhWT
         YLBidpfNFc4iDLm4ZmWJh7VhB4zPL6Yy5vQg7HEhTLCOWYydQDjTn3j4z12mynC6IHXj
         2jAfzQvhoHg2am9vHcOWacJV4tPoX3jXfWInVG9Zym+eBKHmO7kNBlLQQkwT5HlPgG2z
         qYSQ==
X-Forwarded-Encrypted: i=1; AL+hErGEAR4pY3d+RUNcJkV0bK94EIuj4IbFBlIzwbMdc40rspiQozD1TYdvwg+AI1da8xc8/6JaNZFjIrzg6Gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ylD+URtHqQtt0IdU3LahcuV7JS/Rr5vrNa+abe0/0308DnSz0
	x5RyKYlukqfpx3n+posbD1pYDwlZY8XViZ2itAbJ7Dz12e362YHiXHAejulpwYgXjX3CeAA+1t4
	jCx1C4tp13nGGprdMUIFjNupA26v2GjI=
X-Gm-Gg: AZFdTZdi1adNcWOXr7vTaUc+glS2clGNenJg5LltxVNuWHqLpeqtKT5DVPjxQaOXSxh
	1l9G4SzPpKTGUOj2cT6JvoNAe6XRBux70t+2C3I1t4oaHdwlLGQv0PkrPpjB1xRb4xEHp5zOeWS
	NmLC7Ti5POJph35UxxIbOWIsb8vKPYE7Bfgyhx4Hhiu89+x3fRAxmf1snR1R6A3dzjekD7iqlVs
	u+/p3YUZQHTE04fqiCBcDAEQo3r0jLhpJAQWTt/h2QWPM+IhBVzRY2Q4omvL5EtwnRE0jWNURQ5
	0KKS7iamUNt7BxiJicVg7dagIBtCioWl0pXwaj4zzSEaJukCJlmRusuARwJuC8zSAeECZfJmWS1
	QNsbsVJQlMIK81dHQpmdK5v5pLUTDh3QDuugdkMo+HVrYnKS4RgEcC79nPy49cS4nBy9tlLaf/W
	tcsxO+SanXqh0GI/dJa0TILNX9pCdYwT6hfpzzz7xEb690vyDw0Kyo
X-Received: by 2002:a05:651c:4217:b0:3a3:3170:5420 with SMTP id
 38308e7fff4ca-3ae7f8d44b2mr28562781fa.3.1795456331357; Mon, 23 Nov 2026
 09:52:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-shmem-swap-write-failed-v1-1-41a0115dfbf1@columbia.edu>
In-Reply-To: <20261123-shmem-swap-write-failed-v1-1-41a0115dfbf1@columbia.edu>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 23 Nov 2026 10:51:58 -0700
X-Gm-Features: Aa3M54oC7mW_vSMsZDK130KwbXWLigQruCSyLpfj8hjGPNFnBuMpFbLJ5HWExyo
Message-ID: <CAKEwX=NSxxQ7DB_CbFXNV9TZD8ddwLJry3Unab1OjnFPQwR6KA@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem: don't drop a folio whose swap write failed
To: mt4022@columbia.edu
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Chris Mason <mason@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Tal Zussman <tz2294@columbia.edu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:21=E2=80=AFAM Mani Tofigh via B4 Relay
<devnull+mt4022.columbia.edu@kernel.org> wrote:
>
> From: Mani Tofigh <mt4022@columbia.edu>
>
> shmem_swapin_folio() drops a large folio that does not fit the mapping
> from the swap cache if the folio is neither dirty nor under writeback.
> The folio can belong to another file and be under swap writeback, when
> the swap entry was freed and reused before the swap cache lookup.
>
> Swap write completion does not take the folio lock.  On a failed write,
> swap_write_end() marks the folio dirty and then ends writeback.  Since
> dirty is tested first, the folio can look clean and written:
>
>   CPU0 (swapin of file Y)             CPU1 (swapout of file X)
>   -----------------------             ------------------------
>   shmem_swapin_folio()
>     folio_test_dirty() =3D=3D false
>                                       swap_write_end(), failed write
>                                         folio_mark_dirty()
>                                         folio_end_writeback()
>     folio_test_writeback() =3D=3D false
>     swap_cache_del_folio()
>     /* X's data is lost */
>
> The next swapin of X reads the slot whose write failed.
>
> Test writeback first.  Both flags are in folio->flags.  If the
> writeback test sees the write ended, the dirty test then sees the dirty
> bit set before it.
>
> With the fix, a folio whose swap write failed stays in the swap cache.
>
> Fixes: fc2c19648d68 ("mm/shmem: fix swapin livelock on a mismatched large=
 swap cache folio")
> Suggested-by: Chris Mason <mason@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>

Good catch.

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

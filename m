Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795562208;
	b=C5/ABL6HXJE2uwpl6shUFTxiaYJzu74OD30QI/7AG0NXQpaC04iTgaOnW0LIj6CW2rYc
	 JLL7E7P81fH+f+yE2ZAbckmzRoQHMoqEUt60UizbHBRKkp0alRPiMoX8WKI5VWJq+wviZ
	 JqdcTAj13dma3ptbeMU71aFIn/bFLwvEgGhNJH+OdP0yvxrOt5Wspvzpk/jXw4c3yaBVv
	 oel18pXsGosQLdLoDgsZ6Mw3oC+lZAAe+/J10Rg8ks3QknrsL8xz1V4xNaZb0a49yrc8u
	 wxZokUNUJTSaIzmx1bJVucukHPJhynivu29h4Igz3qSO0dNM2PMEZAvB4Son35N5P/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZoFyEnud89IUcB6sarqMzo8JRRy8dWijZef5NdeWRGU=;
	b=AfGo5yPZ25DiQpNrBriuPAbWm47VPpqKcCO8Ai6h7KDhkaDNTdIOkq0APp4dDGd04XCR
	 2WZrgMWG5DJXcS1KwV6+v59svi6fIsS64mfvr5DgsC1/jJH98MNRRHrJLiHztUXAapRqg
	 IVyzdA8ZaFJxR08UKur/xSSWYlfjZ1F7FE5i0XbNFNnMoqYF+h5VDsJbDdFU69IZJ4R5v
	 b+EVhV+7yrjBHVnFSyJFoOLip5OD5x4QTxFw9Vic2gIZNnJ4CbRVG1hjjMGT2wRcDUCJN
	 UUeMtpncWngFin8Y2Ip8HpM5328qgLwEI4LNgH/BtbPcdwSPcRz+5zJJ9QlVqQ4A2Og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTeDWynZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718FC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 718FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTeDWynZ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491846221ffso4346918f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795562207; cv=none;
        d=google.com; s=arc-20260327;
        b=nHhX5sDNvUspjbOC3f6GdEvtiJwf6DCn7hnxF+Y62tMYVZFgTY0xUJE0SJzn85To/S
         rgqaONuq8jz6N3ovc7oMSaBsyeIV+FZbxCf90qM0gsmqUZZG2Lwqu11vg1LwVhfMh2e/
         jTPpRQMdpMgMiS/cbwz/HhNurv5oL69QkDQDxbiJa+DwQ/b6ds++3WqNve80fJ3V7Nx8
         v6/KDiTaOuhAbnZW6grx/YG/SLvrLBT/pqY+7YRhQswf1YR8JgZv8a+fhNIFNjxrQEu1
         FjmWr145L/XphK9GWi8jIYDVeW/2Vo0Y/Z/1Ptyp6uhFNo0QvaHIhpq/kdfnbCzzhk2H
         4fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZoFyEnud89IUcB6sarqMzo8JRRy8dWijZef5NdeWRGU=;
        fh=lDdlFbvoqL2haoYQISUbdvk/O2g8pHT04o17qcgdwBY=;
        b=i+buN1JCg1P5P+LtzyKCzSuHSz8oLxBDnhztcdqZF+DY8rnaWSm6RIFmmOaxxqVTtC
         p5VJ20qahQGB1Yrv7KcUmqV0wnggQVybRuKiW+Nw+bZzImN32xFUjxJNLSqE6UX5/zsu
         OsEJE25aTWkfnRS6WjArIEmF38xrEm818pO+Tm8UIcZvg66P9oajKihEKIjyaK4v02J7
         T70i3I6uHEwAmQ8R5vIC7tR2beYd/LKEyb522SFbl58zRKNMCxRMcOTAgx9dRQ4riZqC
         FWFAc2N5Tb/8WTA7Cje8/Sr/Izexl43yIBSiJyFA0WnIDEH8jj2LO1hDbtGg57kv7jA6
         +dpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562207; x=1796167007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoFyEnud89IUcB6sarqMzo8JRRy8dWijZef5NdeWRGU=;
        b=jTeDWynZO3vHIqs2S2mBHa2gfaQygVXW8WCpN3BC3BNkQhL1zK3M4r1dq7ew6LnH8u
         4uFz90Y6pY4MEFd1w3n/bj0+LeDZl/wmm5tB9VsPIR8v4bd82NQbYoXglCtdLsWaTG8z
         P01vZ5ffmDgw0P/rdva2bS7RTOcZCHm3qnAw8YC5BZn3rf8fCemRb98hovE+UrSmL6pB
         tQ0EL7D9z5lAA1Gcgt2H+ElGKRVtVefcYcPXFXbdL4MF/yVs7CTY9nXo0YMGTsLhsR2o
         4fcXxWP6DODx7NVZ9zaKQsVDCltulVr5TPGRZpgN1vCzEAX9UPT+/EJxDWlBA5Y9leUB
         BB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562207; x=1796167007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoFyEnud89IUcB6sarqMzo8JRRy8dWijZef5NdeWRGU=;
        b=GS5VlgvA8yRTPdAaVn/C+M4FzyNVqbHd7zoSNET0Na/lLyz3O52Hv9DAjqJEFt/t1r
         ES7ZTX1yYwPGmWcv3KaE+xjzDjcFKtLRpA4djJTIDpWowiJAlygz4ofP6htk7zN1Jp3X
         WxPUk6diYVaNh7i3YUzgp/X0EHNEAlWFj4PlotbNMJjAJDjEKl3UODc5pjQfHH9l+i9h
         lPvnj+ifKzt4f1H33YE4HrD0E7l1u3s49K1eg4nBqXY8wWmGJaoTz+TMgBG+3RCiHuIu
         ltPlVzLfhpOcTZbXen01D8vGzN0eyioaXwjBaI/zpubrVGvLwsh+4VE3e1y/KB54JAjH
         GSxA==
X-Forwarded-Encrypted: i=1; AL+hErHjQg4dAE5k+8zO6AXu8sG1VAkaYQNNBOwotXjOEI+S5vfwb7RrxoD/B4HD8hQYRr6nwfRFxFmYbMtH1tA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l28Vzk5aMXAadU8a4kESYsisJB/4lLO4W0+AGpW63I9WFqv3X
	vkYiTQdzJq0WHPCabxuix4t2YYT7+7lcOlsuJu623mSKR7tIT+q1J0/01Yz7OpBSEO3T/Pk/c2q
	tRoNWvVzDi97odShfnFh3GwYYvsEpHpg=
X-Gm-Gg: AZFdTZdJ9RFU5ig+bEX3dhIsuWV9omRD54GfeeBevmHFAI7z9POzjU9oWBeFMtG8JKR
	OW77EqpuDGfB7F6yQai9n3fUIEIcBTwQ+rEVLKAfeIJz0ZgFy/xpsm1pN84TvhHB384jwcDjp7O
	8jhpLow04klkyx0XpI588yv0sHEWxezJKpvFq8SN98BG9QALZp+U49jpxuHO6g3ua7pXlgU+Ueb
	mav8LDJmUAlnZap/a9Z5VBzncLXDFf9LYR0OP8kGGJ1p9AiWyL3UlBy9TyfbyGKVvEBvEb7UDEd
	Cc8v2X3VR8TMzW8yIKmMKe5lR/BqEf926Zin4Y6foetoickE11tiBvVcxtINqBjf1qXA+uX8Sbl
	1siK20/PSCZWOrztrPjWd2exC1iEbh/i93P8N/iPyfg+JRS9GGwQsE77qIZzVr3G7o89Xj0F95i
	lwp09D7sXrFIhaRRb9VqGTBmKmdIjNbQSaW2/rwM/Brpzl86BnjAx0
X-Received: by 2002:a05:6000:290b:b0:4b7:8363:682 with SMTP id
 ffacd0b85a97d-4b7836306d3mr6416284f8f.16.1795562206537; Tue, 24 Nov 2026
 15:16:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <a74aca7a3d27333972782b29786c7b33861a56f1.1795412161.git.senozhatsky@chromium.org>
In-Reply-To: <a74aca7a3d27333972782b29786c7b33861a56f1.1795412161.git.senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 24 Nov 2026 16:16:34 -0700
X-Gm-Features: Aa3M54rNAfJPEtIYBNS8z0FncYPJyb1XKCgONajpLzKwfERL2NRMGTo5_-rczOI
Message-ID: <CAKEwX=MJJVBfdE+LL-j+jwfkNP=OHaV21XLJxEOBv4XwsBLiiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] zsmalloc: free a zspage's pages in one batch
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry@kernel.org>, 
	Hongfeng Chen <hongfengchen@xiaomi.com>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 10:36=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> __free_frozen_pages() and dec_zone_page_state() take about 22% of the
> profile [1].
>
> Collect the pages of a multi-page zspage in a folio_batch and free
> them with folios_put(), which takes the pcp lock once per run of
> same-zone pages, and update NR_ZSPAGES once per such run as well
> A zspage never has more pages than a folio_batch holds.
>
> Single-page zspages, incompressible or power of 2 size classes, use
> the current inline path.  There is nothing to batch there, and
> folio_batch is not free, hence the batch path lives in its own
> noinline function.
>
> munmap() test:
>                     next-20261119      v7.4-rc3
>   256 MiB           -2.0% .. -4.1%     -4.4%
>   1 GiB             -2.8% .. -4.4%     -3.8%
>
> [1] https://lore.kernel.org/20261109105957.2577351-1-chenhongfeng0212@gma=
il.com
>
> Reported-by: Hongfeng Chen <hongfengchen@xiaomi.com>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

That's nice!

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

[...]

> ---
> +       zpdesc =3D get_first_zpdesc(zspage);
> +       if (get_next_zpdesc(zpdesc)) {
> +               free_page_chain(zpdesc);
> +       } else {
> +               /* Single-page zspage, e.g. a huge object: nothing to bat=
ch */

I wonder if it's worth keeping the old logic for incompressible case.

>                 VM_BUG_ON_PAGE(!zpdesc_is_locked(zpdesc), zpdesc_page(zpd=
esc));
> -               next =3D get_next_zpdesc(zpdesc);
>                 reset_zpdesc(zpdesc);
>                 zpdesc_unlock(zpdesc);
>                 zpdesc_dec_zone_page_state(zpdesc);
>                 zpdesc_put(zpdesc);
> -               zpdesc =3D next;
> -       } while (zpdesc !=3D NULL);
> +       }

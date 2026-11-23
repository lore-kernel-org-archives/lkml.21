Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795454187;
	b=EncPgVVVO5OxTRCLrE76lHZbS6aZ9aLJn092cW3/R4KJ+fknIa1zUYWRco3iBpVOls3V
	 Nvs5E+8hR1rz71ecvMzx3i1OZO8wE8tolezE/6X+OwtIr468e13SvoftS88a+TdQ26vKh
	 Wjo+Rzp1mtP++0q7fT6SPAoqzF4Bu7hQZzwpgY3y1lVMx7XdFghii61aEZD09t5JG8l+O
	 +GgdIDLbo71N8GZuNKkiT93zniOiUAdJJcbww6KOQEL8lAPBE4zoF6SlqlV3nW6iKbwEI
	 hBmK1t6Iyz23XKPBfKYu+wjKhvzIoHmf9eh99mj5GowJeZGROyjjXEkUtfTxq71Yu8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hTikqUPwqyc50FMehutzNCz2ncKuDk3/OGCI7AzQ28A=;
	b=j8gNCGgKzV3rYONuqVjbX0dHkFSXheXO2S77h1UVA6pwVCjwaKU38YtNUxmmGrleFTNC
	 +ADriYAWGtJverF0kyHPTRC/R3DhKoWjM00DPTsS04c4tCT7xOcFGTnMenUqdD00+SEME
	 YGqo5MYpqrhyPfC9OlHT7UWffTkZlpATX9Iz7z8Wrv84F8NUBf5400uj6eN5TXxcSLUND
	 ICiPqykCTeSgTJDEJ0O+lRYc7Cz16oIN2MYs0B2jE9tvyP97h7QzOAtQYyGjneR3mWQqE
	 BI61QcBH5qDix/UMM74RhFFV7JMt65RYDeaBq2WHxfBPjD/mp70QKzltDG24LrB+8nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii0wnV2d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii0wnV2d
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso32967405e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:16:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795454185; cv=none;
        d=google.com; s=arc-20260327;
        b=l53AH+RgsRdURvhyEAXU20OXxtuOJ1JZE6ZRV9SzTRIWoRLEbI9MFMpMG38RWVB5Nw
         F1ddx0mcROnJKt5U2QUPmAsnuLzkCjUSo31T46vNSn/Nq3MoGhKoQHC5vwO7+2vxq0dV
         98Xss2CwGtPpxvawVOBG0Qh/Y1VbzCTrei+lQNXVBckOgnKV+Z89ebDw8EEr6MB2aAVv
         GJ+pqbZIClwnDbsN0phlK14k+U9O3yurmaj2e3Tw45imwHWH4HBd75autJ9SI965hqhJ
         x0rvwgduVeE/WQeF/2O0WjbD0Drn1jKXKFTspTcddcD1l3vqvV3pz9zMFuIaEfqe0JKe
         pAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTikqUPwqyc50FMehutzNCz2ncKuDk3/OGCI7AzQ28A=;
        fh=mhSaH7Zezx+tc4mnOoYcmcNRHUpllyqOuYPPb25AaFg=;
        b=lORnTRukYY7mIm5bH27uRRlLDN6K2R8KFsuzeXVK/mn/qG7YzSg3pq3dwHNqBF5Ekm
         L4SKAC2MMiTz+GbOwB4zCFFfStpKm2Be2wwkbKcAyR2SZAnikSVQjdc5B+AXH+AAAWL0
         hp2quHsxxftnKo7cWjhIPESsKFUmhtl4us/o6gBEYInO2NNTxy6DWirrwqItJZoBU/g8
         Nyt6MeMzcFh3DNB4IPfyvfxBceSZexr82C1bA1tESSsx7KPZD9otNl9FxtMA0na/oVyK
         TJ5bftnl0I01anEESohMM3QXZQgui6OJJNZELLwp3JSnnnVGCdDK08pFVika60v3fj6s
         TCMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454185; x=1796058985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTikqUPwqyc50FMehutzNCz2ncKuDk3/OGCI7AzQ28A=;
        b=ii0wnV2dqmf2mZYhQWL0lBHxXFaQUuH/rOZilo2bfBmEc8HsiUuRh/ruTHN3jOqPLL
         1024hy96AGRZRcDPEv7+3FkI5W7POUZ/C8zXWXT1hlM6NclfNPwXcTPVY3sVJ0PHUTel
         wQ89f+R4XhW12CbegBEZJtT7K7UHfJAtThid0/qa1JegAxFfbH0Cris29kg2dE8Rt2dr
         tm3Izm/i9OtjPDzFIcOIdJ0ticgUy1mzQ8bYGywGS26nyTp9Wtvg8Br49goXRLkzianC
         QgK2M8s4PYRZZM15bcttf1oIG/6SaOYRiU/6nWRdgdD6+2Dt85BxDkOCttQVyiZ/7dNm
         JJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454185; x=1796058985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTikqUPwqyc50FMehutzNCz2ncKuDk3/OGCI7AzQ28A=;
        b=KQp/qvFXk6UzZsURZGAYThK4c6ooZu3vE7hgWQB89/+NMPZ29HJSSxTzkcW6+b5Pp0
         u6YjmqoZbpGkm8D2/8okO20/exERN/DTXytX/AKkgZGv4drd5bLuDXn6PUWaggjk4sDI
         fI839/P4JZWKqa8dGj13wbByOFPYYyFgq6b8aCdZIbaTu7UWrxxZkXNn1tp6pE3dnWBS
         VMZLEYB1UYWAvk6OCEegqz/HcrsFFOVdPmjfzqLOt1UU4p5UJ+8KqcUtXUErYkAvoTdr
         9YdkVgmy8KsNYS77YarANM322gVXuAU7g7/X5FdvUME1cGGUy6Sn/ip/JZdg43mGxRJC
         yHeg==
X-Forwarded-Encrypted: i=1; AL+hErF++/ll2QbJs0V6KZ105oslBKK9LgbDThqdDkggHdRFpB9qnSYTPJPcBCwGKII6cR6xHIAubLB29levukE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XiGJLSA1Cf9WafPYE9UYpS0KI5Tftt0AKg2LXa8vHvMX2fFfD
	+33kjAQCa2TzchC0nOnye+a4IXbn1maHIqfPiuUJU/nhMMkARX/3ckUTtWw1PnuundqNu92ftia
	Ari3LkqHNBSHNirP8vMPCrlqKUTZ55kw=
X-Gm-Gg: AZFdTZcIxrcO+51YQN8OLgkjve+kTXbuC+RBBEcTWEoRGhPSjiV3lKSzZvMJ5mE8ooC
	DEGZIndbIL0kQFVDFgow/A1s/7eM+4QIDwvNhefIzLYz5OIH0u83hrMsLagjwcR9ows9WWX+zhx
	2KdvrqL0D0K8vXN/feZRU3t1sxNcjb1euWly6CaWowb/5kCYS+NrLWvbN96PDY2aJJoVefQ5o0U
	p1wFBYGtEJn99TDFLV7XLj2tjiQOYk714P5zJBxgVaixY72gBo1Ei2fMY0njKNFUAnp9rleYYlW
	5M1yZCuKFl6IGzvNklAmbobz0TK45Y84T1TSX/IbYmq7uEFCUO9htQwnBzxmnGZV9/iuDHpSRUO
	nbardnYR9g5qj1sl7tQ8hdsPJURw3GOBT1Er+eCIkWVIArYrTkmH8G0+ifIambw7o4FFq1gq3Mk
	eonn1ro7KZC+gYbCzd365cyHNLmZEb5OO4wUtV0QDxwcvMwTXNDTkq
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id
 5b1f17b1804b1-4bb88811c75mr272447135e9.19.1795454184841; Mon, 23 Nov 2026
 09:16:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>
In-Reply-To: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 23 Nov 2026 10:16:13 -0700
X-Gm-Features: Aa3M54rfVgjOdHlfCA_u99G7OPTAv0jJRAR-jRxCmNX7C5t-zjR2LD1E9wZP3bU
Message-ID: <CAKEwX=M8m6iKXApiCLqQR3s6_dNvZG7MW-bUWGSvbqGkcQkzRQ@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: remove dead length check in zswap_store_page()
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: chengming.zhou@linux.dev, yosry@kernel.org, hannes@cmpxchg.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 8:25=E2=80=AFPM Mohamad Raizudeen
<raizudeen.kerneldev@gmail.com> wrote:
>
> zswap_compress() never succeeds with entry->length =3D=3D 0, so the
> condition is always true. Remove it.
>
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  mm/zswap.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index ae19e301fced..9590f333d83f 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1509,10 +1509,8 @@ static bool zswap_store_page(struct folio *folio, =
long index,
>         entry->swpentry =3D page_swpentry;
>         entry->objcg =3D objcg;
>         entry->referenced =3D true;
> -       if (entry->length) {
> -               INIT_LIST_HEAD(&entry->lru);
> -               zswap_lru_add(entry);
> -       }
> +       INIT_LIST_HEAD(&entry->lru);
> +       zswap_lru_add(entry);

Acked-by: Nhat Pham <nphamcs@gmail.com>

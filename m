Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157212;
	b=DIBFFnhhPdyyLuFNyhJRSfKjK1PBe6Da0WboKJkPjVNXoiGa8FLumvkmk3SZSxw3RqdD
	 rtRNORnwuAXiscoxTPp0B49EP2Wr98kQMFghsnmvhJPo51SvmXq7WwMUtI5KwybZgeO2J
	 mMdMckOpkahHT7x3g6jhlB5IoEzCNeRLzpWJiwr4EHJmU8dz7HqTa+Psrf7i6xcR7zdS9
	 Se0sVH2XfgrGTvoyy4mP0HB1CY0/x9KGZzRv95LadtYywwOFow9vCkcFUaQlUP9dtybTf
	 xx1O4hFyOeV8k0AVXXkfFKuEOPC991gODaJ8/BP8uqdEei1kjY4DyITSuUtMb/OKBMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
	b=Nc0CBkMYBR5Ygw58POFhqynHIsY9LLGc+VPEBIJoAlQC7vwodmoq9fozmu577kAWmv5C
	 CpObjAMiQniKntgjCWDzRdOHnpkofVqg8kvwgHq6Be7WD73OKyBXv8HKfvpmA1WFvKuyP
	 oy0e5Gw6blR/SJQUOQWvORXzBzQi8EFXNmhIVz+nZP7eNEcuH+3gtQdZJzhuYXK97x12G
	 8ueN7cZf31+J8nH/prCQSTCxv/c+0tgNNY4hJvbxBv+PiGvEilNzqCNo7OwYg5a0VKJ/n
	 p61FEGn0YiyT46SL2sv9TthmDIcarXMt09vEV5olbTS036982wQGIk7JlECEj/5Pp8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zivbYnhf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12E1606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F12E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zivbYnhf
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso5581285e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795157210; cv=none;
        d=google.com; s=arc-20260327;
        b=ChZfI6TGiG2bj/f5oWHw7Y+UtoAxwFIP54lfh9djrOL094aMLnFqVcLM9mArY7iqjD
         YJ+MS5f6/E/kKEAh/awNe8IZE0j9hARwBcKQ4FBqZX/0L290y+3nyKyEN1ZplHGyXcRY
         VZtYaF0E/kSIME1Bo9oxTj6ykeWL6hpqVC8bKFQXAvBtPzM2ly74mH+TMUhPyWuL8gR7
         GWwiU7N9PVhApwLoY//63S5ehfqi/is/i+kVJ3XnJwrjHQ8xNTzRhq5SsstNL1b+Z9z7
         3OkO6uATXf9Zf9scJqhH4opKvtzayOzzLJH6ov9tLFmRnyaph2ITaIjGj2MO0rYyPrHo
         RnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
        fh=cAIpcHVLbgroCp+SmZwIWWdHknd0S4KWT3zL+3/vjxw=;
        b=Y86cz8FPtPkD3Jb9KINVcpFHq12lhVMfr4kXonDGwIovaY5EJ0sXiFIPCJWgsh4jQu
         vgSkAB23mx+WO73taSrMYW7a7vDF8wxSxe8EKtC7K3OtGGTPFLr/9fN9418iqKKWotR4
         7tjwYux7Jt/quRBJ6bxZ7mUI2IJoMhuyFpzK7QdsQoByI6tXLiGWJ6b4l8Q4qngFLC6j
         RMcBxsmAUuVDUFzDbuza0Bu3eMS9vVUiNZiVwooPQl2lv0MovxTFiDgGMyp9qRG8wM5u
         vSq8rBAXasJTczuURfjy05q5qs+rgniy9Fp1fzSCfWnXc2Is8OqwCEEnkNVVZBlK2s0+
         RRaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157210; x=1795762010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
        b=zivbYnhf7owyhLTE/5r/3aaw/bfE0rS6phVAheDTlD1J2Z6uqpq4g6KsP58ymMF2Zj
         TIXryv4Hy4jvD3EM5bKVHmeE60oQ0ynXdNGs9wSf7TZz2xm/1scPEl2sByeUr1TASlkt
         rhAD14HyjDHTkyeO5pjjVRBjaqf0aHqRUIXqoRdhsioFM8Emw6BpunKijQDt/PlCA8nM
         22W6PdeMWclJF1fChbGE/+yGZMH/Tu/NB/Ivty4T020IcszE7Gp7BRCMbWGz4ra9kqdX
         DK9xzcXlSv65x+g/bA97b7VzBTFz909LQr2+v/uTns0prBkmHAmY++7fqhmk0ihKVXWa
         4l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157210; x=1795762010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
        b=HS7C42bXfhMZ2pEpIj+Tncj5v8UXuNcFjo3xvd8ZE6pS8Hd2iMptKlntEKnGTuEr8I
         6JSZByLp3d4drWz4CEQxOsLgyVOTKVjyoSyd4vs/j9OPv3CPIXJiIUXLKemZmLkkCBFI
         IOl8gGeouQ6ELSwurmOEG2lkIbntWEbjoyp9E/dvY8JyNs32sP+rlXVqDixzHFIpwi07
         h43NevtSYZR6s3sFIx8WzW2fjpCE6hOIhziwtPbpXW7y6PatSehajHZVPThE0ChdiH8/
         C9SiGEAqRhwWjyPOhKEibmFcTDixaQgjdrkE/GepQqaml+DSUVVAPd+iCEhf1SypJpQ8
         5KKA==
X-Forwarded-Encrypted: i=1; AL+hErHMV3anKCey5wmlL0ZcMirwYklzPrtOYJ5Uwakb4kuR0ng55yW+hKE6J73IYNUhWwruGuMQXKxU9RRWQuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CZYBW5NWTbHeP4U3kryxP3sTApaRIoCKk4nIJZ263vshpMgqD
	h5+bYyZ3dm7N36377F2tULN2PmknUSLe4ulLXYPaRfYfTQjc6MuZxpYKYUMEfUcHxRIdDp0NXuP
	N/AEunh9qO+EqssQmA58hhJlMmldwRqQ=
X-Gm-Gg: AYBFou2BkWhKLTIlxEpc2J6sWgnEJsFMhIJ3Lm3r+xxy4Rbcjis7l/LYaGZ0e9PJHFl
	glGKgSBcTaFLvnBj19/kFL/67MRn8y+P43PpeotHkdsDsHwyFJpVQmCgTMvIRfEbJdxd/ufsqV+
	V6CTJu5RHz6fqNsYqT1w1r5fJ3toryOZF6jr/h5Za2iIy7MlsZbErseSDgLOR/d6GofCn2ssoIZ
	7KqRzam3lCobcMUddXrsXqQBMGX84fyBT1PYwBb88e1iszYu6xy8OisI7HKsigTTk2tH1NMJafs
	DLHvMXkORj/df+gnlEUQ8DehJkn7JVkwyIczwnglEuxSTPQe4tLh5XDhlbl9pAg7HsJEHspGCDE
	4+sSVpFDwLwXPo9yvn3fuBNaCuF5PyXinLog26ASaPoqLKcJ3iBHEYJJqDIKsnfH/
X-Received: by 2002:a05:600c:1c08:b0:4bb:7757:fe6d with SMTP id
 5b1f17b1804b1-4bb88804c5fmr50882955e9.11.1795157209745; Thu, 19 Nov 2026
 22:46:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 14:46:37 +0800
X-Gm-Features: Aa3M54q6diJBPt5X49YJ4xjQARO39_f1G-0YmFpyFCjvJebbL7DyzQ2TCjNUNR8
Message-ID: <CAN_Opa9Gu56Tdx2WVrYZU95BrHdGg0+gf2mpv25gM7WCRULJ0g@mail.gmail.com>
Subject: Re: [PATCH v5 01/17] mm/mglru: rename the generation offset in lru_gen_folio_seq()
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> lru_gen_folio_seq() computes how many generations below max_seq a folio
> should be added to, but stores it in a variable named "gen". Elsewhere in
> MGLRU "gen" means an index into lrugen->folios[], i.e. seq % MAX_NR_GENS,
> so reusing the name for a relative offset is confusing.
>
> Rename it to "age", which matches what the value means: the newest
> generation is age 1, and a larger age is an older generation.
>
> No functional change.
>
> [kasong: dropped the comment table part, the series rewrites it]
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f6f4bc9a704f..2395ca8ee305 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -302,7 +302,7 @@ static inline unsigned long lru_gen_folio_seq(const s=
truct lruvec *lruvec,
>                                               const struct folio *folio,
>                                               bool reclaiming)
>  {
> -       int gen;
> +       int age;
>         int type =3D folio_is_file_lru(folio);
>         const struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>
> @@ -319,17 +319,17 @@ static inline unsigned long lru_gen_folio_seq(const=
 struct lruvec *lruvec,
>          * |<---------------------------- MAX_NR_GENS -------------------=
--------->|
>          */
>         if (folio_test_active(folio))
> -               gen =3D MIN_NR_GENS - folio_test_workingset(folio);
> +               age =3D MIN_NR_GENS - folio_test_workingset(folio);
>         else if (reclaiming)
> -               gen =3D MAX_NR_GENS;
> +               age =3D MAX_NR_GENS;
>         else if ((!folio_is_file_lru(folio) && !folio_test_swapcache(foli=
o)) ||
>                  (folio_test_reclaim(folio) &&
>                   (folio_test_dirty(folio) || folio_test_writeback(folio)=
)))
> -               gen =3D MIN_NR_GENS;
> +               age =3D MIN_NR_GENS;
>         else
> -               gen =3D MAX_NR_GENS - (folio_test_workingset(folio) || fo=
lio_test_referenced(folio));
> +               age =3D MAX_NR_GENS - (folio_test_workingset(folio) || fo=
lio_test_referenced(folio));
>
> -       return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen=
->min_seq[type]));
> +       return max(READ_ONCE(lrugen->max_seq) - age + 1, READ_ONCE(lrugen=
->min_seq[type]));
>  }
>
>  static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct fol=
io *folio,
>
> --
> 2.56.1
>
>

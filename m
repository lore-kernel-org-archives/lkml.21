Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162905;
	b=JOeU0knFeTGz33MfJTuC7msOc2KXXQgX9R4mUFnWXAhwi9gpL7s9NIO4n/A6SUufZBEb
	 D1vNoTIcEfvrPBZ8gII06osvh3XS/gs1dEMkAYJi2ftaYypsRVdU+KMWQgDOy9Rlkbq/S
	 8iYE2bxp/zsUhnfaTgjJwg+Yrwzh5l9vRqYx0cuI1aFOd5a/x1lq+g3bQdN0KGCWbVoeq
	 /AUGIJ8/pH0Uo3PK7w7ukOlRMBTeoJ9O6Fp0LlNW/Ch+6UzpUU6UABsGdXGt3jvIAhJyj
	 yuCAwelW8yBF/lwx+MisKeScEhOnBC1YBVZklqTqH8IQ2VLU9ukM8m+XhbWKOJvMNRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
	b=0lsTmf4vLmADbFZdLKFqmlcESe83fXOvUyIf59++cxNxVkWB2xJRsVu4GLTxnozisZQC
	 Ly2Y8fAjZcpFPwzgOA4xFmUnQb7MgSs8WM6v3DHQl+4OOvQZpCw29q4U+hZJtgcWyeVHX
	 nI5HHTbZSpnGKhur6aADJxXms1Kp3UBzZdHRgUmbPw5jLc8Hn7qdLNMxf+wJ3R1D7qiuc
	 KPq9z6ROblDFowZvrQN0qqDXxmKCEFpkpAHUkSnf9Ket0CTtJ1o0UPXb85LtkicUgWG/1
	 D4QM0/j0IyGBZObYl2vhVqKJK0LCosneKHbr5PtXcMhx5PKrIiWVgA3nczGgeRyVXVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFdDRG0E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7A606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D7A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFdDRG0E
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so734129a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162903; cv=none;
        d=google.com; s=arc-20260327;
        b=o+/TOf7SIXQVHevxPtd1voMHH1iwSTleVa+Y95EwpGDHZerg8Lb11qNxfFl+rQ3jIr
         ukXZOeRqoXUCA6jo/x9nkp6nRrKZjLE4DoAtm/TOYkPDdxtkCA+S5uDWGBNHoh+SmJ2T
         sAWQltzFPmRV12baqBgC6cADSM2XxTCDnadYyAdDYepUsgHk6dBpY052WphMgk9DOVv0
         C9sS1mAdMLRHiG8qHwSfYpG1SW7fQpStsCE+rj1LG/FDyLsvEtKs7Mjr0cMr3pAoI8gt
         xUs5X5pU4Qphx9UigLpCyOi0nlXTo/fvEq3QceVdPcbC86yH5IwMqnrqei2dMz/er0yk
         yqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
        fh=HfdJeAK4J6llSQ1Y3deIfQHXcNcteFcNMNTCLzhLYLU=;
        b=SLCNlq5ZqG2gKvE9yt5etTmJ5zhbD+51ZLN+BLHbc8p+pzF/t89r1HNXKGNfMoSLw3
         10RmNFGAFFEO0cEpRqkPSb4DoYlVtp2zGlP82BgvM4U7WwFfH0nA0OMmmtLihcWTEHoc
         quoZ3DLnXvO+7xHN3obyugJYc4rFJxYno8oVM4zGzqw3y6/RXa3CY9k8HD3va8os9SqC
         LuNVx3hyPWAccBtZDazbUre0GdekGFaKSb6n6yILnchzu5FXwfkeMOHGaDfZ2blnnkGI
         aOVlOham7CKi0lZb1yfyEAvSAJfjVdv7v2MJiPZzt7hiJmG8yw9u2VqZRHBURj/1CnNw
         sBgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162903; x=1795767703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
        b=ZFdDRG0EqOKGceQ1Km4+2+47QBEfmhYNPT4A797uBI/TBR/Kkivy3g0qg8fc2N6/jp
         kLlfhSekCufAUuoBnvUkH2yH7oNLlcwolKgHqbx2JWuH14fFpC1eN0kAh3B6VcUhHV11
         JBpoJ+btwvCpN7fv66NLJ57uTS/fpCoRm17SF2C9tzwS/fMhuqwSWqyYeiJas1Ep1Jv3
         PaOLtTk1HbnuM9Mkuj1h1iEKwnA6wdDkVpFqTL8Nho8mhdoKgvJ0Dd2EWyFw1Cp7BgX9
         ABX0vXiTiYvxjQ+fRnbqU5S1yv0kn5l44sNvmXyvAhmhlfeBH5BNZAO2X/plsC9ggRXm
         wlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162903; x=1795767703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
        b=aNKaz/TFYFPn4cPyHsvqnPZ5rvz0NMJ5fa4NYeClIcC/fGxHfOskli/cyJL++6RN9Y
         ueXPoFTFbF7RKp0Y6OMKFSV4T5pgq8SgPV0ZxyhT7sH908RCTIclMoGLmtd093k34gxl
         Pr6FORZMKnd8HadHxYbQsOAfCTbQvhvV1ikJNwN6p6wH8Ue076p/nxfnMox0e/AzQMer
         UaP72LNr1rgWMTUs973Hg/HbxiZ1aAbOFvTn6jNoFK1mKCX5Tjt9h//NQ7LBV9V/3JQR
         TcglPxHOeG44AT+Kecd8WZHXc0Q8YHBxZ1pHGDNQ6KfvCzXwEg2I6CPtq5g6C7bH19s7
         dUnQ==
X-Forwarded-Encrypted: i=1; AL+hErHLfiFQcm/WqZxZE/Y9YA/I0afymg2eGkAEanCXpyRWeUTtpgGoTuYaF7+ILPxf/7d/blh1YyrIDMhWgyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ynHczYOFj/HTcStHMgDnlqAxn/Ze0+enfY7aveuJqbtyEC5Bv
	labqIz9Jn3WPhirzrTnDw2q+b/ANA4qh4P+By+2VLQeKhEigX6m/dln5961rBlnOXUo9lsK70rl
	gjwK/dQymjxQSkXtV7IuBraSfU8kneqg=
X-Gm-Gg: AZFdTZfhKp6yFCAcMNxnVqR32731Jd6sI0dyuWrmmHVsf0bUUwM5+Yxt5VkZg6+iBFA
	/nmjeBFYCR3fnfuBXocaSjM1hOrJZODCM49nuc0tUBkhmJmlYcIYVLWDuToqJiEKaWS59+J4ZTz
	5cZUTWe6hmWU/vuAst6M2lbnRl9qCLbr5be91ebrTP6LUoLB0xsthvyEod9w83+lV/Lkt7qPJz+
	7+O8oLexa9bBP8xZiXhNeqecua+ds/+5t8oMgY0ESlXLv4mTYpPuaV8LKqleNZTFsSKYBh1sEG+
	Z2KotX8MdH38l8i+pGVGxij8XIbrre9hQKGGP4ztHeGVmLd2Rtfe5rqrZ2JHsz4e1yRjB3yRxGS
	3MM7EOkbzDfONo/uGBRqsslB36oqntYYE7yo4wVgSZiSzoDPnmzskf3Q1pfqmtRQ=
X-Received: by 2002:aa7:c0d0:0:b0:6ba:144f:ae43 with SMTP id
 4fb4d7f45d1cf-6ba37c7b138mr1084173a12.6.1795162902503; Fri, 20 Nov 2026
 00:21:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-11-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-11-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:21:30 +0800
X-Gm-Features: Aa3M54qin3mQjFf5kqOfy-EjZ2kR5w_yWqv5wLaUrnSsLRk4SMbzaUhZRRw7xMY
Message-ID: <CAN_Opa-DxzvggsGKMXJWd2vSKjbztttBHx3uSzJawbiiEOa2bw@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] mm/damon: convert to LRU refs based operations
 for MGLRU
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

On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> damon_pa_pageout() cleared PG_referenced directly, which under MGLRU
> corrupts the folio's refs count. That flag is now
> bit 0 of the count (LRU_REFS_FLAGS).
>
> Reset the count instead under MGLRU.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/damon/paddr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> index e89cb14ee17b..411e1d557ba3 100644
> --- a/mm/damon/paddr.c
> +++ b/mm/damon/paddr.c
> @@ -279,7 +279,8 @@ static unsigned long damon_pa_pageout(struct damon_re=
gion *r,
>                 else
>                         *sz_filter_passed +=3D folio_size(folio) / addr_u=
nit;
>
> -               folio_clear_referenced(folio);
> +               /* The region is cold, better drop the hotness info. */
> +               folio_clear_lru_refs(folio);
>                 folio_test_clear_young(folio);
>                 if (!folio_isolate_lru(folio))
>                         goto put_folio;
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

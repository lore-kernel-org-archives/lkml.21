Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157343;
	b=CnVhiJKTSgx9Ab23MJabQnTzxbi+FesrTTy1GMVkLWkkwka58gEnMftjnQfNDTxGOC7R
	 yk1jUzlBOSn1o1wU6GCStoti4TNupwU4hYiAntrUL8GByLdDjrd+oNcVtnpexhc1dyRWa
	 cQ/qTLxhv9DGGCpcvUD/pBJxadhSp2o/GEsMsSbVfnenvXEe9xhQipcpBY5AGxBGKU7ay
	 fS/REpt8a7lv5rE+50Kwj1R6tROaPzC/n/jpKd0tDrNQy53AQqTyKyHP/2W57HgtFBc2v
	 iSLwf9Mt/yVCeP39d/BafeoMB9ix29aXY9c8eugX5cTs8iN5pPP0X/P4VsSZEtR2m0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
	b=q/rZyJlPkZ2kGGCZ9yRpsJtVW50/JnTuDsR5lY2vQvkBJ9ahP8KRqgmV+6DZkF+deBF/
	 JLnLwQzLhETYAIa2VMJXv+6VC/3H2D/WpnZMhZDtPC0b6cxFOYRP8eikLSYS4VYr3ya8a
	 RPSt23O+D1+HJQlKMmFhRrwG9efWgqJoEvSfaYRiluDfVr/c6X0lnXi7R4LmWVB6f0yrJ
	 5aAmsW0GhfwXxLwapTuWQPqIa+97H9tMrl/wWbuX1yvrqx1jEu5rr8vrOsNGR2nBCoCgS
	 Re+M/k6HhomfLQ5Qi2mw7ApXuoF/5EHL5zZA58/yJHt9yquOCbpHeJ1q8Pr2G73pglg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK4tFHA5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2DA606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A2DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK4tFHA5
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so4697425e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795157342; cv=none;
        d=google.com; s=arc-20260327;
        b=Ej5drwhEH0cb8SBr3k22Io/VMiJkRoz+ZB+qW8GlzPrdZXX1Ma2lph0TnTxRhN5cOl
         Wy8uicciUdyYVpEI+Ud38FW4aLVvVf76A+/3wOvpsMRQ7V7oxcl7/hbg+fIkTuRh60Vr
         2kz17/9eTQVHAMV5UOdiWioRk4hc7olDGEqhyI274nJjeuqBGBq8JWJDBAODpF4+9vne
         qBHaqS0IgIGGYtqt5PHll2RDdIge7sxEPvRs+5nSCB6XwudDSq+82ZCQVxdfVKa3GN1O
         ELs7jJo16p9of+AC2iq7ZXNuMLeFpiM6wu/T+0ar+0pu2C75nrfJ9ZV4KiaHhLnHHJFJ
         yf5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
        fh=YqqzDnrMH69eXTxZWgRF3E/PrVCYDnJMxoGX0UqGGsI=;
        b=AuUmakH13toZO2G6Y3cRlgGKfc43YgWsgEmyQoVaskMPOGXFVwTQBo92d+OOFNnV4Y
         /spqjJsn0DGKDiVVz3IHF/YqW0JY1cHSedIMZumva6G8BT4D/lFoQqMwiD6B1oWEK6YA
         UyXdmn6vKkUsWa8Z8JNOPVBjMI1AuBhkkO4p859fWYlp0fbFY5MAWXxge2NHNyvMdEge
         KuFFrNsc5OUUa9DCZ6Ais9iGYaq6TueLQHFPlL0KGBg08/1sZ6nB5QWj3457IR3GrwYx
         s2GqUK1BgysMzWqyS3dhuWPnkSwhmfk4zNjJJSaFBEYSv/Z48pYHkk4BPg9itTrl0Ggx
         Jy1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157342; x=1795762142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
        b=iK4tFHA5Xdp7Y2lQSfMCqU2KYcvTQK8+4Nu0s87bvt85pOPJAJ1ILVdumwjVy3US9y
         5k8cHgJbnumhHajKfHN8yy2wxq9buial9Vcjv+L0RYe4JZMGUF7CE4IhZ7C7Le48HAEN
         5FOgUILuwNCW1Zqq2XE7uCM3HiYbLzO5MerQGNQUC0JL43nF3slvmscLkGTpe+dBbruu
         ONyOBu1c+VKr7wAO8Fc8ET7vtMmJm8+qbDCJjUVygKDhiyFPwsW3gYgKZEuoS9l7TxfR
         nwIH0oQhf9FNUl73+I5hxBJWeVDH+yyuRqnwRSOeh+iXizrQniF116r6vMtC8K91hcB+
         /91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157342; x=1795762142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
        b=ZqI6D/dnvxJxKtGCUczUr0qDU+OoAmJEtKK/e3a21TOPXxPMYBP3iWjWk1uifVnjSm
         wimldYG2vQKovnqob6bIIa5aRs61lf+UI6p/ol4i4116pmoI4Q5xWCn95znggcNVqfDr
         3gnLpy0w6QdPGPTXk/0ec5hMduwJUrKcW7jTuDCKTFugjILbtuCSwf94zaL71HMEP8kR
         XoaaOoyFeIH4W38DllcF3PzciGiqY6L9p47yv6xWoL6sTZ5e5QP5ggTqtKMnaBB274GJ
         ssdeeXXASUsdZq6xCXwPnL/l9dzHaQEJun+pLzNH3R6P6knHgFcInEof4bLMwbkiunqW
         m/wA==
X-Forwarded-Encrypted: i=1; AL+hErHxQ11sw3TH5BpnpErPVBrv/j71o0EtF4WOUVFVxr7r2kACR1f3zLCi5OYaDWXdubYDoPTTs0zOsQe+uCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SkKBCOGCeAt1VN1rFP0thA1akIOcYHOOK3gQkCiKCYsPLoChX
	YhSvT4fazkTtpAvncX3AJ7ZjwCF/d8sSGYO3yxynSJCkgK7jw6fcibO5ApJFTDn7612yTwgai5Q
	UHwkhrx0+qhgZsRl9TlPjI3kbSwSLha0=
X-Gm-Gg: AYBFou19GMGxdV6WSbDRTwqvqTfUILPALXGxAdQQNnOrm1NkK+oasNGCC4A9pfyY0nx
	yQ0tXJE2ACqGGMzr9gR/+lhh5P3lwS5G9E+f+kJMjOmC/z46EIDbYIggdYQmtYNxwOELspUlDF5
	XMRBsNHXo8dJPe6JAFUI3Om8gaucOE/XAxyOrTlmSFwlpLndN6VAYJ1Ozm0LQdjBr/nzkY0Tm89
	TedgO1ZBkarVLtlBodQxudFPrWftyK2s1B/UUgtNvAJytaakJVvm1zuLuhHINL74dkeiXAeEA0F
	z6uh/vkQiss+dQuK4G53aL6Pz522AiyRkrMOnxig1aputPtWgEUiMEoeSt9OiaeC5M9TFnVTIRr
	x84Y84OpRgVRjtX2vgyGDSQ3ZWPVx3f5gNvABMA5TlVX7vnaG0u9tQ9Wd+71hHTT48Q==
X-Received: by 2002:a05:600c:3d05:b0:4b8:d17e:da27 with SMTP id
 5b1f17b1804b1-4bb88930872mr41310625e9.27.1795157341259; Thu, 19 Nov 2026
 22:49:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 14:48:47 +0800
X-Gm-Features: AclHuK_tpistnJ8n9EgGJGhoSv7JK71sLxGmAZ5e78h-Lbf9KixLF9WGl76rLxw
Message-ID: <CAN_Opa-7j854ph6e7Ckmq6UgmmQerxF8V-ikSr9JNyTAHZCxdw@mail.gmail.com>
Subject: Re: [PATCH v5 02/17] mm/memcontrol: allow update of LRU statistic
 without holding LRU lock
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
> From: Kairui Song <kasong@tencent.com>
>
> To enable moving file pages in folio_mark_accessed directly and lazily
> for MGLRU, allow updating the LRU statistic atomically without holding a
> lock. It may cause temporary counter underflow, which should be fine as
> the counter is eventually consistent and only serves as an estimate.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 2395ca8ee305..2edb9beef6d3 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -47,12 +47,11 @@ static __always_inline void __update_lru_size(struct =
lruvec *lruvec,
>  {
>         struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
>
> -       lockdep_assert_held(&lruvec->lru_lock);
>         WARN_ON_ONCE(nr_pages !=3D (int)nr_pages);
>
>         mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
> -       __mod_zone_page_state(&pgdat->node_zones[zid],
> -                               NR_ZONE_LRU_BASE + lru, nr_pages);
> +       mod_zone_page_state(&pgdat->node_zones[zid],
> +                           NR_ZONE_LRU_BASE + lru, nr_pages);
>  }
>
>  static __always_inline void update_lru_size(struct lruvec *lruvec,
>
> --
> 2.56.1
>
>

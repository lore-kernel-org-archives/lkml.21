Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191223;
	b=iokOoMxA+3t+zdErKDf76nkGTSlcvERdDpJNTxMXc1IwXONZ1UzZxebBrzhGVym0vaEF
	 AZGsbS4Llt+qGlWL/s4NjJgulEBX9S2Xzi9GxylPeAQpj2M81nxeRAusLzGNsUBsHlJBB
	 FEs2/RiPw0CWsizr9sH4zK0Asrwqa/x4BbJE62FyJXxAo5JVPjUCTACkQ2oxWN+jL63CB
	 CbjEascelQkgAO+mxKtgInaGWnC+C3MuoiCxiVgoUFcDp+dxEgiITohol34U0/xXlg+vi
	 0eDz184mMe8ua2/IjfUL/Gr0L/UqORKs1WJgmeareRCHoMPm2Kp6i9c/PLDZAaTulvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BWRoFimV9/d02kSLeG9kMmtSjpsU/IDUSmtfjH9hqHY=;
	b=Yrc5PjZhY/RdRyy6Z0mAVhXo+dpAY3RE9koUSigUGZ22/khtDPELtsiYZi0fbas8L2s3
	 AQ2GRFyHtQRJ98/AM7AZ85NOhWCXEg84JWX39lcWxiHNu4JehZICd+3n6Y4GwRdsI2W+K
	 3nPhGrQDEpORTwxupPvdQQMRfH3xULOCipKC/sNCgKPzNQcHuRC8+ho+wT/GjiKwJLR7Q
	 ODby22S/uC+1eUgq5QySXNu83gGnep7NIWpQYjJaQ16URO85zwqRJjkAOnQeFPTT6zzNt
	 rQ0YdFwONfa/kzSOpJeT/eddBD7ySgEHHnbBFNf/MHRbyBsZHGhGIf1n029/5GiI/Jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVluGjCE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C420606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C420606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVluGjCE
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4aa5833c263so967266f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191221; cv=none;
        d=google.com; s=arc-20260327;
        b=CzEuaQRearhk9Tss4+Koh44DcBloKd95fSWxp0Z4AYzbTVdjlHnFBsd7bOM1/RnMd/
         MAIuJSm8134bp+M7bzs2VBgkiI/1VGVXX85Oj0W5eDK2rFuHcCn8mOE2WODNB4q+ZN3T
         r7nRM4RGVZd+4aH87Ac+fNGzlKQCQXMxf3HseqPrtUdTjaxcoqbFItJp4MT3gd1CLDdW
         xq9F8jPxL8G0YEskjIBOYC+X1IvFT6btc6kPIkuNJ39Z4dRdb8nuFgUrmOgsxUTP0sQN
         APegJf6T+W6ZnndQzSs+s1reeeouD6ysPy8uYL3RxcuYipYcHj4YtQ3h7Wtozk1sK5LB
         G1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BWRoFimV9/d02kSLeG9kMmtSjpsU/IDUSmtfjH9hqHY=;
        fh=pbenyiPWnBJHKjQbzgYXHPvE5l9++GbLlndRzrrq2hk=;
        b=POi6+XoskvosyLTmKbjflWixPOm4yADnSYJSX0h5noDojxxEjJXuWaDv1kQcVzd0Rs
         D7q9KaGtEgcNiZVyrf1PrHb3uG6BjjJA2hp13H4o5Z0pwpBR/R97+utG6usLeh5k6hzH
         R/HpVxzuWpjlqp7raAN6iOe/KIHpgYTSCudtBJYSqcVM4U4fpArV0TBmf6aEq50Ri9KA
         Zyf4kbdCeQapfxchhTiMC+DQtZx5z84yj9A3/vU3g2EgFhXhmhX/2fZ7/3AYT21uLf0m
         x0PX06mThXanUXl5pH4Mr8QpP8+2CH5YCYtwqPE2di4Sxz5T58DMZ7jvgc9ty+YAPOUH
         qzpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191221; x=1795796021; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWRoFimV9/d02kSLeG9kMmtSjpsU/IDUSmtfjH9hqHY=;
        b=CVluGjCEAx/87/8VMUcFBolikN/n+9B5+2uNrZM4eKWPiYTTig4PGdGAOhs75tmXbh
         QTU9p+BCeGADvB6rALYlc1i2JRFoaPiJBMcfMe4Y5wqeZjAFcHtPKtQ32jH85h6mXm9W
         Mdhw8wQts4OyRWMpA9/GgHC6Ge8Kw05ZirNWxWXVRfKX16MIkALMQCksxRSVAeFqsY9X
         bzpLd0seRRgV852nICgxCSzs4+idIEgT9vwwlCzgeYoQFClzD2FQgOMAPIF3bX+g2oHw
         qlJU8OG+P3M9oBzFoY2nNrRMCOVlX9Kzt50bdjo3cK9BVBvBOMP2vfCO7x532kmibvsv
         22nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191221; x=1795796021;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BWRoFimV9/d02kSLeG9kMmtSjpsU/IDUSmtfjH9hqHY=;
        b=ogJJ75HFGgVOY/XCrPztz5c1o2DuDANuwXMb8ZGtoDV5FJ0q4PIXyEZVJXVnxOI/qD
         n6AQW0GGdkQZUDFs/NkCmIhGgvwk8EPKN3bAhx/9qYMQoayEm8FrddEIUelaejxtP6Lu
         tCtDK6yX7hR5CvHY01/+tWGaq4TaGjG3MXpaWhja4yLzoe/fwo0ikY/e8DFeO1cVVMDv
         VZj5hhiGL06Zii/9S0L0FCkoxHxpMYPkbj7RAgsBiKjSxexMQ+mVpk3SPEo7kEC1Rpx+
         KXMZ+ArHNKo/v3J3fGGU+uSLzlzFMAspJHselbzZNjAvffZujN47hsT3273cCdOB1SHP
         IjXQ==
X-Forwarded-Encrypted: i=1; AL+hErExa1+9INn0o8ZPj0VWoFsrKvHNIxm6OptIzSnfWrOJ7tfxwNcZgtD1dkSHIG1/C+tl2Go5p5jCw8Nx6vA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uwcesyRCJIDhfrPhdju00J2qwyJvcrOrxbNszhnjvGBFXw/Qw
	fB49Je/J55OcQldCSKrbO4hSo1yoNiesruP0tqZu646UQ3pGLosruvyRlsiRJOrZ4JaGSq+7kTI
	xlySguL0D4fhLepVOjMNc8Q76eTcCEr4=
X-Gm-Gg: AYBFou3j0HRBc8Z+9JaIFtVSFoiBBa4eW0cc4xQB0RbF7TM7SfoFraBWq9SwtbAdYx7
	EOlQhdFJOWVWppE8sDwOgW78hTY9sdIIAdbZ39GifGmZADEdJ+rpXRpT5lFn4q8+8HlNrRN11Kg
	3zR7qQ2JhcQwr53Fa8sb3oUcv1MHDFXYc1dAixtxnY9HYmTdE/hrhl3UAgiyJ+6jrfml4J+V6L2
	4eYoUmtck+mQU6e3fp0zXYkCNoawn4bdZeOMniO186VRoM85YFjrdI0k99IkeCw2dFDM4Cokyg1
	+oPsI2KvoXebtC/hEnJrMlj+3f+VCYtotfsfMBvboPk+Ekv3+RgmgxZQwWvwW60BIX4fN9komdc
	4cJkd2GE2L8xpSaBd5Fa+SV3C8gyDfSjnRw/3djnmETeJFz8ZoIMabQZx8nnDW6q/tYbN65v9Qi
	eaGTYhefS7CWvimdltdOE=
X-Received: by 2002:a05:600c:820e:b0:4b4:262b:88a2 with SMTP id
 5b1f17b1804b1-4bb887c9f5cmr90227095e9.1.1795191220930; Fri, 20 Nov 2026
 08:13:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114200803.23129-1-baohua@kernel.org> <20261114200803.23129-8-baohua@kernel.org>
In-Reply-To: <20261114200803.23129-8-baohua@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 21 Nov 2026 00:13:29 +0800
X-Gm-Features: Aa3M54qyqMhmK0d32Ed8NiqligUKBKS04r1CMK7vs2xYjZPQQ_emX3mKSTW2UBo
Message-ID: <CAN_Opa86-KD+Ct1Rq10q6i46XXxVm96z0VbcS+a8pOX-P5gC8Q@mail.gmail.com>
Subject: Re: [PATCH v9 07/16] mm/mglru: balance anon and file scan budget by
 refault rate
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, liam@infradead.org, 
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, ryncsn@gmail.com, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"

[...]

> @@ -5769,8 +5822,8 @@ static int run_aging(struct lruvec *lruvec, unsigned long seq,
>  static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_control *sc,
>                         int swappiness, unsigned long nr_to_reclaim)
>  {
> -       int nr_batch;
>         DEFINE_MAX_SEQ(lruvec);
> +       unsigned long nr_to_scan[ANON_AND_FILE];
>
>         if (seq + MIN_NR_GENS > max_seq)
>                 return -EINVAL;
> @@ -5786,8 +5839,11 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
>                 if (sc->nr_reclaimed >= nr_to_reclaim)
>                         return 0;
>
> -               nr_batch = min(nr_to_reclaim - sc->nr_reclaimed, MAX_LRU_BATCH);
> -               if (!evict_folios(nr_batch, lruvec, sc, swappiness))
> +               lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> +               lru_gen_balance_scan(lruvec, swappiness,
> +                                    nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
> +

When nr_to_reclaim is omitted, the first split here uses ULONG_MAX.
At swappiness=200, the excess anon budget goes to file, so we can
scan file in the first round even with plenty of cold anon left.
Is that what we want for the unlimited case?

Thanks,
Kunwu

> +               if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH))
>                         return 0;
>
>                 cond_resched();
> @@ -5850,6 +5906,7 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
>                 .may_writepage = true,
>                 .may_unmap = true,
>                 .may_swap = true,
> +               .priority = DEF_PRIORITY,
>                 .reclaim_idx = MAX_NR_ZONES - 1,
>                 .gfp_mask = GFP_KERNEL,
>                 .proactive = true,
> --
> 2.39.3 (Apple Git-146)
>

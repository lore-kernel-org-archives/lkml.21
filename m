Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795056340;
	b=CfyL7iW4FqzGPG5+QKerVTKGSbzTKnQW+Jw51Ecf+gJHVcaSGAnR929GW754rdkPjdHZ
	 QlcXsUXF+oDsuj0X5aDObawV/O573AN0hmzsMucagQqXINgEQPjWuY7qYgIynAHZHIvSc
	 1n+vmL9IYAKuhdxFPqSJQY8WBYUcKbQ0d/yv75J9khvEwhxQKJbTKBv9o+HKxKpS/z6hD
	 8PotIw85qsj4XoF7FCipOfBEfEWfPSqmuq3aWLZrt+liFljSTLFJRW5c4S+Qy4Ej1G+/5
	 y9sU/zUYY2YZFcDTzP04I/77Sgks83OqDb5QApzw/WSguvm5fUDZ+C4NovyQpSsVtrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:Received:From:In-Reply-To:References:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
	b=5TeGmdUWCcz30O1H7+e23WjWpbGAPpK9C+XdcDSMRd7Ua2ZUVfI00VG2ASjwP4/ZZIN5
	 veea/WuwHwtgQULAbjWxJIE2PNvkb4quHiWx6cBZfORcz/nx38g2SM7eYeQ7PfbchVq19
	 4QUJdeyYVTxH4uY3U4SKOtqmvy8jy8Ls2sHIWEKaM3lWVPNHdZ2SknloTO8Xcb5yIFWi0
	 wex90f4wgNMZPTn3oZGcBz0z5CyvFI5Z2CFQfcyW8Lw5oOB8Sh4pZP56nFwcG8SUGLiI3
	 SAuxJqoQYjUwO3TlIFXmytGJRa+Ny9IIw0Tji+Z3qb/fYtAzaHaKm72Na0T+Bqbo+lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpIdHj8c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3867606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3867606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpIdHj8c
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91e7fc8265aso17618836d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795056339; cv=none;
        d=google.com; s=arc-20260327;
        b=GBWld4LhTeDVhQ+x5X7O05IJdJA71YtqopqWB2XEI1LCnMw8tU5FAD3IPQtrv6A8xR
         mOYNyYiHFab2ijA5xDLv1wEq+FYtgj2bG4HiGVeYxG79FbLWieGHtNzt2OTpSfGrrmwD
         Hkf9WCNP9I7nF4i6Ww+WOeTXkLKIyYuVmPeHkJ858sqRlYPguiF4YfLg9zd2Lk7v/frG
         ygEBfActuIvYFVcGMvAPs8KW01W0iHb4ZNoma0A1vXPoPdanmZohT6psDGY8Z/n9uybP
         F2/U7TnAU00qQrdTuIiIUBmmaE5L+YqqNL8ca81ujTzwARt+nDerF/+07KFWDAs59PJT
         MoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
        fh=x3EG3FeEuuAp/voH2MbX5dQ4kfpwqydfoRkJG1DI5kk=;
        b=DDOEpv43bkG6VqZT7g05KmdxSz0zvm0GvQC6FwwCCzxb8lDtHDlChYrnFQ2aNohcez
         3nysceZkD+DPjMoSMZB2JFp5kp585X8MvoJ53aZD0Zn8TNtA22T4Yn/tpradKs/JP0cd
         LjyU6GDYutQoT4DkQzNHliv4Xdu7AqQA6nSypAZGnXVXbFm16VqS+kpv+h2bT1vOowiI
         Vq8+nDr4DeWiN9vZ/wtylaMsPdPST/rCHDiYLm8mO4ZljKz3RZdywKueJVOGSshugjwV
         eqcFklOtoD3ay726uGFyui32CLwgvaeSq+HXrFz0CCoSzDQrgtrhgc+5DBd/aN/3Miq2
         GiaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795056339; x=1795661139; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
        b=lpIdHj8cethl8NZ04UEbRz+LsiWFLHUwPBYl72U+VxoSD8U4CYn0fPfmuEd9AkKC/k
         1NYK0u//7vksQCDLPGAeqS50HlO4npB38ANnEGJIWroZI8qUSOoUtCNHSA8PTWPQ7nN3
         uecm3J5PG4//VoSP9XZ2aff+uy+HdLV3heFUfHst57h2mO5E/gNDiOisfFv9g/liPIUf
         znuejl6YqNLdGFeC1/6/HKaAAs/qgKPdkg1/Eiyq/tzsNvMuZqDlDNqh9a6UE/KCct0z
         oLVgqeSNP7Y/yGgDk+rKt+VF0gLkneUdnS8JQ1vnb/we4OLqgPIBBKRmJ7YSN29NoqTc
         Is2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795056339; x=1795661139;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
        b=pvnn3scUtuLMGfGhbQC/S4j90YJd6ePwp3VQUVaG+JQ+sZsFvy1Vbrb7NPXkRZfeVG
         6BmsdEdj41ZIQI2Cpn8BZiDxhUwNztHlJDBRLl+/qZBcQCaU5Og/8SAz020kWJAqTKWU
         /pEcSXr2Bz1+kpQzeWYzoZwf9F3mNdT7wipeZhv3NWUlVnkHUgWkj+Zb+XKrwMGePrGe
         q3AQYWDnMKqCAErpohBgGtmZIOSl1r6B4iAxUlPpQ+C5iVinB8Tp8Mrqcjd8SWxl+m1z
         97NDio/+GGpyZiRUmiadiMrUMz+Ud5UhGsPptMjS+n7Jr/y4qRcvdHhhpFTNOJ0T7xQd
         2UOQ==
X-Forwarded-Encrypted: i=1; AL+hErEyfnIBa1gyv4OlA56izQjiZlzgtkZ1oJx5nyzWbcZla4WEFQhw9cETBK4S0TjAgdz/6pGXrm8A1iqD5DI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QVGSTbSNqvJ+rWeZEbwHLdLTot318exH3NDpB42VPmNZXvC12
	83BE6sXxmvNKiCEu6aX1ILg35+3KXStdnsLzJ/rmT+I3yrWVnyj0tLlvF84CQfhn1hrgt/WQYcT
	ksEAUriKIelxdW25GXeuw0VLCCKwnnBM=
X-Gm-Gg: AZFdTZc7pOFGLcO7xXAZ5f17f3KhyW9oM5AdIyibKMTSIdnN2dhZ0H8nRN8Af+oh+uN
	JXdamLf1z5kb11MsO9I5U0NDkMYI8uRpe/G3RFmQ/vwC5BM2thz91GVhGqEmwyPG/Fvf9m3DqJP
	9i4+P7T4NrcXJCQcpC0eCGHT8vAoHiFzJNGFP+cHgmYrMPwteYOB3r+DY3v+vaxSlcMj1bmFrdm
	nBmsW2xs/ybOmyV048aE3W7HXW4HXAjkO1JnAwyutk+RbA18FrZ9gteo2sJ8yIbQ104py2XVMKF
	9L4dOR70pF/nrdy6WvBP94prWhQciPYfSQPJwuunbBKhMMCXXTIeRDl7O3PPXXn5IvcX0aS4s6s
	lGcplLMtpqiijqhnIsoyPYtyobMbCaJNx4hXD
X-Received: by 2002:a05:6214:4509:b0:91e:93bd:17d4 with SMTP id
 6a1803df08f44-92114f234d9mr68688036d6.31.1795056338595; Wed, 18 Nov 2026
 18:45:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 18:45:38 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 18:44:56 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 18 Nov 2026 18:43:28 -0800
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 18 Nov 2026 18:42:52 -0800
From: lianux.mm@gmail.com
In-Reply-To: <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
Date: Wed, 18 Nov 2026 18:45:38 -0800
X-Gm-Features: Aa3M54oczcrQgnIKIdlWRyAqAv-8pL4r_8Eu0gOG26vA4iWYOD9SKwZ3124B0Ic
Message-ID: <CAD1ZK4Zo_qQf5aJkVLtoc-LXM9XbyZd2Vy6rFvK_fih-6FE_EA@mail.gmail.com>
Subject: Re: [PATCH v5 01/17] mm/mglru: rename the generation offset in lru_gen_folio_seq()
To: kasong@tencent.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	muchun.song@linux.dev, qi.zheng@linux.dev, ying.huang@linux.alibaba.com, 
	chrisl@kernel.org, baoquan.he@linux.dev, nico.pache@linux.dev, 
	usama.arif@linux.dev, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, vbabka@kernel.org, surenb@google.com, nphamcs@gmail.com, 
	youngjun.park@lge.com, ziy@nvidia.com, gourry@gourry.net, willy@infradead.org, 
	baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, hughd@google.com, sj@kernel.org, rientjes@google.com, 
	yuzhao@google.com, vernon2gm@gmail.com, wangzicheng@honor.com, 
	chenridong@xiaomi.com, tz2294@columbia.edu, ryncsn@gmail.com, 
	liuxiang.277@bytedance.com, ehab.ababneh@intel.com, 
	zhaozhengzhuo@uniontech.com, joannelkoong@gmail.com, kunwu.chan@gmail.com, 
	hui.zhu@linux.dev, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

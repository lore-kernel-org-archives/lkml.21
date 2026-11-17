Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794942478;
	b=ucO2kwslPvUjziRzjnBvBXCkHw91ASbalXQDIpCWZnZN5ZcZsjdKHrT2TWl2ftrgNkk9
	 8gt6LP4PwCnapsmZtYZow13Xo9GKNxuU116ruRYMjMAjDLBm1dQEDbWE2SJqpNklUq3Se
	 uuFraPqEJ8O49lGakT8xlvov23oCCkqgT/f/0OtZCceNbrjUiHNg/uut8FNfy0WrirsgS
	 B6ZkmhQgGplc4eUyKKBHQyX12DRKnLx4SIIjDq0SB19Whb0VQgqen8gzMURjAZmR8UKFx
	 Ijb0dAKHMLMy+gflcPQC4c3XnOhzc9sZZR6NTCCt/mV+0q2kSFTvGQSQVsNDSbDmC6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=d4mLDd/uQdN7bY/YPYFedZvFpypXkiop92AccgpkyLI=;
	b=xjEn97B2l4zLHJtMyjTDRkMaegRAbJuDiJekJeDTsXgr4oicB48WDykmVvO+ECXfCZpK
	 FdjtIbE12VBYgjf5WMcAKiZc3L1Gt6x7exYX7Za2hVWsYFGE04qEmAipZ3HK7SIYzPFwU
	 z6Fkmj1Tz+0n6Dro+AP/Lo+jqsUFRtmx/JmAfzr4M9WTJs4vPNBpf30KdzY+gPsaWWEPv
	 lVlY9LuMRXREk/I5jiDqxAhEMdrnWH4+SLqQRny78GZG8JR/yOZGhPCmpEMB8phuEdOnd
	 WncBFjOv6tU/CMb4pLk7GKRKkkC856LWOPQEXumoesu+L0U6e0DrxSEHVhV2c61nEww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CWEDb1yh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A75606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A75606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CWEDb1yh
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so296411a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794942476; cv=none;
        d=google.com; s=arc-20260327;
        b=pgezKRnhzU0KH2tkYuS/YFetp363SYX2L7XCR/lRjL/g9jX/2giCunCrB9isoIlt4Z
         dB2HYu6yGTUZybUdfKXEZj+acyiwcVuXG8pyvSx/x4Rq0ESJ5xyELohcUUYaBcQl0W6V
         fDB/FEo0Vs1pSzExcXqY2TZKv3Shl8hVRNBiem2tXmZPVD4JTCI8tvbB+DPVUJPzX0D9
         yjnr5dJkAgIrB/9W6ckKv8MX52qaX0CifkbhalXqQTpQvTj5ywj2qls9iq8s/pyx3Msh
         AFSYua7bvCOIyosxgeGDOr22o7R7zx6RWZ9VQQHJENvpV81SdN/DExTKbgg58Qzg1/tV
         wMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d4mLDd/uQdN7bY/YPYFedZvFpypXkiop92AccgpkyLI=;
        fh=+PgWuhgciNnfAX/vfRyB2/IXZXgS2e+hbYTH41O7kaI=;
        b=X7uJVLiUgI4Ticf2RxUSYt5LthHOXDScrUv0DhgVy6Z2TUjfdiIJ+UZfWLrAFmgx7Z
         +UOe4CeR1McAnaMB2pqJtjtIuQlihC/FQIyOJab++DBUB9juFqsQvvEe38OvE502AYkv
         kGl56iGJjYRpVKDstLyXqmCvhjjBBUvrKYX+ZFnyPD1MUtlkOjnVPzMgPCO5OUXQaRlg
         3Om2RXSTxHPBQbe6Pmhsut6lWXmwJzeGC/rP5N6UXrgiMenF4Lrl4Rxbq3vi6x6+pYkz
         1Dp7NJZGoTn4Jl2nCdLTLVGWRgxjWdnAAux5xpk1dyzIt63OcFhSL8C/hXHGpLukrvNP
         FSpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794942476; x=1795547276; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4mLDd/uQdN7bY/YPYFedZvFpypXkiop92AccgpkyLI=;
        b=CWEDb1yhsbiFDT5/IZ7/+ZOPrREOd7QYymfn4mn6Q3O4M/XOPJQqPTJGnqB58RMoTK
         d51OjAwbUOQEm/An9tEkboKSQwfKtTb8W+xK6KBYiwTpDVtsT1Fn+G8BinE+hThL6m8s
         tLj33Jhkm01QTnfdykjmupghPb+SK9MpqJefbIjMr+4rGizgja6sZXviI8I3ITtFJzhw
         rL3zqAoAwzgrDWNi/SI5ETV2c0I4Z8dFBV/4wDWA3foDkVfxfPgNHHfYUqQgP3e1xJKf
         diZXa1wC79ggb6lRGQq65T2e2E0DuixcvtCunKoSzhLcGv4GlAB1MlHlX3Uao4m1tb0D
         2GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942476; x=1795547276;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d4mLDd/uQdN7bY/YPYFedZvFpypXkiop92AccgpkyLI=;
        b=Jxkglf6+qKRXtvoETMB3fBytn0jzGUOYhaxhtKr85TxUooiHd8BWyN1bKV+M4O+FII
         u55KzkaUpfrAxsD6s83BqanenC24I9cwbUW6lHK4Or8OwDeaE94HkQpUSLx+nS9kmknJ
         jeDalYA2ZgP2ni3jJIlCbiN99srjqD/YyN5Q2mpNo+Qe5BrXGodFJ8ZKIM6MNBTvPGdg
         hLq2Kxhu5isv6+FlDip4Gl66gVebbL8v74OEty5ZXddOocxoo+qIkXzM5i8vCD70zDRQ
         6kl8+OSZys1e5rhCmqb+hbnqIyX/Rw1MIhCR8Tl88nm5A469xf4Zxk4Ss+zyUCWCtk2Z
         p41w==
X-Forwarded-Encrypted: i=1; AL+hErGWQtxnWqI5cMZxm7JW9shXqe7afKmT0EEFP30n6f3zR5CeHqPZYL3WopKaIWNbhipoRqO3HqUSSwt82Wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q+OATar8PjpDW49e9m9T0kud86K0+GfWve+gy2JVZB5iwuMF/
	PyK5YfKI7ZTF3+kSUFoHiPs1JV3L+1Wlnk+CHAsYebGeYnsnhqJcbhZjWyQa4jqex769X0A2BDu
	eegd0//WPin8Qfri5e9/zu/BzLD2QhHyoo6I/TLGxvlgl9hoYOHLR2oMy
X-Gm-Gg: AYBFou1aPWGHWXosc2Bm+hHfpwaPtDOEVt6P2TZFi/Jbn2hAZDldn2zLfk/WfBPwV7T
	D6msKN2IV4xDhu0vu8xsxuj+y/p3ObkjjSgucHEdbIADNv4p2NNo8Dctan8CIDNcDKhIRv+pOpH
	k/uqWCwb1XziFdQwPjKY5oJPYDv094B2C2PswVVkR+QYrsY/t2jhT2Gvtu/1p6WSKTb3NPWL2q1
	8RwBMgdYNm386d8wMC7QbhOmsN5vlBUkqO7nJNgkeSaArGT+iJXyuhh54TypRNdxtSgnB6/I31B
	WlklM5ZAGSQ4LaGcYtuYpMjnyzozz7Syk7LX42qGQxbvIqqyziRaDup5hzNxqCTPUdFhW/XAKT9
	hQM4VrTXHZRZf7dgkAdDHhH/n7plYydz6pxS0hU5yEj6jCT70d3cjrf1K2fB5jRiJOjE=
X-Received: by 2002:a17:907:2d13:b0:c40:b477:dfa0 with SMTP id
 a640c23a62f3a-c510e1e90f1mr20057266b.18.1794942475932; Tue, 17 Nov 2026
 11:07:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-blk-plug-fix-v1-1-7fa2a6215b8d@mediatek.com>
In-Reply-To: <20261112-blk-plug-fix-v1-1-7fa2a6215b8d@mediatek.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Tue, 17 Nov 2026 11:07:44 -0800
X-Gm-Features: AclHuK8_K-iJgh8nbeVlichavK0zIZlG8B8U4MkOUyaGlS8RKuiq1rZzu30675Q
Message-ID: <CAB=BE-S68WquuwZ506RriJctggHCebbNnhX+EYMWjxZxMqRDMg@mail.gmail.com>
Subject: Re: [PATCH] block: fix PF_BLOCK_TS/current->plug ordering in blk_finish_plug()
To: Zi-Hao Huang <zi-hao.huang@mediatek.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Cc: +Chao Yu <chao@kernel.org>

> Fixes: 06b23f92af87 ("block: update cached timestamp post schedule/preemption")
> Cc: stable@vger.kernel.org # v6.9+
> Signed-off-by: Zi-Hao Huang <zi-hao.huang@mediatek.com>

Note that Chao independently hit and posted a fix for the same panic a
few days later [1], placing barrier() at the end of __blk_flush_plug()
instead. Placing barrier() here in blk_finish_plug() looks slightly
cleaner since blk_finish_plug() is the only caller of __blk_flush_plug()
that clears current->plug.

One correction on the Fixes/stable tags (which Chao's patch got right):
06b23f92af87 checked `if (plug)` in blk_plug_invalidate_ts() and only ran
from sched_update_worker(), so this preemption race and NULL dereference
was introduced by
fad156c2af22 ("block: invalidate cached plug timestamp after task switch"),
similar to
691b052139c9 ("block: fix race in blk_time_get_ns() returning 0").

So the tags should be:

Fixes: fad156c2af22 ("block: invalidate cached plug timestamp after
task switch")
Cc: stable@vger.kernel.org

With the updated Fixes/stable tags:

Reviewed-by: Sandeep Dhavale <dhavale@google.com>

- Sandeep.

[1] https://lore.kernel.org/all/20261116000723.934826-1-chao@kernel.org/

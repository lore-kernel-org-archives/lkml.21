Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795741847;
	b=emACKpI7jwWQPmu5RON/la7+N+FXYg1FRlbJMeFqfrptHBiAKD/+5RAJl7XqyZleL/jZ
	 FD56NaCg4Gp+Db+JVSxo2+q2c2Un9B0+T/r6toTFWxDw/Duk7+0H1NkZFjorpsHoUOBSC
	 95kEaA1048sJnbJrJmCtVSHwy6X3RyEvWDniZlbakVIM1KVpmpPj1I7M++CTtZQhqHyqM
	 VZllBrd6FepYeJxJGEouHCrwW1BWswL+0yxKYoThGnujzW41E2sOm3W59+2KIMUwlIghP
	 P1zssvYzWuwUOod3EGwXMAXLGmvnKPTHh6KWFrg/++Y5any3SZvib023TXeQXKJXtyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795741847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=HZ2sCqXwwWM570Uzj7/jKB0ciamWJ56LEpgiUf6Er7s=;
	b=KOaNtHwAzHmUHbdTSPngnQnx80u4LeQ5/iH8QVmGatZAKrHJ2EnjG3ONwPh9Hu8vwhL3
	 1plK2IxEH5EYt1hisbOHSzVIKM2OufDoX4HOHylNjiYBAkl46QnijokhngdcH9cNbS69/
	 BpDATyScwvBj4f9rfv7IZ8OSQJQmZG1loVM7XefxCya7ziOLzm6v5/ci63SHaaoCjvnCw
	 WLP+5n5e3SGZS6lBWdly+DZwZBCiJNtRVzthwlIuLr+Gwo1iQJ6WG2C6ulcC7BTPYsB7E
	 S6iIMfL3rbTgn+yJdis3zD4uvDXgyXIdMAVyIUEji2WErn+b1Bd/jbIEEJNFj0ijt9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7wpUDC6;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEBF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAEBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7wpUDC6
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0426a65e0so46314835ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795741846; x=1796346646; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZ2sCqXwwWM570Uzj7/jKB0ciamWJ56LEpgiUf6Er7s=;
        b=K7wpUDC6Gq3dN0zmS6NnEmNqGUhHVyKQaTAo9TXsuZhUOJtuilvLBW2keTkjDTuOxW
         8CWJu5chybB5QWUU0d/o2obVqm3bK4T1Xxl0f+FishKYTxDzac1DLdmNW+MBmjP3Ux7F
         mXM0DQCzLeGrhYoxSCIhmk98KwdqJJEft7Jt0KK/+1lgHDlYpqbRrxfDSiTTsGDvDTqX
         xHcbHwTPOyArmWHfTxJX+C/VvsxNvs8D1/n0DwlzkA6v5EGT6MYmz6PnBMO+S2Hwjo8d
         qpc/g0Ek3VnXzAayMR7TVQknTmVWSfxKeNHI69VLwv3SfKz3zMv+Cq8kCyfn/NOyhaBU
         ALtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795741846; x=1796346646;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HZ2sCqXwwWM570Uzj7/jKB0ciamWJ56LEpgiUf6Er7s=;
        b=dn0+mkACqr6Zrk4gwi6T2hizJ9yHwcpq7M+KcnM6GzF7Yudq32wOakfMrLYGjvxNF7
         sV11Cd5JUC4sag1ChmIjuYhQQ1I4mxH1CbfB04eMGSLg58gqF4hktQJfmmdmvHyUI4qh
         7LXnej5LMyoqqqPIKYZUNH4HMNr+KAzHr2SvjD392Bm+yQnygkcll++mrFA13GYsu87P
         XcOpLgLaih+nZBxHfyEbT1fwEWRus3PPAae0679IGrsqa2+t6KmnZIhhJLyolA9OqIgf
         HuO+4kBxy0FubO0LFSuyaVonoIKoGLG2c6lEoJOuYs3RCohPIwWLyg2IqdJxSM7bC3qG
         joBA==
X-Forwarded-Encrypted: i=1; AL+hErGf4WgKJxpSYmV6m/TvmNM7hZ1HkyVQ8DQNLRMrZJDKzyryLBVaepbI80C5HkApqdpxl5QTNKqj0gu9xyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z88ByTpVailN/IqoAImZec8X60rr8LeiB+L4vGyMo4TuYxa5xpj
	StiTKboU8hGBvXSQ45DUI2p3uH20MdsY4XtBozmH1mYQ7RPUSXtGbDRq
X-Gm-Gg: AZFdTZcpYd1lyc0hUAY3odGC8XA2XIu0cQITYPPzm7uTOp5nP8FGzBRJyCCEmFj30V7
	RXiI3ZenT7Rxq3ePxOb5CFcVsJD1HpWgPOHWt12KZtUNX0ApuQ11drjWb8tr4lSxrTz51t8Gal/
	ixcHJneXu3qRqmx4vsiBqN+1iZ+p+7T9dFM2CEdvxB6/BcRWnb1Y/cNE8jiytY45HdpeIctW4cV
	YQ66HNC2mJUIJnLmi7gtyuV2dw3BWuQhwGu03QlvOIfRl7F9dxgiPhssgKBNpBjdu6N2LBVr2w2
	DujsJNeAr9/Ey3X30z5m2qs01SuVstQVwnWTxfCKonwogl4ZEhsaXIKvAH+q8YeVzYF6jOtDQym
	NvbcSxLKKH6lpAV8/hHG5LXcOYOaGoob4btmAwrrm3ma9y1OHB90+P4cKqpSNoou0ySBmvOk7UB
	3hDdVRFBer6VfmGUTqMdU218bsYFSwhATFYWWM7jkhss58h75HquK4lxX2FaboaDx5I9oV2MMzq
	jMT/evuHKmQY0mewHCqhHxLK+PjMAIQwVfLDCWcXwnfPdRnTzx/rRY/XfnEnSu9hwpB1WaGxhAU
	gL9Qgs0GJXtt6BlTod7RfPn2mRubD7kk7jKpMIKsaU5iTR6qvuN6SBJovGOaDzuosNp/GMGn3K6
	N
X-Received: by 2002:a17:903:19e7:b0:2e9:9a19:c54 with SMTP id d9443c01a7336-2f03f24206fmr190172495ad.50.1795741846137;
        Thu, 26 Nov 2026 17:10:46 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm110189725ad.64.2026.11.26.17.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:10:45 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: stanley.chu@mediatek.com, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, louisalexis.eyraud@collabora.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] scsi: ufs: mediatek: allow clock scaling when
 ufs_fde is absent
In-Reply-To: <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
 <20261126031008.27506-3-iasnezhkov@gmail.com>
 <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:10:41 +0800
Message-ID: <179574184161.52486.4990124402659702610@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Peter,

No — this patch does not change whether UFSHCD_CAP_CLK_SCALING is
enabled.

ufs_mtk_is_clk_scale_ready() only checks ufs_sel, ufs_sel_max_src, and
ufs_sel_min_src, so on any platform (including MT6789) whose DT
provides those three clocks, UFSHCD_CAP_CLK_SCALING is already enabled
today and devfreq already runs. Platforms that omit ufs_sel_{min,max}_src
still have UFSHCD_CAP_CLK_SCALING cleared as before.

What was broken without this patch is that when a DT provides ufs_sel
and its min/max sources without ufs_fde, _ufs_mtk_clk_scale() returned
early on `!fde_clki`, so ufs_sel never actually switched parents while
ufshcd still treated the scaling transition as successful and updated
clki->curr_freq.

With this change, MT6789's already-enabled clock scaling actually
switches ufs_sel between 26 MHz (tck_26m_mx9) and 192 MHz (msdcpll_d2)
as intended.

Best regards,
Ilia

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709702;
	b=1YlKPH44Gqhs5arz7/UNf4O12BLzydCTRKutwdWwg+iIHw48XrNJTdym2VUCsRhQijxQ
	 FZdOldVdEzXEtqqsNiP0IoNCDvQufBFPiwU+EnSCgssWky69UGKbQbRZr3H0k9y39CHCq
	 XjAWS11XXKqZnFnqtApx9HLIKWtb4ee1fb0sFg1PTzKZgyvVRDyfOMfDoe3wrqqhYjjps
	 0i5rC2TTSaQMIO9r+pRl9IJL7bROYW1ZVWI5r+O3SE1YhPvToDEBqN1Vr6+iJY2RivtMI
	 2Fl9vBXCyZ6SQHjl+Pvl2een5j2wnBIXjRYcc4pW6G65quRHZ4oIqkJJLZ9dk2xVcGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709702;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
	b=xht2ZK6zX3KJXP9mpVUNASEbmBG4aQTvuiLRZMinh+oJeS0FHBV9zF1Lkw95L/SLHMSD
	 X2+Ygjf9jBOVmrkH6C5H8lV1PJXJ07MC2UWT+PGatdtuDpE/qjx16bpM/CcKDTLAoH2mQ
	 UI4kN8hc0Zr3vRtYgsFJaZaSJ6UpTvdArlrzPz+EOtClEprDYHBEJriYvEeMFKzky94O9
	 5IMdXV+s15/OnE1PZtDnp/56O/fr6VD8kM6Aa0BHFrtgF1yg2nHz3mQlkFDpMZGfHFJs+
	 aAh0ho8jtpdMoy+8xh44BRCFxAW4Jl1QbuCPK6ygRiT0HKVDqQY/RwGzgaq8vSGDCfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K04GlxYw;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2C60A2606
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A2C60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K04GlxYw
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3215934a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709699; x=1796314499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
        b=ke+wNZJCTTrqcsU2PRbv8zcecn1BdZ05Y2Vf9L7JBNZGAJ1XH366dTHXd5afkrw7fT
         B+kBQA6qTNGEcBorXUM/lRelZkTCVd1WdlWhCVpWdosfZl4Sn//qHKvTwxe+8Ja5YVe0
         hwzToVwePZRJ7celDzrIMtNMYhg5erDkgQo52MY3cUri2CdmT4dIefbgyUSllSfPuyVI
         o6YyxXRB3kziG3/er/8ezz7X26HNSO8W3p2Obns2O6BCO1LsDqAgbpnFrB0CsH5tjr83
         NvGFuaHh/TSMZUIke9uIsSjq70QTVfIttgRvXJ8gTjLFNiU98AsfuFMvWErICzWVi4yi
         ZuLg==
X-Forwarded-Encrypted: i=1; AL+hErEMP/MeuwXeD8s/d2L8vEuxqXHseB+FiOnPvPWRM45nxHYM6eIu2mqe1oDt+UpaOfa32eOcNDJd/zko/po=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qJLXxUMiV8I3jX6CYOlRe8MQSpW71s0hqOHd6aMvASEOczOHQ
	Q7mAvqo/rGbAsx73bMkvibCjMYl5Bbof90aEK6JNNHrTqxO7i6UwTE244cKVBubnC3se27j9S85
	Iv0F7SklrHpy6Y6vXQFJQ28rfkFtHgNQlODDqUvjIpUzGe0H+f65ZC7ALj5+cV11fdbEqE/oHYp
	UtO/L8P9KTVeNslxJA+d1ZjBy3YQD7b9AectpDZGyLAHDXwwPWrFSqTFHpncLTwiTh9aWFx79in
	rYPCynceXrRmTkt2Ou6Jh0NSQ==
X-Gm-Gg: AZFdTZe0gUNsYrDEIMtKAqGPbmMBxj2gquHYOrYSdFwM3AGiiG4KVwLIh8b4dkhki1L
	3VhPyiKxmXwT/EAOW3wa10DktYxWyAYcCZXexjxTfl/YF9ffKhVFJvxfArlk8tk7jaWW5a+pjCh
	pFxLUhyLrYm6AHzx0z8jbs+Q3o4tEjks8M6Ccj7uznOBeYAVUFoF+/Ybr+ijKtdR6f8+8yih+KE
	eqZGJKb/WSMl32VOvirnWrjucjPt8b2ffZ94BvXsjQK3Sj8zOJEVHtujne3tDwJyHTJKNiP1SEb
	+H+8ZXOYPYD4HiiH5r3uBQORBJGxM7hoIzyQ/OHlqhI1yXmzQrAVJ37FiMfqIbl4CXmkkxRGM7Q
	sOUUtG+En94IjyBjkJsLUmKI7ZhH2hZoXBvaeFP67WFW6SpI1LlCYGJKJrzd5XpXW0B/7cn5hMV
	ER4rBtU31Oa2rmlu23vWyVJDruHtTtF52+IUKE/sm+Xw==
X-Received: by 2002:a17:90b:2e8c:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3b41c8e105bmr18389336a91.17.1795709698736;
        Thu, 26 Nov 2026 08:14:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d683sm15864315a91.3.2026.11.26.08.14.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso991228385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709697; x=1796314497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
        b=K04GlxYwKnqfDFqNa3CFtzIe0lo4570IqVtjPk23pAFcf6BkkmZ0YkJ1KBAKY3WEz/
         +KFRqVemt9hKuSQB/ae/xoJi7uW7zFBBwzt6RpluThM3JyHyrfB5H0Xqx5Co4tPZpcgf
         M6jmV5KCvb4QQGUMqOv1sS+cYpFhHIJ2Q2PF4=
X-Forwarded-Encrypted: i=1; AL+hErGbnx7QOGTJACXvPJV/YWO7Wx5MhDAfWb2HI1Xtp8FHSBe43KlAlOWTzEIsKhejnRN5SZErzcA18finUZU=@vger.kernel.org
X-Received: by 2002:a05:620a:8389:b0:942:a42a:78a2 with SMTP id af79cd13be357-949ba9ffe27mr3853464285a.31.1795709697561;
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:8389:b0:942:a42a:78a2 with SMTP id af79cd13be357-949ba9ffe27mr3853459385a.31.1795709697120;
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:56 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 4/6] wifi: brcmfmac: add the AWDL data path
Date: Thu, 26 Nov 2026 17:14:43 +0100
Message-ID: <20261126161444.2484980-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-5-dev@deq.rocks>
References: <20261125190254.176055-5-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:52 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The firmware passes AWDL data frames as 802.3 frames. An LLC/SNAP
> header with the Apple OUI (aa aa 03 00 17 f2 08 00) is followed by the
> AWDL data header 03 04, a 16 bit sequence number, two reserved bytes
> and the ethertype.
>
> Let the AWDL network device send and receive plain Ethernet frames.
> brcmf_netdev_start_xmit() adds the headers and brcmf_netif_rx() removes
> them, so both count Ethernet frames. The addresses of received frames
> are moved so that they form an Ethernet header with the ethertype
> again, which keeps packet taps consistent.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 87 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  9 ++
>  .../broadcom/brcm80211/brcmfmac/core.c        | 17 ++++
>  3 files changed, 113 insertions(+)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

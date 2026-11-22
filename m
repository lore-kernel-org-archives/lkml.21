Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378180;
	b=nWqTIKSPfLugRzJXpXZcokIM9PMEJzyEMA2vmji+yFJQW3EtFTKlqMcHbLUlrnR7g0dZ
	 PrNqdxdIZutS6rbJXuBEDfE3RJ35ikhsnfC1m3I6nuP85CRCr2UBy64cDvmK5OrtIV8Iy
	 y4MweYD36QTAcPoqQljfSUvvvZ6p70L6x2UTuImIDv9SGcQ71tRprFnlVWe6M4l3wVbVJ
	 hcBvBM9rwt6qpYp4Z9XvRlGe4FAD1fnJFlWZjXw4odGsRMvPcu9wsC7shVQNSSWV8Ty/N
	 Wup5tr8+9/mesDQjCRPI/5JC5FVYRQeGqlRiMg3Sp5gyRzLX7pTm12Fjhb0csRg26bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378180;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
	b=0sDpji5jkPX1WE3RHDkvqxGEmyiDJBCz/9TYEpGb9o/3T1t2Pi/IsZ/4hLYwr21hYGA6
	 /1P1wBwHt0nRt1T+AMwm0+CpBttpL4MMX3/8hQKykI7tuLggcOFNIwrpBxSZb8HO2jo2q
	 /6enUmxp5xwTuKtWjf8OmTdHvc5Evs4uGcye1QIT0m+NukPl9r/P7HtRPP941DcsyozQA
	 EF6/s3mfewhCJJbTa5hT4vOU9Tfq/jqZ1QgSTUM49fh3w3H4gRfBX0GelgtuKdEabityq
	 4bxm79YjbLGXtUqqDE3xlnzEpS69MnSvX4WfAfzUI72VEOz8qxvyAjlkdjyA4z/ob1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GhOFQdm4;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A547606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A547606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GhOFQdm4
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb628232d2so1455728a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378179; x=1795982979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
        b=uwDBXbV+dP0dDzLjP4RF/Di0UApeRVP0+BTDU5QGgQdcQM03T7lVfyhJWLT0dEd5Ig
         G6++OSocWwvRIlC+QvVexPVVOmLEYDW/i5ntPvGWgKiS1fU0IaVrjMbxb+n2wvRhRYj9
         Zfs0xv5Xolb1Cq7e7y1k/lKEWpCHN7/jRMEDje4sCsQ7ve5BCvVteAkpplir9gWyr+2O
         wVdnPkvFhzKkjC5bf9050pGcdlrdcSd0qC+XdKjrqGG41Sih71LnZER8PqRpnBw1jwIw
         vEAC89D3rKPfSZvEXpnVUIswEpUiB62uNT4rk/C5f9n62t+nYlJMBfXU1ROSg2rMRM34
         PYcg==
X-Forwarded-Encrypted: i=1; AL+hErF3p+PnXE4orqLd2xBJk0f6ztzpk6dsseAFgw/XifwcQf72ZJWkZqsUCw3zfRVKmEdBnBJRmkdbahZQD1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z99mPd/uCKgrp/rG+S1yYHp5gXiOsyzLjCP+oCEgnsTWVp4wYvB
	2pu1ktJBiaE6jnypLmeM2Cv+H33sWx/SsddWjvGhoZVTRo3KJp2ihBx7n+DkxE4kdfukBzbpVyS
	92NKNLjSySgreTJro4ey9zwezQB+YX8m0bvXj/BSn1VZkK7rLgs24zDjG0zaqL8PK6nXISNSOmk
	LohO3/QWt5HXNV1DRtKnfOH8ZXt+w+elBJGgVDUdS+vE+6yzyR5j0pfyEXRmPQ955d/4qC4dnNj
	RfY4NE0Mz4VtYChQmmVfbY=
X-Gm-Gg: AZFdTZcsiWlqwpIKUbeBMLpjyXu8AfYxC30WgiVO4MFziQRPIhDVOSGlAMzg7VBNGB3
	t2cDjsor3Dyocwp4+jKdok9PxIGmNsYf16xTshCDCBHwFIJh7+wr07LYQQYqxfZPmyScrTNPRX3
	p+2KQ4g5xcH3b19h7zeWJX2i97JLdaYfCwmIEQAv+2UXY9hn3S/s17/+NRFKryfNZo1GHKqgPzr
	mv1vtO4pRx8YBkMa9DYlSU+zQjRakS7D9hunr0tBE9vkb+cIAgjHGyUftZ9bUPEGC4+671hmOO9
	vZg2nSEdgA16cCqyHxCy3z+3Mzwcx3uPeGomH1ck3fk4ziPVktu9LPJFLqyOOweeec3wvENWxUT
	Gi7n5gZTIUqQ+t1cc/w3hxdTfzruF03GaZn66w2wBep5jBXC1KJa6uucXCo1xopBpMcoX7iVvIQ
	2b9cKoOZUa8S7ra/7OXeMjJ7Fk1V8qZJcsN5lxEBE=
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr9270010a91.66.1795378179331;
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfb370asm3600651a91.0.2026.11.22.12.09.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so256806185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378176; x=1795982976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
        b=GhOFQdm4QJ8rjAkHe1DldB8CmJhcTorqSYwF13HRyZ6BRFboZbrAZ+E72IBlaqxuQa
         rkqxpSmtj/IEd1kzxl/Orbj9Ds/weCrCfT/PnHovlmjLBRpU7zzeh68EDtoDj2PjvUm6
         OVP2uDN7VcapKlWqF2BPuBskrYLiSg88+spdg=
X-Forwarded-Encrypted: i=1; AL+hErHPhsptnXSSM1P09JV0ibFWHutlPrJoT0Y8RZt0+upi3I9DoePpFjX2k1GtQFO7Z6ExUcHBBFdNYSyhMrg=@vger.kernel.org
X-Received: by 2002:a05:620a:2886:b0:949:44d2:3275 with SMTP id af79cd13be357-949ba9b9893mr1759710685a.21.1795378176464;
        Sun, 22 Nov 2026 12:09:36 -0800 (PST)
X-Received: by 2002:a05:620a:2886:b0:949:44d2:3275 with SMTP id af79cd13be357-949ba9b9893mr1759707985a.21.1795378176005;
        Sun, 22 Nov 2026 12:09:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:35 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 3/7] wifi: brcmfmac: detect AWDL support of the firmware
Date: Sun, 22 Nov 2026 21:09:26 +0100
Message-ID: <20261122200931.2090372-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-4-dev@deq.rocks>
References: <20261104151547.70333-4-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:43 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware of the BCM4364 and BCM4377 runs Apple Wireless
> Direct Link (AWDL) itself and announces it with "awdl" in its
> capabilities. Add the feature flag for it.
>
> An AWDL interface is created with interface_create version 3 and
> interface type 2. The host gives the MAC address, the interface index
> and the BSSID, which the flags 0x2, 0x8 and 0x10 select. Add the
> definitions for the interface type and the two new flags.
>
> The BCM4350 firmware 7.35.180.133 lists "awdl" as well and answers
> every interface_create, including the version query, with
> BCME_UNSUPPORTED. Keep the flag only when the firmware reports
> interface_create version 3.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c     | 26 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/feature.h     |  3 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)

Similar to the previous patch this one hits a conflict with the
EVENT_MSGS_EXT feature. Rebase needed anyway so this one gets my
acknowledgement:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

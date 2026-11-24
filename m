Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551232;
	b=tVqMA+CTrQrx3LrDvYYHpEmHcPGYKyEhuk2h74rUfJVE9lqkTUFvw08bkdMa6aNrjGCB
	 a0lIJxtPMDpCxKGmjvTB93JtY1sX5loDq9oKTmkL1jb29s28EVs+SDkqESXWlycAG/0ei
	 JX+FIyZTbLxLcUFMUP3RuxjRk5OGEneZ2s/425blfkfebQYG6ydFrBqiN2s7/b17MYmsO
	 UjkLnwWSYd0PrgmCe8YwHh8Q3228+TRE0I6/L1U8ujP0T0XDY12BxstIT72a8zztcb2+m
	 nqMpNXCvS02xLuhNNcoOb3HvNCGeS1yPk96lt24m3nN+olTMCLdmQOG60Y+zYYebMkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551232;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
	b=PfTEJj64hQAOU3Blm0GJZyr8CNAL4A/0k957SRZZmucen0vjcdEHFSUSv9sZDJz6Q60h
	 jXBtKnKrcumZMj/fIFPPXAsnU1dRV8ceOmCdcIKInGinzfqyK+ahQyEJSLWZENMjSsUOI
	 pZ1zTrc8PTtmRRWeJbuzvAwQwr9tynkwyw5fsKLbgdyu7IN469ew5rO2bFTgjkC/tR16C
	 eF11gpVAH89pPiOh9PxpyVYE6QUHpSe11w2ckWmRI5/wuPA5keO9vrcCO1AaSqUTWtd/v
	 LCbnPaOID7NnQ+btPo5uwEi/BH0OXHIhNV/Xf2ojb4j89rRzisnbxUa9grCng5TSIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=V4U0ayHB;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607D8606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 607D8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=V4U0ayHB
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so2654843a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551232; x=1796156032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
        b=JJlPZ5JSYUlryrFs2ft3D6PH8FhPUy9JvPRLVHqVfKMZ6Pe560CaIrBOdcBWhGZH4Q
         LzmQVCNUodgsf4FrFdebTIVEUi+GKvPda7ckpsc8i6uL5VHoTM7JI8GV1E4QZtioAUWy
         DjPTlgcb/D9eLw56bLtAsGwGgyE5oC/s7Ses/SIt9OqGKgjImCbXJZJ7SDR/oG4E38yN
         vNTOzB15fXSNk8m9PmjfYK0ZSqQXkdrZJ76RcbfeZnubGUIxKgGRSDYhBlBkYr4ELRD6
         hPq3SI9+86c6c0ve7mnTTeY+NbvtSqhcTN0KZJT3/YkHeiNO6qhviAY8kBwhHUna1gn3
         OUQQ==
X-Forwarded-Encrypted: i=1; AL+hErFSwFaUnPdKoOGfYt8flEBIQfCg4j3OF5/iPKaJz5NL1emRTjDFzU+hfwmelhPT+wDGFEIF3Jd6uJsP9vU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k7ov7bjJj5MyZFSbzYLFqrSax5XluWNF3Gll+c+ECgdaeEdhU
	blR4WdWlV+t89RkTX8A7QzILr5TiqqrSbimAdqgMcDIsextWfzGaer1Wz8s3fP7RG9Wfwx5D+QN
	bm48Vu/F1LZv3jtEWsLkMOrDVDTi7W4ODPvWZm8UiA9s+U1MITXEi6crNJA/RZLkoXZoZrXWhyp
	xsCFBsNyJ2WUOixKpkm9StrPYDDdIL5OGrDOC3cTP33GNlOIUngrU5JXXvxBNs9zjjRNIP2nb/4
	jHDTVKb1WbO747FDkxAtR4=
X-Gm-Gg: AZFdTZczwsGtsN97dZIwe1MH/3UEKk3sjNDzsWXxq/sHM33yY3EKvQFYMgc9byVAojC
	18L0WL8Rnc1YXOchgw24yC5VuKnO3thuqTzIY93cSlq84fUHbYGvXijQ/hNhrVTR+Smf8iqaoEC
	u3Xy6W/yl9XjR8KdMhZUx45jOqyBa1nFQZFp3YLQ2P+mCoLcP+ghH4Tf3ZVdu0/bBhHZJZKzfk1
	xt+hnE37p6wBVuEprNZJ1KgJeM1KZ10FjkGHkPC5tU325nP2mL8JCmK6IzQclbDk/tutHcNKook
	28psfqRwLiQ3NHRhoD9mLFm1yOfPsZ519NkHmgoC0NhFqGtHFcL2cndXM2+7NFR9CvBxxnEv2qa
	gstmUGBvTK3NBTP9yX59r2H8/GbhezGBvydSknxmcNdsmPhajNetMTMMc5Q9KnEOU130wf+Xq6g
	1rHnAXppYcSKp3b++vkRZ+LB2pBhjBnmQxWU6vPKTWew==
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr14680082a91.5.1795551231747;
        Tue, 24 Nov 2026 12:13:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b49fsm4984682a91.1.2026.11.24.12.13.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0a55e4b4so1395924241.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551230; x=1796156030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
        b=V4U0ayHBYJdc62E0XX7iYYnLYjvvF4v4PFODp6nL11OP8KBRyQM0x+nVPwUH0Ygb32
         HyX+ggzf7x8MxHP0vNJyS0vfTrGDeblTLCQStMrONVfADWSDfgVO0zCQ/8/TgXme+pmy
         Dc9gBx9kD6lxn+MmNbjJJUx/as1gPJD7dzneo=
X-Forwarded-Encrypted: i=1; AL+hErGqrUSKse00Umwj6sPJl0dMcX8TAs7Ep7b3yt9Shrozl1QXiiwN1mt1WJKItf3+LXxamgsnBvbXXTrIPCk=@vger.kernel.org
X-Received: by 2002:a05:6102:580a:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d74432e4a1mr7935571137.37.1795551230440;
        Tue, 24 Nov 2026 12:13:50 -0800 (PST)
X-Received: by 2002:a05:6102:580a:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d74432e4a1mr7935544137.37.1795551229967;
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm140905426d6.1.2026.11.24.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 2/2] wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index
Date: Tue, 24 Nov 2026 21:13:44 +0100
Message-ID: <20261124201344.3494326-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115185843.64633-3-maoyixie.tju@gmail.com>
References: <20261115185843.64633-3-maoyixie.tju@gmail.com>
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

On Mon, 16 Nov 2026 02:58:43 +0800, Maoyi Xie <maoyixie.tju@gmail.com> wrote:
> brcmf_fws_macdesc_indicate() stores the interface index of a
> MACDESC_ADD signal without a check. brcmf_fws_macdesc_closed() later
> uses it as an index.
>
> 	if_entry = &fws->desc.iface[entry->interface_id];
>
> A device that reports an index of BRCMF_MAX_IFS or more makes this read
> past iface[]. On USB this parser runs with the default module
> parameters. Reject such a signal as
> brcmf_fws_interface_state_indicate() does, and count it as a failed
> update.
>
> This was found with a static analysis tool that we develop. A userspace
> harness that compiles the fwsignal.c functions unchanged shows the
> out-of-bounds index under UBSAN before this patch, but not after it. No
> hardware was available for testing.
>
> Fixes: b75c1a301b7d ("brcmfmac: destination mac closed when interface is closed")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

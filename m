Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709691;
	b=Yigiq8sA9KfckUUuRCS7FvGIP6L22FQkn29Cjd1Izb0vy2vV+poOBZddp3k7nt2XApPM
	 vVvYKyVceDdmiZg3olx044FHPsHsFvWbffGHh23Qm8+OfdWtl/SA8lAVsSUza/62yF950
	 LEzw1AqLpdviWyjf3SM502MrXcV1LaNcXRzogw53FAcy2ZD4cMoIQ+VbM2CyXgWybbwNL
	 3YksTDdHV1f9xb3MKhaNzEokWTIlztryfkSZlBtPVgrf3CjMOJR8tOXrYVbRv/blA/2XQ
	 GybDJfer+s3Oq6/mZddF3cggJDYTBSMYKTaNdKlbFyodB//VIUryoERMmNGWN9K/q8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709691;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
	b=WRLTpiiyPXEzUgKt9FCEpW36acAoe2G5Yki/+ErZl78IIzPz96F6u4dSY8VKn6rUyXQc
	 xwWnmxmETri7BKc1gUcJKvaesTfO6XUaC5BJf2mnx7MGnfZMnsQ+nkCnFaIUIUL8/Bl02
	 0E90mty280l1ED2P7qt+SxciN3BOT1KUUBWd2l8gfvMRfegu0pkPx3JF6IlR2iIG3t3Hs
	 QwVy1gWwDF2223m4mRfow/TGOggyAPxfQUe8yFP2N+BLXyXK7zLCiEuQdvZGElc2isa92
	 EJl7a6nRUZcgKLn57pooOh6rf7QjtJimQeJf0C1UTLvL0d2eNspf+dsypNk1NuokIVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hV7xhfCF;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854F5606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854F5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hV7xhfCF
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-33fb4680717so2897501eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709691; x=1796314491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
        b=y3BM1/ypgOYlNFFLtYP3UsRcBPE64ZkLFpbxZRbj3FltcluxMmi7qirm9DdQJZRYzt
         9G0QjYWXv3GhbRGM7yK0zXyCpjfnX+Nar8tQWVGigM2SKDhXS44ke+PF4uPmpC8dVncU
         BszcJwe8wtLAYGJMPlReU0a48tLbem1oXO3j1mN/WvQJaTSShIDieqpF0YAxAd6IdNQ5
         pibSnlVGrIkk0WaHrzP1VFA2NuLhnCkImFsAomX8NfmRWfwkalHHIoo/FvZj34BhkoLl
         reoqDLG6mbJAuHNunFxoE4BK608XpicvcDEdi4/traZqC4ikoVRlgpXpO+NYrySWRgbo
         EULg==
X-Forwarded-Encrypted: i=1; AL+hErHpDlDyUYBVHpMMkV6UkMpqeBmm1fb/AwI1AEsAsv5+xtwCJhmLAeLgfFfmyiqrF/6+lgS+6/hz/SNrXqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xnfGvbStRMieEGSwmOkHUuQBCgh5ShPe3/7QoJtALZosilb6F
	qmmBuLyqiJ+dbH/y/g5QSRz0F5B3XZtb3+AcSvbG+bLRueIv5TtEto9N2GZnnB9QQ+yt2G2J08E
	0t4bDrNHu8nJQ0xncDlvLCgHIoj0QV1fGhjWPN3XGglp4QOlxVCgBuo4rI+jOn/nV5SR4oAl/cP
	kK3gJ9RFgGmsdTtxxcUgR1hXd3tnbZ/h7DpAbXkbe6qELf25XPjGROQd2RnESFTgC2goXPKWY8c
	YoWWTrC8uYW5QJt5QdgMZ6STg==
X-Gm-Gg: AZFdTZfPkWn3iOttuU65vIBlLs9Iw3d/KBvMAqKh7Uiu+0GpV+mWfNMYdFX/xDTCdGv
	OGD9DNF4q6Tk5lVCi3dbtrqw8hl77YabYIaH3oEVNuX2YZn+QYgOnuP7bYiKzbuwr4NaLwCJz9e
	wqLYGQiqRkB+rhpS/4Ag5gnaUrpLjPFnNTMw+65B2R/yRsP39Zv0d8k+p6bR2xU3lIm7APwWcm9
	PFidrRt2uyL1OUyT8TuldAEB8tgtVOFE9CbCrc2gig1Fj8zo1tGdDqWZVJFvYVtUFRwM+cdx29I
	VZ+USFiP9OqNC6woKkmJjdNZVil5+EjCWwXn1wZpfl158Gc06FhMp7nJfdc4joWUAer9agQRqfq
	PwNJjLDmUMd5o5dfjP0eXAnOWH+/INv9d4ThoUbd30n/RtvJCA8ImOVZ66h+DPSCsTZ8rsfQBj2
	lilQf0Av5kbur5ZDS2a+wfi8TCDBESLTq5M5W/BUAtnA==
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr10343388eec.38.1795709690420;
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385673c6e98sm3319485eec.16.2026.11.26.08.14.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so715704785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709689; x=1796314489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
        b=hV7xhfCFk9GHDeFT989TwtfeFjHOZYTqZSgf1Geol48Bk83Hr/pvU38ssVDl0Fjmvs
         57i/N2oTx3ziBzmtLJULMTGCEMs0XeT23wduIwo/Kubh2JL7ICmNqihGGI/B7nt/Mist
         iKX7WRLM1HiLeauCL2yx/ocjxN+j+6NlLAdYk=
X-Forwarded-Encrypted: i=1; AL+hErEOp9udTdqU+oQ3PdueayjujD64/EeC+hMkHnIxhFUAuGpThFEscGIoD36mVtkiRX3YLVItuzjowCT2dW0=@vger.kernel.org
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr3903799985a.58.1795709689010;
        Thu, 26 Nov 2026 08:14:49 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr3903795785a.58.1795709688522;
        Thu, 26 Nov 2026 08:14:48 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:48 -0800 (PST)
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
Subject: Re: [PATCH wireless-next v2 1/6] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Thu, 26 Nov 2026 17:14:39 +0100
Message-ID: <20261126161444.2484980-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-2-dev@deq.rocks>
References: <20261125190254.176055-2-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:49 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The interface_create iovar structures and flags are firmware interface
> types like the others in fwil_types.h. Move them there so code outside
> cfg80211.c can create firmware interfaces as well.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 42 deletions(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

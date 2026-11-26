Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703397;
	b=Jwc8svydnL74af3ohEuiIpyydUo+NJbJnB08JccJDY7fUhWqwcgNcZqvl53wNQwUp8v5
	 myu7RrGv8o8bKygvJV6iSqGSbVPkTt+7vP8RF5nxbr1x9/jJVZNjmRueajLS+/m5sFqo8
	 edaIk/lGFRloEdN+h1GT1vWHcDn4E3Pv5b9cLf5xRnTqUOKquApazp3TMifeIOcg5cxhq
	 QX3BJ4K4zIMXYXp/I+9I3MJCxvbl7WSSQy8vsI712GD1MF+dBnfVd2Fc1qlN5XSxcyw+d
	 nPec3AcZPrmgOWatS5+xyeaGhv/GnWjxaMsWYznvtjyT7idBK6PO6jELCVv6KqxpTyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703397;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
	b=RNN/Opdma1WuQwx+AVe4NegGy4NMh51LyBsRAZqihRo2YP0fBmWZQcLfKhYQ9U+oo/rF
	 8v0nTzeQ1FwKCh5yJKAa6+ZX/6hK+11c/CHr92cvQZTaS4ha/WHmSvZITUUy3oXIzRXVZ
	 4cfZKZamVirY6tazx6qBMgHbRW3aHwY/FijVKCuFG4qVVhEcGE0mHfoipw3j3QMZ2dsW3
	 JJNdEZQ0vKBZh1SdtgQt/d2NB+sWZkvaW6wxm+2oMZ5lzwHjnklQhWUoaSJsHaJcwBVm5
	 b4A70iHiJw+249sTUWhO8hDpjKFfQ6xAjU/D/ybRyUCy5iJTacdkfmMpc0HbY4IL78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="VxbSpa/w";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75563606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75563606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VxbSpa/w
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so1896361a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703394; x=1796308194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=RnGHCHAX1kj2QWs7pONuErGaXSOkWk2u8kux1KxJI/ZFvD597A+7THAdGFQvtDFz8V
         naADIhB3bLRSWqnqr3YMjC6JPmnrwfhAOZqub1SkqTqgBLDmuj+sBA/+BaEirBOsx4pg
         XUTb1MTVaf6dJQSATII3MKqs6e5u9qmezVVY7UTJ28RC7uAneodZvB3yuQt0lKVz00WN
         HkgScS3mqddj7IvQWPR6ewxi7zyU1gUEwU558Jek2SX5MCmDHfV/BnF0VdR9aY5bZDe+
         90wli0wzEZBCBEwcUe7ungrhFF75gi3cFIxXbqiGvovcvTIbXrdtRXYEPQwaWr9q9aXw
         5QcA==
X-Forwarded-Encrypted: i=1; AL+hErEKNFxaM+HzSKqvYq+0xeauSC4kR0noelvzOQQpwvDBBqv79OQXkpEfpqQnO0rGxoI5/qawOxwjujCKXbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oY/riRZtTzYoZOo/9UHbQDw0oQPESXp1cF6YdCn2RbBddaLv0
	7An2agYensaGht+BZ9F3Bngu97jCBLLa+t+WidJOcU6u3pztCaJnSCJzSZlHdB5YVuutN2Wl+V2
	IilwRfflEMvlb2ycmoB16CZn7oh7/7SqhHFWCv6to/7PEnMPLg0NPo95X44DYIkHuUbmXoI5Sio
	gvH1PYnRA0YZF1N3YubRuS01YgyE/K3St47TB0yBNIcCk5XZaHtmrThz49pSrS/l5Y8E8a1KgdG
	7zTrpePS39RvLF4426AvOu2qQ==
X-Gm-Gg: AZFdTZftqON0ySE6RuhVvCBu2eJVisjDXestAJgN/HUHngirfz5qktIbasyCEwQ+M/w
	+RYAStXykDSftxB0QJjIiLKlvdQBQKstI6JxaPq32NCw9ms+ZKV3iRuFDAfM5m4j1blzjzy//YQ
	FWheBjSrrDdweagwvYLAEimk4YviIfUwHeUjw4rh2wtOZi6U6IMMIBrg/U3xbwpWo3CAFTR+AEb
	At8d4YoOgMtZAbX1tBpKWAg0nV+CbS92juVqFpPrDUNRhd1+kLVIAd3FD4CESCboxv/obaQjYZ/
	gI1Wpln1HYhrhLdeT3t9pXex9Dv9i2qEhyiotiCcCr3gfH/HtEPok6mDjDniOBMDcLfD1q8B6TQ
	OGbB9V1hHULZGv3wmKHcMgFelrtOEHHVGN75EXE9btzE5pssQrm6QXsI+9mkrgwVlJaxlwe2FW2
	6JhagK3BgXNvYWE2DWnfVpbPpFQFCXOuyD70Nu4qngoA==
X-Received: by 2002:a17:90b:2f8c:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3b41c959e23mr19406446a91.39.1795703393812;
        Thu, 26 Nov 2026 06:29:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm14476305a91.0.2026.11.26.06.29.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53639e47be2so133283201cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703392; x=1796308192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=VxbSpa/wd0Al4wo9Kw2Y2KhH9hV1GOTJ8/pl5R26zk+DHmUFb4XhstybGpKHsUF+4v
         Qg3kKF9bIuS28mqZMmk5qLwCJb2ig8RDu44skCs7naCFHqqmWjW8JEfa7CECwTzgxJF1
         sDjjMLvcxL8zD06rnQZ3kplQ/3ZAu7VS4I2xw=
X-Forwarded-Encrypted: i=1; AL+hErG7tZK/+ffJWa2hLyvetXzCBn76Fwj0TyA+M1OXo6s+J8dvjBXXLFqFqpuS6DX7AWNfBaqnXbuzuzzRvO8=@vger.kernel.org
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394072261cf.0.1795703392441;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394071861cf.0.1795703392021;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/5] wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is a capability
Date: Thu, 26 Nov 2026 15:29:40 +0100
Message-ID: <20261126142942.881504-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-3-dev@deq.rocks>
References: <20261111120748.23795-3-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:45 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With host ready in the host capabilities, the BCM4364 firmware halts on
> the doorbell that brcmf_pcie_preinit() rings, before it answers the
> first ioctl. The B3 of the MacBookPro16,1 does so on every load, the B2
> of the MacBookPro15,1 on some:
>
>   brcmf_pcie_handle_mb_data D2H_MB_DATA: FW HALT
>   brcmf_attach: dongle is not responding: err=-5
>
> The BCM4377 stays silent without the capability, so it stays. Once host
> ready is a capability the firmware takes the doorbell as the exit from
> D3, where Broadcom's DHD driver rings it, after D0_INFORM. Ring it at
> init only when host ready is not a capability.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The sentence "The BCM4377 stays silent without the capability, so it stays." is
unclear. What stays, the capability or the doorbell? Also please add a Fixes: tag
for a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with
firmware"), which introduced the host ready capability.

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1599,7 +1600,13 @@ static int brcmf_pcie_preinit(struct device *dev)
>  	brcmf_dbg(PCIE, "Enter\n");
>
>  	brcmf_pcie_intr_enable(buspub->devinfo);
> -	brcmf_pcie_hostready(buspub->devinfo);
> +	/*
> +	 * Once the host capabilities enable host ready, the firmware takes the
> +	 * doorbell as the exit from D3 only. The BCM4364 firmware halts on it
> +	 * here.
> +	 */
> +	if (!buspub->devinfo->shared.hostrdy)
> +		brcmf_pcie_hostready(buspub->devinfo);
>
>  	return 0;
>  }

This skips the doorbell at init for every firmware with shared version >= 6 and
HOSTRDY_DB1, not only the BCM4364. That includes the newer chips the BCM4388 series
was written for, which as far as I know ran with the doorbell at init. Doorbell 1 was
introduced to tell the firmware that the common rings are initialized, so I would not
drop it for chips we have no data on. The B2 only halting on some loads also suggests
the doorbell is rung too early rather than that it must not be rung. Please either
limit this to the chips that need it, or ring it at a later point if that avoids the
halt. Otherwise I would like Michael and Hector to confirm that the other chips do
not need it at init.

Regards,
Arend

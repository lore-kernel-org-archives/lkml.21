Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703394;
	b=mIzwC6f902uTHwf3EfXe4hXZgDHllE0CFEHNVDFDL+JIWqScPvKWlAxUgah7GO0Z/UwI
	 NPMF5EAGbe2mzxjp+W4eJE8wW6BdtWVvB70nJbkZlJeH4S8pOXgm5Gyu8Cs6cPkziD2hO
	 fWL/tr67JmnjaSoG1PVvQyCbUQHukzzvc0Y7zCwUNXS/NhYt6xMZL1RrJrb6neTtE7F/4
	 eBxyxzTEdSDEhpPhQMbAlR6W+isYrpikjwAP4m+ow/z2Yf4Hw5QdqG2Edc5jA+yp03WsO
	 qXVT26ZIuf35P/wFsMmvdCT/527XVRPNjqltF8hp5+Ygk+aDJQEku7IHRpwa+6AqVHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703394;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
	b=IK11ggHJPe5tKlWFYmDBOzxF8JxGWQ7GnoQsTzm2Z6jZvVL8gn2ceWyRcMWpUfhbRuLx
	 thI9jgfEIDcF/VjRdjkFdep+oT4mze7v105+5K/wbOccybVUDg5J/2KJT1QRymzEvGdhR
	 NEwYSOPQAlwN5Qt40I9lVOGvgB8ORkUg57H4r/26SmOicTLXcsym48GLOcFWLocglvKiC
	 GshxgkbHGC8ZiaNBHAUWqjxdNp/vBCBJn7KarkjwahAT5ahmjU54NwWbhUAvpeG6P9T9e
	 UX4VGhQk1OmlSzubTk+yibCc12QwD9EPUaV04JBEcse7sexMBVHzbgbjFF+lxpStJ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZFPR1khy;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C3606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4C3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZFPR1khy
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso3545405a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703392; x=1796308192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=ddDsyjHthyetfTToLUWwqWX51FdCDvo7Q60vr5S5r9UHcJaLJSCXX3Wr5z+R6QdSXA
         bZQ0p+HaSIsD6hARmTQapnsvUDSbavmx9gYTYrXk5juZomm3hK0lEtXI99P2J6memAmA
         /RQJvjIA9P3VLeeno0Vv7pSOrnztt6htYCi0RkDuE8y5I1wBDu77/Z2jMtQz+YoOzmij
         dKN5cUBdkaVpEwn+VIU8Y/nM9KxA1w5Xh6ZqXcj3ujZqR8m2pSxT8jqxAAWJhWF8EE6N
         Wfp01nwHSy0hpNKVUKISQFG1Kac8evI8pBoeKFeiH84U5t56h95y91Zhv5IWoQUHHIcJ
         zsZw==
X-Forwarded-Encrypted: i=1; AL+hErGzyvUU0zBtGPCDdFVSZ3HGeR2xbduppxeeLMStHZ/LzNIWXmaoTff+V68Z77iRDR9oamrTXoNZiMAi6iY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g04oMU60K0z+F0S65mKmRXdZP6IKPHtB9B+w4k85Cy7jU+TFS
	CNY2E0oJEorRaB0YPWvB0uSNEnmMC1x+3XRWxWbmkOzjTgw4vBymRD8kmFUyjn3VjcO/eE/BMir
	O24zZfWsTzu/WSJbp68Tnjw5AE4R0w387OvHNlkzSoickTKj5+1tIXufkVnB9GTvdVlLl1ooa7P
	rxfi+oeQLB9YjotQ2J3bP8j4o1oEJX3/YGl+7yFs2aGwG11c4fNWjf1imTdI/uLpWeACivjcMwu
	L8m9ASQAZPXKU6xKOCBOU4=
X-Gm-Gg: AZFdTZcdycGdDCdBnd7R4ItQqEP9HMr8VCiE+mlPM+MQpZRbqK7vWrQcKQ58GeJoAPK
	sy68HBsQ+6zyNENEGehPKF8Eog9MTXur1yL4KVyAFp6HDFl1CVgpWY4nc8SgGtmN87m7Y5A3Dn4
	1MFU5Merq9PVd6e7M51pzPlyIErpvD2a45dncLIGm/KoeQOPk0Y/oSg44gZt4EF1aAAmHIxuGd2
	2XXdYoZY9mVjRk489ModNvaZNlbGG2t2ZvAC9RXDF4bpadujyXNIyuNeeYUzNkhhri5SEc+GsrK
	zYt5ysZRKusv3cttUNPrRECP0UhjWF5pq3pA4Ixm1qs9cxqEURyDtsRkoOXOheyEGTIneFUVunX
	D8G2f9zoMOPsLRLtJNKDbc8Za03nnScqaAqzdO3rGxi9ITfEh6z68hS8int7rg2HAKcZNM8018n
	y7G9Ju5fuY3MfwePbRcUtE6SF61g2E2uePIoqkaUe7Dw==
X-Received: by 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr20490592a91.20.1795703391468;
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae12863sm14881518a91.6.2026.11.26.06.29.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d846fd50aso44242821cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703390; x=1796308190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=ZFPR1khy3inJXkvlG9iIhay32WyQz+YPDwBRKJdV7QXIT6JZpoTmqZ6CbO88/swF9t
         7qFbA+z5clVMvTPUnahiztaSCMBuFUY09EI9HPfBLIZLakcf/K1bkVDCaKaITp+XCKSL
         a50rDba/pFW1CRpKBmPaRphR9XtumLRghy3AA=
X-Forwarded-Encrypted: i=1; AL+hErHFCbVEwcnN37VC69SUSd91xqxJ2TpREU/F0puPovXmCItgpMhdI39awtL1kzm03wQDfMXtTQcI2w/iaD4=@vger.kernel.org
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976581cf.27.1795703390135;
        Thu, 26 Nov 2026 06:29:50 -0800 (PST)
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976211cf.27.1795703389662;
        Thu, 26 Nov 2026 06:29:49 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
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
Subject: Re: [PATCH v2 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Thu, 26 Nov 2026 15:29:39 +0100
Message-ID: <20261126142942.881504-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-4-dev@deq.rocks>
References: <20261111120748.23795-4-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:46 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> After ACPI S3 the chip comes back without its firmware, but the
> interrupt mask can read back nonzero, so brcmf_pcie_pm_leave_D3()
> takes the hot resume path and every command times out afterwards.
> Seen on the BCM4377 and BCM4364 of the T2 Macs.
>
> When the platform firmware handled the resume and WoWL is off, go
> straight to the existing remove and re-probe path.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 10 ++++++++++
>  1 file changed, 10 insertions(+)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2844,6 +2845,15 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
>  	devinfo = bus->bus_priv.pcie->devinfo;
>  	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
>
> +	/*
> +	 * Without WoWL the device is powered off when the platform firmware
> +	 * handles the system sleep, as with ACPI S3, and comes back without
> +	 * its firmware. Its registers can still read back nonzero, so probe
> +	 * it again.
> +	 */
> +	if (pm_resume_via_firmware() && !devinfo->wowl_enabled)
> +		goto cleanup;
> +
>  	/* Check if device is still up and running, if so we are ready */
>  	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
>  		brcmf_dbg(PCIE, "Try to wakeup device....\n");

This applies to every chip handled by brcmfmac PCIe on any platform that resumes
through platform firmware, while the problem was seen on the BCM4377 and BCM4364 of
the T2 Macs. A device that keeps its power across S3 elsewhere resumed fine through
the hot resume path and now gets a full firmware reload. Please limit this to the
affected chips (e.g. check devinfo->ci->chip) or explain why a re-probe is right for
all of them.

The series "wifi: brcmfmac: pcie: recover from fatal PCIe errors"
(https://patchwork.kernel.org/series/1203582/) also re-probes the device, from its
PCI error resume callback with device_reprobe(). An error that hits during a
resume through platform firmware could start both re-probes. Please check how the
two interact, and make sure only one of them runs.

Regards,
Arend

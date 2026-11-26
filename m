Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709694;
	b=Xs6ngr923Q8PqYI+rPNL1kmhQWwiKjp0hPf4cWjc5ARMJB13zdVeKK9X3iLRg/e6VCXY
	 ohFlqDGgQzjowgbYkwo/Fclu9h4qBKerIeV4pCIznOebulMyM1ZFx1xaT4ieNV1fmNOeQ
	 JNOFDTgPeOjuM0ps9lejYq+rfMU8gCMccCLxtVqljd94qzfoyplpKNuKzgahs3dRVxa2b
	 /hm7eXHAc81kCa6DIxEliBnhnYE0+8hhxPVVEY3m9Nj3c6tNPqvlUQh7y5P3iunI+prG+
	 1UsQ7P5tecD5HG4LbjmAdwop6VVS5ymj+s7GaK9JCbLj9+94MvaRaQQupe8mgLoz93A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709694;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
	b=i8GH3PQ3Nt0HOnKFUc1MqRYrnfPRHMM7+BxXjOMAGDt/eKD+3zBfqxBuAAmz852eeXKn
	 YRekQmT2AxRvxCQjmNPCxS9hFDXTRCdlxxo1+KrNT9Tzv+tfNB70422vx24jrBKJLN//2
	 STHqqTurX6Q7NwDR+cv6yXSLhWNa8WMEVXuUl3BA/TVG+plYCKFSv59bXTBHV5FuhzS8f
	 OOTI0xNb8Ns6JgoCbF3RV0oo4T6Sa6WZju/5I6pEQltHBVUVoZiTImzeulFG4DB/BtQta
	 hSLl2rwAXFmdv2s580dOttO7DmjyCXJb/w2v611GTs9yaRQJYkbdmNFTyocnGZml/BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XAYFPliI;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDCA606A690
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDCA606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XAYFPliI
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so3679846a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709692; x=1796314492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
        b=NoTY5r4y+JWzh29DM9/5yBuHKSFrrNCmkIJ9TN6KOxwpvcSQsi+gVri8nVQM6rgqpY
         NRxWx0+JIahclQlY8LUCaOo0UL5RV9VxkNVca2kByDFbrGjzUDxfmSL89st4hlr3aOfY
         L0cMjBdLgOxUnXlu4b7/rzbrRi93EMlyK/FyOtksFNJkP1qP1je2477iP373p1GPEWgE
         lDFtcE2ZSgVckTAsyLE9kao/uRrzv5uGiSEyXXYWH5c//FpThX6xKLULAx/jmzakSffv
         ERa+7K0KZkIHP2stZBo0yqr42Q65TcqQJGJJMwEEv88Uwozujfbv5pW9pD7ZhCeyAHFl
         9CKg==
X-Forwarded-Encrypted: i=1; AL+hErGldGpaYibPtV+00S3Lr/EC9Nn+0haUtz4wOpUpgGd/wkSfXKzpM7D4sm3f+Fs+3TYO0HKrcjU1HTk4rpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mb4KxzdL+KatF15GOA/90X9VtnUKtk4N1lHZzAMfstoloZ0NT
	mKTYREeaISz/FdatAaOILvjrZ8aSbXYnTN/LlpBGluP/oo2dquLb2DKuC+qXnurxv4JuEiQviwp
	CzpY72lriulnQflpAUSRvXFeoxC+hJs41jdNNq0ZPVICxk2qoMy/pDHsBrdEuJud/0eDifUXQXi
	rrRg5p5n2G3wd1VXFIvi1emprfI5WCQPo/DyVMkf4FkUZ4qiNed7+Xc46Chgkg8EwkYLyKJdes3
	8hAxPF5XQl1cXtcvnLQJBeZ+Q==
X-Gm-Gg: AZFdTZf68nk5reU2uqjFey6Jjbr1jqzGZbrbiN/FJZMKejcJEqyh3dhUBjzem52TFpf
	0K4AVI6T2I29uTJ0AHofo9XINvqD62n/fQha3p29iMl/kx/AAcFERJU7DsrZB1q4WNwuMEMHsIo
	vSlyNcwmh8XpIOu9M5lW1dw0zvP0YSyF+p8DOt+ntJhgHAGSqwAvbTTqJlXSR/WH7DQgFsWXm+a
	YsCdMr4O153VbmUPHeZTJ8cQR0h+Bx0V88b8yiNMh0l5YjxWoFcjP40czfC9PC8qLLHsi05svw/
	SpjUMKwOjzF6nU2t7tPTwJVaXG+FBP2s/CQyeGOFtRd4qaYSE4wTUp6WPnC65xxMHwdOhNQqjy3
	tyr8hkhNb8FP1QHY3k0xxm61LSUWUgd8XQjB0/l8LUfaopM4pIRY6UsiV6jE7ave8CaS0Xv2zym
	GsZQmmRWbWzRGbKm/MQdOMRv+Tsi3dv6plbNIOYpQ=
X-Received: by 2002:a17:90b:3f0e:b0:3b3:b6c3:ff5b with SMTP id 98e67ed59e1d1-3b41c9059e1mr20200627a91.36.1795709692378;
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm15313012a91.4.2026.11.26.08.14.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so1309959885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709691; x=1796314491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
        b=XAYFPliIf6q89aTUSjSz0NJO8Xxe5BryDOfy+HjKkIIka8XNJgOyt63rNp+IUhBbao
         61KC9OlnPWzSGrYBb20CDgE/e/hRji9DjDBEt2XsLEa8WSAsKCakS8INXkmoTrXmGtLE
         6WOKgf74T56Qgk/64xeH2Vngbnv4HcytpE0n4=
X-Forwarded-Encrypted: i=1; AL+hErHZjVGDkQchwtv3TapWbNGsuCx5QDOkE2nx/qmtqysqimI9d7V/J7hg0mWP+vsp6BzD5Y4Xxl3Y/IDo1Qc=@vger.kernel.org
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id af79cd13be357-949bab480dcmr3591430585a.80.1795709691135;
        Thu, 26 Nov 2026 08:14:51 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id af79cd13be357-949bab480dcmr3591425485a.80.1795709690707;
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
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
Subject: Re: [PATCH wireless-next v2 3/6] wifi: brcmfmac: create and remove the AWDL interface
Date: Thu, 26 Nov 2026 17:14:40 +0100
Message-ID: <20261126161444.2484980-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-4-dev@deq.rocks>
References: <20261125190254.176055-4-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:51 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Firmware with AWDL support creates an interface of type AWDL with
> interface_create. The host gives the MAC address, the firmware
> interface index 2 and the AWDL BSSID 00:25:00:ff:94:73.

[...]

> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/Makefile      |   3 +-
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 288 ++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  51 ++++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   6 +
>  .../broadcom/brcm80211/brcmfmac/core.c        |  65 +++-
>  .../broadcom/brcm80211/brcmfmac/core.h        |   7 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |  17 ++
>  7 files changed, 428 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
> new file mode 100644
> index 000000000000..1ef6dd50958f
> --- /dev/null
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0

Missed this in the earlier review round, but all other brcmfmac files are ISC.
I always struggle with the per-file identifiers. If ISC is acceptable for you
please consider changing this here and in awdl.h.

[...]

> +	spin_lock(&awdl->lock);
> +	ether_addr_copy(awdl->mac, mac);
> +	awdl->adding = true;
> +	awdl->abandoned = false;
> +	reinit_completion(&awdl->if_event);
> +	spin_unlock(&awdl->lock);

awdl->abandoned is cleared here. After an add that timed out, the
firmware interface event may still be on its way. If the next add fails
in interface_create (the interface exists) the late event is claimed by
nobody, brcmf_add_if() keeps the ifp with ifidx 2 in iflist and
brcmf_awdl_ifidx_used() blocks every later add, as in v1. Keep
abandoned set here and clear it when brcmf_awdl_if_added() has claimed
an event instead.

[...]

> +	spin_lock(&awdl->lock);
> +	awdl->adding = false;
> +	ifp = awdl->ifp;
> +	/* The firmware created the interface, its event may still come */
> +	if (!err && !ifp)
> +		awdl->abandoned = true;
> +	spin_unlock(&awdl->lock);
> +
> +	if (err) {
> +		bphy_err(drvr, "AWDL interface_create failed: %d\n", err);
> +		return err;
> +	}
> +	if (!left || !ifp) {
> +		bphy_err(drvr, "no interface event for the AWDL interface\n");
> +		return -ETIMEDOUT;
> +	}

If the event is handled after wait_for_completion_timeout() expired but
before the spin_lock() above, ifp is set and adding is already cleared.
Then !left makes this return -ETIMEDOUT with awdl->ifp set and no
network device registered, so AWDL_START reports a failure while the
interface is kept. Test !ifp only.

[...]

Regards,
Arend

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378192;
	b=n15pfVOI7gfIESgtCbEnEUEpkNI4J7QMjeJQMUj3KvNsd4VyVZAVJ41ti9LnQeNt/yL+
	 rkxOj8b0jfvPoaGSTabHbzRF8l/LUGvIiFun/mTME4kqDuS2mH0jAV4gTm6tS5jpsjEhH
	 lMeMoWWfe1zL/bzPBmOf5GnUj9td4Wn95SmBggu8AbVjx3oI1vy39c0U7wuKuHLUbHI/s
	 udy88VbIWdivZc2ZrisV4f2qQiKCNN3/1z/3EQa/LUFQQLx4/TKGxctxDdkaEOLc+rn70
	 jQUv8TM/ohC0tJxi4qzJ4ZwIc23nNTgGGu2tQGqAh9FZMQ3SkmjS4c6y7QKk8Z4FS5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378192;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
	b=j7K9Yc8xp8qCkVDK6zoY6D8K7aFjnGLyPMh5wDd60x6tTaK5J0gOc8TZzen5frGnyB6b
	 bEKnkDWotTe9RtTw3Q4JHGNwfdOwhbcjqSPFabrmsPJ2OLS3zAimSPnLDcav9nZvs/mgG
	 1YkIPFsspvrQ3gQtZ6h5x8ifueqs/olcnIjsNtlIqqxlJURIhukx+nozVIEwYDJDlbeRU
	 4ZUW28E10Bjk65Y+EHCzBTC+tft5GygL0bFFIrPKVK0TDxo+6PLanANfwuP7D5JcQeE/t
	 QUT+luVbjCwYQtX4Oc4JBUxhMgge8srtrtl2tnZ4zm6EOHDtxasywVjVi1wqpI9sMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HVhIuyUJ;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD50C606A69B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD50C606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HVhIuyUJ
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2f07a960666so6964855ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378191; x=1795982991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
        b=yu0gyJ0ROy0c7QdzFzTZoeRx757mBqDManRdrapf3j2kc1t5V6VfDZIhmnPaLzqAbW
         pHrvQLpB2bC4L4nNe3AX/INYO/4jhe31ePegCSb3A7Mdq+jxJc12qlyRB7wu2awo+iLG
         Idp4MxJA5AyULS/SKb9JjIt1nmhNdoxxtDwPnEvIpnvHdgbGQwe5WyHKeHZCWr0X4kSw
         kRFWZk7SOt0eQfTpSbeKiJDeE2nclgayAu1mS6gboMK58XtVaz7b0lHbO0oWSBh4yepL
         P53RKYmpNDux5RRLNnIuyz82qLFteKjsKwXo9icZiD6Flj+gYjlkdRuHJHhtGQ6dKIvQ
         Yimg==
X-Forwarded-Encrypted: i=1; AL+hErEtsWtexu3OOB4zb5TIFMhyElngJ8mfcDrLEN63dTuH9LJpiQFXvIPu+VhYSGa3FwwT0ypcS1zxgVlUAMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IxcSHyaUW4efIRyHIcoZmXqT0OphPYS9Qqw69dse38ErTU4CE
	Bwu+wp9pWnj+0k6Ogryp89bhFPKPWpmQ6EnFmUbbtIDW2qopuweaduAhL2gSA9BsH2bjbvKxBKJ
	BPGMFnSBIWRZMKBQxoEOLjrGlIDWFjMyPNntRHqovDQe1SpDHLCl6dRKsKlujYdonGjojI3bzG+
	nT82atC5fOpulkBB/Uv2GtRx0FciVrPBqCn+4xBs+FKmA+HL5ce+1cMkOD5JZO3kbq4Ty4qM/x8
	sXdRoeqrYldKGZObSFkZCg=
X-Gm-Gg: AZFdTZf1qGJQmWBfmgKtAy8muUUFOnatkTbp/p4T348yaEcxdU2PuZriapgYPbYy6Ks
	/S1D0uCRGduuOp1t7ZQht/Q6tjYrFRtiODmSl9+46IOclxfo3mjTbF27V8Kdd7Og11t8+D+lepL
	FnD9XtsmyZ9vQKHA18xebgTWdMwNapa8MEhbk/0HCXB9DzFRvVdF5gkXGJ3Ik4lnsOte9KIq70W
	Qz4fe/NLoUyF0ltrPHb139pofFUdCk66XXIxbCwgUP7pY+PbVXOGZQGAPnD+r/UwL6C7FF1FEbV
	P2TulpVK+WCXrBisIfk44oto4h/EJBLVdeZxiQ2pDmGVVO0npPAohTWbphihkylaxvOMLKWwVaB
	bxJuzAMB4vvoWCBQH8KVceDhTFlxzqLRr0WefUBZP5OckFTcB81q67bORu7j4ulVeBTrVzZZt6i
	Bk+piNJc+ck2wepjhSY8lDp3HQ4YIgHEEk6xDKXkwP6Q==
X-Received: by 2002:a17:90b:4d10:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b41c852d1dmr9503316a91.5.1795378191031;
        Sun, 22 Nov 2026 12:09:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d224ba3sm3587235a91.1.2026.11.22.12.09.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so591199685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378188; x=1795982988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
        b=HVhIuyUJwerUKXF8nZbBnPP6rrHrJclhwtEvEeT/9oX8wumXwWGnu9dSLXewHNOr3P
         cH1aGhScaxFw8kta4LUrRuIL2u2nLS9miFADSjOtWnwT59VMbqax666Ihdh5A+GR+J8P
         /xBkCGB6bctUSx+ymHlFg6wJBHzq5Gap1PSgY=
X-Forwarded-Encrypted: i=1; AL+hErGbxtWlxxjuKq88TedgXytVTE6xVlMvGGFZeU5nBkdj+ViI0Ipb23mkwsz3h/IUAymJQI2FYI1d7SnxZU4=@vger.kernel.org
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr1628683885a.38.1795378188446;
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr1628681885a.38.1795378187987;
        Sun, 22 Nov 2026 12:09:47 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:47 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 7/7] wifi: brcmfmac: pass AWDL frames and role changes to user space
Date: Sun, 22 Nov 2026 21:09:31 +0100
Message-ID: <20261122200931.2090372-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-8-dev@deq.rocks>
References: <20261104151547.70333-8-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:47 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> User space runs the AWDL election and peer discovery from the AWDL
> action frames other devices send. The firmware reports them with two
> events on the AWDL interface, ACTION_FRAME_RX and AWDL_EVENT (98). A
> header is in front of the frame. Its first 16 bits, high byte first,
> are its version: 1 is struct brcmf_rx_mgmt_data with 16 bytes, 2 has 24
> bytes. Both events come with either version. AWDL_EVENT carries a frame
> only with some of its status values. AWDL_ROLE (97) reports the AWDL
> role of the firmware in its status, 0 slave, 1 master not taking part
> in the election and 2 master.
>
> Register the two AWDL events when the firmware supports AWDL, so the
> event mask includes them. Pass every AWDL action frame (vendor specific
> category, OUI 00:17:f2, type 8) of the two events and the role changes
> to user space as the vendor events AWDL_FRAME and AWDL_ROLE. Other
> events of the AWDL interface are dropped as before.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 122 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |   4 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |   8 +-
>  .../broadcom/brcm80211/brcmfmac/fweh.h        |   5 +
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |   8 ++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  12 ++
>  7 files changed, 151 insertions(+), 9 deletions(-)

[...]

> @@ -324,11 +324,13 @@ static void brcmf_fweh_event_worker(struct work_struct *work)
>  			ifp = drvr->iflist[0];
>  		else
>  			ifp = drvr->iflist[emsg.bsscfgidx];
> -		/* The AWDL interface has no vif, its events are not for
> -		 * the cfg80211 handlers
> +		/* The AWDL interface has no vif, its events go to user
> +		 * space and not to the cfg80211 handlers
>  		 */
> -		if (ifp && ifp->awdl)
> +		if (ifp && ifp->awdl) {
> +			brcmf_awdl_fweh_event(ifp, &emsg, event->data);
>  			goto event_free;
> +		}
>
>  		err = brcmf_fweh_call_event_handler(drvr, ifp, event->code,
>  						    &emsg, event->data);

The return value of brcmf_awdl_fweh_event() is not used, and a
failure to allocate or fill the vendor event drops the frame without a
trace. A bphy_err() on those paths would show why frames are missing.

[...]

> @@ -94,7 +94,12 @@ struct brcmf_cfg80211_info;
>  	BRCMF_ENUM_DEF(FIFO_CREDIT_MAP, 74) \
>  	BRCMF_ENUM_DEF(ACTION_FRAME_RX, 75) \
>  	BRCMF_ENUM_DEF(TDLS_PEER_EVENT, 92) \
> +	BRCMF_ENUM_DEF(AWDL_AW, 96) \
> +	BRCMF_ENUM_DEF(AWDL_ROLE, 97) \
> +	BRCMF_ENUM_DEF(AWDL_EVENT, 98) \
>  	BRCMF_ENUM_DEF(BCMC_CREDIT_SUPPORT, 127) \
> +	BRCMF_ENUM_DEF(AWDL_STATS, 150) \
> +	BRCMF_ENUM_DEF(SDB_STATE, 152) \
>  	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_REQ, 0) \
>  	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_FRAME_RX, 1) \
>  	BRCMF_ABSTRACT_ENUM_DEF(MGMT_FRAME_TXSTATUS, 2) \

These event codes are specific to the firmware used for the Apple
chips, but BRCMF_ENUM_DEF puts them in the common list where the same
numbers may mean something else on other firmware families. Use
abstract codes for them and translate them in the WCC vendor module,
like cyw/core.c does for EXT_AUTH_REQ:

1. fweh.h: replace the five BRCMF_ENUM_DEF() entries by
   BRCMF_ABSTRACT_ENUM_DEF(AWDL_AW, 4), AWDL_ROLE 5, AWDL_EVENT 6,
   AWDL_STATS 7 and SDB_STATE 8, after the existing abstract entries.
2. wcc/core.c: define BRCMF_WCC_E_AWDL_AW (96), _AWDL_ROLE (97),
   _AWDL_EVENT (98), _AWDL_STATS (150) and _SDB_STATE (152) next to
   BRCMF_WCC_E_LAST, which already covers them, and add a
   struct brcmf_fweh_event_map brcmf_wcc_event_map with these five items
   and n_items = 5.
3. wcc/core.c: set fweh->event_map = &brcmf_wcc_event_map in
   brcmf_wcc_alloc_fweh_info().
4. Register the events from a new brcmf_wcc_register_event_handlers(),
   set as .register_event_handlers in brcmf_wcc_ops, instead of
   brcmf_awdl_register_events() called from wl_init_priv(). Keep the
   BRCMF_FEAT_AWDL check there, and export brcmf_awdl_fweh_event() for
   it. An abstract code is not range checked by brcmf_fweh_register()
   on a vendor without an event map, so it must not be registered from
   common code.

brcmf_awdl_fweh_event() itself keeps working, the event worker passes
it the abstract code.

Regards,
Arend

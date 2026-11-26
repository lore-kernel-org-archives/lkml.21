Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703399;
	b=mAfyvlFgAiC3BeBmPb/qA9UabbI0W2YznwS4jfkLaZHdT79tfGqKLTvpNaWCH+DD9kK4
	 RBxfNsSINN3Imv84WPYFmzzgC5BJqaWuUoEFtF1ok2MZbby0H7FYr5nQmPtiMNgBlEWVj
	 YPjMmItW9hdlgtMMC2HqrkvqeIayqpHGCX1KaCKZr+LORmaN4s/ucAJRovnWuGrqY5ccv
	 5LwB33wjhARxpK2bhNj8ZEbwGWrtZ2coj3I2gHjGTcOzp2HcG14pR3AXT9iqyLLpIrGP2
	 boEBUFsPt7u29btRc7JdtEXior6uE+j+PTTMhtzHVwv7C5pDKh7EZ7IlhGvLK1p5/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703399;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
	b=KQJN2uj3J+YiAxe1/goWDNtw+mpVPYwmZXGRXnS7SPpSrt0PapT3bhRr+Io5bzQPzX51
	 jGDv7rKxHBn9Tq9CI85fCCn0Zh7gJ0xol+5FNYxDHlccmPt3pt5FBMwdigDLIqOTHZdKn
	 3DfQysfDsu9/a5iF/j5fUJR0Ct2UIZgsXHx63fNxTCwEuZ8rpStxSdutEbiLw75GMgsTp
	 Frxay9xcMXQlRkt41Xdj9rknu7U+YtZ0jGWmBLTWxMR3zppzX/2fOCbnIL+b/FxxjWtmu
	 se1MQubicMwtEmAUh16TSOBTgZRP6p+z/TUvbOrmz4g+Ua7Zz1E6M23nnbczT5pLKlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E3qSJN1N;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3E606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C3E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E3qSJN1N
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b413997581so5369305a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703397; x=1796308197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=bKe7pf6IuYUtsxc3EufGEWmUzPKMC2+PXAtOy1oXucQRxWdn26pInCDJRKmixJ4od5
         Hs0uYqlQW4FvNFxND8I95eaHWydySwcIkAWLw9UlyhCq4AEeU6F9aejBMfV7Rq/QktuD
         JgXD0BTGblqwpMPmSgg2yfdBqOEIFT+7tIvcd6PU50ryIt/oOUbF0c4yahRJPJjW3Ndq
         aBHReNHKcu4sBv5UhFW6XVdmpJo2o6rjbkob1lnyogCvjqoxjvGTN0M4+Mx+GSWFw4c8
         mVwmOKeXgGN3GLslsVRWcrZ0Fv5ehf8Ja/GeqxQcCZAivdKUTEKzNK0ym9Q9rr6dWzsp
         vGVg==
X-Forwarded-Encrypted: i=1; AL+hErEzWCyy6s8yryTNnD1slKtRhl3fiklDY0oUVoBv299vwqT9bBijNCtpou4SUpGDfm2LYONg5ue2qD2+tfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SEaLinHleMzApl3VN8gALZGDWVsNyc9shUzhKxj/xraMnHOV2
	vPfPlA/CAYVhPctSCShSCKCWlBtQ3bkf0cH4WyOxW1PRRRSF2Kj0XA8QlyNybSmDYIvtBRCrgcw
	FlS8jP5aIeXrzazKlKoY3FDXdw3wlldfVS8OX7M/Bj+PUubhQnNVBPHGi+7Kk2MNnbbFLgAtaNy
	n4EM8VlNe4T8MLmtkUPqHZkxBNwNeEUzgPTrA8AP/uwLZDgrE9Fc7pDk7SzSxy3ZJRtarXjFIgS
	/nGRs7cST9zZiltUGuoMkw=
X-Gm-Gg: AZFdTZfpB3J9yXYsFzIgzaIGzcMplePh2QOKJXUfpAyjeEEBu5cyvvgHsGEwefpIY+k
	5dIhagBNnBgH1ptYl6YfIce7unwkHYLP6amdOOBqMyDD+IubN7LKIELud+jue18rlfA2NgEkwE+
	+wX0FWdEoKdV/ZWl79hNd+VmdsrASvEnYuxWt7JXAuI0vWPJD0Ezsn5BEvqlpBQpG0vwc3m10ze
	GhatOvP/rkySt8dGJZBDoPyksF0NKHQz+AwolnYcAFbr7ptxGofxGEQS2e1x+zOUVgdAeE4vQ7c
	lgHZEx4KQG5I2FFr7iuW1daInij/sNn3ge/BpPCOBYWz9ptne+Kmsj3BoOoYJTb6+onGAhb0fPl
	j1hr150wgF07ol57oz9lu+Bo4OFKXnEQN9rNllhYd4CqkUdzm1F2t+7AtIrHFROtMWaNhYJliDe
	QGUpeJyx9+E1ekGza02GkZfyi1AZjaydiThbZtgAI=
X-Received: by 2002:a17:90b:3d92:b0:3b3:a74d:f848 with SMTP id 98e67ed59e1d1-3b41c8e1711mr15945227a91.15.1795703396995;
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm15196717a91.4.2026.11.26.06.29.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d994579f9so74985661cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703396; x=1796308196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=E3qSJN1NmFofxmW5lg0sxHhX2UuHUvyA3cjthfdoPhSM/ciFVHcCE+q4BDwi6SQysp
         TXCoASbE8Pk1h1QK2LJ6jjU3/oGXVXwPPJ3gAI5tAoqNASgPgOITTpmU5IuzmQPyc3fy
         Nf5aOEP0urwGvy4p1F1Utfu8Gs2WkZFoc++h0=
X-Forwarded-Encrypted: i=1; AL+hErEiSb+nF6vYyVtP1T96e3CUW8MF9gLLttfYHNfVVCh+CHoUo7FM9TDRDItAeK4LTQgCwy0XBl8/CFUA7As=@vger.kernel.org
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66784061cf.5.1795703395477;
        Thu, 26 Nov 2026 06:29:55 -0800 (PST)
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66783611cf.5.1795703394993;
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
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
Subject: Re: [PATCH v2 4/5] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Thu, 26 Nov 2026 15:29:41 +0100
Message-ID: <20261126142942.881504-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-5-dev@deq.rocks>
References: <20261111120748.23795-5-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:47 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request. brcmf_msgbuf_delete_flowring()
> waits up to 100 ms for them before it sends the request, so every
> disconnect logs a timeout, and the cleared counter goes below zero when
> the status arrives.
>
> The race the wait was added for in commit 0fa24196e425 ("wifi: brcmfmac:
> fix continuous 802.1x tx pending timeout error") is covered by
> RING_CLOSING since commit 09be7546a602 ("wifi: brcmfmac: fix scheduling
> while atomic issue when deleting flowring"), and late tx status still
> releases the packet. Send the delete right away and reset the counter
> when the ring is created.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The race handled by 09be7546a602 is the posting side. What 0fa24196e425 also states
is that the flowring must be deleted only after all tx status is back, otherwise
pend_8021x_cnt never drains and every connection is delayed by 950 ms. Dropping the
wait is only safe if the firmware returns the tx status of the queued packets on
flowring delete, before the delete response. That was only observed on the BCM4377.
Would be good if this can be confirmed for other chips as well otherwise (probably)
better to keep the wait for those.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -73,7 +73,6 @@
>  #define BRCMF_MSGBUF_TRICKLE_TXWORKER_THRS	32
>  #define BRCMF_MSGBUF_UPDATE_RX_PTR_THRS		48
>
> -#define BRCMF_MAX_TXSTATUS_WAIT_RETRIES		10
>
>  struct msgbuf_common_hdr {
>  	u8				msgtype;

This leaves two consecutive blank lines before struct msgbuf_common_hdr.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -1471,23 +1475,16 @@ void brcmf_msgbuf_delete_flowring(struct brcmf_pub *drvr, u16 flowid)
>  	void *ret_ptr;
>  	u8 ifidx;
>  	int err;
> -	int retry = BRCMF_MAX_TXSTATUS_WAIT_RETRIES;
>
> -	/* make sure it is not in txflow */
> +	/*
> +	 * Make sure txflow posts nothing more to the ring. The firmware returns
> +	 * the tx status of the posted packets when it deletes the ring, before
> +	 * it sends the delete response.
> +	 */
>  	brcmf_commonring_lock(commonring_del);
>  	flow->rings[flowid]->status = RING_CLOSING;
>  	brcmf_commonring_unlock(commonring_del);
>
> -	/* wait for commonring txflow finished */
> -	while (retry && atomic_read(&commonring_del->outstanding_tx)) {
> -		usleep_range(5000, 10000);
> -		retry--;
> -	}
> -	if (!retry) {
> -		brcmf_err("timed out waiting for txstatus\n");
> -		atomic_set(&commonring_del->outstanding_tx, 0);
> -	}
> -
>  	/* no need to submit if firmware can not be reached */
>  	if (drvr->bus_if->state != BRCMF_BUS_UP) {
>  		brcmf_dbg(MSGBUF, "bus down, flowring will be removed\n");

As said above, I do not think the wait can go for all chips on the evidence of the
BCM4377 only. I will see if I can replicate this on my 43664 device.

Regards,
Arend

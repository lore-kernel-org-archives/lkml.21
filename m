Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973286;
	b=l14idjseseF3VCU0DSmbI4sHk9RWE78U5b6MdsWlAXMKbokouhMCGriQVcMoi1Cbdpyz
	 D5RvvvM7Xl3ZEcHpJ2uiveuscfmSHVtNQVxqJ0F5Ft3y5W4kdUxq6cJe00u9Qr8WLOhKL
	 fEFEK5gOeDl3mMtXw8Iz6HX13wOAxXNGYfWSB7/W/GP4X9ZaSTg6nDvRdhpGslVYN7hq0
	 TDB+Bf0GqB2dqVfEoqdYtVWTbA/eDjMXEukskJAarezfa69zqsdss4NNc+xwYckyLlCx2
	 P1xaJ+p2WmtTXryUwc6iewXVPwdoY4sUV5mtEMMH5lg2A1gdoHQ8KLNaZyzDdbDvYKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iLN4MW9ODY9ox27u7mAX4K/WuNhddDvFTBwZkODNj54=;
	b=cj1S4efy/WLVIzaLehTSrGFclYrdVfJSaSJMiIIlSWO7puhYVW1X2PbNuIpqw730DubL
	 XkkBowgCiNqHsBzRk+3XhzEUZZXv7MrlbFhUN0SXRXfvcx6wFHWgukBH4JnNfQPH/fbGw
	 E6id4hygUioFs41iA7IFP4wdtAgF/HyC+D/CVsm6oRSv7pAZYF8r2pz8T7QNLUgdJ2B3+
	 4ZfQVb+cOjtip5B3qcuCVkFgmZUYHm/q6/PGE6y1lXVv8yGWtIdqom5vKcL/VDVTTadAR
	 gGn43GuLswUjOPxbLIerRUDbGqIzgf4ZeI9JlFe024HZHv69wlYWhX6Mxn87NriGywA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aPhecY8G;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0C606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B0C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aPhecY8G
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2efde3200c7so1917295ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1794973284; x=1795578084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLN4MW9ODY9ox27u7mAX4K/WuNhddDvFTBwZkODNj54=;
        b=aPhecY8GMBIa+nYNDpQ6Nw2J0g1Ci7+fFM7OT5D7R+XeseB5C1wIN39R7uMhX1qwpT
         peQckTbsk/IZmg0uS8s8NcPgsNBNtzE59Cn4tTwVR6T4LHF7jtF2PE+EZ06mqQfw743l
         96vKj4zzO5vBilTrSwtCJDcIePWbU8uxVXNsX+BUUcnUr/OJ7ZH0P09IbLrzRqZJpZuC
         YzleiisHJ1m+ROsfbbjNkU2YzVBEMtk7g/3R0rKu+v9Gwib34WwyU2TL72xgcxuJSx4p
         rfw28K+OhD3SnY2T48m/MLP+tTTlcQm9KgpjAKZcWr4F8Y/WjCMyY4/Owk6PYEzAZlZt
         +6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973284; x=1795578084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLN4MW9ODY9ox27u7mAX4K/WuNhddDvFTBwZkODNj54=;
        b=DjDjYCI3o18teot3yazHRlEFV69Oh2dRWOMxESxABkQsEDDgsoIatEZcEI9p30AB2h
         GTvVyEt6aO1tYXKlKpAURTHuN/nO2L2kCXT2pOouto1+MNgvSNNfpeh3ZPjXCwiDDxgp
         UyhAIefDPo96vJfvnAxYC2OOsvo8ssFwHvR7yw/+o/Cjd/YV1G84NVSRGcAHcXhZlo5H
         Za+HKlFVIkRDbBcFWZIqlIUJjMICrNi4tXQM0VQyTL0sylPWoh7bqW0Vz2vQWc/AVThD
         LVsOrWUPNyFcPjGxcWn5rY8KJsYjQqqtWG1FVZKFwZx5CFqd6Zct/D/bMtpts5Qev5zV
         8lcA==
X-Forwarded-Encrypted: i=1; AL+hErGMfQrzZcUuL3uGHU/0vKwHt1+HC5AB7uKSgaAgBmCHaRcmCCVE9dk2YO15CTNZWG37o5u4KFohzwZMc9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ip62CQbNH7wMfr35wHuyWC4qUhOnkD8M6IY5hC5Kpiq1Bvtof
	gEPP0s+baGXzt1zK2lrOG49EBLK0orwQuySDNnUJWqBqUFieEAG2zjc5IwYmkOZyQn7n0GvImiF
	c0GjFuPKNUQ==
X-Gm-Gg: AZFdTZe34KfnSL8OuKgina2kF3CkXDe3PbJ21LmyUoIehkCEa6DR47riKwIz6JpEawY
	QJqBdwyd3YI4HV2xVieUnjt7KpSIH9gJpYBuRrvok15HP0ADq/AkK2eaYsgSw5kHnqEVJ2faRSN
	58u51fLtnU6fRI5KcRggoWWU7XnnOddICNpuoR2oGJW6ucsyYo+fiWHY/hazYYzvS21YKi0NDF5
	J49l0QXCF2CXU/hdW+BFzw4ahY2tPfqbwcCwfRDZzCQU/nDOnkSz32sMqfn/0IDtIN64CWm4iEF
	LICrV4J0wPXpeeZX/Oa1fibFb4dsopbKHuRr7ShTYgu2f8XFcDm4+i/j+SytGb4R9v2J8BJ/X+G
	C7vOtJ55891Y80jDxZR2hXtTGq6t/9fRDlqGklqOHu48UKwpmcgV9uOPL7DUB6Yzlq21wt0NziL
	u++IaBj6D8lu7YQI0w0zefslJWZbvwVeXKD9r0hhJrkoQk0mJVxkPFNT2sPbOkWo9JhEUlGidsF
	9LjinbhO+eu4VgfC369tnKZ6PtV1mwS+S4qVfTl4cch+v150hrE1uovA2lQjnon3fcaxld9XnVP
	hRv9GW6bTu/Be57jwNJHGsnAv6IJVKSI9teZ6sPteYYh6eZd09Ehmmc//1NGpfKDYL5CohhiSi5
	wMQ/b6YuQFZDo9SA=
X-Received: by 2002:a17:90b:3c04:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b3d079ffb7mr1117572a91.22.1794973284230;
        Tue, 17 Nov 2026 19:41:24 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d143d69csm1793636a91.1.2026.11.17.19.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:41:23 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oliver@neukum.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Jan=20Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a stopped queue
Date: Wed, 18 Nov 2026 03:41:22 +0000
Message-ID: <20261118034122.315979-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
whether usbnet has stopped the netdev TX queue. Since commit
ad70411a978d ("usbnet: fix kernel crash after disconnect"),
usbnet_start_xmit() frees any NTB submitted while the queue is stopped
and increments tx_dropped.

This triggers routinely under bulk load. With the default 16 KiB NTBs,
usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
bulk TCP stream stops the queue constantly. The TX timer is armed while
an NTB is partly filled and keeps running after a subsequent packet
sends that NTB out full; when the timer fires while all 5 URBs are still
in flight, any frame left in tx_rem_skb or tx_curr_skb is flushed into a
new NTB and dropped by usbnet, causing steady tx_dropped increments and
TCP retransmits.

While TX URBs are in flight (dev->txq) or completed and awaiting
usbnet_bh() (dev->done), usbnet will wake the queue again. When the
queue is stopped under those conditions and cdc_ncm has buffered TX
frames, restart the timer instead of flushing into usbnet_start_xmit().
Keep the existing flush path when nothing is queued to wake the device,
the interface is down, or the timer is disabled (tx_timer_usecs = 0), so
the timer cannot rearm indefinitely.

Check the state under ctx->mtx inside netif_tx_lock_bh(), matching the
lock order on the transmit path and keeping tx_reason_timeout
serialized.

Fixes: ad70411a978d ("usbnet: fix kernel crash after disconnect")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/net/usb/cdc_ncm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index e92dc7f011ea..e5d659dd7436 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -1509,9 +1509,26 @@ static void cdc_ncm_txpath_bh(struct tasklet_struct *t)
 		cdc_ncm_tx_timeout_start(ctx);
 		spin_unlock(&ctx->mtx);
 	} else if (dev->net != NULL) {
-		ctx->tx_reason_timeout++;	/* count reason for transmitting */
 		spin_unlock(&ctx->mtx);
 		netif_tx_lock_bh(dev->net);
+		spin_lock(&ctx->mtx);
+		/* usbnet drops the whole NTB if its queue is stopped. While
+		 * TX URBs are in flight, or completed but not yet reaped by
+		 * usbnet_bh(), the queue will be woken again, so keep any
+		 * buffered frames and retry a timer interval later.
+		 */
+		if (ctx->timer_interval &&
+		    (ctx->tx_curr_skb || ctx->tx_rem_skb) &&
+		    netif_running(dev->net) && netif_queue_stopped(dev->net) &&
+		    (skb_queue_len_lockless(&dev->txq) ||
+		     skb_queue_len_lockless(&dev->done))) {
+			cdc_ncm_tx_timeout_start(ctx);
+			spin_unlock(&ctx->mtx);
+			netif_tx_unlock_bh(dev->net);
+			return;
+		}
+		ctx->tx_reason_timeout++;
+		spin_unlock(&ctx->mtx);
 		usbnet_start_xmit(NULL, dev->net);
 		netif_tx_unlock_bh(dev->net);
 	} else {

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1.703.gf848ed807c-goog


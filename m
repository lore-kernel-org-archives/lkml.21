Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111389;
	b=eNt7ux+B7kmH8j7WdF84rixqhC5BiAjrLrNuXzPo6HoGIgudMDJ2R7Q3X9rdRPvifWO5
	 wT5mC52SSO7XVW+IpbGbQLdvQX9kJqruVmwwwE8wMr/edwfhG67HhVdyr9pTtK2UYRrpA
	 odMF02UBIMk9m3giuBQBr8VAh94XQmSS/RIEm6KyH4PnszifjnEmbNJiTWiNQanjJmDYw
	 G+T7Qfoo0pMLcafehCFOtvu+E+qaFU5NpUGRkAAZWgGzPFtpgbIAr0LQz/qBeYB3BrfXt
	 883k1NQ26fZEziikBmyFnk3zOowqk4Z0bTHbFN3e0BQopfVnVDtFQSBU3Ccc78+0U4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
	b=EPVyFaATt/kISeINhQCkl7w+B4/hGnkMtTbn1uTBhQNV73k6tjCh/TnY7iLmpxXYtKZa
	 w52jO24sn2nwWGx+WsaeP7vhbXKUY5n4hnVhRD5axvXiVPxfWCCjftNYyS8ztDJ/ILSbX
	 tgAVAFGhr5fDlcr0V/DLNvTs9/QupYY9VvUXPe4Gnao4TOIsFUmwZDl6/Ygi68en6Mh/X
	 jHEEGidWxssKhC8cLHqkoHbhaaRj1AUjm88e3GIRGTYeP3rIv17RYb1fDzUZxcmYGeuHo
	 hT2pzijvX8KSxYcoXC20UkFNs6C/8XXi5ao92kX5Vpi9ps3C3qCetaNDp7DG5jTiNog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYEpxgBw;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD9E606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD9E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYEpxgBw
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-702fd86d674so1771948eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111388; x=1795716188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=DYEpxgBwNBU9ZlLRYeAhl+VOhhcyolS1iutkHkIZMJ9kiaeJ1r0CA0jkLIc/iyBk1W
         112kcn3WGBsArIWl1rG5mZAwDixuG7iqQveilbXR8/vz4bJ+B1eeHsWkKr5ScXkh7QTL
         QyFg+zYIkKsI1R64Ka/g0fJWUIT+aTMSFqV8wuN4Fy36KJQat+7olupQ0VhHJOLqSLnz
         XuAFDTGNWF9mNFVpVvaBs9zvN8OTNUR+IbWbqJd6AkL+w4XdtcljwinV/48smMNvt3eR
         ZGuUWr8hirI3DNYTdRPKL/YXQLWDtcw+ISXLJ5yl2NZQy5Y/llVWw9dheKI+4/ylB5Ay
         Gc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111388; x=1795716188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=S+nnj4I4t4uXZiQIW2SIED4EA4Dcz26ryenU7O1GgDFAWDdi1Guas/6fJLSbqxN1il
         wSPWxpgUKOlwxgGrUE8WAHEf2sd1GJbgDXnSDyW/duChiih3myAaBiUl5XqNHtvN1JRx
         RBOwsMZ7nkD2MBgPLqAxi9GgR0Af+jBIw58fctyIv+uUWoZT3st9B+40yUv5k8KbJkvo
         bVDQoWoRH+xEzcCjYD2NzjOvNC1VE78q4I4wX2+V3Bs/6LnpxlZiVB6VtLgw4XK5cYb/
         yuA+Sn1JR/IDtYx3FKeJ8UtqqliL4j82XgI/UwE1CvolwzCBotIbLQApeBKd5RBdsNT2
         RKzA==
X-Forwarded-Encrypted: i=1; AL+hErHgycpwayhobFSGKvn30K2+LAyyk0MxYRHymkf/3Qwu57oXrQz0L63mvFg5h0h9QkVENXofTdJdUft+Ceg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c63pZaq/en1aqDOjnRNvUwG8CAHuuWm6IxTXdxRu77FxZY10P
	RqNhLkXm/iCmcuSZymGfcnuFpFG8TPMqSoeni2GZZ+lKBMpcQnit9OFb
X-Gm-Gg: AYBFou2ADx+GwbBdtv+49m6JOKbQIJxoT0WZqIw04lDozVtA6Lu3eUwlJew/djoZTsj
	zm7anKREgbBqbCY9Ij6wkX9dWT80cuPa3ie4pHdDImGxJU+n5CoBbeBthDZJ6g16gDxrYdUoeuO
	SJiDUbIXSuu4MeksV2uHnJVs9W6koezbpd25FoJ/Jy3DemUqPjLI0P4mBha68xwVsDYA4LAtoCN
	ZJ7GOwwgLw/eig0s2hlQI3e1JlgyJi0jBFjsVGwaKcdXkbpttTjZA+fNvHXHyHTg2Rmb9SyZ/Nl
	Hh6u35omQAMq9k4fCJcZdJueB1QQ/e5oRQFdB7FGOQGtO45G5GPiWwpmscxalNIsh7DG/1UFYFD
	bA1HUev1G++2vrE7X5Ivxtq+lqfg0vht6kVIHMaUjJWUhMaQrpbYaZfn2qDBUqy4p/Mil0pKz/z
	kWV3nVzlUAFJLZw5A7MmUZEp1sLGbGg6/T96nU57y4qv/H8IqbvpIpref3Lzp/THltPnkEIj09Q
	nqCfXPY2+fLt/lO8NI8tgWS3LmnMZrFX0cUrmxCUPQnJzTnrB//An8lNL6ABduIhmqTbzZaUO9i
	VznXFLKpX5ClIF8Z+dvCP77FL94SlZbGXgNVqhM6Of3efxD9XQEYh16xxTW1w6mgkOf8FzUy/kw
	TEM/gxj/PSxHeY/H9duOkazh0BAPP2ZL10dJIZjFUa6KpphYS6/D2qlt2KE2wfzFtw0tx4KfihE
	ISmN6FMJvd+mxGZKxt07SRn4a1WYBvW1iVvMBsgA7bKiKWuvtcBPF6
X-Received: by 2002:a05:6820:340a:10b0:716:db9f:682c with SMTP id 006d021491bc7-71b3960e47cmr234297eaf.69.1795111387559;
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:21 -0700
Subject: [PATCH v3 1/3] dmaengine: virt-dma: share deferred descriptor
 retirement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-1-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A cyclic callback can retain its descriptor after the tasklet drops the
virtual-channel lock. Collecting and freeing descriptors during atomic
termination does not wait for that callback, and clearing vc->cyclic alone
only cancels a callback which has not started.

Provide vchan_terminate_all() to clear the pending cyclic callback and
move submitted, issued and completed descriptors to desc_terminated. A
cyclic descriptor moved to the completed list by an error path is still
retained; completed descriptors already detached by the tasklet remain
its responsibility.

Leave prepared descriptors on desc_allocated: the client still owns them
and may submit them after terminating earlier work. Freeing channel
resources, unlike termination, still releases these descriptors.

vchan_synchronize() drains callbacks before freeing or recycling retired
descriptors. Repeated termination leaves them on the terminated list.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..f753c6b62d6b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,25 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Submitted, issued and completed descriptors stay on desc_terminated until
+ * vchan_synchronize() drains callbacks. Prepared descriptors remain available
+ * for submission. The completion tasklet owns descriptors it already detached.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	lockdep_assert_held(&vc->lock);
+
+	vc->cyclic = NULL;
+	list_splice_tail_init(&vc->desc_submitted, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_issued, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_completed, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +251,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
  * Makes sure that all scheduled or active callbacks have finished running. For
  * proper operation the caller has to ensure that no new callbacks are scheduled
  * after the invocation of this function started.
- * Free up the terminated cyclic descriptor to prevent memory leakage.
+ * Free or recycle terminated descriptors after their callbacks have drained.
  */
 static inline void vchan_synchronize(struct virt_dma_chan *vc)
 {

-- 
2.53.0


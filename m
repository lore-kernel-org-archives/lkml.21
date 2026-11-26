Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656971;
	b=e4MhIPzd3yRJAk4I5Z4axCTlcGEW5VUSqVMwshB32JOYJDjKKZU55iNgsgMJTq6EFOVu
	 9Ov04Sk3lKnTeJLT9Pv5u8njhnS1jhniUDdQd5quqWYL08GWdrxslYcw6ItJRRmA2EoKK
	 gu9jZYKL4PDDXxgtvNxau0VgyWvJ3HgiIHFjV4B6eMoGzomo6O1x5muIcdQDy3Mw9OILg
	 TEkDie7RTCmvULCZo/+49onILGO8u5TrCzmcOAxKvcH/XxYVxT/eKzhw6al87f/92jLky
	 lrSZYN0FygTcFoF8dwG0nlzCDtn5Hcy+FPzl1nYLAnGGetBy6t/rPlFiT/egeEWdsXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5tMp4+nCkrdqMXbrytBsy8KUnTj5f9f9jbnW4fe3cDk=;
	b=DtxHzasTCkC1Kd/tQoFgqQJHV43TCZ9R2FysnbHtqEKdM7JhVydkkZ8Ly39PqF9yvLCN
	 +EmVw49/knsEzsXljScn+rqohpaNLZ29+4v5yx7ODuNZxuQy3kaE7f11RyVFWwn5bPhZK
	 TOugpLImbgUJL/nVCcJrd/DgP0lgcyBla5vUdVB9TM7b1wxnDd1+5828F5LTYSHROSI3b
	 75JNUs3r7uowl715yfaFPjoIwxVSDjv5Zo52vdemVbXlRBEeGrFoksOduFxhQFpIgRUaM
	 ac5rILUQaFJA3C3t3VGSiQoYr2ng5BqMhcbnaYSWNNPLJU1W4Zc8GEHuuKufgS2Trjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=if6kqgG0;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B93606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B93606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=if6kqgG0
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso6032462a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795656970; x=1796261770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tMp4+nCkrdqMXbrytBsy8KUnTj5f9f9jbnW4fe3cDk=;
        b=if6kqgG0b0+6/sY8VbrVQFAzpHTn0s/OAz0OUONut6y0pcwFsIzHguAiKdbwmWr6Vj
         unGhAOmLA4sWAMEmCPWt3gUMQXFNgOxBhlLvCNood6T9LCJc8qz7nxdJ0XknHS3dtrmX
         4B5eLSNZpA6BPgBCJAkX/EnyyS73NxwOyhxH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656970; x=1796261770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tMp4+nCkrdqMXbrytBsy8KUnTj5f9f9jbnW4fe3cDk=;
        b=sJvVezbgk751pE++2vs0NhjFFk/JwXW025IPS+jRXQ/PVkaif+/ARd9slS6rv67Dnn
         7AYEHpdMnXowi77SNlaWCDbeYjHieNPHueucf2ZDkzmgbkaWjEtEviGf8npDVd3rWLRt
         Mvc79r5GmwjuLl8/1pqwik/+c2WmWPYOAQVDc47AULiVTsnQkGr6BZdTzy7Lvn9m/bNa
         gmTXjjAN5r3he8qC+kxdN1YH8Y3ZLiBpMuMkToypu+7gpaSwzxoYB0Pnj5x9H7UiYOoW
         rA/39niS87UuJRV3I17ePfP9zHekYV+w2sPmuMHa4lS3ksracZ/cgofsaDrav1W1fDI4
         1mXg==
X-Gm-Message-State: APuU4Z8GTrQS8saIElKqm+ttzeKz9Z98sARe2wJnu9RsfwZc9hvusLbU
	Mkn2fcWA+ufMMRBtSVqW3QTNvc8ujmoYm30gQ7A1avK6Kj6jX7r6h8lJ80CM4aTz7Q==
X-Gm-Gg: AZFdTZegkdI/BYBE+RZp+dbFDnvJfWM0AjsWXdc3oxeZAmBTCn5bTNg8hyVmnvkMbF4
	CIoH7J8MVs8bPO7YxQcmCq82HdJnralLCS4+f7uwC8k+D3GkqeHAvSoCGQEnFWiwe4qzOhe2AgH
	VV68j6WEOCkmOfc4UXukk/Hcm2MwwWm+lfW3jsMwBW/Q9ts3q89y6ovMEuhq3evipmK08iipXR/
	dl6UwUjH+dbo/hS4pGwts4AB8Iu8iTbORIJ2n+/53RgdcKSHX0gbYQlgy5aGsfqg28+wBf5nc8i
	XTQ3ZkgWBkVw2klgqwIhidpYiIvqImynqUpCtxHNbkzoGL20OlevpQ9iCeas6QkY6davV7ZgU+B
	jVYltBCRH8pVR+Bgz3rFuGXefl0/oFKAHdczo1M3RZPeHlDNXwVFeFHGxu4rQe4sWnSeSERNSOW
	DEH+U85NwR+RSR+2zwsJMC2uWhRqUACyA3MS2n+1l+PWaHfiVQuRCy1W3uMNzLvPVMt9yvjPfTQ
	/brjD+gvkDT5QdlZvlYT8lZFdickzLm011Y0fWKJ1F6hjfgAOrx3RCoj4W8iIN4qKbDfZS5BK19
	E7AeKdboeFHyfK5b5SvGaM8ArJKtz0oesN88xtNMFuSE+WBI8HlEJvILX38Rnfx1uA==
X-Received: by 2002:a17:90b:3b8f:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b41c95f0e1mr13115867a91.34.1795656970314;
        Wed, 25 Nov 2026 17:36:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:59ac:90a:64:4bd7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm14278085a91.10.2026.11.25.17.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:36:09 -0800 (PST)
Date: Thu, 26 Nov 2026 10:36:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-hardening@vger.kernel.org
Subject: Re: Writing through const-qualified pointer in next_arg() from
 recomp_algorithm_store()
Message-ID: <aweJUDMS7yF3b7R2@google.com>
References: <awcpkJD6K1xtx_Pe@devuan>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awcpkJD6K1xtx_Pe@devuan>

Hi,

On (26/11/25 20:08), Alejandro Colomar wrote:
> I'm working on preserving the const qualifier in some <linux/string.h>
> APIs.  That uncovered some places where we are currently discarding the
> const qualifier.
> 
> Here's one of the cases I've found:
> 
> 	$ grepc recomp_algorithm_store drivers/block/zram/zram_drv.c \
> 	| grep -e '^\S' -e '\<buf\>' -e '\<args\>';
> 	drivers/block/zram/zram_drv.c:static ssize_t recomp_algorithm_store(struct device *dev,
> 					      const char *buf,
> 	{
> 		char *args, *param, *val;
> 		args = skip_spaces(buf);
> 		while (*args) {
> 			args = next_arg(args, &param, &val);
> 	}

kernfs_fop_write_iter() gives us a kmalloc(len + 1, GFP_KERNEL) copy of
the user buffer, so it's "safe" to write to it, per se.  But I get the
correctness of the code point of view, so... probably another copy of
the buffer?  :/

---
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 96b135e3f727..ca12c1918aec 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1279,10 +1279,15 @@ static ssize_t writeback_store(struct device *dev,
 	unsigned long lo = 0, hi;
 	struct zram_pp_ctl *pp_ctl = NULL;
 	struct zram_wb_ctl *wb_ctl = NULL;
+	char *kbuf __free(kfree) = NULL;
 	char *args, *param, *val;
 	ssize_t ret = len;
 	int err, mode = 0;
 
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
 	guard(rwsem_write)(&zram->dev_lock);
 	if (!init_done(zram))
 		return -EINVAL;
@@ -1303,7 +1308,7 @@ static ssize_t writeback_store(struct device *dev,
 		goto out;
 	}
 
-	args = skip_spaces(buf);
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
@@ -1779,12 +1784,17 @@ static ssize_t algorithm_params_store(struct device *dev,
 	char *args, *param, *val, *algo = NULL, *dict_path = NULL;
 	struct deflate_params deflate_params;
 	struct zram *zram = dev_to_zram(dev);
+	char *kbuf __free(kfree) = NULL;
 	bool prio_param = false;
 	int ret;
 
 	deflate_params.winbits = ZCOMP_PARAM_NOT_SET;
 
-	args = skip_spaces(buf);
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
@@ -1899,12 +1909,17 @@ static ssize_t recomp_algorithm_store(struct device *dev,
 				      size_t len)
 {
 	struct zram *zram = dev_to_zram(dev);
+	char *kbuf __free(kfree) = NULL;
 	int prio = ZRAM_SECONDARY_COMP;
 	char *args, *param, *val;
 	char *alg = NULL;
 	int ret;
 
-	args = skip_spaces(buf);
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
@@ -2578,6 +2593,7 @@ static ssize_t recompress_store(struct device *dev,
 	struct zram *zram = dev_to_zram(dev);
 	char *args, *param, *val, *algo = NULL;
 	u64 num_recomp_pages = ULLONG_MAX;
+	char *kbuf __free(kfree) = NULL;
 	struct zram_pp_ctl *ctl = NULL;
 	s32 prio = ZRAM_SECONDARY_COMP;
 	u32 mode = 0, threshold = 0;
@@ -2586,7 +2602,11 @@ static ssize_t recompress_store(struct device *dev,
 	bool prio_param = false;
 	ssize_t ret;
 
-	args = skip_spaces(buf);
+	kbuf = kstrndup(buf, len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	args = skip_spaces(kbuf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
---

[..]
>
> Should we make the 'buf' parameter of recomp_algorithm_store() non-const?
>

device attr store requires a const chat *.

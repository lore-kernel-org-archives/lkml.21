Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179944;
	b=A2LlpV3TMFHeOgLBuZVSlORxCpoYVUl6AsZkLqDEwq9eKzICgSKtyrmhPW3eQUQw3Da/
	 QAfLARRv0fLYtWbT6oWIJAXaVFPML3HT2Vl6pRF+ZqRdwW8cyVDdXYjAonuJtd8AMEmOs
	 fYJj8LjjwgYpvMDkk7m3TvGqjxqIXjdzp2DjV3t4UJKASLBfmUwj1gEZjKhZj7es7NiCq
	 vq5wgLiXz2ErdtgOb8LBPFLB49cRXpPLYHc4J78pI/kzbAzWyJFdLOcF+m0FXdQVcHidz
	 xYU4EaHyolXKUNlMadvasBFTpWBy44Pne+k5OOaDS8a9+AGL04vDI9o2v5a0lGwxdjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=vZD7H59wVkQJIxaCAkwRu81Yn4gtf3+T3VW/kqvLqyk=;
	b=qQ2PKRS6GGXBnzilcOQhkI6dv5BKet79NoaokKWKUqEybYPj3Lav2GvvlUOsDtWERePC
	 Op8AIHKdPSATMXFykLh+A3oc1mc/cyOir+VEQQWMW9nRMqdQgmju7VBBXCFhCUt41m0hj
	 KnwzDCZVoC6I+ac9QB5knojUjanLe+3+GV9DIYnl7FYgqAlGzgMaX97sMN63z2pKIsMWh
	 Mgfxt5HNPygnRa5QPgqrZGn5dkuocZwbPA189aIlDAYzVcFCsW5fqjamesk83EMnhH/7E
	 OsvmMdPU5zO6i2mr0AxUD9fOYizEBkH7mEyB9Rye0oTV1urfcq6HECg48mTid/XWMrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLK5CECU;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D3660A3823
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D3660A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLK5CECU
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso132722366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179942; x=1795784742; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vZD7H59wVkQJIxaCAkwRu81Yn4gtf3+T3VW/kqvLqyk=;
        b=xLK5CECUhYqGQaOh9chBL9LAtOPmWb8MCflYggF6Apd4Vzy/BtfqFmAaD/z0A6ks5c
         MJPem9HO9QygE/i9RhCvatWSvmlsMf7wvNLo9xkQJ9uB4mdngYR3Nj5OqGByl9BGBV/5
         izd8Qh/Bzig2MYB1by1RYOtONFdxXMfh0+5CQZffkXASYOvtCM/KgujGGQF8MgM6tkld
         bf2GeSHM24iQ+rgzqhHLA46ktCXO4aFImcKTR4PC9bFpIkHSqfoiZMxQs61/Crn8A9ly
         yuwusnpXqmohbqO9zFYjj+gNy+NePxOLieLdKLJf0HqUjRebN/JQiGAVaGQ93nf9rl6y
         ZA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179942; x=1795784742;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZD7H59wVkQJIxaCAkwRu81Yn4gtf3+T3VW/kqvLqyk=;
        b=XM+einMZUUd3D086Qh0Pw+9BFhoxmoNp3bTa/4bZHZr8J6UA+qhvvnWwdTrtriTwjl
         Af6JV8gABlwpkVHhdBAscvOwYxy9TaYchsvLtA/JX2maZa7pC3I8uUbmuGlexwiDsVM8
         Ypbr1kvgiDF4aS/cBaCcCt/nB/Nzb4tFLG4NzqVEq99/W2rzjC2q6fADbIZO/h+Hs/lS
         koBKr4Qds7t+PVYZZ0C5tLzAGxH0lEXQNotsoMAiIzu5/BmvgfLLAoOX0SP0AbkOF5Xl
         nY76NwWXSNVfXTEqalOMuj2jtUOT2B9Mm7GNPau5yVDddxVVRiqdBXw9JDAPbuAAEdGK
         5BFw==
X-Forwarded-Encrypted: i=1; AL+hErFAdXSJ55AvklqPsvF4Zex84qjLI6de4eINAslyuxQsi6JtFEX5BkEFC68ic8YERQBgmYyTLiNp7Jw2O40=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hWCrAAXt9Hoa0sCOoA6bKO+UvA7JbJhcM4ZrpBF/jvtZENLig
	iDLOY20p0Q5kyLn/2dDoSUBFxITGQx487lFvwS7gl3Cphdlu4iQPpR8g
X-Gm-Gg: AYBFou0cpUoCJxqmoGvMVqj/MKnC9AShKojE/qAM87EXO5Dpgn8K110aXG2fEkMmwKH
	gpSJR25oGJBFGYgn61U1id6Gc6GlbBiHkU9u7+iLlgL3gMLDmRTMgcKeIQtWS69Ic626aWFsOo1
	eRjq8ne/iEGuUVAInU9YxPkbXNT5z7A9774sIb7ahu8VjN2PH9jNCDNr1izxoaBE8Cu8rnQUzxc
	KFB+IUdrcm0wLliF+FLEPxGHosVDmso91uAqL+pJH/tOeaWVRKmX8smLXC9+qOJz7Xn83QpDQsF
	Gmn9siFF2oHhEzdvLUa3QhTHncTKwvIBQf6sXrV+fb+mVMSxOkUUJZr2AJnqzu/ObdeiIxoJ2m1
	rMCUufVrBsA9Z7yvGinE55urwj/m48yCx0KUKQ/u3+t1hUHLlYZEBjby3Co5QLC+0btPox8P5Yj
	sbZUjkndYI8D2bc8dtxYSHC01D/uzKF6ID92YZ6AY6f3xgLZctH2zMjwkpr2NFcfsoRic+iO41Y
	Mo/E5regXmgMZW9c82ydJahC46yuBVaBj8R7necE/xsG0P5VP6CQbpWYqIIwr2q9yrazcZLix3X
	kOhUJUkKHvMXrJbJ1jg7ga5AbnGK0watmbGI1ADQaxc+rQl5c5g929wq
X-Received: by 2002:a17:907:ea90:b0:c50:5e90:5ea7 with SMTP id a640c23a62f3a-c513ac9dac3mr301963366b.49.1795179942348;
        Fri, 20 Nov 2026 05:05:42 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6780esm95720566b.17.2026.11.20.05.05.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:41 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 8/8] char: xillybus: Cancel delayed work items before teardown
Date: Fri, 20 Nov 2026 14:05:02 +0100
Message-Id: <20261120130502.17056-9-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261120130502.17056-1-eli.billauer@gmail.com>
References: <20261120130502.17056-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

xillybus_core queues only delayed work items in its workqueue. Use
cancel_delayed_work_sync() instead of flush_workqueue() to clean up
queued work items, as the latter does not wait for or cancel delayed
work items whose timers have not yet expired.

Fixes: 48bae0507410 ("staging: New driver: Xillybus generic interface for FPGA")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260630092330.43534-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v3:
    - Rebased onto the updated kernel tree (devm_kmalloc_obj() conversion).
    
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillybus_core.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 3433f07e4286..879e26aa6a83 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1922,9 +1922,10 @@ struct xilly_endpoint *xillybus_init_endpoint(struct device *dev)
 }
 EXPORT_SYMBOL(xillybus_init_endpoint);
 
-static int xilly_quiesce(struct xilly_endpoint *endpoint)
+static int xilly_quiesce(struct xilly_endpoint *endpoint, int to_cancel)
 {
 	long t;
+	int i;
 
 	endpoint->idtlen = -1;
 	endpoint->num_channels = 0;
@@ -1940,6 +1941,9 @@ static int xilly_quiesce(struct xilly_endpoint *endpoint)
 
 	xilly_allow_isr(endpoint, false);
 
+	for (i = 1; i <= to_cancel; i++)
+		cancel_delayed_work_sync(&endpoint->channels[i]->rd_workitem);
+
 	if (t <= 0) {
 		dev_err(endpoint->dev,
 			"Failed to quiesce the device on exit.\n");
@@ -1952,6 +1956,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 {
 	int rc;
 	long t;
+	int quiesce_channels = 0;
 
 	void *bootstrap_resources;
 	int idtbuffersize = (1 << PAGE_SHIFT);
@@ -2054,6 +2059,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 		goto failed_idt;
 
 	xilly_allow_isr(endpoint, true);
+	quiesce_channels = endpoint->num_channels;
 
 	rc = xillybus_init_chrdev(dev, &xillybus_fops,
 				  endpoint->owner, endpoint,
@@ -2070,8 +2076,7 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 	return 0;
 
 failed_idt:
-	xilly_quiesce(endpoint);
-	flush_workqueue(xillybus_wq);
+	xilly_quiesce(endpoint, quiesce_channels);
 
 	return rc;
 }
@@ -2081,13 +2086,7 @@ void xillybus_endpoint_remove(struct xilly_endpoint *endpoint)
 {
 	xillybus_cleanup_chrdev(endpoint, endpoint->dev);
 
-	xilly_quiesce(endpoint);
-
-	/*
-	 * Flushing is done upon endpoint release to prevent access to memory
-	 * just about to be released. This makes the quiesce complete.
-	 */
-	flush_workqueue(xillybus_wq);
+	xilly_quiesce(endpoint, endpoint->num_channels);
 }
 EXPORT_SYMBOL(xillybus_endpoint_remove);
 
@@ -2102,7 +2101,7 @@ static int __init xillybus_init(void)
 
 static void __exit xillybus_exit(void)
 {
-	/* flush_workqueue() was called for each endpoint released */
+	/* Work items have been canceled for each endpoint separately */
 	destroy_workqueue(xillybus_wq);
 }
 
-- 
2.17.1


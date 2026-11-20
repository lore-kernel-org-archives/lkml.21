Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186816;
	b=uN2CKXiRbygqDkIO2jmB2CvcT2ewfPSu09t58hHI0eUe8syL9ZypeDnQ+oTlLpGp91mz
	 LJdtRRMtH/hByWEGHaYfNZu8RpFv87jzRA7UDxk/VyN3IDBHN5+TrVamzKre3+jB3kdHB
	 npvQIMKe5ozDg5fvyBDXmbtgp97cHv4ta50i2d6tViqwKOploBhNcpjMSApeaM4PZVsaU
	 MHEdlQHSGvvb3rzbJInZ3jr4n21zIjOzCBeuNUUOFXxIybWsnQ1lJ6FUfpvhld5Trt5cG
	 F3Dy9BaKP+wl3v3xkIpwCaHZ2lTYNipmIuvIFwz5llrRWyQqspKMC1j0toBDjB4NMnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NBH8Vk7x49WT+m8mgSOTracB/qDaBoM1+u+x062nujE=;
	b=SxqX22C64GGn/YVtUezHQRe1Z5nfljxrG83XjG8jJS13QUr2FwGcOwkuYlwwWxFCFRgf
	 RZXvcJpF4ApwwardGxS/e9AI+usEHe+PwP0jVjRTPaMqvCiPM0YqCE/6e8mmwNsO3fnKr
	 MVuSVbCL4B7JrLqJfuU2xkZkvbyRzgTtASSGKh0s9RbidDTpiXULSVNkWQEGHCbxjFJ+O
	 NN7nh1cNEtBiowrpB7S9kSEi1ceC+v0UCBuib9C7MuDlm+e8Tw8SAKjs51FzAV+v1bIWw
	 FRBvEjrqOiKMVtIHqqSEGY7SLNLthBoAT+ygd+EXKZZHyU97U97G5h2wAyKLHEUcG4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OR6bZKRR;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27ED60A5BFE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27ED60A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OR6bZKRR
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f0481b35c9so4059785ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186815; x=1795791615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBH8Vk7x49WT+m8mgSOTracB/qDaBoM1+u+x062nujE=;
        b=OR6bZKRR6EkH90jRglR5Eedr3LK5EDTCpbXlvGoU1ycPAocvhZOBwtm239PcSVTXq9
         FeSZs6MvlcZAfV4WyMEZLjFAkx/02cNJhxxmZQfZk4dZVBnykGtzjtVF66DDmPmUR2eM
         CPHqRjGeVySPa4CqpWJ0XSPYq6PpP2rw6JJgsYMgaPltmZ6JH/lUC0kGaP3BfILooeAG
         i34YEkzP0oprcv3lWvJs0TP3fKJ/5D69fBvY4V6DGlwStVIGPX+MkAA7dO9HOeDwT3mA
         CVnQyOwBvQQ3QXRJTz2P4XFzTYb7rU/BSRW7ez2vKpktX8hO7ysP4rI/9g8szfypqYsj
         k4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186815; x=1795791615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBH8Vk7x49WT+m8mgSOTracB/qDaBoM1+u+x062nujE=;
        b=zXGKiMgOMM1TBqO2ACMQKJ2xReB2tmIovETgUNHrn+FIfi5qJ8joAlh8kpwSgwTodv
         iEqHYkeqnb+GxrmpxOSWuIdkhRCTeBlwrEVXyKbnrF+SFtKzO0n6Ny0tT+zL2FsO07r7
         KNDXLhQ1gsp0DT4eaCCeTdVsQAoKpxQ+k0BjEFYDGwyRmSnqAOfSdTZX8YosZ9Pv4whF
         4vr9qwUWY6rDTH9Lv/edGJaWrd7/N6HXREx8sRf2vs6/v73XuOa5kCIt4FLZ0EeBcHht
         YtMU6nQb6tvYpRBAvo8myxXYlQywoYbVwqvvPnrDvEUDrTGoZe6ZE9yvb3txFrpiFzM8
         kMLw==
X-Forwarded-Encrypted: i=1; AL+hErF881PqerIANXPQbRxCCmpC5/X0yF29vSg2xuNVsgiSStPg3nOgNb44k9ferUSNLXshf8+2is6KN5lWxCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AGHXAc+u6E2ipXKFdVbg7Bcwer1g/2yLJiE4LcXtKIhb2pHuH
	NeoKZIPhSMY6uRN+3RbGgBZSfHI1YQMNYsuSqco8WXhs4nW831TJWkPA
X-Gm-Gg: AZFdTZfBFcna/qoyT8s8pDzQpXs/em0MsWRG0T1MAeHSwr7ouxk934XrL1oMmugZxN9
	2j0njX6VBxxIRFaMbmvZh9pM6N6jtPPKiuQ5eoSivtaqHrH+i1WZEnz4VhMfeEXlckE2NlDnWTX
	Stz5WDzGuyyT6osT4oMWQwdFJBlYg9PSEy0cfelPNFrmF1pkTekE5OXhzp+V4vHPx44Jgu/Yl1z
	f2LCLG2XPWA3BxHJlvMOD6lxxQArFvXKMXgvirfiHLtEqPqOyEuxjFHM81N7NmHvmgqAIvhylhd
	3W+1wMcE6dtUiX+p0iq0phJzLGfG/6rNrJGZ4HFU4Q6E7uYws5wnJuJmyGrnchnFbGQAkDOtIE+
	3FAO2A+XRFuTwHtlI3LinE6RLr1UEvaGtTVeW444QRDhlIShMJmKh4WRsTTJy1IflZTtrqZGA9K
	CBjWWZjrTFYA1Jr8bBdpz2QQqULnXnzAN45S5UJGjKD3h95ZiFpteTcVwoA4w0DvXhNxdcpzc0r
	ajW4iC6s6CY0qOCsyccg4HPOLl87IHzbGQkJLVAjqIEPHNS9UVZ3+uRcWzy5prE7Op4rp081Y+i
	yr8NGPpUFxPnpXNYfBKxbMG17NY1gxOZq/C7oB70/fQzrJAdoifh
X-Received: by 2002:a17:902:ea01:b0:2ed:1b26:2bf5 with SMTP id d9443c01a7336-2f03f21e92cmr31475695ad.44.1795186815085;
        Fri, 20 Nov 2026 07:00:15 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm15213005ad.59.2026.11.20.07.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:14 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
Date: Sat, 21 Nov 2026 00:00:05 +0900
Message-ID: <20261120150008.1144420-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120150008.1144420-1-ekffu200098@gmail.com>
References: <20261120150008.1144420-1-ekffu200098@gmail.com>
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

inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.

But inval_wq_set() can be called at boot or module load before
fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
warns and the work never starts.

So defer scheduling the work until fuse_dentry_tree_init() sets it up.
Also hold kernel_param_lock() in fuse_dentry_tree_init(), because a
sysfs write can call inval_wq_set() at the same time.

Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 fs/fuse/dir.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index da23ccd8685c..0d5d04df477b 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
 /* Minimum invalidation work queue frequency */
 #define FUSE_DENTRY_INVAL_FREQ_MIN 5
 
+static bool inval_wq_ready;
 unsigned __read_mostly inval_wq;
 static int inval_wq_set(const char *val, const struct kernel_param *kp)
 {
@@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const struct kernel_param *kp)
 
 	*((unsigned int *)kp->arg) = num;
 
+	/* Defer the work until fuse_dentry_tree_init() sets it up. */
+	if (!inval_wq_ready)
+		return 0;
+
 	if (num && !old)
 		schedule_delayed_work(&dentry_tree_work,
 				      secs_to_jiffies(num));
@@ -224,6 +229,14 @@ void fuse_dentry_tree_init(void)
 		dentry_hash[i].tree = RB_ROOT;
 	}
 	INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
+
+	kernel_param_lock(THIS_MODULE);
+	inval_wq_ready = true;
+
+	if (inval_wq)
+		schedule_delayed_work(&dentry_tree_work,
+				      secs_to_jiffies(inval_wq));
+	kernel_param_unlock(THIS_MODULE);
 }
 
 void fuse_dentry_tree_cleanup(void)
-- 
2.53.0


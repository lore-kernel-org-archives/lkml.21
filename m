Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208793;
	b=cf0A6jR67DgnF+ejYsnGdCemRnW5Y3QqDgQRgEXtmRnkw/somv+GMN5myjYiRGJZAc4E
	 Rj2K2MkaNtuSum2x1OsZwju7nh0nc50VgQxuI+eOT20ocQvc3HRsibtEzSGysOQ24nlNQ
	 XPX0Ql7IZpZ8fcjWz1/lKOWIZ8/BBr7lfEe4jZuOQi+05QKS0oWpZVfaVMiRljcOG64UU
	 bn0TifLzu05Yqpl06knNxs9Wxu6ZUfwrO6uIISWba8b/Gf25spzOfr6KLQKuHm7PwDRTH
	 PVh7/0PlmWXhhrM1u6jNQ0xqlFmMbM3cXQ7YJEyw0cnJqLsnFDKYnbfKvzVjnkPj0Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3LS5gvBAydA0Ig1FL/11e5L9aa77Zg2FmflSrEEofQc=;
	b=U6f2a7pJHhPjGorA59OFX8DQqD+M/WO40z/CvIpV8TWRqpIGPDQrWPreMuMDW07Y1tPA
	 suTQjja3vPpbQdKR55A7vkrBabBXa+njMgesK2ZemUZ4gxsc7W0yfLyzS8B4FX4IC8CS4
	 yjMKYIsW5k6qUOrY6xIZ7uePSynCN7/6gTmt59j9QdN8YLJdhPjFxWaey+9B+kpSlNgo0
	 XFhcYQvGqBPu2Xeddj2u9RouXyUM51qLgaiDWkvy3zGUKjEs3Dc8jxYGdpvJPZVZ0/iod
	 3UnlCbJVBsc0O/EET9p8K4FsHVkl69JbklCwwAS/BGJBToqoeVddAWY4bqB/RpoW3Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yfmtltvj;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34648606A684
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34648606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yfmtltvj
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9213f004a14so8627346d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795208790; x=1795813590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LS5gvBAydA0Ig1FL/11e5L9aa77Zg2FmflSrEEofQc=;
        b=YfmtltvjYin2V0r/X5r77eN74n1Qf5MVudBB9cLA7bRTyHQ1S6vpmEM62BGlRaXwtS
         xifBTkIhBJ76sN4Wer8ZTPZuKxVOMd8ClMyJBExXj0d7bRpEUZoIKPGY+PScsLrh9aku
         Nem1DVqLtR5LnicdQjbVLavtKu/oBXt1c/QJiE48IytIXDYjlw83oQzZjKDM2T9z97/8
         aqGwbkAq7vl6/1Rj9f4yoWxJ26fS7118ia/YDw5eL3vYO53181M4Y4Pphero1q/qqrRa
         yIbiL6dj7Cm3hefZ/5DuoSh8MnQXcl+0mvFbPxccv9y4LBbLK9dRU4ndJV5SmSDpCS9M
         hDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208790; x=1795813590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LS5gvBAydA0Ig1FL/11e5L9aa77Zg2FmflSrEEofQc=;
        b=sYNHOSKHt4eILNy+S8xWfehzT5AnAbTLXqnhq1s0wJQWy+tckJiVUY3Kh3bPTMNktw
         fwg/oOVdA1EBCGZza9NNiluKv30i7a7y6n6w5CiM8xfjFIisZ87/+o8kVOQMMeT4/89r
         QqGXt3YUqwbHwtg9gy1ZoC77B9FdckmdVXA9Z6jjxtk0+NIPb1mX/oOULqBx2SBB7NQS
         hWx3MyCIyVOPZnw157LNCdZQ840EMt2iGvzuhWKGuURQfitMop4qj7kfx3DqucYCHMRr
         yjsMSYTPFmzNsYUquC6GChhpXHwbtszyUmnp/mbkKZRjjyqzVf+bivIJLl6TngdtKISh
         IxMQ==
X-Forwarded-Encrypted: i=1; AL+hErE+gDExr/TF5x28kaniGbE7VtQlvjieXYuDfjHKDDOEAyAFAaPjQFA3YCXQ5pfMzZ6oU/KzJzQ0mj2Wx6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z929dNVvfY+/GTk8wzHNExl5TEDZ0+EzhtJ/n9UHGuB33v9qNTB
	RvRTtLrixDWiUqr2XONnScH67w4o3i6DcaF0GuLs5EPOFIm1zAgCYmuB
X-Gm-Gg: AZFdTZciuX2D65N1kHS3eGEW1tpfiqupA00mk0R3oVrbGYknzmL5Ja8V/ilY6tYSZT9
	z/0yitp+TzjmJqRUDpNe9+f+3bE96cIwpGUHlMtWIi8nrykYItiEXvvMcwUvsZJKfGtfC/HOeM3
	1w4JFtWTfVoPNLHyFyj+0DHbemU4uQHMTMK97FRxsWEmzlP96ZWtYsqPfMDFVAIPlh7xbJ6dpGD
	kOWGTzk81Z/wXlMu2NlZpVJ0EcdMn9IvzyD2kRLnPrXzXoD5fFwkv4JLwkw9mX952SpjT/o7LJf
	fZKfKkXF0ZaUM9Q7VoIpk0euXV2MAjIdLB9dGAC9CQMosKzy/8rF2HUVsuTzHloZjOPdU4jLe8F
	j9cC9vxYrJTg7q/M3grGl8fwhGYJ8Mk6Oq46JXB/tXF02hd8k1xjeei+xKfBpc1L397H+eabYw3
	hf3wn2iDgy/uvdYQJTsUbkjCCZQoQ3D8uqBgD8BVSrwgnUZPnAQWmWzroVUXMnMpDc1JAf+gxjz
	SGFwWtkJQjmb2kGiZcQj29ELXTsUh4CiyRTdFh5hzZx0yjiTcYENGh1J5TOgwL5RlqvzUJvsluK
	CYCrz+A1ctzhq2PZvxVjQGvX8hvesmp9tHdZgZATPN83PeOxhthKmLCXdh8=
X-Received: by 2002:a05:6214:84d3:b0:91f:1e1b:7b3a with SMTP id 6a1803df08f44-92134b0c780mr49391576d6.57.1795208789683;
        Fri, 20 Nov 2026 13:06:29 -0800 (PST)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm35509986d6.44.2026.11.20.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:06:29 -0800 (PST)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_fs: fix use-after-free in ffs_func_unbind
Date: Fri, 20 Nov 2026 16:06:16 -0500
Message-ID: <20261120210616.2293426-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ffs_func_unbind() calls functionfs_unbind(), which drops the reference
to ffs taken in functionfs_bind(). It then keeps using ffs: it takes
ffs->eps_lock to free the endpoint requests.

The superblock holds a separate reference, dropped when FunctionFS is
unmounted. If the gadget is unbound (for example by writing an empty
string to the configfs UDC attribute) while FunctionFS is being
unmounted, ffs_fs_kill_sb() can see FFS_FL_BOUND already cleared, skip
unregister_gadget_item(), and drop its reference. Whichever put comes
last frees ffs, and if that happens before ffs_func_unbind() is done,
the eps_lock access is a use-after-free. KASAN reports it as a
slab-use-after-free in _raw_spin_lock_irqsave() called from
ffs_func_unbind().

Before commit a3058a5d82e2 ("usb: gadget: f_fs: remove redundant
ffs_data_get()"), bind took two references and unbind dropped only one,
so ffs was never freed and the late access was harmless.

Do the endpoint cleanup first and call functionfs_unbind() last, so ffs
is not touched after the reference is dropped.

Fixes: a3058a5d82e2 ("usb: gadget: f_fs: remove redundant ffs_data_get()")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
v2: Don't take an extra reference. Instead, move functionfs_unbind() to
    the end of ffs_func_unbind(), so ffs is not used after the binding
    reference is dropped. (Greg)
v1: https://lore.kernel.org/all/20260815013818.39466-1-shuangpeng.kernel@gmail.com/

 drivers/usb/gadget/function/f_fs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..fe4564d68b18 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -4212,8 +4212,6 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	drain_workqueue(ffs->io_completion_wq);
 
 	ffs_event_add(ffs, FUNCTIONFS_UNBIND);
-	if (!--opts->refcnt)
-		functionfs_unbind(ffs);
 
 	/* cleanup after autoconfig */
 	spin_lock_irqsave(&func->ffs->eps_lock, flags);
@@ -4236,6 +4234,12 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	func->function.ssp_descriptors = NULL;
 	func->interfaces_nums = NULL;
 
+	/*
+	 * This may drop the last reference to ffs, so it must be the
+	 * last thing that touches ffs.
+	 */
+	if (!--opts->refcnt)
+		functionfs_unbind(ffs);
 }
 
 static struct usb_function *ffs_alloc(struct usb_function_instance *fi)
-- 
2.43.0


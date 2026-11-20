Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795137146;
	b=Y9uKBuzmt9bjh/lY6j+j4OKZSvem/WwrcMNVE9deg2p5a6Cz3yS4+CBvL6NwyrETuOsW
	 IFMsfifGqOZvM2Pdd8+p8+De0Ukx4mRqHSyz6NzDzfrQJ6HGCqwyjNG/+gmIwUZlAq/+M
	 8tM1hhfLxhvFTMcRTQXX3v5M9BB6WQpsquqhnQtMDj+VmR04u1FNSZ6fk39v8yX02DUbh
	 autGDx/6Ybvg653uZmIomIdBy7NwfwFDxTJynmikYteTK3kYIqaIPDAVZobglZG6LoyyD
	 luPpf6dXXDclpXqg6/rbid9K6Pak5tNSXHWn5USylc/BPFvQg4R8RsvwnkD4Ku73nWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PjzNoj806C+rvUXpCLkwOoZeurc6cZlqNpY4AXcwYQo=;
	b=hG1/ne0I+A8XkE8UG+Wd9G+a6irvfNuwGpjGVUPfoKwSE1DfX8imC44iocwQ8+V2vsIV
	 wgUQZiFWqVVR73ZA41DawuckEu8IMymfFkL8zc/q3g9TlNwEZ4+WMBu/dwV1+0lCr3g0V
	 Zk7UyagDoYxTLA6siqMLTyHVsjpWlmJYBe8A4xOGE3fQdzvbu6j/hAIH16wHMX/S/n/mH
	 EW3WOdsVnIKaswqwTUS1yJI2Tr9+TxGmp2ISTTR1NPga0LI8Jg4HRatUVYb/kVcFW5/BC
	 2b94YgsDEVKst6kYnuD4Ji+ZZAfHripUtYJltM0ARiD6CnAnGzEWgeCDIvW1e1+sUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vX6Ne/6b";
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8529606A5C5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8529606A5C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vX6Ne/6b
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b196fefa1fso191314a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795137145; x=1795741945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjzNoj806C+rvUXpCLkwOoZeurc6cZlqNpY4AXcwYQo=;
        b=vX6Ne/6bQ/4UZ8sumxqYuz35G1OsJVZY8r6kEm96WGyPZSYmlUYcIc+eAQvfyKgirI
         mqalQRpE0Y0mQuFiAxiIyr+TY91KeyHfpdhPFxbZvurra6CH5R2YAwScJap5KnLDt+Oj
         dLNw3RJQx4AQ6SnbVdc8EnT+A3oY09bzx4UvyF76QRjWWt0DN48I6p9vYIwwJ7K5mLrt
         0KS3UjI7IGldSuPP3nXAqmMs8KePOZES75jHhNIKbT52kSy5tLUTyfLwTkK1UoSq+vNM
         TSqFcELV17FzYq0FwMERFqr5Ln4dDWJbpyH7Bn8rg80HyYDec7kPtBESGsPnGbuIyILl
         jAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795137145; x=1795741945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjzNoj806C+rvUXpCLkwOoZeurc6cZlqNpY4AXcwYQo=;
        b=MUi6n3oRuxo8pL4smXYpZYQDzEDrKCsSfZtQmId6NmMKGc8zVioW04GmPchPGoSpi/
         CifHZNDcKXpC8TbVopeOiU5mc3ghMEL7iqBypM2anp1qUCF/xW5QJI/2erh/NNrAvzgZ
         NnokCijfgHcUQpEyjuj5pGtf3gKr7xEc7MFxb1gMSLn52ZhfFL2+h+2XrzNgAUNWSAQN
         hXZwkGR07rihUdvkXJkM7M0jiTv9usGxmJHbg8v4DQLaRfIPxn+HyVpI84AI6/JmcR+O
         e9MRTkTMUHYacP/y46ub/2qUTtmn6m9ttQWjgQlZSH7iswjzJxDi3oBYTBwS8PqEvSbk
         IX9g==
X-Forwarded-Encrypted: i=1; AL+hErEHp9qB4u7wbds3CVwXI/PYY0vZPODljBhlu3LRLXwVGSml7mS9B3NrNEJbAqx27RvAzJxPAPk8XRZQI2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/En4h9heECXUYYAVdoDD8f+JNe7obdWnNVfKiPFjR1mGQ+SXSC
	J0dsb3XkEiCMEm1d6uXF/KLMBv58fcmLhnc2BEv8ey974LnEi1e2dnma
X-Gm-Gg: AZFdTZd6gXZAbWRhEpBOX5ll5t9AJwynWX3A0CShNSLDHtTjn+yt6t26s2wv91iHMX5
	JewSjkAMY17+L0yD0oXQ+ZIp2tOAPcJBXp0EfwgyJrdDUxmzwr3d15IF4nKQ9+IEmZzd0HFqfYb
	29y5px/bYsLhkak56jkHLU/1KkY8czkFV6OlaiB7sy8CJDVwJfrl5xXqUC/xwAGG6VPO3EteNP4
	EjQ1MrVCaa3tAFBDByj22KdlRoTz9qKX0txrnqXa5Dry5BocS9nDvxy5QDIeczEa0N7ZD6dhegW
	fvPKv9RCdgm3WZLidTpZ1dJHPv9uhYooR0DEbSDZjFHXNrNuWa5Dcj5xPdGl0h2Mak9aFECjmyr
	LAgim9E8Q1sObQ5mrjIepnKr632XVDV9Zf/wRCaKOC3GFI6ackxTw4EfTuWaG9fGmbU670S+1KE
	9W5zRY0sYuvNVnJsLKCML9PWoW5SrTLLRhNJa69/58gwQqztM/An3T8gqNx8idxp07kknj+nNsN
	2AZhdtUXrsI7Vd9EPSJ3LYpB3SDD8+yrI/8eJ7j32r8zG033cpFjIfJaKi6bdzPzcXMnzMblbLA
	tZHc5kEJVU++xtfQ8TNtbcs3E2pZXe3TDPyqEha5q124ilkED++AerQDp6VaedoMi6vTcECAWHd
	iTkoGxwKYUac+
X-Received: by 2002:a17:90b:268f:b0:3b0:d0c5:c110 with SMTP id 98e67ed59e1d1-3b41c95ce7fmr1046872a91.56.1795137145051;
        Thu, 19 Nov 2026 17:12:25 -0800 (PST)
Received: from localhost ([50.7.253.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d243eb1sm622215a91.3.2026.11.19.17.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:12:24 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Fri, 20 Nov 2026 12:05:48 +1100
Subject: [PATCH RESEND v2 2/2] HID: picolcd: Avoid framebuffer last-close
 deadlock
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <20261120-mail-picolcd-v2-resend-20261120-v2-2-d7531fa8061b@gmail.com>
References: <20261120-mail-picolcd-v2-resend-20261120-v2-0-d7531fa8061b@gmail.com>
In-Reply-To: <20261120-mail-picolcd-v2-resend-20261120-v2-0-d7531fa8061b@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, deller@gmx.de, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Clark Williams <clrkwllms@kernel.org>, bigeasy@linutronix.de, 
 linux-input@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Takashi Iwai <tiwai@suse.de>, 
 syzbot+912222e4cb82423535fa@syzkaller.appspotmail.com, 
 linux-rt-devel@lists.linux.dev, simona@ffwll.ch, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
X-Mailer: b4 0.16.0

Closing the last framebuffer descriptor can deadlock against PicoLCD's
deferred update worker. fb_release() holds info->lock while waiting for
deferred work, and picolcd_fb_update() takes the same lock. Lockdep
reports the cycle through deferred-work completion and fbdefio_state->lock.
Repeated framebuffer open/write/close with concurrent device destruction
reproduces the hang in a PREEMPT_RT QEMU guest.

Use a private update mutex in the deferred worker instead of info->lock.
Take it in picolcd_set_par() as well to preserve serialization of pixel
format conversion and framebuffer updates. Initialize it before exposing
the framebuffer.

The test with the preceding output-request fix hung in the first round
and reported a circular locking dependency. With this change, all five
rounds completed, including 29 successful framebuffer write cycles and
concurrent LCD, backlight, two LED and UHID destroy operations, without
BUG/WARNING. The original syzkaller reproducer and persistent-open
framebuffer tests also passed again. These are bounded virtual-device
tests; physical hardware and suspend/resume remain untested.

Fixes: 3efc61d95259 ("fbdev: Fix invalid page access after closing deferred=
 I/O devices")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 drivers/hid/hid-picolcd.h    |  2 ++
 drivers/hid/hid-picolcd_fb.c | 33 ++++++++++++++++++++++-----------
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-picolcd.h b/drivers/hid/hid-picolcd.h
index 846a8ceb95..33e6654ca0 100644
--- a/drivers/hid/hid-picolcd.h
+++ b/drivers/hid/hid-picolcd.h
@@ -115,6 +115,8 @@ struct picolcd_data {
 struct picolcd_fb_data {
 	/* Framebuffer stuff */
 	spinlock_t lock;
+	/* Deferred I/O runs while fbdefio_state->lock is held. */
+	struct mutex update_lock;
 	struct picolcd_data *picolcd;
 	u8 update_rate;
 	u8 bpp;
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index c17104fd60..258c7c4fa2 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -231,7 +231,8 @@ static void picolcd_fb_update(struct fb_info *info)
 	struct picolcd_fb_data *fbdata =3D info->par;
 	struct picolcd_data *data;
=20
-	mutex_lock(&info->lock);
+	/* fb_release() flushes this work while holding info->lock. */
+	mutex_lock(&fbdata->update_lock);
=20
 	spin_lock_irqsave(&fbdata->lock, flags);
 	data =3D !fbdata->ready ? fbdata->picolcd : NULL;
@@ -258,11 +259,11 @@ static void picolcd_fb_update(struct fb_info *info)
 				spin_lock_irqsave(&fbdata->lock, flags);
 				data =3D fbdata->picolcd;
 				spin_unlock_irqrestore(&fbdata->lock, flags);
-				mutex_unlock(&info->lock);
+				mutex_unlock(&fbdata->update_lock);
 				if (!data)
 					return;
 				hid_hw_wait(data->hdev);
-				mutex_lock(&info->lock);
+				mutex_lock(&fbdata->update_lock);
 				n =3D 0;
 			}
 			spin_lock_irqsave(&fbdata->lock, flags);
@@ -277,13 +278,13 @@ static void picolcd_fb_update(struct fb_info *info)
 		spin_lock_irqsave(&fbdata->lock, flags);
 		data =3D fbdata->picolcd;
 		spin_unlock_irqrestore(&fbdata->lock, flags);
-		mutex_unlock(&info->lock);
+		mutex_unlock(&fbdata->update_lock);
 		if (data)
 			hid_hw_wait(data->hdev);
 		return;
 	}
 out:
-	mutex_unlock(&info->lock);
+	mutex_unlock(&fbdata->update_lock);
 }
=20
 static int picolcd_fb_blank(int blank, struct fb_info *info)
@@ -332,17 +333,24 @@ static int picolcd_set_par(struct fb_info *info)
 {
 	struct picolcd_fb_data *fbdata =3D info->par;
 	u8 *tmp_fb, *o_fb;
+	int ret =3D 0;
+
+	mutex_lock(&fbdata->update_lock);
 	if (info->var.bits_per_pixel =3D=3D fbdata->bpp)
-		return 0;
+		goto out;
 	/* switch between 1/8 bit depths */
-	if (info->var.bits_per_pixel !=3D 1 && info->var.bits_per_pixel !=3D 8)
-		return -EINVAL;
+	if (info->var.bits_per_pixel !=3D 1 && info->var.bits_per_pixel !=3D 8) {
+		ret =3D -EINVAL;
+		goto out;
+	}
=20
 	o_fb   =3D fbdata->bitmap;
 	tmp_fb =3D kmalloc_array(PICOLCDFB_SIZE, info->var.bits_per_pixel,
 			       GFP_KERNEL);
-	if (!tmp_fb)
-		return -ENOMEM;
+	if (!tmp_fb) {
+		ret =3D -ENOMEM;
+		goto out;
+	}
=20
 	/* translate FB content to new bits-per-pixel */
 	if (info->var.bits_per_pixel =3D=3D 1) {
@@ -369,7 +377,9 @@ static int picolcd_set_par(struct fb_info *info)
=20
 	kfree(tmp_fb);
 	fbdata->bpp =3D info->var.bits_per_pixel;
-	return 0;
+out:
+	mutex_unlock(&fbdata->update_lock);
+	return ret;
 }
=20
 static void picolcdfb_ops_damage_range(struct fb_info *info, off_t off, si=
ze_t len)
@@ -506,6 +516,7 @@ int picolcd_init_framebuffer(struct picolcd_data *data)
=20
 	fbdata =3D info->par;
 	spin_lock_init(&fbdata->lock);
+	mutex_init(&fbdata->update_lock);
 	fbdata->picolcd =3D data;
 	fbdata->update_rate =3D PICOLCDFB_UPDATE_RATE_DEFAULT;
 	fbdata->bpp     =3D picolcdfb_var.bits_per_pixel;

--=20
2.56.1


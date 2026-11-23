Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400892;
	b=WI2FX0G08CN/Ccy+sNNRYpqgaoJikABzyE5gabpg3neT7M1whUWR/4PSV7rvRvfxHCKx
	 DaEUsbeTbtY/z6rIvPn2zxGfTUPVgJZD5q6rBadZMM9+vryh4TvMf5vFr0QnBllIf2oFL
	 qJHiO521xjh075X28Z8TxCAghHUbY8a9RHA2UuN/jHDo0rCm4HeKzQXVGTp5QvpEDFl9m
	 8i+wkAn0LpBBf+OH7BVXAw+uLe0UAFMFzwfn6scFPIzMy+rMsKfcDdGdlhv6+Km3t0X3D
	 ZvRX95ktztnNNpP+y4VjI7NMbwTb4mS34m7TFy0BogS36SyBYjGRR8wozqcmErKGC3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
	b=R+bneW/Vaad38sh/uFk3V+UExrBviZKIn1d02Lbh4FX/rOkpLlsdvkXXxljRKwX4S70t
	 ZOGnQsdYSk94sX/7QIMv6i/KDqBR1m09tSdMC/JVPEfHOVnZt1dn4J5C2qDXpPeF565sv
	 h5UDFPOF7J0YAlX7jNPW1m9+G3TU3cBkRTnjhtGZEOLKFlLH2FQx9pC8B+h5Uc3cgLGtD
	 Hv28OM+MpmpPG2lmENmt/dRh+0r8r+qzBNoOsm+Tc78ema1NJ0JATYSK9jEq8E4OKfgMg
	 n7SrVVKrR6rvNPS81Bbn8RkdlC2QriK0XiFzLCKdvW6ESLaII2qfLcyQva0ChJTs9iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7DDd108;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFEA8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7DDd108
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-71733a926edso307917eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400891; x=1796005691; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=h7DDd108o5GP2IznqcAo5q1OAqf8piaqHCH6mnYZ2mfyRuOOgLUJrTscgFfD/KkHFO
         hrlTQk1XPPpzXy9rt517TvXbNnSf4nLESVhZYrFhEjAnl81SiuG3ZfENJ7tSGeYZyOwY
         9HqOkHF4tU53Sf5s2g3OcF1PkFwaA3IFnTaVeI6Cc6oPc8Y5E2rCUJEzlQ4E4nvfhkiX
         aBnwCQj1EZwXRl393Y0mdfr/s0GeM3anITT4jFy3oRbpI6nA1RtV1cgXEIpcDHuONOW/
         ceDiIn6GWHQb4faEWtZBoRdMHS8+OagMGcdSLBHaofxOMvOS4JA0nNbXqldjustAyYed
         YHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400891; x=1796005691;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=Qfl6Q7U4hVTn+ZrRPJPYsU1Mc69ctB0YvwvgkT2hjAcjhRPWhfdrFj6fsPjfhWp0hK
         zxY0+5QLu0izi8tmmr/4ugu5A5k91xZXMQPibwGunDr9uUB0bDe+idxDK+NhvXIAdxpF
         YuokTpiYa2qebbZ4aM3ulpEkndvztIFz3QetAyvve1q7fTZYwHsJPBkqBmuffTBLjlQZ
         RKSfdJ7SQ+3CBIMy8e2IazpNfoP4vnEn3rtC8DgiwbdHh0abbb6gaFgLe/lXtafLoC5v
         kvhn+tJHFuqRg2OIMNosMlKWPt8XayoVuoXAu3yUNCT9JjZ3PajiNbCCZYJufu68IEfD
         woHg==
X-Forwarded-Encrypted: i=1; AL+hErFNPLpryxwt5YfavR9+d4/7N6bWXdfuc8LaHtx+TkF8N2vYbVE642V7+DuWTZLQcm00F2P04x21VxVoNRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D1jpJoSY1pW7dT42TJOZ1hG9IK2UqHTEpYPhuHXGIU7akB0iq
	hEpZ+HFMOFEYhuuvZWFr8uH1JK9LxJUlrY2AW+br53IiPEx0fO3kcGxpNB06Pr8eXv3TBw==
X-Gm-Gg: AZFdTZdqMsHTOShjx42wxA0mFAyPn++F9LTmyNQKOFJu+Jp0SrobKAJ43T62EtwVBs7
	+7xnH5v9lpC8NN7dRaYm1HPwmlgCzZI5uiWT6lqf9nXhCi1W5VGltfgNASu/CHvywbK8lVVAKeg
	W9W0NN0bNu0WlFp1bKlo1/09ZQJ12fxxLxLEz6JacO0snSmNeYtzLSyrFZN9anBAvGHuIpiy8Jh
	XGbgNAKQqZuT9NFWsxggAWCLkMQO1xOjIu4BX0ie67Kf/oAfcFUJpwOdRUuWf2KJUjuENrP5r+M
	c5hqTX7e8nMBJD01HWL0ZPNJwAosGJbKY+l08Jx6bIpJ8l7uyZKhZRbAHPFKyKu8DHpjiIgL5av
	9sPqooP3EcJIco3gg6dFsoNelqnm96PdeBAjNAybzZNECZlffDv5kd0lIJ+fSut3ckcWH9pcF9p
	4yGNOJPh5SyX9cDWPOL1JsE/r3SZidtwheU2LZrkDLTcdDLEkGPJDaxgRjnPrefjilVzbir9dTI
	TAKFmOYPdkUvv3gnHsNLG3IlvmOfU35llGwyZltQdUdR6V0AwA2LP5TQETVGVSEFHasrpdzJSbz
	uH8wpmNLMBJZ+pyJRF/f/PoR
X-Received: by 2002:a05:6808:10d0:b0:579:7ac6:3a80 with SMTP id 5614622812f47-57a06b2355amr11438197b6e.1.1795400890686;
        Sun, 22 Nov 2026 18:28:10 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3575f5bfsm7953975b6e.14.2026.11.22.18.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 22 Nov 2026 20:28:06 -0600
Subject: [PATCH] usb: mtu3: keep interrupts disabled in gadget completion
 callbacks
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
Message-Id: <20261122-usb-mtu3-callbacks-irqs-off-v1-1-27733bb678c4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwA0KuEfC9g41DoVcSPpks0ODdtnAhjd
 x/4DvBWDG2ugRlWbPr18HnCDKkDrPcy3ZR8wAzIBz6lxExLCD0/y5FqGUcp9RHk7R00m9E5iYm
 wDr1V7ABfTc1///1y3bYdQaxVlG0AAAA=
X-Change-ID: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795400888; l=3240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Aex+y+91dtK8aIQ4sNmRyr8JQGY1Dd909+lkCK2MTzs=;
 b=M4YvQXt6noE/enwV80nd/23sRWZ6NXQcoF6/XGBBX6Drd8EoP1lXTTqbtd4nE9h11U0CS9Zz7
 YYjFJu75V3fBozGGwwgkXnSJ6bvpw58SqaekR/st0+fYeKjcOwSuAW5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Commit 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks
with interrupts disabled") made the threaded mtu3_irq() take mtu->lock
with spin_lock_bh(). mtu3_req_complete() drops the lock with a plain
spin_unlock() around usb_gadget_giveback_request(), so the gadget
function's completion callback now runs with interrupts enabled.

That breaks the gadget API, struct usb_request's @complete "will always
be called with interrupts disabled". u_serial's console relies on it:
gs_console_complete_out() takes cons->lock with spin_lock(), and
gs_console_write() takes the same lock with spin_lock_irqsave() from
printk, which can then interrupt the callback on the same CPU while it
holds the lock.

Keep spin_lock_irqsave() in mtu3_irq() and disable bottom halves around
it instead, as dwc3 does in commit 84918a89d6ef ("usb: dwc3: gadget: Let
the interrupt handler disable bottom halves."). netif_rx() then finds
softirqs disabled and leaves them alone, the completion callbacks run
with interrupts disabled again, and the softirq netif_rx() raises runs
at local_bh_enable(), once the lock is dropped and interrupts are on.

Tested on an MT8173 tablet with PROVE_LOCKING, copying a 21 MB file over
USB ethernet three times per arm: with spin_lock_bh(), all 8,333 completion
callbacks ran with interrupts enabled; with this change, none of about
16,000 did, with no lockdep report and every copy intact.

Fixes: 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks with interrupts disabled")
Cc: stable@kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Greg, commit 625dd9076e35 in usb-linus is v1 of my mtu3 callbacks fix,
the one I asked you on 2026-11-03 not to apply. With spin_lock_bh() the
gadget completion callbacks run with interrupts enabled, which the
gadget API rules out. v2 [1] got no reply, so here is v2's change as a
fix on top of 625dd9076e35; the resulting mtu3_irq() is the same as v2's.

My bad for the original error in v1.

[1] https://lore.kernel.org/all/20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com/
---
 drivers/usb/mtu3/mtu3_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index fc274646fcde..f6677f58dd1f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,9 +790,11 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
+	unsigned long flags;
 	u32 level1;
 
-	spin_lock_bh(&mtu->lock);
+	local_bh_disable();
+	spin_lock_irqsave(&mtu->lock, flags);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -813,7 +815,8 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_bh(&mtu->lock);
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	local_bh_enable();
 
 	return IRQ_HANDLED;
 }

---
base-commit: b0baaf6cbb16bc773d0c76916aac17c44a6cd557
change-id: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


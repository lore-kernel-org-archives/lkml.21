Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675900;
	b=DY/hCsaw0t+k8+6gFQOPAkJ9sWejsQPRAaw34Hkto3bOiKOP7adnSmldmBGSxYE3loLw
	 8uEIg5uN1y4XllV18F/IKjFKP6WwjCOFDW0wZJ0CG08qc8+MQXAlRcRA496KLG9ClmLNf
	 4lRC4WxqEfo7HxVoTeMyKicDYhpOOWWnHVLunChRN5kbo3n3B0JZLsrPy2VfAAVI1KvXE
	 dSFXW96Z9FozKlA8LSulFwJ3Px5mHVdWxcJCqKeXUKzKj8P1nQ2mI4qaIB5c0hDJzQwc7
	 W54Cc9lNfQa+uO5BZr5bKeIlBkGI4Z6uT8bEAbRCRGeS3N7k8zkY7AKs2KvlH/PNC1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZYTbVZm8c9pPfQXQr0mcNexiI7K3UauJcjFD8QyNtGY=;
	b=5i3Nv7AfuTrwuu2Bm4tEO2qMVFM5hKtJGD5ClyYRyupUa/V64eRnHjf7GPAzmH6HGfs1
	 XA7N4fxXi8kawklpWByYMgBiqCUJ/NuhoDMfNnw9VTcUxuwrIWabyLR2jALG6k801t1Ju
	 hzqKtFp1BHlnq/iJCgwl7kyAziYZH79O1e3sKRbwYyUvSV3bu9QQgJt205OHYOulEar/X
	 u3pyx1D6qhzVvBjzn+DO1bOTgNuUTIbHMpmUZE7l/rRNwEQ0LvSUkSFghBEs9M2o0Tuho
	 AShgzk3+SxdHEm14a4RCnwueSslS0gIBKb01ZZSVVMSDVNkuaQuIWKyEyQxY57yIjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GmtSUu//";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F890606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F890606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmtSUu//
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cddac941ed1so2992265a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675900; x=1796280700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYTbVZm8c9pPfQXQr0mcNexiI7K3UauJcjFD8QyNtGY=;
        b=GmtSUu//MHseD16Q+WXmBG/a4G0emLEiXQJRuhGXOubj2mJQpur6EMboa5wXs6VOwg
         bmFcTNb6kY8KNANP2I1ZrhttcUHQ7f/sP8dKDPDRowMcF+d3Ru+GKDoEhYp8S0JqEP1A
         CPXV0UzLKiXHN9dTMg1MzzBE0Fdp8Yg4S4XmUQ+m4f3nqqY0imAKQZ4lT/PoYmrsOHpa
         MBiVx65yJlqlGWUlhc8x0zUKjGksph0Nni9UfW1DgkLudyeb8tifRVGGej7wtIrEwowY
         e3hZqLlej8XSB6tKwzmzPI355eDRcnWbxtwfEloy8tLx4WRhq9WqqIsqG9Vfu0Lp5Gn3
         y5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675900; x=1796280700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYTbVZm8c9pPfQXQr0mcNexiI7K3UauJcjFD8QyNtGY=;
        b=BMFwCrkZbQzG/u7iueiMI65hXcs4WL1Ot9zyWtxi/rM72ULraHDxS9OToY5G3fSxhs
         nZf6RJcP1UHBIiX2Ix5uyE/PfTJv9X3/UEmVemoVzHdvIiPBnVC56lrc/m7In2vEb2rU
         1nLbAh6Ke/Xj25PY9bx3UE1H/14O4GzD1zKisNQf0owK+chmS5T7iwcJL/HjuDsmk7Us
         BTTqeG0VV//b/mOi3nhZXa85jXpjKqsHcqU0NMZY0O12UdR1QcGm3VOKIai+/ss++rMY
         Yt5WwxuV+UZ0rJvZdLE0uDVy+FQun2XYkQTWHayAKP2pGBTfvqbjuajtVLZ/eOkk7+Da
         GSaQ==
X-Forwarded-Encrypted: i=1; AL+hErFhOAm0rOYKrsi+Nv7Uh5mP2sHasp4KNixfwIFSEOKFFsc7TMKzx2akaPvQys3XmWRgjHfLDoaD92gl00Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/85RGrq+4D6GiMS9qpTOHiVoWXK/QdZnW1RRHObkytTYBbn+E1
	p+Psusd3KkfYIC4oHk6CtlD/13Vp6ZEM2GgbXTLIxkDtgTm8SADpNL0Moa32+2cNGeoaVme23y4
	=
X-Gm-Gg: AZFdTZfIdVsyvpmdndrn1yluYLjLjdlTpPQYGRz+HhCGISLtqP4sq3p7xCWu+oDBebH
	VcT8t2J0xQvMfEVNT//C0kXq3GsqlrP4KjxoSB+Z24yePkspMnAVIu/bN5l60Z9KP331+hfCgbe
	OuUgUqiDWSY5oXOxSPTZpHG1k6e+XsLkfJVOEktl9xTeLybXK5gjlt4+EUTwpntEKgudFs8Amtq
	AifuIFXJ+wB39IYKJuxxohjUrW0/PV+yX7OdUuzJvET+tEP9v5Rcj8dghzOtTFUkGaJHOPt+aEp
	BIdyb/9Ll1sISUoicE1Qk4qP9RUVZldpAYLvDSQz/c5t6jsZ8lAFNICTCQzMIdfw8ue3dEmrhUo
	c+VvaHqop6ZDoUebMRq8TWzyii77gj4Ls2uYSdDsugRyGi+Bq26nGVESXC7h3ExBJQvmLjn47M7
	OEs+DNC1VrFD8Yn4WiPZwMAhL4OdwtvKxszzienKPpCjp6nzbFdVGexnAQVlM4CXO8TJussCwfg
	NDChopH0C6HJRXwjH8+8y2jgKNax8tBB3J9yWONZMCFJve2D/FseOkLDNlAjIBGXnpYjV3LIbuM
	l05pHohDHkTByxmkOnZEGXqx1KXqRZStFXHJK2cv0SfVWoHOV0THqRRijKKb/XZh6GKrion0cd0
	OS9/RdIgZ8iJ86eZtWc+Vbr5PixGrSSiJ6A2jDDbnFzJOQMiYTIeCXd191ZopBJA33AgQ8BARLE
	JL7WJLsGPwEkal9XNyK9u36tblnWe5ODdSIaQ6Jt46
X-Received: by 2002:a17:90b:390b:b0:3b4:1336:4f6c with SMTP id 98e67ed59e1d1-3b41c7b6994mr18471889a91.2.1795675899422;
        Wed, 25 Nov 2026 22:51:39 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm34380982a91.2.2026.11.25.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:51:39 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: stf_xl@wp.pl,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: rt2x00: prevent txstatus_timer rearm during USB uninitialize
Date: Thu, 26 Nov 2026 14:51:32 +0800
Message-ID: <20261126065132.971-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

rt2x00usb_uninitialize() cancels rt2x00dev->txstatus_timer before
calling cancel_work_sync(&rt2x00dev->txdone_work). Because
rt2800usb_work_txdone() calls rt2800usb_async_read_tx_status() and
rearms txstatus_timer, the timer can remain armed after
rt2x00usb_uninitialize() frees queue entries via
rt2x00usb_free_entries(), allowing rt2800usb_tx_sta_fifo_timeout() to
submit new async register-read URBs and queue txdone_work on torn-down
queues.

Because rt2x00lib_uninitialize() clears DEVICE_STATE_INITIALIZED before
calling rt2x00usb_uninitialize(), guard txstatus_timer rearming and
timer-driven async register reads with DEVICE_STATE_INITIALIZED and
cancel txstatus_timer after cancel_work_sync(&rt2x00dev->txdone_work).

Fixes: 6232c17438ed ("rt2x00: avoid introducing a USB dependency in the rt2x00lib module")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection. Compile-tested on x86_64 with W=1 and KASAN (drivers/net/wireless/ralink/rt2x00/rt2800usb.o and rt2x00usb.o); not runtime-tested on Ralink USB hardware.

 drivers/net/wireless/ralink/rt2x00/rt2800usb.c | 10 +++++++++-
 drivers/net/wireless/ralink/rt2x00/rt2x00usb.c |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
index 15de3db..57e04c6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
@@ -118,7 +118,8 @@ static bool rt2800usb_tx_sta_fifo_read_completed(struct rt2x00_dev *rt2x00dev,
 	if (rt2800_txstatus_timeout(rt2x00dev))
 		queue_work(rt2x00dev->workqueue, &rt2x00dev->txdone_work);
 
-	if (rt2800_txstatus_pending(rt2x00dev)) {
+	if (rt2800_txstatus_pending(rt2x00dev) &&
+	    test_bit(DEVICE_STATE_INITIALIZED, &rt2x00dev->flags)) {
 		/* Read register after 1 ms */
 		hrtimer_start(&rt2x00dev->txstatus_timer,
 			      TXSTATUS_READ_INTERVAL,
@@ -142,6 +143,8 @@ stop_reading:
 
 static void rt2800usb_async_read_tx_status(struct rt2x00_dev *rt2x00dev)
 {
+	if (!test_bit(DEVICE_STATE_INITIALIZED, &rt2x00dev->flags))
+		return;
 
 	if (test_and_set_bit(TX_STATUS_READING, &rt2x00dev->flags))
 		return;
@@ -164,6 +167,11 @@ static enum hrtimer_restart rt2800usb_tx_sta_fifo_timeout(struct hrtimer *timer)
 	struct rt2x00_dev *rt2x00dev =
 	    container_of(timer, struct rt2x00_dev, txstatus_timer);
 
+	if (!test_bit(DEVICE_STATE_INITIALIZED, &rt2x00dev->flags)) {
+		clear_bit(TX_STATUS_READING, &rt2x00dev->flags);
+		return HRTIMER_NORESTART;
+	}
+
 	rt2x00usb_register_read_async(rt2x00dev, TX_STA_FIFO,
 				      rt2800usb_tx_sta_fifo_read_completed);
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index c9fbc37..bfd5a81 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -746,9 +746,9 @@ void rt2x00usb_uninitialize(struct rt2x00_dev *rt2x00dev)
 	struct data_queue *queue;
 
 	usb_kill_anchored_urbs(rt2x00dev->anchor);
-	hrtimer_cancel(&rt2x00dev->txstatus_timer);
 	cancel_work_sync(&rt2x00dev->rxdone_work);
 	cancel_work_sync(&rt2x00dev->txdone_work);
+	hrtimer_cancel(&rt2x00dev->txstatus_timer);
 
 	queue_for_each(rt2x00dev, queue)
 		rt2x00usb_free_entries(queue);
-- 
2.43.0


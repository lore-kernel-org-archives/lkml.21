Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746669;
	b=AToj0gWLJBSRL2khqYYfm621Ps3dnSE/QfLA4l3t0cFl0qyb5dsO3K7dyFvKnqhH02Lw
	 kFr57N4tEF1U3ID2EuFZgslZBlqdJ9cR1vQRLmwYisGBL7D/uhLPD1ILkBGQEUgeUUx+A
	 gvSG5fBBkiwODdmGE1WCzMRRPJr7RxrUwCUwayJgNaDyauhu7CQrd64YbsUs67gbH0yVB
	 DCki49O6cq2zwvVX4bvYoRQX4NeBZhsKfzd/0ZXcplN+a60fPbliR7hwkjXUrIOYe2/hF
	 y//Aa8Bm0uda/yEsu3KfS1RDQffpNo8i5BrXCOI++bQcq6IJmDtRlONkxWDoqHo5HNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746669;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer;
	bh=Eh8C429NYRB84ph6Okmue8COMMyeDf/G0j10ZZ+41x4=;
	b=LxjLOjbksMHFciLKPhsCWLMsiVAH3zEfHuhfnb3ceWvccvPLUWtOILyJmXhMSRNx4v6c
	 dlB4IkD3jBVlyoKQop0vXP2BSfo9wGH8a5NEXIP+S0K3IhanZvCE+6ANuju76nvWSzDC7
	 3Sqq8dQAZ4Bgalqe6cmfhzSbQT2Cf0wf8J4PAZ4MachP8yoiCRBGf4URSJrnKiikGErl6
	 Zvwz9i21frtypa02WTiiNVxDiLXGsFXdzVfH/GYiVJoSJS9HsEadtbd8O9zyzOpvUfbzD
	 /Iwrsr0iN/GUt9jonqJ/py70zdnBlHlFR6ptta+kkQsrhaP33qIaxygPi4BnhPnU6qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BZkOh5i6;
	arc=none smtp.remote-ip=91.218.175.221
Received: from mta0.migadu.com (out-221.mta0.migadu.com [91.218.175.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112C2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BZkOh5i6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UchmUJbpElyPXtiD+OkQfEDCqKbO9cZFRhnY5TgkKns=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795746667; v=1; x=1796351467;
 b=BZkOh5i6xOPaBjR6TkTxhuTswTlzDEn/4BuN5qa/jns0L01kl9fu1ChzW3NIjvardxAuz2Lu
 PapTkZmEjnuJOqtqEpuFXHhjlIwT53fpePtAAfrJ+xKnvJPoX60xDmhECkg7You4Kv/FGnUrrvU
 3axbSUK5EoQgrYHLbrFd/IP0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e7f9c2afca020d17;
	Fri, 27 Nov 2026 02:31:07 +0000
X-Mizu-Trace-ID: e7f9c2afca020d17
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: linusw@kernel.org,
	brgl@kernel.org,
	paulmck@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qiang.zhang@linux.dev
Subject: [PATCH] gpiolib: Use srcu_barrier() instead of synchronize_srcu() in gpiodev_release()
Date: Fri, 27 Nov 2026 10:31:01 +0800
Message-Id: <20261127023101.27568-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The gpio_desc_label object are freed asynchronously via call_srcu() on
gdev->desc_srcu (see desc_set_label()). to drain these pending SRCU
callbacks before cleanup the SRCU structure, gpiodev_release() currently
calls synchronize_srcu(&gdev->desc_srcu).

However, synchronize_srcu() only waits for a grace period to elapse and
for its own wakeme_after_rcu callback to be invoked. it does not guarantee
that callbacks queued on other CPUs have actually been invoked by the time
it returns. The following race may happen:

              CPUA                                        CPUB
call_srcu(desc_srcu, desc_free_label)

                                               gpiodev_release()
                                               ->synchronize_srcu()
                                                 ->call_srcu() queue wakeme_after_rcu()

SRCU GP end
timer_reduce(delay_work)

                                               SRCU GP end
                                                synchronize_srcu() return
                                               ->cleanup_srcu_struct()
/* timer still pending! */                        ->for CPUA timer_delete_sync() return true
                                                    and cblist not empty. tigger WARN_ON()

This commit therefore use srcu_barrier() instead of synchronize_srcu() on
gdev->desc_srcu,  it entrains a barrier callback on every CPU that has callbacks
queued and waits until all of them have been invoked.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c09342fc52cb..5dd4d142cf52 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -898,7 +898,7 @@ static void gpiodev_release(struct device *dev)
 	struct gpio_device *gdev = to_gpio_device(dev);
 
 	/* Call pending kfree()s for descriptor labels. */
-	synchronize_srcu(&gdev->desc_srcu);
+	srcu_barrier(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
 	if (gdev->line_state_wq)
-- 
2.17.1


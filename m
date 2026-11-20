Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139772;
	b=BlFhqBW/6zTy5hVD6+BEWJMZtFp/OnUfVfp2/fN1ZSmpRYEgtRFY2sPMSTs0n6+so45i
	 3euTO9HhpQOJapQkc/LguDwaT+oavNEUOcp+73tIL9zN47h68q0QhDLeo6VZSlIVtQGZ5
	 TT4e5VZes04lX+1bh0jqS6As14PEdom3oqtIvo0QZHqefJzzC4atommMtkgZ06O+mUx0q
	 9t/Lj7st9OmF5YvgLgMSLaa1Crwnc5F2QYVkGDbspg3c1eZU2uz6vB5LPKg2kml1rnrDq
	 uD+gy+MpeU/hcJRrCTemj0Jk1VskFmlufj5iyLse1sRpza15yZkkYTxdnOhirdbroxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPmYdno3g8WSLKD4XaUSvZ7KnfsPKwYsTc83SiDb58I=;
	b=UT5pT9sifAhg7dbtwWhibLWnH1BEAK1D7D+lAps0SlNYoG7gU9v67I502ORgEWrZjawk
	 WG3Kk9Ywnpr6qsh7KmGpFEuiK0iwLWTkm6QsM/cJTDsKlDvabHaytHFIauTrqLbButIRZ
	 Whs0IklYQL/3zFj2WjC3Y60Hc1dv8xh5jEahbbBJkIzgLv140mWX/0E7d0CiLcx+I41Ib
	 5xG1PiJksxV9x3KT3TgGFjjU7HPLx4RecbHGgSfOI81jZt6Mh+h9oJ7pbCidtNwfh+/EJ
	 y9NkUernTCdRC9f1TacEbUmIySJdNRe2FsSNewvmCfl5Fjn0tLwGYMEhWl0NMdUgWVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt8u0qdV;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D480606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D480606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt8u0qdV
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0213202fdso1888255ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139772; x=1795744572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPmYdno3g8WSLKD4XaUSvZ7KnfsPKwYsTc83SiDb58I=;
        b=Vt8u0qdVzKznUyLCtJOxfbqD1RvjbGLJmsTkmayi633oL1nxvM3Cnxy+yTPRViS9rt
         YIXnXBxOxjXB7icDJa6zR6KhnESI0iifY61PrUfAXarE7Oo78xwkhcnv7/6RGqD3NX23
         yALY5UE+K1RqBmpIGL7knk9bddWE8tCNi1RRjqpydLWj2JdlmSo+oSR+D/t0DO3W4txI
         pEf8dh/4ZMGmSbDthrRiQUxfhFf93+qsnqvuStnTAnYxgI+6K1wci/jwJj8EZapIsha7
         KJBG+1UcejiyKPzX2Ctsd/DlIIDcn3uq0VooYmRGbJJcf64lmJbMw9ca48JZj1gw2kFj
         3Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139772; x=1795744572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPmYdno3g8WSLKD4XaUSvZ7KnfsPKwYsTc83SiDb58I=;
        b=ce8KQ7OA/rXjV6HDcnF+2vKH4gDD8j6FhqA1qFiLKUJslR/ckw2XGMu1zL2J9Gapb9
         zy1MQGKEvAXiLcG6kieyDKdpAVkw7sZI6OatDzAJ9i6DffC4BEIgc/vlascwhKcD3iuR
         xZoeC4MJQUrU5KgfCt5pjOo+sJCSLxH64OBeWGPKn+ubPoqCfUp0iVM/6PNMyVp/HA54
         tWlnn4c0r+FV1Po4qr8/g1J1HtRVBcJ3S/T7hgyN1QoJkFErr//8n3m11KuX4dHLT9XT
         1x2Nv2rCn2FIx5kO4uBur1UA5VFBAsfa4S3ySeDhwd87lab3IXEItSCMK7DK+KazCdFC
         WEeA==
X-Forwarded-Encrypted: i=1; AL+hErGBs3DA6SgPhO0SfgEgZS0hgaRQwEwCVNB6xi1I6LjDhNJNxDzjtcKfMAX0EXLhxO13Y2lqgix2km0bhfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aLnr3Sx565rL3S6xsXaog/Cw1K4482ZmlUzT/xWf16VQHlsKA
	Fj4BPyTwPwYUdZPG4VpamoweKZluqmCrHn9O34TdMwW+WN7p+4RHwhQi
X-Gm-Gg: AZFdTZeYP8nkw6IUFk3/IZzQQH7AyE+O5K5VZqjlmCDhEmMXT3UTI0agSnGoQcWTtau
	sde5rwwjrxYfAd7ASSv9om0FugJP/l5A+H3EkP3IO0vuQRUWns0X3RlZMgq8UqKgZU4DC+hZBdv
	vX5r0fw8SMmKH8dPNCBH2NEcRubYIbIzBmjiAuco6jHXL34uEflVgq61nphFwDTpGxtVG82PNbg
	37Jy+nqUeBQtXsWbCXg6pi/7xB5VnwHxOgJXMbkboA6GuHzHKxuom/MY/mDUpZ8wl0fpGJhMwv1
	lYhNHocdAwDflzoksdfz8LvmOKuZLgAdN9WnPXKtmyU2um36uePJB+P+JqXeF1S+RULCITfen0+
	1rex/TPRi97vAnO6WbrnRvOWEhKXOeeVoYsDlrzGxIJ7VJmHQceohGQJTaw1Hse3qAzM5sZ0qtr
	HXT3sq2eIeDz3HnfUM8vRRPQ3lStzxsp5vr2wCl14dtdFnThAfkrrPtOVeWiNRSIOg/dvdiYR12
	w+4JHpe2ZTmKgaX+3dBbpecmJqbj12fE+vxnm+YOcn1Im74vNEIVZVH9oNYkCHVFHhMcifId3Xc
	XdNI2bB4lPjXspaelsU1PM4HOyXEIKFJ9ot1SFsH0cX3xgQ4o4Y=
X-Received: by 2002:a17:90b:4ec5:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3b41c96182bmr1177968a91.59.1795139771651;
        Thu, 19 Nov 2026 17:56:11 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:11 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 1/6] net: wwan: t7xx: fix TX push kthread soft lockup on system suspend
Date: Fri, 20 Nov 2026 09:55:51 +0800
Message-ID: <20261120015556.131547-2-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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

t7xx_dpmaif_suspend() stops the TX queues (que_started = false) but
leaves dpmaif_ctrl->state at DPMAIF_STATE_PWRON. The TX push kthread
only sleeps while the TX lists are empty or state != PWRON, so when
skbs are still queued at the time the suspend callback runs its wait
condition stays true and every iteration completes without doing
anything and without sleeping: pm_runtime_resume_and_get() returns 0
without resuming anything (the PCI core resumed the device before the
suspend callback, and once runtime PM is disabled in the late phase an
active device is reported as already resumed); t7xx_pci_disable_sleep()
completes at once because md_pm_state is no longer MTK_PM_RESUMED;
t7xx_do_tx_hw_push() returns immediately because no queue is started.
There is no scheduling point in that loop, so the kthread spins on its
CPU for the rest of the suspend/resume cycle.

With s2idle and ASPM L1 enabled this was seen as a soft lockup after
about a thousand suspend/resume cycles (the 981st in the capture below).
The lockup was reported at different points of the suspend: while the
device callbacks were still running, right after this driver's own
suspend callback had stopped the queues, and after the wakeup interrupt
but before any resume callback had run. Captured with kdump on an
unmodified 6.19 kernel:

  mtk_t7xx 0000:56:00.0: PM: pci_pm_suspend returned 0 after 39260 usecs
  ...
  watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [dpmaif_tx_hw_pu:764]
  RIP: 0010:ktime_get_mono_fast_ns+0x2e/0xe0
  Call Trace:
   ? t7xx_pci_enable_sleep+0x44/0x90 [mtk_t7xx]
   t7xx_dpmaif_tx_hw_push_thread+0x1f9/0x490 [mtk_t7xx]
   kthread+0x10b/0x220
   ret_from_fork+0x159/0x1d0
   ret_from_fork_asm+0x1a/0x30

Other captures sample the same loop in t7xx_pci_disable_sleep() or in
the runtime PM put; all other CPUs are idle.

The same loop runs after a resume that does not restart the queues (a
modem exception found in the PM resume state, or shutdown) until the
FSM takes the DPMAIF out of DPMAIF_STATE_PWRON.

Once pm_runtime_resume_and_get() has returned, a runtime suspended
device has been resumed and its queues restarted, so a TX queue that is
still stopped at that point was stopped by a system suspend or by an
exception. Skip the push in that case and wait on tx_wq until the queue
is restarted or the thread is stopped; t7xx_dpmaif_resume() and
t7xx_dpmaif_start() already wake tx_wq after restarting the queues.

The check is not folded into the thread's main wait condition on
purpose: a runtime suspended device also has its queues stopped and
relies on this thread calling pm_runtime_resume_and_get() to be
resumed when skbs are queued.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 236d632cf591..798e4e95004f 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -445,6 +445,7 @@ static void t7xx_do_tx_hw_push(struct dpmaif_ctrl *dpmaif_ctrl)
 static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 {
 	struct dpmaif_ctrl *dpmaif_ctrl = arg;
+	bool txq_stopped;
 	int ret;
 
 	while (!kthread_should_stop()) {
@@ -464,10 +465,23 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 		if (ret < 0 && ret != -EACCES)
 			return ret;
 
-		t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
-		t7xx_do_tx_hw_push(dpmaif_ctrl);
-		t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
+		/* A runtime suspended device was resumed above and had its queues
+		 * restarted, so a stopped queue here belongs to a system suspend
+		 * or an exception: wait for t7xx_dpmaif_resume() or
+		 * t7xx_dpmaif_start() to restart it instead of spinning.
+		 */
+		txq_stopped = !t7xx_select_tx_queue(dpmaif_ctrl);
+		if (!txq_stopped) {
+			t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
+			t7xx_do_tx_hw_push(dpmaif_ctrl);
+			t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
+		}
 		pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
+
+		if (txq_stopped)
+			wait_event_interruptible(dpmaif_ctrl->tx_wq,
+						 t7xx_select_tx_queue(dpmaif_ctrl) ||
+						 kthread_should_stop());
 	}
 
 	return 0;
-- 
2.43.0


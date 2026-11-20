Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139792;
	b=DmDvc+KYL9TTnqouDOopOrWEs7nWyM+w4Su3KdzQLNAIAnTzQxl+9jkfrfl24vuCr92g
	 XuNoyYo3rU1JS01/0RebQ/lihLNqEN+Wrg2FPT9OHpiyKgnSro2zzxvffyXRYdJBH9qtV
	 hJ4nqfiaSWwbcly7RKQDa/KhSnd+iVCcFF+b7uOJIJQeaaJHry3D5dAVVNTvuFhDXpQhw
	 P15+qJWj05+ZimU+FdHSJiXpM/mS2D/v6T/cD19/pJV+QVIyMwU2RHLhZfJEdaN2QG3dC
	 7umeVh5XHFITsvik1Ak34ewcA5i2eplwpUCLKHWaDleVXwM+YH5GD7E52uha8ukEb2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NkVoEL8R6+jFswtX2KmwPOjhnhN80a9T2KLgPaWg2qw=;
	b=TIz8Rvo7PjoRIIBbWdzCD1tCBvpxuLHo8lp1kjMJAG77rnPi5d1rXm4i8+4T/tpRs1L4
	 vRGDofmdPSiebwgFWec9Dwd2eM0AVEYZImI+G5boH2PlMqSxveBYaEOvCe5n9mO0eljFU
	 RdjIx9qJGHH2jJ9sNGbYxO40kIxaWkyA3UDCw5NWrzJU9qU7+1jA2iIbch2w3m94Kkgfr
	 5KNdkSPpROg64e90CvY++L2RKaonQ7qAW7YXI6sicDjzVuMN7SG16W4gk7S2edf1RvqxJ
	 HQFNOYtrAxnQ9hBV87pwgdJ4z29w1+Fl2nXUY2BK9tplwRlfjaIf0oAT9mj20MNeL8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RBArh/Tb";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FE606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70FE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RBArh/Tb
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab938dc83so173932a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139791; x=1795744591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkVoEL8R6+jFswtX2KmwPOjhnhN80a9T2KLgPaWg2qw=;
        b=RBArh/Tb/F97/TrDoqVqjqL+RAsNjTutN9aSWTNbjdsCe58AjcclftNURZgvk+xAH6
         QxSDAGtpD4t8K/nDGG83OvLBLp1QM7Q0UlB895cUOYly+AkFZo+GakF9Zm3f0fwxQut3
         5JJ1UU/8cdqgw/ryvR/0uWWtz20Ke+DoMaUpUru3DsiHyedM2IsPVtry3G8VgABL7AWE
         aGNcdHv1gwq8BkPyI6s8zHO843SZgzicg1EiozcTdksZTmdpoIvHK2kw77yJRTvro7/Q
         OXpEkp3D465Qi2xtfSP8x6Swts4AXb4Y+9dUsrF/BLwfZ23pAA1utxe0vUyoykfKE8g1
         m0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139791; x=1795744591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NkVoEL8R6+jFswtX2KmwPOjhnhN80a9T2KLgPaWg2qw=;
        b=IXqoPPVitKooyIQBEmmy7QYYP/F6ZzIno6qF3TdERNsD9p/S+SiAcOKPPSK4pG1jod
         xn0ByUDD1d5kVnBG4MOp/oz4AMb6rI+kM20fyEzGIkmdiFPsK17eEQaxv5Gjo77Z/ANz
         L2Gk0yJC4mTht5QUHr9zSUnhiT6IomqQCQcGXRe6MxlV3PO+AHKY7XCwyCJ6mIzaMvgT
         U+qjStzAAIovn5yy+K/nrMrHSxYLuAoCBBRx/RcfIba88OQg2LTAoZtlUN0VNE0AheDk
         6odBaFKsKENny5iBFhpdDdjgAz8QnpZONpeTCHVEmVS4kmRePeWBo8SV8n2wuWOWmbWe
         Ihdg==
X-Forwarded-Encrypted: i=1; AL+hErG4rNIjy6RpsS6wqJMs66JT5gp2FVAIoGCI98rRSrsOCcCxWEBY5BSB0W4beZKkYcXpoDfuBqulf7G0qdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5YlcC3QABX0lL+eyOfAfhe3DAZDbQROq8LpWS46uP0SRfXUit
	d9L8iPib8Wu57f9U+vsm052I0Piq3clo+Fx9w3qpsNhmh3bYzGxQeR4B
X-Gm-Gg: AZFdTZc4E9juZEbtexG1iM+rjmLQRGJ51MvKV3xThQQ1pMTe5uKhEk68HWde0/LKFVY
	YjKnzTTobvREa2LIKUljocuD9xBCg/DtQ/VVFS9Kqvp+cVCpAh6HYgA32b4lDQP6Ly8CLGUD8ii
	XE7A51DWX6zokmuR4lMk9S+C6MOS352sJL+1wjPFbiIcmLV4rtJTd/OgUv/K5xN055enB6y1IIl
	spVAV4S2l85b1EufQiuGMVZwxVkFPj4O1HLlGxGT2pm+CD7ldteRnmgUiSv0VvFyQx4ZsIeNq8B
	Ip6uW+hlwke/lwVPzmqrOObiYnJ61DQSLHsUpiYhUXr/mHvr47rCKAYXeuLDBInd2+z6Cgi0BfI
	PEGUI3nACsQJBCxRstPJNvx+mm3N8JF56mx1e2vyqj5TkZwtmhX5yolOuF4+usQtG0ZpVDtC+1K
	pbuWFeXr+vuJAKyzh01ToEhZ6cCCCqkWY4N615jtim3skomwd3av6YL91K7O3t7Bvvj7sy7JV0O
	xFQlZn2zdVlLdI3HYMhT3xdM1uIkssnGYNLvM9morItYY24VGLF4FBx7/VnOBxc2oN0/8zGndw5
	r4Nph3+Fgqo26CbJQJuoosRCrd8ocUH4OwgYlVvxrOClareXbDQp
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr1431787a91.5.1795139790906;
        Thu, 19 Nov 2026 17:56:30 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:30 -0800 (PST)
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
	Tim JH Chen <tim770802@gmail.com>,
	Andreas Haerter <ah@foundata.com>
Subject: [PATCH net v7 4/6] net: wwan: t7xx: do not exit the TX push kthread on resume failure
Date: Fri, 20 Nov 2026 09:55:54 +0800
Message-ID: <20261120015556.131547-5-tim770802@gmail.com>
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

t7xx_dpmaif_tx_hw_push_thread() returns, ending the kthread, when the
runtime PM resume fails with anything other than -EACCES. kthread_run()
keeps no extra reference to the task, so the task_struct can be reaped
or reused while dpmaif_ctrl->tx_thread still points at it. A later
t7xx_dpmaif_tx_thread_rel() then calls kthread_stop() on the stale
pointer. It also stops TX permanently and silently.

This was hit in the field after a runtime suspend failure ("SAP
suspend error: -110") left dev->power.runtime_error set: every resume
returned -EINVAL, the thread exited, and a later write to the PCI
remove attribute crashed in kthread_stop() with a NULL
worker_private. The remove then hung in D state holding
pci_rescan_remove_lock and the machine could not shut down cleanly.

Log the failure and retry every second instead of exiting. Only the
first failure of a streak is logged. The wait ends early on
kthread_stop(), so the thread stays alive until
t7xx_dpmaif_tx_thread_rel() tears it down. Recovering from a sticky
runtime_error is a separate problem and is not attempted here.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Reported-by: Andreas Haerter <ah@foundata.com>
Closes: https://lore.kernel.org/netdev/20261106054532.201311-1-ah@foundata.com/
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 48558b98e7c6..00e456bdd808 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -448,6 +448,7 @@ static void t7xx_do_tx_hw_push(struct dpmaif_ctrl *dpmaif_ctrl)
 static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 {
 	struct dpmaif_ctrl *dpmaif_ctrl = arg;
+	bool resume_failed = false;
 	bool txq_stopped;
 	int ret;
 
@@ -468,8 +469,19 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 		ret = pm_runtime_resume(dpmaif_ctrl->dev);
 		if (ret < 0 && ret != -EACCES) {
 			pm_runtime_put_noidle(dpmaif_ctrl->dev);
-			return ret;
+			/* Do not exit: t7xx_dpmaif_tx_thread_rel() kthread_stop()s
+			 * this task. Retry until the resume works or we are stopped.
+			 */
+			if (!resume_failed)
+				dev_err(dpmaif_ctrl->dev,
+					"Failed to resume for TX push: %d\n", ret);
+			resume_failed = true;
+			wait_event_interruptible_timeout(dpmaif_ctrl->tx_wq,
+							 kthread_should_stop(),
+							 HZ);
+			continue;
 		}
+		resume_failed = false;
 
 		/* A runtime suspended device was resumed above and had its queues
 		 * restarted, so a stopped queue here belongs to a system suspend
-- 
2.43.0


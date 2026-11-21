Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302470;
	b=A5Xx5GDjPeyAwtgOEv34CX3T4sjZ5BCjKmOaWfoaVLoGD6LhkHLxdCbouh7AnxeTHNw1
	 OpTrQj1rEOZiO8YkTtpkSUqrkhkIjPOyZadx8R2htPfMoT7rI35s+eRV5R1Aom5q7zSky
	 dyZovT2EZKiNCTFlGtbFjjHXpcX3CwmuP3p+4ApY7rNDLfgSKM/SuSe3/+gw5kHSrrOG3
	 CvyqWYWJH10aX7LP7L3Cs+opTo4OsyHH5YCb6nHdJ6etOv2EUWV8P0jJP5yYYYZHyY2yu
	 ST3VuvyMSPqnVaSY+lYBNLGxbCeAWxCIsUaMzYvceY/IywfpaPY9AgN+y60DO2RBDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
	b=r0VHNrqMd6YiNyvzHDP9udRWZZQjlszbvNCEWD001agwKQDM5Agb3BgSiTe56dOS+/+/
	 U+hnFZWfZUmcPhrni4ijOwM1UN5PZcX90waPfH061p1woluw8+trRiaXdEGOrshWAKW/9
	 4dvrRHWu0/LmEUcKs8SUBRiUtjqT1jC7VOdn22TnAkDezIFQWnb58wLm0d9yA+uKcGnNY
	 sCqNOurHo4o/eBRGBTAeNqul2TM6MeNXgBVuRIM/RzrQJTUi2nsfEYdrzF2WiOBIph/jW
	 nzcRN3SWHfpTs7hs1dw2r878yxvZ4xqNg6YSxZ230VCkHVy2JQSMqHHsUQW3nZRfUBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JcBzBLkB;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731960A3803
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9731960A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JcBzBLkB
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c513a854320so364442666b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302468; x=1795907268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
        b=JcBzBLkBbabbjnUzyZkJCTQOUMeZlV++pXiJqlIgCLN7/S2luV7Ylz0Gbzc21vv+Cj
         WDJ/Wer0cG4EA2LOHv0Snh+7boeFsKAn10PQw1nvGfLzPqDnIsJizo+e96ORX4cR1k5g
         KdXwBDjhvNSMMmH1aws+gHSkSIS7JnSMdpXLzvvEFoUWHUM0yTOgppDsFU0QcZfSCIbh
         t19bZ1M2DUOJZ2z2Lej8KFQ2w/8T2QVzoHNqmqZ2lDb/sTVVn9rhZ9Rmp7cgY3Pk7I+M
         c4pu7B0wdO9C6p7CAawrldEhuDa6sT1wsl2dnQr2VzW7Atpsx9G0nwdsWU6zUZNat7Fg
         i9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302468; x=1795907268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
        b=hkervYrGUgHFXshJukhRhKUNQOXpueYhqUdNwqJO7OOrdNnne2aRPkFam9aUf7aeUr
         80J5zNaeN/MhBfDcJFWgi6q5vSiZpArHzgph6/b7pwMrX4YNxq0UvNUNicWZ5CkCtUJY
         Ik+dXzdvlsk6CcYsMqAYB0ySIHBuLYh0bXwxIWefQOFdab76wYFOEoJtYzrYgGEbFYT9
         MzYqtQVJ/C16ZKvVcavsY00+wG4FsJQL9HdKZ3+09UPQya/QSZsM7YeNawNlSY042IWf
         DIB+Hei7leKq9zhPvRBEDMakOW7dQFCmvnKJtm8QTAtp1p2nwhIg86DJGJLedqWJDZez
         Lznw==
X-Forwarded-Encrypted: i=1; AL+hErGkTTt5g5A7VkjtQyFn16Izooeeue6XHsU/vjDI2/AfRAv/htF4cf//onphoPbCyCZwjDIWYzE8bsEGvb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z+WWpkOm/qwoUDyZxFxWyjGFCyKb6kFcL9Woc7MiNi78XfGl7
	vABjWp1Tw1urDim4oupy2azFKohtMvIwRcCBMzU5d/IPqSgMHXukFB7VwUi2gfyAYg==
X-Gm-Gg: AZFdTZeLnLunAj4zI20n3dsGT2UZHQzxZUnehZzrLjUK7qEThb1ytl3ngt7R1hwU9zt
	vH6QdZ4hOyZwaQyMvsTNdLja9AsKTX1iFZCMbu6FhtLs8oXkimIjYL+0qqv4A2KYY4+EnRsoHsY
	5zKT1t63n3XHm28aQCHlSDNfs3CAb0/rWp82fcWbAoFSRgZyoF3raQWclxcNgc2bPniP6XGfG+e
	wgIAFwV35wMKEJheYtm16G+5OyuatzbtjnfbiFFqcQzkcKXhGZ6TBq/zpTPmDUhFl8XQ4ImivhV
	GVsbok5bNv8HEh1sHTQltF6WNolkCkuSED8oGGxSWzUIvBPgvbvzKRNpSDXVvGov8js2331zc8q
	32teKItI7r/wGEsbPLqKsJheCVD2kLLss4ZBnv85mFAa4uytkZyOu5WiDO/Cbupv1jex3C2ILIM
	KiXQ8Nu92zuA7LpLdGSisQmNUo2VnMZl117eTSxz8wFdbT/3z7QFvRo8BwUduhQXRGE85itU8qR
	1bHTVaIlFK6COaPA/kGNgYqpxtBc3o49pyGMhwNyb1syq/vLxOcsjN42uOPtZzjmniWeQdgtAll
	ZSTxzEhnuj9eROakk/bhRyLPby1AeMa+t382Xvp8ztTt/aJkGHOqgo7pAu011n0EyqADB1nPrFx
	61H5pd+AHXV9EI0og+/BAcDt2U0PgKfAkaZ32cIaoMtmQQzftdQgYO8lswGj5zoX5SARW0xbdXr
	qHA6OE48LEXvDO2M6xIGuLkq/hvxkvD31SMsnBjw1jJIBsiOnzsJ9Lildg01LqclhhzL/G5+rJ1
	g8fjgaZAuRO2kvtMq40LiUUCA6oq3NHYliXwN+OD0NmzsmXJIfgQcDRk9JE2ewgW93XcoBwTqft
	YJiTA6dw1asEpTyUyc/Qv/AAfA0+N1/igOcw3YEHpFDQJFhEsah+N2wRVxczFTC8iuo4gIsc8Ec
	=
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr489568866b.14.1795302468046;
        Sat, 21 Nov 2026 15:07:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 08/13] wifi: ath11k: ahb: stop TX before WCSS is reset on a firmware crash
Date: Sun, 22 Nov 2026 00:07:26 +0100
Message-ID: <20261121230731.1206043-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

From: Florian Maurer <fmaurer@disroot.org>

On IPQ8074 a firmware crash is handled by remoteproc, which stops the
remote processor and thereby resets WCSS. ath11k sets
ATH11K_FLAG_CRASH_FLUSH, which stops the TX paths, only when it handles
the QMI server exit event. That event results from the glink teardown
in rproc_stop() and is handled asynchronously, so it can be processed
after WCSS is already in reset. A TX in that window writes a ring head
pointer to the reset block, which ends in an asynchronous SError:

  remoteproc remoteproc0: stopped remote processor cd00000.q6v5_wcss
  SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
  pc : ath11k_dp_tx+0x45c/0x878 [ath11k]
  Kernel panic - not syncing: Asynchronous SError Interrupt

remoteproc sends a QCOM_SSR_BEFORE_SHUTDOWN notification with crashed
set before it stops the processor. Register for it, like ath10k does on
SNOC, set ATH11K_FLAG_CRASH_FLUSH there and wait with synchronize_rcu()
for TX paths which have not seen the flag yet. ath11k_dp_tx() is called
by mac80211 within RCU read-side critical sections or with BHs
disabled. Check the flag in ath11k_ce_send() again under ce_lock, so
that this also covers WMI and HTC.

This stops new TX descriptors, for data and for everything sent through
CE. Ring pointer updates from the RX and TX completion paths (NAPI, CE
tasklets) are not stopped by this.

A crash during the restart work of an earlier crash, after the QMI
firmware start and before ath11k_core_qmi_firmware_ready() clears
ATH11K_FLAG_CRASH_FLUSH after ath11k_dp_alloc(), is not covered yet:
the flag set by the notifier is cleared again, and CE/HTC sends from
the restart work can still reach the reset WCSS. mac80211 data queues
are still stopped at that point. That window is a few milliseconds and
will be addressed separately.

The SSR subsystem name depends on the remoteproc driver, so add it to
hw_params. Only IPQ8074 sets it for now. qcom_register_ssr_notifier()
must be reachable from ath11k_ahb, so add the same Kconfig dependency
on QCOM_RPROC_COMMON as ath10k SNOC has.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/Kconfig |  1 +
 drivers/net/wireless/ath/ath11k/ahb.c   | 59 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/ahb.h   |  2 +
 drivers/net/wireless/ath/ath11k/ce.c    |  7 +++
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 6 files changed, 71 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 2b608d4ed263..7dcc2c3543eb 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -13,6 +13,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
+	depends on QCOM_RPROC_COMMON || QCOM_RPROC_COMMON=n
 	depends on RPMSG
 	select QRTR
 	select QRTR_SMD
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 3ff7d5f27f5e..893a3270394e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -20,6 +20,7 @@
 #include "pcic.h"
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/remoteproc/qcom_rproc.h>
 
 static const struct of_device_id ath11k_ahb_of_match[] = {
 	/* TODO: Should we change the compatible string to something similar
@@ -832,6 +833,60 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
 	.ce_irq_disable = ath11k_pci_disable_ce_irqs_except_wake_irq,
 };
 
+static int ath11k_ahb_ssr_notifier(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct ath11k_ahb *ab_ahb = container_of(nb, struct ath11k_ahb, ssr_nb);
+	struct ath11k_base *ab = container_of((void *)ab_ahb, struct ath11k_base,
+					      drv_priv);
+	struct qcom_ssr_notify_data *notify = data;
+
+	if (action != QCOM_SSR_BEFORE_SHUTDOWN || !notify->crashed)
+		return NOTIFY_DONE;
+
+	/* WCSS can be reset before the QMI server exit event sets the flag.
+	 * ath11k_dp_tx() runs in RCU read-side sections or with BHs disabled
+	 * and ath11k_ce_send() checks the flag under ce_lock, so after
+	 * synchronize_rcu() no new TX descriptors are queued.
+	 */
+	ath11k_dbg(ab, ATH11K_DBG_AHB, "firmware crashed, stopping tx\n");
+	set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+	synchronize_rcu();
+
+	return NOTIFY_OK;
+}
+
+static void ath11k_ahb_register_ssr_notifier(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+	void *handle;
+
+	if (!ab->hw_params.ssr_name)
+		return;
+
+	ab_ahb->ssr_nb.notifier_call = ath11k_ahb_ssr_notifier;
+	handle = qcom_register_ssr_notifier(ab->hw_params.ssr_name,
+					    &ab_ahb->ssr_nb);
+	if (IS_ERR(handle)) {
+		ath11k_warn(ab, "failed to register ssr notifier: %ld\n",
+			    PTR_ERR(handle));
+		return;
+	}
+
+	ab_ahb->ssr_handle = handle;
+}
+
+static void ath11k_ahb_unregister_ssr_notifier(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+
+	if (!ab_ahb->ssr_handle)
+		return;
+
+	qcom_unregister_ssr_notifier(ab_ahb->ssr_handle, &ab_ahb->ssr_nb);
+	ab_ahb->ssr_handle = NULL;
+}
+
 static int ath11k_core_get_rproc(struct ath11k_base *ab)
 {
 	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
@@ -1230,6 +1285,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_ce_free;
 
+	ath11k_ahb_register_ssr_notifier(ab);
+
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
@@ -1247,6 +1304,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	return 0;
 
 err_ce_free:
+	ath11k_ahb_unregister_ssr_notifier(ab);
 	ath11k_ce_free_pipes(ab);
 
 err_hal_srng_deinit:
@@ -1288,6 +1346,7 @@ static void ath11k_ahb_free_resources(struct ath11k_base *ab)
 {
 	struct platform_device *pdev = ab->pdev;
 
+	ath11k_ahb_unregister_ssr_notifier(ab);
 	ath11k_ahb_free_irq(ab);
 	ath11k_hal_srng_deinit(ab);
 	ath11k_ahb_release_smp2p_handle(ab);
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 8c1eb1e8e6b1..d7ea47f42edf 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -23,6 +23,8 @@ struct ath11k_base;
 
 struct ath11k_ahb {
 	struct rproc *tgt_rproc;
+	struct notifier_block ssr_nb;
+	void *ssr_handle;
 	struct {
 		struct device *dev;
 		struct iommu_domain *iommu_domain;
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index af08a2a24c6d..08fd0ab353e4 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -745,6 +745,12 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 
 	spin_lock_bh(&ab->ce.ce_lock);
 
+	/* Check again with BHs disabled, see ath11k_ahb_ssr_notifier() */
+	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags)) {
+		ret = -ESHUTDOWN;
+		goto err_ce_unlock;
+	}
+
 	write_index = pipe->src_ring->write_index;
 	nentries_mask = pipe->src_ring->nentries_mask;
 
@@ -791,6 +797,7 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 err_unlock:
 	spin_unlock_bh(&srng->lock);
 
+err_ce_unlock:
 	spin_unlock_bh(&ab->ce.ce_lock);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e8d245f1023a..d4845a1300d9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -91,6 +91,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_mm = true,
 		.coldboot_cal_ftm = true,
 		.cbcal_restart_fw = true,
+		.ssr_name = "q6wcss",
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..ce52c61d661d 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -191,6 +191,7 @@ struct ath11k_hw_params {
 	bool coldboot_cal_mm;
 	bool coldboot_cal_ftm;
 	bool cbcal_restart_fw;
+	const char *ssr_name;
 	int fw_mem_mode;
 	u32 num_vdevs;
 	u32 num_peers;
-- 
2.53.0


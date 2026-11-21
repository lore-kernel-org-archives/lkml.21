Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283646;
	b=MvHbf3EAmy1zh/vveKnIZ/kxSJnKlVzDvNE/NUC5hJy/CHl6bCedvJD8ciVVtcNG38QH
	 sTbFQbgzI3XVCmSt9B+rI/Cc1snBB8EwkGB8HqGXP3dM+z2kh1pwAIM2gDA1D+k/iuO/G
	 y19t9H9M1lKxalundRKVwkCm01+B1eP0u2KWqZHPPSQ7g1Eg1tdWm1qbbh+CKZWtVVw+O
	 OLFKhWxXVilxSpoJdER34nbxKa90yFfeoObdV52eNOtyW6IPXbVyxcqOBjzb6toQpnUUf
	 qLu0E8wNc94aoOSp/CfehnZgtijjVYEW9oBypSa6V6V6QurIZRn8vd1t7S4eLXvflmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GKuofsZia6gZu0IVTj6I5maYmZCkTtZmhIHR+mKMDpE=;
	b=2oQJnLO3jwLL+UmPL+wdQRd3gxgchLf+qu0TaLjHGPhjqFmiEQs0kfi194d3g2eROcPr
	 B7k8ONJZKn/rsBZcPC2bvS9bFJdJ9iC7K5qI3s4DNI45lROuabURv4hT/+Ap//JXt0TH7
	 GPFMTYvvISMD3H2EbtRGJaaDh3XXIEVjcs9hbIrxCJlpziugggYanynw8h51V9EszdYB3
	 tPX5pOlmnB0Uoav8zHjUh7vuQh/xKwJwKlIfGu9jhzcOrvoCZ5Uw2TyBH/f6C5cxOFa59
	 bDj5sTjlpd1J2l+q3YK7ds6/JMLsILrhDN8Q5cX8QvaIla3nycA59A968FnAMnfii4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oEjGYKWd;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9C606A68C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A9C606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oEjGYKWd
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c511cdd5a82so232519766b.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283644; x=1795888444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKuofsZia6gZu0IVTj6I5maYmZCkTtZmhIHR+mKMDpE=;
        b=oEjGYKWd6xC2wk9w7oZ6I8JDxLRQd6xw+Ub+Znn4KI+LcEkZL4tJh4LNgOj9vQ7JBN
         4A7HCa1NFgaHiybone9ZeJrQYfKqw8vFJ/+CvL+4wjbxRhl5qaLINwy4TZhdWVtGorNS
         Iy3D7LfOolC6WnWAo1AVE3DNkFXMSd4s8jo7mkZEU8wLPqF2BZozT3BkK6RuOPBiTqm5
         X6I020glc4rQetDQ0SnhbFYhzsiw1VJ04g56kuuMhV+L7JhaQNucovumqS8QohEuaQ6I
         JMaXmjfZjYhCyW7hxtg+VlZy1CuGB6Xcl9Yp2V/s6aoV7xqtWkKh5saBrR2OTYeRQHOu
         QNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283644; x=1795888444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKuofsZia6gZu0IVTj6I5maYmZCkTtZmhIHR+mKMDpE=;
        b=QnWh7ZFvEWA5JBr0Z3EIIab5Mc7gKpAN6J9qNslYAwJmlLrGYg5RKu5yX5df2v595H
         RiQA3ZjT1XTiZb7k0Qjg4qB4YvApaDQEQhz3ZJmL7mkK/ydDeIVo+URCRVxuS6Ut8LGA
         f1UsxCJ95h6AoFS7dD/dB7A+OV55oiP6Ue/Yj/y7nR8KaOlXXNFl8rmVu0X/zDB27M1X
         NZCIlHXaeyM9oeM6A9Lz1awGjZNIgmHPnCePPdvu7/FGUi6xOcx1ytFjvjKZ0Nvtq6IO
         yP12mKE8Vm/M1w4AjVuTg3fC9n9jzL+okkUd+C8ddbIaDDPboqlgnhtJgFT2gDX/SANO
         W0Vg==
X-Forwarded-Encrypted: i=1; AL+hErGB/pNX3MNpU+Fbh1SHOh+EwBwIHpVxf6UxkLf2mSgLqUHvqp2D2aigdmw7rMUbmfKf+EiI2sGF/ZPhY2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AftVTy17IbING4kbidHxmLaUs65rfPEo17FKP8ZjL/odYFJzH
	4BOqbAFfvg53kKnVJshFHT2Ctz14JtpXCO5WVSH0QHQcxPyM1bf5FmAFPiUGQehCdQ==
X-Gm-Gg: AZFdTZf039p07A3Bh/RnUyd2xYVdX+CIJyxcQimTYwGtR1txlkmnabxzHdT6xrRrcHJ
	pEU1nfeZm6imgB/MYmqN79948thKXrl8/4+lG6DtzqzZ4m/PRoxAS6/bFSU7wzY5CMuPf65+ACI
	3QUfou4FswkyUERjOrF/AFuF1IJFeQqCQ1nFhW3yYBwi1f5XDu088LtzkXJN9DbgeIcFX6C5nYN
	k+VmXFqcGIKEL0yFLz/Z70XvnhhLHb4NKhsTfml/pyPlASap5+gShShOGmiQ+BCyH9XXDRIepH8
	Oct62pCL7QNE89iXlU9+eaoaHX8XhhwyaUJweceA9JSyOJ60LJDmShGJ9pQw9UGyPeV2iGfVnWA
	4KiXpqzG4sgsnq98aPZBmAFAzBhMkpt5uBiK0SjO6AD6Lw4bTCwiR6cIfq0LJNUjeEZUaYH5VMY
	hGqNJvat3sKrT/S3cdlXoHFqInGBdDe5IaihYmUTVpwFQZM9U5Pul1I1Y723OGm/E7En+sT6bDf
	NUomz8oYzCFW9y40G8D1IaQTh0NwQrR5TSP3zTgTbMtdr+yGgi3dKHs8D5tzG4fz01KYqlqL4/D
	LVR0amsJ5L5xGiqGZS8JAWz/utBQiwz9iWKZzBEDT9jNVvx/pZmjeatRsfabMZ14AJBkz41pqqL
	+h7wrLaeqGVQvMsqbUG9j8TwDor4h2Au/+ZAe1m9h0uPouExLmY2qivJdagOVSLp4nsh7aXg+76
	6XIbKooillhbXs9JBEwCU+VcxLXdEebeuX/mtxzjGEDmzRj5mvEoRJmuo4nz143Gj7Y+sBcJRcS
	kXY3Vgvao0MFfZ4QIiviBx6UnZW32HUlhfdJBZfk6/C2fS+FGHIfUiGQ64MawAxLzZZSmjDpk8f
	vFpDwpWx1znWaiI8tFUmMcsTSLl0HAIj71jCqhBeTdngol2YOYQpUlstFn4gSHgi1JqwSoqowF1
	a
X-Received: by 2002:a17:907:9488:b0:c50:6345:e41b with SMTP id a640c23a62f3a-c513accc97emr549537666b.46.1795283644494;
        Sat, 21 Nov 2026 09:54:04 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm220167466b.45.2026.11.21.09.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:04 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:02 +0100
Message-ID: <20261121175402.644803-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121175402.644803-1-julius@bairaktaris.de>
References: <20261121175402.644803-1-julius@bairaktaris.de>
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

The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
Message Capable 3) and, when granted all of them, raises the firmware
interrupt and each copy engine on its own vector. Since commit
cfe9011a05a8 ("ath10k: remove MSI range support") ath10k asks for one
vector, so all its copy engine interrupts and the NAPI they schedule run
on one CPU.

That commit removed the vector block because it was hardly tested,
ath10k was mainly used with a single or shared interrupt, and its
removal made room to rework the copy engine locking and to add NAPI. The
removed code gave the firmware vector its own handler and each copy
engine vector ath10k_pci_per_engine_handler(), which derived the copy
engine from the irq number and scheduled a tasklet for it. None of that
comes back here: every vector gets ath10k_pci_interrupt_handler(), which
schedules the one NAPI that services all copy engines, as the single
vector does now. The locking and NAPI stay as they are, and the copy
engine to vector mapping does not matter for correctness. What the block
gives is placement: the HTT copy engine, which carries the load, has a
vector of its own whose CPU can be chosen.

Only the chips used in access points take the block: QCA988X, QCA9887,
QCA99X0, QCA9984 and QCA9888, marked by ce_msi_spread in their
ath10k_hw_values. QCA6174, QCA6164 and QCA9377 keep one vector and no
affinity hint, as now. They are Wi-Fi and Bluetooth combination chips
(hci_qca binds qcom,qca6174-bt and qcom,qca9377-bt) used in clients,
where waking fewer CPUs saves power, and the PCI chips for which ath10k
already lets the target sleep (pci_ps). OpenWrt's router image
definitions name firmware packages for the first five 245 times and for
QCA6174 and QCA9377 not once.

On those chips, ask for the block of vectors that layout needs, the
firmware vector and one for each copy engine up to msi_assign_ce_max (7
on QCA988X and QCA9887, 12 on the others) rounded up to the power of two
that MSI encodes, or for a single vector when the block is not granted,
and spread them over the CPUs, starting each further device on the next
CPU. With one vector nothing changes. The vectors are not managed, so
the placement is set once at probe: a vector whose CPU goes offline and
comes back, as in system suspend, stays where the CPU hotplug code moved
it until user space sets it again.

The vectors are not requested with PCI_IRQ_AFFINITY. The load is on one
fixed vector, the HTT copy engine's, and every vector schedules the same
NAPI, so what matters is the CPU of that vector and that a second device
starts on another one. irq_calc_affinity_vectors() sizes the block by
the possible CPUs (kernel/irq/affinity.c:118-123). With a calc_sets
callback that grants all the vectors, group_cpus_evenly() makes at most
one group per CPU (lib/group_cpus.c:254) and the rest get
irq_default_affinity (kernel/irq/affinity.c:88-94), as managed
interrupts that user space cannot move. Neither gives a device its own
starting CPU.

On the AX3600, a station uploading 83-84 Mbit/s over the QCA9889 raised
37326-37927 HTT copy engine interrupts in 14 s on vector 6, set to CPU2,
which was 21-23% busy (20-21% softirq) with the other CPUs at 0-1%.
Without the patch the 37957-38630 interrupts of the single vector and
21-22% busy were on CPU0, at 84-85 Mbit/s. Downloading 87-88 Mbit/s CPU2
was 8-13% busy, against 15-17% on CPU0 without the patch. Idle priority
spinners put the CPU time of the whole system at 16-33% of one CPU with
the patch and 16-34% without (3 runs each). With a calc_sets callback
granting all 8 vectors, vector 6 kept the default affinity: its 37487
interrupts in 14 s stayed on CPU0 and writes to its smp_affinity were
refused (1 run). With the block not granted, one vector carried 38285
interrupts in 14 s at 84 Mbit/s (1 run). A firmware crash forced through
debugfs recovered with the vectors on the same CPUs, and 84 Mbit/s after
it (1 run).

Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2:
- Only QCA988X, QCA9887, QCA99X0, QCA9984 and QCA9888 take the vector
  block; QCA6174, QCA6164 and QCA9377 keep one vector (Jeff Johnson).
- Name cfe9011a05a8, why it removed the block and how this differs, and
  update the comment above ath10k_pci_interrupt_handler() (Loic Poulain).
- Say why PCI_IRQ_AFFINITY is not used (Loic Poulain).
- Request exactly roundup_pow_of_two(MSI_ASSIGN_CE_MAX + 1) vectors, or
  one, instead of 1 to CE_COUNT_MAX + 1 (Sashiko).

 drivers/net/wireless/ath/ath10k/hw.c  |  3 +
 drivers/net/wireless/ath/ath10k/hw.h  |  2 +
 drivers/net/wireless/ath/ath10k/pci.c | 86 ++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/pci.h |  3 +
 4 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 6f5019bf0b7d..731d175b6ed0 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -145,6 +145,7 @@ const struct ath10k_hw_values qca988x_values = {
 	.rtc_state_val_on		= 3,
 	.ce_count			= 8,
 	.msi_assign_ce_max		= 7,
+	.ce_msi_spread			= true,
 	.num_target_ce_config_wlan	= 7,
 	.ce_desc_meta_data_mask		= 0xFFFC,
 	.ce_desc_meta_data_lsb		= 2,
@@ -166,6 +167,7 @@ const struct ath10k_hw_values qca99x0_values = {
 	.rtc_state_val_on		= 7,
 	.ce_count			= 12,
 	.msi_assign_ce_max		= 12,
+	.ce_msi_spread			= true,
 	.num_target_ce_config_wlan	= 10,
 	.ce_desc_meta_data_mask		= 0xFFF0,
 	.ce_desc_meta_data_lsb		= 4,
@@ -175,6 +177,7 @@ const struct ath10k_hw_values qca9888_values = {
 	.rtc_state_val_on		= 3,
 	.ce_count			= 12,
 	.msi_assign_ce_max		= 12,
+	.ce_msi_spread			= true,
 	.num_target_ce_config_wlan	= 10,
 	.ce_desc_meta_data_mask		= 0xFFF0,
 	.ce_desc_meta_data_lsb		= 4,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index cd468b24bd33..08f1490e6a02 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -373,6 +373,8 @@ struct ath10k_hw_values {
 	u32 rtc_state_val_on;
 	u8 ce_count;
 	u8 msi_assign_ce_max;
+	/* PCI: one MSI vector per copy engine, spread over the CPUs */
+	bool ce_msi_spread;
 	u8 num_target_ce_config_wlan;
 	u16 ce_desc_meta_data_mask;
 	u8 ce_desc_meta_data_lsb;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 4843a41ea801..ebc33513e68d 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -38,6 +38,9 @@ MODULE_PARM_DESC(irq_mode, "0: auto, 1: legacy, 2: msi (default: 0)");
 module_param_named(reset_mode, ath10k_pci_reset_mode, uint, 0644);
 MODULE_PARM_DESC(reset_mode, "0: auto, 1: warm only (default: 0)");
 
+/* Spreads the interrupts of each further device from the next CPU on */
+static atomic_t ath10k_pci_num_devs = ATOMIC_INIT(0);
+
 /* how long wait to wait for target to initialise, in ms */
 #define ATH10K_PCI_TARGET_WAIT 3000
 #define ATH10K_PCI_NUM_WARM_RESET_ATTEMPTS 3
@@ -1943,8 +1946,10 @@ static void ath10k_pci_irq_disable(struct ath10k *ar)
 static void ath10k_pci_irq_sync(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int i;
 
-	synchronize_irq(ar_pci->pdev->irq);
+	for (i = 0; i < ar_pci->num_irqs; i++)
+		synchronize_irq(pci_irq_vector(ar_pci->pdev, i));
 }
 
 static void ath10k_pci_irq_enable(struct ath10k *ar)
@@ -3094,8 +3099,8 @@ static const struct ath10k_hif_ops ath10k_pci_hif_ops = {
 
 /*
  * Top-level interrupt handler for all PCI interrupts from a Target.
- * When a block of MSI interrupts is allocated, this top-level handler
- * is not used; instead, we directly call the correct sub-handler.
+ * Every MSI vector uses it too: whichever vector fires, it schedules the
+ * one NAPI that services all copy engines.
  */
 static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
 {
@@ -3164,18 +3169,45 @@ static int ath10k_pci_napi_poll(struct napi_struct *ctx, int budget)
 static int ath10k_pci_request_irq_msi(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	int ret;
+	int cpu_offset = 0, cpu, irq, ret, i;
 
-	ret = request_irq(ar_pci->pdev->irq,
-			  ath10k_pci_interrupt_handler,
-			  IRQF_SHARED, "ath10k_pci", ar);
-	if (ret) {
-		ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
-			    ar_pci->pdev->irq, ret);
-		return ret;
+	/*
+	 * With several vectors the device raises the firmware interrupt and
+	 * each copy engine on its own one. Each vector schedules the same
+	 * NAPI, so they only differ in where it runs: spread them over the
+	 * CPUs, from a different CPU for each device.
+	 */
+	if (ar_pci->num_irqs > 1)
+		cpu_offset = atomic_fetch_inc(&ath10k_pci_num_devs);
+
+	for (i = 0; i < ar_pci->num_irqs; i++) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		ret = request_irq(irq, ath10k_pci_interrupt_handler,
+				  IRQF_SHARED, "ath10k_pci", ar);
+		if (ret) {
+			ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
+				    irq, ret);
+			goto err_free;
+		}
+
+		if (ar_pci->num_irqs > 1) {
+			cpu = cpumask_local_spread(i + cpu_offset,
+						   dev_to_node(ar_pci->dev));
+			irq_set_affinity_and_hint(irq, cpumask_of(cpu));
+		}
 	}
 
 	return 0;
+
+err_free:
+	while (--i >= 0) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		if (ar_pci->num_irqs > 1)
+			irq_update_affinity_hint(irq, NULL);
+		free_irq(irq, ar);
+	}
+
+	return ret;
 }
 
 static int ath10k_pci_request_irq_intx(struct ath10k *ar)
@@ -3212,8 +3244,14 @@ static int ath10k_pci_request_irq(struct ath10k *ar)
 static void ath10k_pci_free_irq(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int irq, i;
 
-	free_irq(ar_pci->pdev->irq, ar);
+	for (i = 0; i < ar_pci->num_irqs; i++) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		if (ar_pci->num_irqs > 1)
+			irq_update_affinity_hint(irq, NULL);
+		free_irq(irq, ar);
+	}
 }
 
 void ath10k_pci_init_napi(struct ath10k *ar)
@@ -3224,7 +3262,7 @@ void ath10k_pci_init_napi(struct ath10k *ar)
 static int ath10k_pci_init_irq(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	int ret;
+	int ret, nvec;
 
 	ath10k_pci_init_napi(ar);
 
@@ -3235,9 +3273,24 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	/* Try MSI */
 	if (ath10k_pci_irq_mode != ATH10K_PCI_IRQ_INTX) {
 		ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_MSI;
-		ret = pci_enable_msi(ar_pci->pdev);
-		if (ret == 0)
+		/*
+		 * The device raises the firmware interrupt and each copy
+		 * engine on the vector MSI_ASSIGN_* names, so take the whole
+		 * block or a single vector, never a part of it. Chips whose
+		 * interrupts are not to be spread take one vector.
+		 */
+		nvec = 1;
+		if (ar->hw_values->ce_msi_spread)
+			nvec = roundup_pow_of_two(MSI_ASSIGN_CE_MAX + 1);
+		ret = pci_alloc_irq_vectors(ar_pci->pdev, nvec, nvec,
+					    PCI_IRQ_MSI);
+		if (ret < 0 && nvec > 1)
+			ret = pci_alloc_irq_vectors(ar_pci->pdev, 1, 1,
+						    PCI_IRQ_MSI);
+		if (ret > 0) {
+			ar_pci->num_irqs = ret;
 			return 0;
+		}
 
 		/* MHI failed, try legacy irq next */
 	}
@@ -3252,6 +3305,7 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	 * synchronization checking.
 	 */
 	ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_INTX;
+	ar_pci->num_irqs = 1;
 
 	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_ADDRESS,
 			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
@@ -3274,7 +3328,7 @@ static int ath10k_pci_deinit_irq(struct ath10k *ar)
 		ath10k_pci_deinit_irq_intx(ar);
 		break;
 	default:
-		pci_disable_msi(ar_pci->pdev);
+		pci_free_irq_vectors(ar_pci->pdev);
 		break;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index d114778edb41..252044dd632d 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -115,6 +115,9 @@ struct ath10k_pci {
 	/* Operating interrupt mode */
 	enum ath10k_pci_irq_mode oper_irq_mode;
 
+	/* Number of MSI vectors, or 1 for INTx */
+	int num_irqs;
+
 	struct ath10k_pci_pipe pipe_info[CE_COUNT_MAX];
 
 	/* Copy Engine used for Diagnostic Accesses */
-- 
2.53.0


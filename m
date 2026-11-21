Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302466;
	b=kPDsZhTw7nO6ewvoCCXBt1nOGdbaNdPW47RdVARkjm+yYfYJHKXed2x6qKm6h/mmr0Dr
	 OoWd+4lHBNp2AyY9JJJE+0Ok/U1yMWh9YuTaBN2ow5AjgvAu0URrItUuZbEmd7+BPmOGN
	 SQ+Ui7Fe02g4bHqa/GUeCrF/hetgh2q2m147UmrCBQiiGZj8sL49sUp6jKDoLjM5YJ4ev
	 dGSs2LW4IcxnC8gTikI+iAP63t6HPDNvZG1xItXiLWdjjVnaAKAE1jiL+zmi6BXMQx7vz
	 8MF2Kz7ELNXwjI9xZIFc0mAOL3MKftFiZUHsVzWO+z7pHL1LtrMm+OUwIRr+fGgSb3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
	b=wYNq2tvJm9XQr47q/lt02vBxKKfmbFOX41dyLEmQhD+WWFOFoJOryyUVtoG3qefyXdmZ
	 te3bus8CoXabMLUE+L3Lr9jeAqYp+2nVD1bgCPujWORiRQMnygkx+pzlhfaKJm11DCfTl
	 FsfG/2IU+z4NThNMZltsEyR/Yzlh4tlt3UAsV/k6x6fiuT/rAy8wnD0hVK47v0l0ZxZEU
	 RaBcmnKDnpG1B0+6CcRyuUV7W+uKTKlhuopPaqantdDfXXOOfeKl9VqCECFV8v6k+Hgu7
	 pRzinlF0IJWqHEtdNOPKS4XH3z6mQl7OPPgD9vkEUBGpTCdEu9bUmbNJz9Zic3qgqhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=YLxvM9lO;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BF0606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3BF0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=YLxvM9lO
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d21051042so360321466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302464; x=1795907264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
        b=YLxvM9lOh51yCpThdfwiEFEza0K0dYbM6wXgu35tDqk9pJVZNurcEdUfrHAG4KdW8i
         gy5WSOOJvTnPQ41t+JSOFPdJYQw4hpfyYHN1QuhZTB2kej81RiBecSKNfnDBiqgRr50F
         BXHpDMdSGvkIAPbNE4ACf4GvtnnobbyjMmF1WNBfdENu9zbuPPex9TXn0r7uZ2f87EzU
         X1P/6ouOx8XRqmo1yxiyj66XUXmLsBI4rXm0e9blG7WAWds60nLD9Oe/lTJg8ysm/NdY
         CxOWBaiyBE4CO82RyRRyZTuXRvjCyebss6snAqmtRR9ktbqGmR/FTMTWqdBd2uHWQmWt
         F0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302464; x=1795907264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
        b=Ml8IXZvVygte/DVrrFfGEShOCVxNR4fJdMxMIKkPO2ZpYRCsN7LueO89gFEhg8NhzT
         sc9HWqIzVJUldcecn/P/vnTM/m5Olqy0KddRbmXibYF/ZgjgD/ov41V6Xp3x26qpd4Yj
         37a58BHsAaXXekfbnDJTEtkqCNBlgVwczpVmaXdKJhcFMgBsx8B3KH4jzIojuGl06g43
         dNy5IUOfhQuSm7s/LEGOiDOFRRwjx4CYgHiyZ2R7AXThhRbST1ievPfQO22j1AQDf66j
         Odqg86bsyNznVMRkhAJ6Ahd9g+gk1F2C2vPc8bb1NnF2hGSvY+b48u/2BMB2rglQ3s2W
         dSRQ==
X-Forwarded-Encrypted: i=1; AL+hErGIWFAZza3ommP88Xspx55h5IaZe4JGGjbiN3BI/lOb4HvWsQndJ6ZysJwR0/rvMD6FFvQ+ycjLyCO1IYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QFJLPRTA1ypOxEGQM3F+y93wxOO52KC11r/OPFhbd//+lppDe
	ZElp9ES7CESezOj8yAGJtTqVJ4ExfV8Ym7jQlaOWi1NFCjVOZ+gTfnojvBFVez8+gg==
X-Gm-Gg: AZFdTZcyM1o1a/TbQftzESC4+pxu8QBCO/rDUa16cZlnIGOZP4ESf7dYHCrJA94RhTP
	wzHk7bfaOJW/VK2mrTp7OXAyAX6n5Lk7dLakIP53R6FsdJBVzNZS0kP/KqJ65SjI/PQWAbpf7Cb
	HunhO13ATlv0yFpMLuzG35VvLWrXkX7g4NKhtPEntuf9EJSEQ+z6XxcttzFtto7Gi99wCrQoFsb
	bwkiXZIGir0dLpCLi8TlRaU6WqqYLK6rxN9cuRZihCBwlyrwHFcu8lGX0VlTc2I2PmAWJWxa0RR
	G6iwAFvZJv8NBAEp/VMLOb2u12heYLa2lJJ+P4yHmubxv9/WYvofEHoW4YmrOxJxSwr7xBRdqJB
	K+8aOvnui1jJohIEC4eVCbx1gfFO3iXvuYkAEJ2fj+5cKqtceQ1K9JfnoZFJfVRljLevpulry0R
	qGheYj+Sfyq3LWe5Qr0V9kve0GsxW62YPvNZLuhnhUMND0v8GYY+b77+dIj6EQFg/lx0AnL6bbk
	b+brPQrjfkSrQ2T2mSVTcHAmAMr0bFHBZyZieW7XK9iBTB9677ngwim7hB255tWdkssi2mAWx2m
	OlmEuBLzm8nAHpRdoeoOm/+MrlgWfpMLmbtzvJBCocoYVVDyqTycPm/pTrLmWXaQcQjbg7i2UcK
	JeFOr8dy3FpqilEoX028uJxURpVDbTZ0D0au/tRCQeEFmRmB/imLRpR6AKU1LBCgHcqxW34CSjA
	1Dyjw0++8ynyIoA0gQOFQDfiwM8TztxJ0I9kqRyXXpqfCsieruXCCYU1yAoTIv8voaNdWhIkhRv
	X1TO0GN3IhVQObQZFWz75cXqAoJ/slsT30l9YiG3lOnPbFdhEmhxbZ+wJmFOdT6Bm5Q/6/tRxd9
	x8iP3UuDyTRtHxNQNwPH8QOaVDlXFgWl9j+3W61J59beADsuOIGkk1/ZhShn+KJLyhfy82/4JO0
	=
X-Received: by 2002:a17:907:6ea9:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c513a3a6598mr657443866b.1.1795302464094;
        Sat, 21 Nov 2026 15:07:44 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:42 -0800 (PST)
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
Subject: [PATCH ath-next v3 06/13] wifi: ath11k: don't disable ext IRQs twice
Date: Sun, 22 Nov 2026 00:07:24 +0100
Message-ID: <20261121230731.1206043-7-julius@bairaktaris.de>
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

ath11k_core_reconfigure_on_crash() disables the IRQs at the start of
every firmware recovery and ath11k_core_qmi_firmware_ready() enables
them again at its end. If a recovery fails, they stay disabled. The
next recovery disables them again, so the disable depth of the ext
IRQs goes to two and the single enable_irq() leaves them masked. The
DP rings would then not be serviced after an otherwise successful
recovery.

This is the same kind of imbalance as the one fixed for suspend/resume
by commit e56c9d429ba0 ("wifi: ath11k: fix unbalanced IRQ enable/disable
during suspend/resume"), but caused by a failed recovery.

NAPI already handles this: it is only disabled if it is enabled. The
ext IRQs are only enabled together with NAPI, so only disable them if
NAPI is enabled as well. The pcic ext IRQ code has the same pattern, so
change it there too. The PCI CE IRQs (ath11k_pcic_ce_irqs_disable())
can have the same imbalance after a failed recovery; they are not
changed here. The AHB CE IRQs are not affected, as they are enabled
and disabled through register bits without a disable depth.

On IPQ8074 (AHB) this shows up when a failed recovery (forced with a
test patch) is followed by another firmware crash: the recovery reports
success, but TX completions stop, TX fails with "failed to transmit
frame -12" and the firmware asserts again repeatedly. With this change
the same sequence recovered 3 out of 3 times. The pcic change is
compile-tested only.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware crash recovery")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/ahb.c  | 4 ++--
 drivers/net/wireless/ath/ath11k/pcic.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 27d01411b6e9..3ff7d5f27f5e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -235,9 +235,9 @@ static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_ahb_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_ahb_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 2259adc3bbdc..2e7dfa8388b0 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -455,9 +455,9 @@ static void __ath11k_pcic_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_pcic_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_pcic_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
-- 
2.53.0


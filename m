Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302467;
	b=Oq/pTbGSbiDaWpdYAws9o2IfDtX7K2a1bR/pDzm1IppdiKXY13gls5d9SbeR9effgoEV
	 RQKOl6Q+JjF2hGfy5mmMOSDGpt6qDvGw7v7Po0uN+KgHiPhGeboxGIU93VVeGPv3AOV4t
	 FsgSNzB36SAEIEmUuzj3WC0u5zmOCX1ziZZjcgPlD/zw12R8GCkVTCjgF7UzBkOO4z5CN
	 o4EUdR6TIRubw+Hu8htoX47VZFbHFWWyQ55kA4uxQcKEZJerbrYOjjuXiMKH/9bxsgnXQ
	 2zimGMA6JeMCnSlbuSJkKlBQWqZDhL0Q3J14GvEU7DPbr0w0SfyZuRjit4+u1OjrVxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
	b=TVhc6K1s4SzXmfxUG/DISiGWejV9q5HOEh7jEUEUljf3sbfGXLnrb6woK5mRQrbvfFDI
	 CGGDel1P1ehK4qA1XMVqQTPKGtFxE93RmknYtiKhwT4Mf9YSLCMMt3N6rtPdJq0bkeaB1
	 kGnSQA+KNV+dVYy7jUsAtfCrIvDgcfbu5gob3FFMQboa5MDlGS1MgUI2If2Owi31yMZqe
	 xwex8TkJGskpOjpbJ1vR+aXN5AqUhGIikdl/MLprUgF4FKf0DfYvWy1FMaUea2c0ruqLR
	 TxjFIZKCuez/AJOYktulV+QT2jESnz+atSZzcmDowYSskQQCx77ssROUxu3l0nMAJcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HVjAoiGm;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3BA60A2622
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B3BA60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HVjAoiGm
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so391300666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302466; x=1795907266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
        b=HVjAoiGmKzeE58aE4rLmdcQ/r4u75DFDxLTKLE054NvRD91UQDoWR3Pc5gR+is2KIa
         D6oh0FYI2e5QMZYOYn2AakT269LA8bNEYuLZ4ffcTfDsKvOtbQTCDC4o0LwczQ958b1I
         5uMi1gDDnMdV2AzsLMmGdYDxWp75IWZoTcWQNRVIloP/7or1u3IOSErK+aeSVw8LAeeY
         PRnA5h4LY4EjaGnGN1fD+IibMcXBFlJL6VEEplQspXY3FYClObVGgeSRQDSSId6r0/Xx
         GP+E6ZRWE5owkMPpND4PsJImNhbVcixE/YmfRTFdsEN+Ip+6zYXBCSCd1TiAWdEMlU+v
         jHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302466; x=1795907266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6btR2aaFXry8/+OvCG761RoKG42Ek6YtGx/y9HYL3Ck=;
        b=QLBF0CrLah2CNtD0aQQByf1B/PsZOjtPqFR3MyWO9NbymE7/J7ThBosWvcQT1ddh4i
         yXtafNepS9KwWJ6M7hEEaPssA05UU5vjXPp/N6lpMd+Yg/JE4Z0SMeIZyt1zYRKD7bq8
         vSC1gDCJbsto1Wl7d7EkfgtCTpGbACLo4xoDK8bSOt32KMUnM0A6nX31RDWTxvJzHjOa
         SonT1rdUvhbNg3UHR0TxM+nOClV9fmV1QCGyoca0jMM22G/VxMUVlxXt1VoRvKTJQDYJ
         qYTyL7EeLl73AzQR8h+cOB5z614sYcIZeNNIZU5Xt8Jy4aaMhQnsa6LS0HI+JBtWVFH7
         QBqg==
X-Forwarded-Encrypted: i=1; AL+hErHViCT/vkm9efkjYLAH7hMROy/qY6Lm0u6c+Os3VXKxjeDYIZltQ3gbJTtgAiir7qoFeT0bAQzOEIHx57Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Gf/8LrGN2Co+xzXfrU0FwRM9fAVvLT4b205M0uW23L4IJCH8
	6lVfxkrY84FHuXXDEyw/mfRZm7hjm2tjaPbC0ZYx7qkRt2R/cdSvLdxhgxSN4nt+Bg==
X-Gm-Gg: AZFdTZeFArQReKhppxT7TiTXxCa5WKOBwk1J/Qy3Mz1bi4ShcpPpyrqEHCzRLrQvwe/
	csNxz6uTAUksrkoaH9wfdMu4NgWJFsFoPKWfGOGBtf9WSgrNVgbunLOHj3rzQvEcMCMZz2o+SrN
	JTK3XtQDyQPD4T4LyYgEsfrar+rM2iXHgB6/tKESsRqfw/Zmv6d/pKSgofGMrEXt2wA/dZ5W7vA
	kR3WU0Co+YAioQAiU03Fk+L5b5JzUaaOmklgLLdPAHmdCNBoEY/IT9tkcmz4QS6rGI4tzVb9rkL
	Bap3sxvR3tBsZThaMkXY8ocexs3vNi62Xqev0cbUbw6zqJywgvMvhAw920eq1Ei05fYDJouA0N3
	rPDJaU2EVJgjX1Bcggvw4wTRYt5SmAYhIUhzQDHhhp8xVTMa982fLqSQcn0h5nzjJK57XEsHHcR
	vA584JWttvEdua6S+7AdtM4YMyBZ5WyXK4PLnDea3KzkF/T9UUeZt6TAMup1ygZVH6HxsUUilBD
	+mmiRsFJInubyXjLzdc7/ObIRG2Wc1bJk8mULXqN2ydDV+MosJ7+1LpjaOvVaLzoLVhcN2Ihwzd
	nTIo09SPOMggSTHuxtAOfrlKh4iSeFxy+B9XfOJ1nlo/lnW+TkLQy8BgbaH40czfzH85dXCuMhz
	KOJoZRas4h3HyFcrcW7xa/mgGI7HISLLyk5opdm9BoHzabfa5VdsyZgaw5l+ROPmdaN+CnrYJuG
	SD2nntaD+D7UBB7hUHQRABkYCuin5GGt53w7e/0BJCviy4hA/OI3vLPD75Wrp9amTxiLnbWv1hp
	KvTICTplyBDVAZajy+llLcYbzrW+ZEljSKF6T/U/J/dXiSOpBob8ZVbDNOwbYxKaKHgvkPbD1rh
	IGTxXf+7Gba+3I5FnAya1ihFNuFDyVabrjsKg/vBu9T4n0h3dQ36Ry1Y0sugQz04Y9sneI6Hr8k
	=
X-Received: by 2002:a17:906:694f:b0:c50:ff1c:22be with SMTP id a640c23a62f3a-c513aace676mr469413066b.16.1795302465698;
        Sat, 21 Nov 2026 15:07:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:44 -0800 (PST)
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
Subject: [PATCH ath-next v3 07/13] wifi: ath11k: depend on RPMSG instead of selecting it
Date: Sun, 22 Nov 2026 00:07:25 +0100
Message-ID: <20261121230731.1206043-8-julius@bairaktaris.de>
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

Commit 32ec8488d75d ("wifi: ath11k: fix sporadic WLAN initialization
failures") made ATH11K_AHB select RPMSG, QRTR and QRTR_SMD. Selecting
RPMSG makes it impossible for ATH11K_AHB to depend on
QCOM_RPROC_COMMON, which is needed to use the remoteproc SSR notifier
when ath11k_ahb is built in. Adding that dependency gives a recursive
dependency error:

  symbol RPMSG is selected by ATH11K_AHB
  symbol ATH11K_AHB depends on QCOM_RPROC_COMMON
  symbol QCOM_RPROC_COMMON is selected by QCOM_Q6V5_ADSP
  symbol QCOM_Q6V5_ADSP depends on QCOM_SYSMON
  symbol QCOM_SYSMON depends on RPMSG

RPMSG has no prompt and is selected by the rpmsg bus drivers (GLINK,
SMD, virtio). ath11k_ahb needs one of these transports anyway, so it
can depend on RPMSG like QRTR_SMD and QCOM_SYSMON do. QRTR and QRTR_SMD
are still selected.

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 99f625b82fe1..2b608d4ed263 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -13,7 +13,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
-	select RPMSG
+	depends on RPMSG
 	select QRTR
 	select QRTR_SMD
 	help
-- 
2.53.0


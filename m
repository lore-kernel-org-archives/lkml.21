Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302460;
	b=4uZ0ipw519pxCYrxVcz5yCbp/OfH+RdeKG/FXx+ArJ137wrQyD/t2YTCQQPJrthjDCtP
	 iH1ajbocMIVtzBlf+8bu8NTYnbQR01WOniRtLO88ny0EvREIJDH08oJshFu6DUpv4OOvw
	 nwTwM1P1skDY+MWb44Iwy2DnvfA+Q7sjnBdveSPwUs0lGhCYnybhDTIc3GxLVEF134dB5
	 +1Esz+D+rPQbrh5Qye3qdth0QltjwbhLRacT4HKiMX6/Pr9i6MQjP3bizb2B6kVSHLNwb
	 dBYcDir/JZI8sCotKLUf3OnSuzUKujp67suB8iKm8DpHoaxTWJbW5lQdpIwJMlmybuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
	b=mjhJRkZajxJWbx4zCPMlVaKcm5FfahzUvH5NRP0LrfuCi6xBfwhXaup0VbjaEh6Rj31I
	 QjkERNNBj4F8GQ4K8nwJ9TRUnCk1uYp9qPQfjW+QbLC6d/u+/hAFaBR0Bojzmf/lCYXaC
	 AItdgZphmHt4cgbHu0JZ+wkv9beUH/nGy2JJWx7pXTTLNrIRi4xFYT01O6UdLRBkxSClf
	 5y0gZ7I0rePxuNilmdcEuKcIsZz3oaxYU9rkM7MngXJnEsN0amrMTk6nqvHZRr+ZKiwfn
	 VHFM4HMBfzS9nkD/NQEKKmpIkJAbiBFVInb7RuwBkyVh/jfT0Ng86Dktu7g15XMJ+CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W0X2B71Z;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1E606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB1E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W0X2B71Z
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d28f75d62so360106166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302457; x=1795907257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
        b=W0X2B71ZJTucaJ/Bp6BW0FMPpswkNXe4wtLaX7UfB//Om+KNYhFCIsdtFFLNxndHNm
         YICs20ngVo+8diCreK2LjrLJTAbZ7PCPdp8dZiKlQTyHMnDuCrG+lvCS/Lqnd7jIG9Cq
         9WGjq/2cqeeKNZFwVhX+IV9woP6jsBZ14CQl9Bl7coqT9WdJhbYwoKl3vpOJdG0Y2RFI
         pmBlYZp6sWSu/FozQH2LPoAlmt0wYD0f9mObmQO9KSOPsYwQseRdN6qrOBl4aRI0man7
         4CndfXdHLLitu3Ew3tJPmK27nJAoO8lr7QNJJuNvy/KrmQ8rhBAl0IgOhfxL6K/Dl7KB
         q4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302457; x=1795907257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
        b=swBMtkUFntjmX5mnYELoZ0EIRbXt3YAi2/B+NXFTZ/JbJ18wmGEh6Zt9AcUGytEw4D
         hixess/me8XxULePa3xRU41VJNPRbF4Ttz504BOLeFkgSVmq9lWwu97AjmAAXeFZJ2p2
         wWR+EEsBG/W2bYwiD++lDuN6y7eA8C6cNx+s/um6HOSPnxQ612io7xTedtBbKU7aHb/0
         sfKqkY1ZGrP/8YtImsNvu4RHm5YROy9LWkzHF0mv6bqWnTaPgQwnJzfPtplSfjaSCIM+
         muqk8p7ePBuYn+JKAJd8DngFHXkQHkMFhrkXRJDhWJi6n9rhJf5pnI1mP2ya5fKh89Dp
         B4Mw==
X-Forwarded-Encrypted: i=1; AL+hErHIxGduNnhoOeRSqxQxpmy5xaasqfq7IrSGh4ZWWBtKzihrNPqIBwtdbzxIzkeo9XPURDkdmbnHU+w1ePM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g7CHrUJiPavJCmnWR2aswVtvGf7iluZkL/NwmtZK2d/moA9wK
	zro3IzIGoIWFpxVQhTllf1sK/lLCafhgJxXqvmLv3xze2bYFHM8Ctp0j2DMOn2jCrQ==
X-Gm-Gg: AZFdTZcSdxNaquDWz4quZzhBUqfXYpR1j/pKmPSzQN7CP6s5+u5JR64VQFRJtEnnTwl
	Ussn3iY0bzLLPc/J01XsPx5DVMkRXXsHGpNObGZn8+2j7wz5HA6MgE3SHunWM9lk7S136u8H6eX
	RDMYV98F6Fh/zoEbsqc1F5qhvdVDVC4jTzsQySsYfTgdrRpDjH+e8Y4HlqyNoBUboFnGGPtPeyu
	eCpls8ifczwvpNrv8vvJfvYGTeu+dKu6/doaORdIWd+PqrUh0i0BEJHbtutr+1XCF30aOwUJiCc
	d9H4WgGH2WPlpey4ZQ2QpXhevqwgmTr2kDB0s0h5AqPUi8eCW6x98YKRjrrwrrwmlefZaKIZxw2
	fYcs5PObJey/i/6CX5b18d0zmBCPnJF2CSRAr12uWMpX6q65rpYJSbN/36l5hRQ78Eds0jKnG3A
	eL0cBwtea7rTkeeMFKDnSlBhsO6Cl3gyVQ1opgyCdMb3xGTNsE6Fu8L6+Q0MxN4jBgt9bbGlOJT
	giTJpiOoRp8/eY1zz4+x9Motu1FyLw/uHhD8roQ2OGKKt7CM63z8SvSBCJLV0dYEXCgCYg/YBn3
	fGqec82gbGYvTBAPgtmVg6iI1smxPqyUClum90NdHM/4Gk+tObWyEFhU0OvyxkHEIgTfcvEOtVk
	vYbQvSF0n2zMYE81RUFrfMv605QLK9PsqjfxrKSsMfW/tZyuIqEcIdtImNK1hL6ERxo2uxNEFqi
	FcWpMWWXWV0TJtOgPFRHNPnWrTstyVZP1K7fAxDPJErecvVWS78EfOm5u9AmRZ0MEN/EgtfoUuQ
	CCG8HMW1Q9OKKF3XIyUpBZKznMQen1gxwlWYvqzB+GIPPNssMjMxdhrktAMIlsKd38UQONEPoqj
	BsrfIsYzlO4HyYvC//elz97YBZVbPtp++l5kdLjIJnGqC7c7wuf9IWOM7CqSnzNGFNS2D6F86EA
	=
X-Received: by 2002:a17:906:1911:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c513acd297fmr440901566b.47.1795302457248;
        Sat, 21 Nov 2026 15:07:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:36 -0800 (PST)
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
Subject: [PATCH ath-next v3 02/13] wifi: ath11k: keep the radios when a firmware recovery fails
Date: Sun, 22 Nov 2026 00:07:20 +0100
Message-ID: <20261121230731.1206043-3-julius@bairaktaris.de>
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

On a firmware crash recovery ath11k_mac_allocate() keeps the registered
radios, but the error paths of ath11k_core_start() and
ath11k_core_qmi_firmware_ready() still call ath11k_mac_destroy(). A
failed recovery thus frees an ieee80211_hw that mac80211 still uses and
leaves ab->pdevs[i].ar NULL. A frame bridged to the radio then follows
the freed hw:

  Unable to handle kernel paging request at virtual address
  ffffff8316cfd480
  pc : sta_info_hash_lookup+0x4c/0xe4 [mac80211]
  Call trace:
   sta_info_hash_lookup+0x4c/0xe4 [mac80211] (P)
   sta_info_get_bss+0x1c/0x78 [mac80211]
   ieee80211_lookup_ra_sta+0x124/0x14c [mac80211]
   __ieee80211_subif_start_xmit+0xb8/0x3a0 [mac80211]
   ieee80211_subif_start_xmit+0x50/0x750 [mac80211]
   dev_hard_start_xmit+0x98/0x120

and driver removal dereferences the NULL ar:

  Unable to handle kernel access to user memory outside uaccess routines
  at virtual address 0000000000000000
  pc : ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k]
  Call trace:
   ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k] (P)
   ath11k_dp_pdev_free+0x4c/0x84 [ath11k]
   ath11k_core_deinit+0xdc/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Destroy the radios only when ATH11K_FLAG_REGISTERED is clear, as
ath11k_mac_allocate() does.

ath11k_core_pdev_create() has the same problem with the registration.
During a recovery ath11k_mac_register() and ath11k_debugfs_pdev_create()
return early, but when a later step such as ath11k_spectral_init() or
ath11k_cfr_init() fails, the error path calls ath11k_mac_unregister()
and ath11k_debugfs_pdev_destroy(). The first unregisters the radios
from mac80211 while ATH11K_FLAG_REGISTERED stays set, so driver removal
unregisters them a second time. The second removes the debugfs tree of
the device with the macN directories, while ar->debug.debugfs_pdev
keeps pointing to the removed directory; the next recovery's
ath11k_spectral_init() and ath11k_cfr_init() create their files under
it. Undo both there only when ATH11K_FLAG_REGISTERED is clear as well,
which is when this call did them.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 0366f42640a4 ("ath11k: Move mac80211 hw allocation before wmi_init command")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: also skip ath11k_mac_unregister() and ath11k_debugfs_pdev_destroy() in the
error path of ath11k_core_pdev_create() while the device stays registered.
Florian's Tested-by dropped, as the code changed.

 drivers/net/wireless/ath/ath11k/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8e4dab61a300..5f4e7fbe0b25 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2073,11 +2073,13 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 err_thermal_unregister:
 	ath11k_thermal_unregister(ab);
 err_mac_unregister:
-	ath11k_mac_unregister(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_unregister(ab);
 err_dp_pdev_free:
 	ath11k_dp_pdev_free(ab);
 err_pdev_debug:
-	ath11k_debugfs_pdev_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_debugfs_pdev_destroy(ab);
 
 	return ret;
 }
@@ -2231,7 +2233,8 @@ static int ath11k_core_start(struct ath11k_base *ab)
 err_reo_cleanup:
 	ath11k_dp_pdev_reo_cleanup(ab);
 err_mac_destroy:
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_hif_stop:
 	ath11k_hif_stop(ab);
 err_wmi_detach:
@@ -2315,7 +2318,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 
 err_core_stop:
 	ath11k_core_stop(ab);
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_dp_free:
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
-- 
2.53.0


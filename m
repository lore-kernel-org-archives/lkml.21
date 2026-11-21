Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302463;
	b=j2fVEAE06F2WxpEuEZbWQYV0xV8AJIztmL10c86qFRdB3lZI3LP3Z1wbesti0QDpnesm
	 VuuPGtEOFrkwCE52t3BLqoS3QnEdsrkxlXeYeZg7Z6yfXJ4oKfqEHW8mF2hFwM7/iof3Q
	 lDH//Mhkz+Y5evsZ+4DMBizAGTtV5UyYNLI9P8+9deOWYKjUYQAdgxCqkr6aMMMMV5kyD
	 zrXNulJAaDUgVgbyga9RdNCmz/PV7B2ioilC/Ky4vTxZlly0zVboimGOYUHfhlbJXvgDv
	 rT6pDfRB+nvl92uRYgtxkp/bo0rKovmB50PZxWgtzD6/gBL+Xb4sKvRjI2jUti2P4JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
	b=lbxcv1gIJslla5o2f2YXYWm9UcGii/elpZ0FkBLm18rniYzkq/9Q3gWlMU3BX4NfYHOF
	 o4Zqjc1RGKCckz4r/WjJ0ynUMa3TUHNYlZbEf/k2y4ver4uxrADBoA7x7fg8jTVzRDICa
	 U4JH4bANGKrzQje7wxBFFPcQ2ksY/QZkeOZFUMZy2pIGzie8Fa8Lx5T087CJYapKo5W65
	 YaCacHLtg46ToWBMAxUiK/zghYGtj6FqplNEamliABg0A0nDd0UyoFpJ9KN4+IckDdC08
	 FHpIAup/UZL2Gz1zXdJg4sQTlddbVCFdYqE4v/jEXLVbUqmCPxvgilf9boWG8/KaE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hViEOR77;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60360606A6B8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60360606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hViEOR77
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so391294666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302462; x=1795907262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
        b=hViEOR77vvb48wZzRWUrPldcdOdYdzqZg1ZpZmKwlQcepmRMcwB+zvuKGYv3qrmsoo
         ZYVv/z7JZrcd8hJVzX4kKTi5isBqdwxd1LOeU3LshKJqyHFtfPT/hrLa5q+HpY/cpHV3
         kmKsZDpYW0dwDyz9MAub1wiYW1p2BM6nNRpB56MCbUI9k1u49r+mxMHewH9oEDpvI6DB
         +NXYZiXd6TUtafpZew45jOmV3Fshk6hVING3m0z9jTFp6dZ2fWyaRWrs8OQXyra0LUw1
         p+7tChwn69UVjX8JM5SO2+g61xschK0dVIaaC2bVUzChBdSzFsLxvPtrJQknzCmUx7qm
         9E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302462; x=1795907262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
        b=MqoS3hcWHyeMfmo/mqdmkchY/K/gxJyjk6FdtUYyvSo7i/RNMWkYRaYOaBJAFgG9br
         aR/m6s3MmJvJC8pPox31pDP1cdzjWfHD/29qQcL3NM+qa5grnQ+fx21XAM7lp5FHR0LW
         n1Y2Q9DIAVmtwVoq8r5j1cTINSexez0EXb7mF3B/gHJjADfIyBZDV10q6XGrkGKyS1E2
         lMV7WuoOwkiBezj8Ol33FnrC1rO2qwFl1fL5AH8NyREs/bz5EQXER0I1/effn+6ESiK5
         se0s3vytModvTAyrmMguJhlkoh7WQhZTPBaFm1gGQGRrta2oUPbE8Ue1xXFbEEFUrkqN
         tIfw==
X-Forwarded-Encrypted: i=1; AL+hErEEs0khtERc6SeKH4O43eCe4PUVI5YwbYByD0+2AvGbXnkX3HGzDoVbGr15oP6HcLIRSpDc/eAwSqjOodk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/a/VZHkt5Wt0zxW+d7YRTYhnU5fsGS+uYLzmK1p8FAakB0MZf
	jf99kMFUay/dIyKFtaZX9NP9cuIO9Uq3quj7eLKD/48x+EPp4GgwLVHjJAypCuXSmg==
X-Gm-Gg: AZFdTZf7zkZ4qKiqqqqEWUXwm/1CH4SajdMTKMhFz6+1dPcpDQmR4LUIB7tycs8sZP4
	J7X0bxW4JdoMMbFO2tlQOHZyVb1x7wb8ho0tKfvLdWvuCSxM+jOLoDu+8btelmVj7glmHj8pzYg
	GlcKsp2HgLrvLDRiuJxSzlGao7bVCnX0B529XmMkU/age3isUSbUmYf6CGCm/PLUq/lZcbqvbOK
	8dI//bD5wu7anWhRXA3ohAG/cgndvIveCmO9nC74vQXyevH+8WC2fGJOuAx4/pxR8HEi/VlRnI/
	JrEL9ldrQ2wnCPnaQ4RbaaTNqwjeLxpku8M82Iplyiij262jY2RGOj6Gup62qyQSGvQuGpXveTe
	v0tWZMWfw23qkpGxICLGRcZ6gj7oYrE5qWT+xtaFJFMPndKnOIn8fc03+orM4pa/RhrR6MLertI
	JfjzSheQ9xdd+SN5oPHWQuRVgtl5s+MqY8EnLDeLS09nOR9ebPYWms7cRlpcJIJD5M4CZWeLs1m
	8/QogoBOahJjlhzbLxtghJtwJ+sWm7cQBvq3gPw6pHmOPNd3N7731V9YB+63fbO433zxc83h1ca
	aqtBjNpMVU0FAMh9JWlgQVi4le5te1JX2rNHN8QEY0aOo4SMv5eeiySxGnUFUVwOgI7tH2cZbeb
	TERg7akVmFImbIhIRwsz9JUN9FBgy4TXe25vmFxlvAp+/BS6QCxqDoArm41iDvGKU5+rpQXJd4K
	1k8ua4yhvL8hvTexFgjE1OiD4XuvCLqFgCVsEh/JKKZrJJJkdEu2ofrD0vcDt3bRHmMKhD3mv83
	eGH03PjI8O92MUZ9xOzC/x4K36kVkNvpSQ915nEUmy36oZWf8mumoaWot6putIr/HpDUXTEN9Qr
	E4Is7MAuMzRLDKyFtz2ZP0WwJcDwBEJsNAWWKLqL/2R3qrLMONJIx4ADEA0UOMILYwX5tPymLvE
	=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr413314766b.26.1795302461807;
        Sat, 21 Nov 2026 15:07:41 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:41 -0800 (PST)
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
Subject: [PATCH ath-next v3 05/13] wifi: ath11k: hold back WMI commands while the firmware restarts
Date: Sun, 22 Nov 2026 00:07:23 +0100
Message-ID: <20261121230731.1206043-6-julius@bairaktaris.de>
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

ath11k_core_restart() brings the firmware up outside mac80211's restart,
so cfg80211 operations keep sending WMI commands while the HTC services
reconnect and before the firmware reports ready. These commands crash
the restarting firmware again, and recovery then fails on the unified
ready timeout:

  ath11k c000000.wifi: failed to receive wmi unified ready event: -110
  ath11k c000000.wifi: failed to reconfigure driver on crash recovery

With iw setting the RTS threshold in a loop from the moment the firmware
stops, the firmware crashed 15, 15 and 11 times on three triggers
before recovery succeeded. With this patch it crashed once per trigger
(5 of 5).

Return -ESHUTDOWN for commands from outside the restart worker while
ATH11K_FLAG_RECOVERY is set. mac80211 replays the configuration when the
driver restarts the hardware. Test the flag on every try of the send
loop, not only on entry: a command that already waits for a WMI credit
or a CE descriptor when the firmware crashes would otherwise be sent once
the restart worker's own commands free one. Wake the waiters for CE
descriptors in ath11k_core_pre_reconfigure_recovery(), as it already
does for credits, so they return when the recovery starts.

On targets that do not restart the firmware after the cold boot
calibration, the QMI FW_READY handler clears the flag also during a
recovery, while the restart worker is still bringing the firmware up.
Clear it there only on the first boot.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: test RECOVERY on every try of the send loops, wake the CE descriptor
waiters in ath11k_core_pre_reconfigure_recovery(), clear RECOVERY in the
FW_READY handler only on the first boot. Florian's Tested-by dropped, as the
code changed.

 drivers/net/wireless/ath/ath11k/core.c |  2 ++
 drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c  | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7456a8422654..e8d245f1023a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2463,6 +2463,8 @@ void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		wake_up(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
 	wake_up(&ab->peer_mapping_wq);
 
 	reinit_completion(&ab->driver_recovery);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index a176e6498ec9..aee32aec8732 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3291,10 +3291,10 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			if (ab->hw_params.cbcal_restart_fw)
 				break;
 
-			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
 					  &ab->dev_flags);
+				clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 				ret = ath11k_core_qmi_firmware_ready(ab);
 				if (ret) {
 					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5f2412982229..82b8481ba818 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -303,6 +303,17 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 	return ret;
 }
 
+/*
+ * While the firmware restarts, only the restart work talks to it.
+ * Tested on every try, so that a sender which already waits for a
+ * credit or a CE descriptor when the firmware crashes is held back too.
+ */
+static bool ath11k_wmi_cmd_held_back(struct ath11k_base *ab)
+{
+	return test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
+	       current_work() != &ab->restart_work;
+}
+
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id)
 {
@@ -314,7 +325,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 
 	if (ab->hw_params.credit_flow) {
 		wait_event_timeout(wmi_ab->tx_credits_wq, ({
-			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+			if (ath11k_wmi_cmd_held_back(ab))
+				ret = -ESHUTDOWN;
+			else
+				ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
 			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
 					    &wmi_ab->ab->dev_flags))
@@ -324,7 +338,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			}), WMI_SEND_TIMEOUT_HZ);
 	} else {
 		wait_event_timeout(wmi->tx_ce_desc_wq, ({
-			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+			if (ath11k_wmi_cmd_held_back(ab))
+				ret = -ESHUTDOWN;
+			else
+				ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
 			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
 					    &wmi_ab->ab->dev_flags))
-- 
2.53.0


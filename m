Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290600;
	b=Y4D6z7MX0X3GTa9+6ZyXaN7k1u38Dipkm2c+NcKARQZtaMYNfCmSFPrgtOmmPfpdbm7F
	 KyRPQRGAN7hl8qHTuJ+J/TJ9UfcSjmVv2KDWO+vFje32U7MKKhs1j+zrBtPlS9ujVvT90
	 3ctGgYrYFJ8LBYboTs4l7gUY4E1Hq+U6tMQq0FcPKc4rshZCaRoHv4xDGFPgAyGJEROyb
	 WJ0XwMVyh331kpUshMI6FCHTHAohnVRJ+cdCWQWT4gxWTkZjKSgVwRCfBz0SFShbViBvE
	 c1ORXXTDIm8IZxP1R1noi2OFZrfRrg/ab0kvpGmRs8gSZxq9ThUyJ1VwkI4xoaHs3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
	b=WmCS/tg07gYyrebOXS/jlSeFP0wnrhqt7zL7fTievudVgk0Af5CSN8X2JuhHQEvy84Ij
	 am8hpMrKqS7pEsXPYe1Gc2ZpPTei+5I4lWqvXfVmj4V7C6ajRDS39XtzJVKu90URYFgYz
	 1wBVy5QfxOSyMm7WdeunJbFA4DV0RZ4Wem7OmkVZH0I5V3YeZDLyxn2qJ0yKYKQAvScao
	 efJINFaRXQKwyXqknk+Dg+I5+LLTPmlVXZYpsDvl9kItVTc65cDyWfPEvUCnDWnhMzPVv
	 FISVBKNDHQ7MV+N3acoDRf27DFwsIDTg6In3A3BMSxMP6pQmqKneEI2i33+35GyjR+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFrJbL6d;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92D9606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E92D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFrJbL6d
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1767793f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290598; x=1795895398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
        b=gFrJbL6dFtWznzoIQltJZWkyWMukMQzFfNpqr1iwTfyDCz8hvwFDVpsEapO1k4DRmo
         GXmxkL+0qLoepFvGGHs7/xwyZrtMHv44A+72D41ks/UK9KWPV9274qp2J7yGpbPGmzTo
         /rQ0fC3OauJEQ6k743GCE5mdjm6eIBK5fV01n4zUeZNNaCOS8oIl2Nw+dxZ8WseoWUiz
         kCy8NidvRzKzTkHXt0Y1rV5WMH3IIqRFTXjkOhnFAIhVbrdS0wXgqTR19jeIPDZldFMl
         BJi56TJnSxy0MYMG8NQnbVfkrWmrF4eP932JPcdkJ5BXBsMJlTyDy3flllnJ23NR938M
         4e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290598; x=1795895398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
        b=mIKvKDbJ9NMcAIhP3dsYUepdIzCRgcXZWohoc589tG6V+WF8+DFKrnxdblq+3f9taa
         g2LHgAhIU6PAYvBDhz4fxaQabZb0yV4pqTyR2uLYpTK0J0e+aAvT19P2rUfFBjlx8P1z
         1d6e0771PF+OoohHc03zC3Fyn/p3YQLO9Vrmwb17KxhtT7Kkb0RqT13qo8gGkuDCDCYc
         XRpxLuQShcfTWoqhiXzFwZ/ff4Q80QvUwGPCtPSHLQQgl3n1hqKMFAC2iS6LuUubH/Ps
         V7OuUNjjE7Fd8kwz0tbysFKBxFDYufJMNfHJdH2V7LfrhoAMuikFITQT+HLQ2UaI5+uR
         esDw==
X-Forwarded-Encrypted: i=1; AL+hErEY+xWOdjqZXJmq95PIlcB9qk6lzUA0UM23gMezsQFsU0ZA4j4uE5GbkzMdYynrtvp3Y20T9vdRhwgGza8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MHKgr3Y07IW5xVNpttLKMhgF9fcJX5k8ewnvtP1RS7XFvxjRh
	zEgTo6UguPIoo4EeD0odTYYowR3u2SfFlWegu6R2nduqKkCTCrRv6Uy5
X-Gm-Gg: AZFdTZfG2UCifoj3J4LFQ7AV1q0TrPvcgZ3TNMKnOiBxmdNKZSJ/F+PGrHPcG8Ot8cN
	/BwUmhJ3Smmo/I2fbgtw8guJEgOhBrOFwutZHdbPHIU0E2OOnGhBjEl2U84p2eNWNDS/6GfWuBH
	54d33dFVefEUcd8OnzakB8zrfsy8ZLosvnTTZpD5Rn0p0xg+yY8afwZIAIyxZLsM84pHbDYO+CM
	7JMSiqe8du4+X0YkXTx86iXsw4gPN21Zpgv9MADaQ7VFi2peY8Z4amo80wNbhCMRXLT2pX51OtA
	qHZ6PQXONvEBtf0kpU6A+9Nu+1XindQgjM1sfoMG2s/RiaNxtgQ7dRNaLD0K+jh88u0urcXdgOR
	tN3TQhjmH8zZRkpLJ2rfnSeYiCkMdN8xyae6DuQ6i3OuOO7IuNbXqFzcEoT5I6KUDxas3dpfmui
	PUmbIzI6yiPrcgTG+lDej+JQHVGoV7r9TzCk3s6AXVgcrIAAe/bWFFS9E6eXtyX5BLAoA2J0Zpj
	VaSkxf5iniFR4ouV1fu2VCYRLZaS+16RSNj9psxogsTL5cmBim6gnjPQPFdvRz+XucPjzZlvrDW
	uFRkp1gxR9RoYEs+woETmouejSE/OXD12T5nkgaNHXphpU+1FFEQjCNXyw0=
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr170965775e9.21.1795290598210;
        Sat, 21 Nov 2026 11:49:58 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:49:57 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip channel stats events
Date: Sat, 21 Nov 2026 20:49:37 +0100
Message-ID: <20261121194939.3647400-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121194939.3647400-1-morf3089@gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com>
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

SDM660 WCN3990 firmware crashes during scan when the scan command
requests channel stats events (WMI_SCAN_CHAN_STAT_EVENT):

  qcom-q6v5-mss 4080000.remoteproc: fatal error received:
    err_qdi.c:459:EX:wlan_process:1:WLAN RT:2073:PC=b00a5d88

qcacld-3.0 only sets this flag when gEnableSNRMonitoring=1, which
defaults to 0 and is not set by the vendor WCNSS_qcom_cfg.ini, so the
vendor driver never exercises this path.

Add ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT so affected firmware images
can opt out via firmware-N.bin. With the bit set the firmware no longer
reports per-channel statistics during scan, so survey data is not
updated on these devices.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 3 +++
 drivers/net/wireless/ath/ath10k/wmi.c  | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2aa18adb3..d37add4cf 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -815,6 +815,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
+	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee43261..29a4c0d74 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -838,6 +838,9 @@ enum ath10k_fw_features {
 	/* Firmware support IRAM recovery */
 	ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
 
+	/* Firmware crashes when asked for channel stats events during scan. */
+	ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT = 23,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e57588c19..adaf3c80f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -7095,7 +7095,9 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL_EXIT
 		| WMI_SCAN_EVENT_DEQUEUED;
-	arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
+	if (!test_bit(ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT,
+		      ar->running_fw->fw_file.fw_features))
+		arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
 	arg->n_bssids = 1;
 	arg->bssids[0].bssid = "\xFF\xFF\xFF\xFF\xFF\xFF";
 }
-- 
2.56.1


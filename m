Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965008;
	b=aPYyyhg2Bhqbq3f117+Xn66MJYy87Oqn0lNrP7JuNeFQlZdg9iGt4iIS4GPLF8eAGrjb
	 i0QXWCDHcqJBt3AlfSRoL2YUq6ILjLoB4iiA5uyg93eYIBRGNdYVEJPkvwTJCE2/+2U07
	 0wYU7N4nGRxO+eDt2oPS6P0sjXwjgCqBRb/IfHbt0H/i8VMQyOGU/yTkD5+8WFZnTgHCc
	 ddzR9BRD444ikXF1THDKitZJtfE876etaNwCXDrQ7MhG0b1vXcfF8VE6OYOeSeIecCGul
	 4wXOA6/xUD5cjj4j40DttsmwV1p2apqW2dS2v8Ri7vjrNkJtR6ULrOkfKePQvCA0hUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
	b=mCSYd/1YRytiQhjAdig4EBp+L0eBDCQ9KQzez2YJCka8jAXvtJdeaXJpdfu7ohbaj+9V
	 cQvVRsk9oU83NMHeXnTWFIagHLHvKoISTsmw40xm05JGdRYi+VSycVMiFIsMXyG2a0ESv
	 ce6BBBHKSJ180vfViwwNDsKDrhP5QG/OOZlhrz0EyeLGC4C4yFlz+Uy8KiAZHD8dviSa1
	 unYK58QD9HXVo+PStY792ROfV78CBrAFK5LoPYL7JnG6tKNn1o6aCd19Q3sBsb3PYBrjb
	 ZW75dPIWg01t4eUysZo/udCFxdJAedWMUCg1mv0nwClmNF6nOaSWPcEElYeg96m8WRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pi0.com;
	spf=pass smtp.mailfrom=domojo.com;
	dkim=pass header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=DZmwM0Z3;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF915606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF915606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pi0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=domojo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=DZmwM0Z3
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso305610a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1794965007; x=1795569807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
        b=DZmwM0Z3iA/PolSickj+gYPBKFp1C0Imn3q+48/u9uS6y/T5GG/wWsuZ+Wv4xmSZ26
         pSHoUIj4wGb3wKKLs00ufb8c1fKC/X03+98OJS8S+IPdQ3tMUDfJosjTFZb0v6l/pxnW
         zZKZOYWVUh69AtshRTs6y5mh9fZ6J8nxiym8IZtnTESJ/ehYyu7iGRgsqHCOiK8nNU4+
         +aDjxBr5zZQgSM79iK6lmWXWzkFyrGqnMs3CYT8JUxcOic/9kjv5/6yBcY3UiylJmhdI
         N3HhSGASLpf3TPnKEJqELtwiQrUTiCt+EMvdQ/eysciVe7P59DUnQpXl2N4LUsM7QqJ1
         LUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965007; x=1795569807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
        b=HPxtrL+qtr45VWPHYM+veDVSfxyIP2+CEgTpVzDzf/LWFlDUxb7baLRm4mS67heOzV
         j3CutOMJ/OZlO8m6938xsFh/5kSO/2ty/lctAOVqsWQy85o8A8gEMvv/pyunlUdu1eIs
         cXosciH7MsRu7xNI3Qx6llpmWh36Opo0Yl+XeV1rWlCyYEPN0N4A9rQaBsm+f86gLnXA
         NXmOZSXj66e3LNO3+vncCcuN1qXzUjUtFFAKRRLvehVyQ3jh7qFS30L8yve63KGVzjvO
         RhCWoDyXrOkQbTl7mfhxBn9Ty3QvbJMLBhIFxExQyW4bbsPCZf6HJpkiCG0qVbC31v31
         dNog==
X-Forwarded-Encrypted: i=1; AL+hErESkmP0BPMAjFiFV3Ini8Q8a8sON5I8WZs1UDMCZo+JK/rE/5NPuYc8sOGyb1AELi+XKY1CMgtUJjrCFwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zuTw1h6SFepJ0MlIA0NJhNrd1pBrMSBCVEI+pT/GV7z/Zyldo
	0ASqjF3r0CPb9c0Z+GG8fX3LY1p3yVmsWzCcEVbzZVTSqDIQSQP1gYHXQkD2m0xCvlo=
X-Gm-Gg: AZFdTZdM43d3fP2gORZiaZ5x5ogugCo14BlVArTH4H/88QZhn6FbAkLnIX5nNlIhohs
	vuXphg/bh1cBqlf3msRYtttnnGCuPzZHH3YSmadozIaePmF8kp/kEnBKFGxv+WMgScp9o4li+Dr
	RT/VF5YOTEEP4ce7GA3mq16mAbSdQ+RLJXaqB5B93xNi0Uj0rZClBP5DH9Ojoe45VBk1uNP7JYB
	Ew+fWGhRjwHRXiG8o+v5wouIkoD7uegEZtfDQFwiCdJYLuEDHFjpzjOsmpYgI8QPoQoOgmzp+Rq
	giXvhFZ/3TDaMrlRcbtdVWv+5GUYtCnx/BcodEzllsqwa9C3YG/lvN4xOKkNC77lKrlEfZxF3Go
	+1/D6AW9nfS9bXezx1SbnPBGHj9h2JJwhXu+iMYiDGWr6lRjtCMOaK3apFXeObuQK+nPqtFptnj
	7gT0b7Jy36JsU4EX0kWfjWvLTUtEahBHuQq/RA79mtu6Nu1PeO8iL4DCZ0ZoBHW1IXRLV0F3wZ0
	bheSedUj4cbJQ1v8ayJcqklKrUfC0/rkF02fzTvrpMX6CwwmJP3C0kSoEpmD1x0h2/znCqiowsf
	h+3qkJIvjjHvBXJsCNIlM1GVcPOuigv9JieC+/vYxBjS8iKyPE0c5sowQisIGLh9COm1d3c+Dee
	H37gQPWrx1KW21z+3m1NwfLI2vXuawzoS08pVZ2xjg9FZsxG6WYxhF6vg
X-Received: by 2002:a17:90b:4c8a:b0:3b3:c998:6d6d with SMTP id 98e67ed59e1d1-3b3d07d454dmr1081904a91.47.1794965006850;
        Tue, 17 Nov 2026 17:23:26 -0800 (PST)
Received: from apex.localdomain (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187aa1esm1439308a91.5.2026.11.17.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:23:26 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability TLVs
Date: Tue, 17 Nov 2026 16:23:21 -0900
Message-ID: <20261118012321.2861920-1-wolf@pi0.com>
X-Mailer: git-send-email 2.56.0
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

The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
therefore points to an inner TLV header, not directly to struct
ath12k_wmi_dbs_or_sbs_cap_params.

Casting the array pointer to that structure reads hw_mode_id as
sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
partner-link deactivation.

Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and reject
unexpected tags and payloads shorter than the capability structure.
Use the first record, matching the vendor host extractor, and leave
the cutoff at zero when the array is empty. Only store the cutoff
after the complete array has been validated. This leaves the existing
hardware-mode and link-selection policy unchanged.

Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
patch to Valve's matching 7.2 kernel source. MLO advertisement and
radio-mapping diagnostics were enabled separately. The cutoff changed
from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
and AP-side data counters increased on both links during traffic.
No driver recovery or association loss was observed during the test.
An unmodified upstream kernel was not boot-tested.

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-parser-live-test.txt
Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990..f43c9a359 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+				       u16 len, const void *ptr, void *data)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params **first = data;
+
+	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
+		return -EPROTO;
+
+	if (!*first)
+		*first = ptr;
+
+	return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
-	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
@@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
+			if (ret)
+				return ret;
+
 			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
+				caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
 
 			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
 				   ab->wmi_ab.sbs_lower_band_end_freq);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759..94bb6854b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
 	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD = 0x3D9,
 	WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD = 0x3FB,
+	WMI_TAG_DBS_OR_SBS_CAP_EXT = 0x400,
 	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM = 0x427,
 	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
 	WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,
-- 
2.56.0


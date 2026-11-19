Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115867;
	b=N2zexghhPdZCSGUqSmJApNLmofiqklRaVnVejkMZPNPMbAheYoGnTJtGAtnLjntYrA54
	 u9dSRDtUiB8VjI2DR+mLJ6Mrt0FkyG2fd1UsRDiFH+XFzmRA/yBt7VWxfH/zFG7S/ARTu
	 g3rMbz/KVsCr9e/Lje/9583W0i5mwuUsyt8C/QJfbJ6bVVcR6YKXGLe0jVAU8Fr+wkByo
	 lB/4yHrrkTtZwLQvHCuWlMc3cTBmDMkwmGNJQildbEvkE+l/lbLdWAft7yXR+5luI7KfC
	 ZNYetOl+Hkz6pGA4PDe3zMiAy3eehYsIbQmzYqJddVwX/gooWkAM/a02Bn965Y9aOPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
	b=NGBJVDSltARhFritPcmS5bwTB1YQ0kYOkRRcUKHAu+Sy6smdq8YgPNSCRaefkpbL3Txr
	 PQl+IZCrccpetAxk99hgFQH58CBMiDHtJmEvXjBU6pvUd/AM8Aj5NJkalgLSMngIPd36Z
	 vyS8/0DDqfXB0pogj6DyVXeRLLbFddSXw/jn/5UZRG5Z4BxiW129pxBtKs8tGmmtYS2cY
	 TT27MY99aa4u2Slpv6wiNwZmDb1IxlQTFi91n4RRsxZKUHtIDMojhWl5uX9q0ARli53VF
	 0cc8k21r1mpkk25r46Q9Jb9y3lf04Cewut2yabAy+QcNw+7iIIQ46CbzGDE8xmEUfSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pi0.com;
	spf=pass smtp.mailfrom=domojo.com;
	dkim=pass header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=L9PefKkt;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60226606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60226606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pi0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=domojo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=L9PefKkt
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2efef1516b5so405965ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795115866; x=1795720666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
        b=L9PefKktCIxPn7EjNDggL5GXv2V0u5eRM/43RbHzPOmc8s0tnYTjZmCqDXOzLgtsDh
         Cz1CxzzUj7Jc6mhyAzjzJPkkTHIMxfW9NzTb1ORDuhrIFBmtOziC5vM6ycMk6sP8ME6J
         +P2FjsdWhaY5i9l4Gq5y4nZceMC+koijIZbQbkQB65m01c/TRAZ9MVTn6pWoEUaGQBM2
         C0m5y0+lTJ1xGDKvF/xDeg1Cn3m2ec57NDaac8ilnvKMG1pY5QAaBhakTY9Xd5CfvxOP
         GoLBf8AYPu+7ZKAlTNAyZiHP2ncto3iIhO/X3RliacSSkqzS2z5qj58RGURFq8464Jyq
         JFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115866; x=1795720666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
        b=p8k/CNuz9FMgnydc10SdmDhBHfyMhOZg12D8K58vxaC7KYQ+aRzYynyel4Dk6AgHDQ
         uLJkL8/QbK5BVcJFZjBft7WKT7uVhB5MVi3gpArhaNAqLvQX94J+WWw2GbHVz+8oohqT
         ccbFdj6RfTa3iMkzUzYI3wRkLS9WOn1sWJ/3JC3L20KldXwN1JUy65PEiPBo2DXhZykl
         1XEUipzOQyRQgPyw6T31ZRfvUJYbyIcu8ixqp8+gKHOevLkeG1fx7VhcP9MA8Is8V1mb
         u8IGT+b1tnAtVJiNZY4XrJ27aRuw/hqSihMV2W2JwIpK6sudIA4SbmQEMRamSEKASX3R
         Be3A==
X-Forwarded-Encrypted: i=1; AL+hErFXovsY/udiGL3XvNEOQSIQWsrDA2t3550ZIOYbg0sZ9ju/dl9sal8mAoqKtp7GRJwdqWw03TrD45zO1Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uZLAAqjXqKtmT7VTCNy5WrUEmtekjxU22sNJyiNdRr1f/+Mo3
	yv+SY+0VO0kegzsEzMUSjvf7pDTOCbUzbsJvNDS/O4p+voYdBb/w8LMPs5UuLqEyfsRr4YXleYJ
	z0euh3bdQWQ==
X-Gm-Gg: AZFdTZd6ZXp5TZD1Ns1c5sfBOEV0V78pKjShI1e9SEbKkS9/nc6ZvJrozYj7qlLXd0Y
	b5+e2EL+mtRA9IrU10VcTyNpDw9lE3B1WF0xmpAWJip0X4sQTw9ScSBRr/j81PSDLJhACGGq0sA
	+vZk3fUMYUQJFKFyKLulzHdOby8cIjZYA+wEyz8Nld9enxkNj8fWxkp795e/AIeEoUKKrWmfT/T
	Dhlh41PJwTLR1VJOd3vixJk4nxqzj6QmM0PZSD4woMo9EGiZIZrzsBuOC/IUhGL6Hwpc+uJcpn9
	/763ScBxzGSAYrIUKcQ6ITo1I6+4+K68hykaDgfD6qLSYsXtQ+smX/g+Q94Ay2xvG1/o37LpaX2
	I7w97nmM7P4eseGUdPlP4WTZnS21AEGpSHx5BZZ/MTdMrZ5PuQHY+PhSftZDcDjfRwbedOij2Uj
	ps7l2ykZtVlJma1L31Z8baKuoo+NT/pBjjvjqsQ7XV2U7G/ZMeVBX2F6tkTtNiYR+QF+3I0RQRu
	9gmaxWZXtT47Rfd2hHZYyXdhhkb1zvS3rhvAh8iPEXW26hEGe+KpMrWHNvSAOYsqgFYVHjINg2Q
	oAek8bI2UlC/TVgJL1k5hMlG7WPn4CB4N4p/FsS2bvKV5gXufKhgCdm0WzG/IxMU2qz4Ne0eR3U
	96kJEH1fBwpxKzd3liWQyVdvxnKmeNG71emGJMfJrSuijYOvsgj798URH+6i2TzOs
X-Received: by 2002:a17:90b:3e81:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b41c9559f5mr292265a91.41.1795115865629;
        Thu, 19 Nov 2026 11:17:45 -0800 (PST)
Received: from apex.tail2509b0.ts.net (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm3809796a91.14.2026.11.19.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:17:45 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com,
	jjohnson@kernel.org,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current v3] wifi: ath12k: parse the nested DBS/SBS capability TLV
Date: Thu, 19 Nov 2026 10:17:16 -0900
Message-ID: <20261119191717.215161-1-wolf@pi0.com>
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

The DBS/SBS capability in WMI_SERVICE_READY_EXT2_EVENTID is inside a
WMI_TAG_ARRAY_STRUCT. The array payload starts with the inner TLV
header. Casting that pointer to struct ath12k_wmi_dbs_or_sbs_cap_params
makes ath12k read hw_mode_id as sbs_lower_band_end_freq.

On WCN7850 with hardware mode 5 and a 5900 MHz cutoff, this gives an
SBS frequency range of 4900-5 MHz. The driver can then map the 5 GHz
and 6 GHz links to the same MAC and request deactivation of one link.

Use ath12k_wmi_tlv_iter() to reach the capability payload. Check the
tag and minimum payload length before converting the cutoff to CPU byte
order. Clear the cached cutoff before parsing so an empty array leaves
it at zero.

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
Changes in v3:
- Follow Baochen's suggestion to decode and log the single capability
  in the iterator callback. Drop the first-record pointer and wrapper.
  Clear the cutoff before walking the array to handle an empty array.

Changes in v2:
- Warn on a nested parse error. Move the cutoff assignment and debug
  message into a helper and separate Tested-on from the trailers.

v2: https://lore.kernel.org/ath12k/20261118204307.3154270-1-wolf@pi0.com/
v1: https://lore.kernel.org/ath12k/20261118012321.2861920-1-wolf@pi0.com/

Built ath12k for arm64. A host test of the event parser reproduces the
5 MHz result on ath-current and gets 5900 MHz with v3. This revision
has not yet been run on hardware.


 drivers/net/wireless/ath/ath12k/wmi.c | 32 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c..9b1de1ec06 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,27 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+				       u16 len, const void *ptr, void *data)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = ptr;
+
+	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(*caps))
+		return -EPROTO;
+
+	ab->wmi_ab.sbs_lower_band_end_freq =
+		le32_to_cpu(caps->sbs_lower_band_end_freq);
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
+		   ab->wmi_ab.sbs_lower_band_end_freq);
+
+	return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
-	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
@@ -5840,12 +5856,14 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
-			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
-
-			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
-				   ab->wmi_ab.sbs_lower_band_end_freq);
+			ab->wmi_ab.sbs_lower_band_end_freq = 0;
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_dbs_sbs_caps, NULL);
+			if (ret) {
+				ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI TLV: %d\n",
+					    ret);
+				return ret;
+			}
 
 			ret = ath12k_wmi_update_hw_mode_list(ab);
 			if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759b..94bb6854b0 100644
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

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.0


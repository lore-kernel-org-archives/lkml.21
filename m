Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658859;
	b=WNCQqfGjAK9NtrIbdEsP/D8zDYaYi1h5E1H8w69wbE7bv4FBQG6wY3kQuLAXm4JSzHyg
	 Ujij+LNLpjvcvIhRjAVn9L2t/wjVu6O/+9pAvcloV3KUuM02v3UUq0VIOnTsInT5bBgCO
	 sgNqd2UGaexSK4ghScc6KHaxD0OXp6cAJ58KGPVx0/3uKkyrrseaAQmr8liHQQw4xULmK
	 B9y8u4UFrAeEI37mkx0yVDGK5wcsPpeuOYWUtYfjPx9s7wAF06Rben60dtcnghMZOGmZf
	 IQjCup8k5TG0SJDEbuuVnnUc6qS8Mx+1Yiv+jBPY7f6U86sutfgWiK5PX8AtTxrOcEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
	b=Gtqtn3aDTv4QzPe3U1m20HhA12WD02EDWxLCm5INC+r+zOJV0H13Imi56j7fi+IiNRjJ
	 CMj3UnpbBWRnvvBm+8Ko1RcYjZgHoqQZLFf73A1K/swqgbtUKLBOPwzWUVz0xvblGlzfe
	 4sB2qFWoXWHd8ScHY1qn7sqd85FdMSKu025nF01P7D+agyogd4wZz1VwYKRx9wD6M3/5U
	 jkYlil9oXxctQFx+r5iyD2nxDzuPh0q88bIWWwtY3grhCvzLeWe4UE0LmMZy+JTuvcHVx
	 KoZDTE41kA2slq9RzWMYieoU/oH1qFlXVR4TL0CXzO2PabyJHms7moWdshRPdvegi0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=augfP6Zw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=foOqpnS+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5B0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=augfP6Zw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=foOqpnS+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAtWm1357697
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0R6kz49hV3A
	Zznu/COs3CzoBAvj0flKjT5W/5U4wY7U=; b=augfP6Zw91OUSzboB9QrvNdpqm0
	m3I6YkxtsxmTZvi1qf/QzK+sevb250QZbdndMDGUm82CSvKGp8QAf+ZKQHp3ylJR
	3dK/5qL1kh5sPosvak2mBAsorAmlBm6dKwqyk6cb9pbn1QH+PqdAp7wPBsnJ5BS7
	71eGRs/2VxDo20HAoqat4acL+22lZONWv2V3LYJTS63E8dgnZeelW8ubg9pBkQRh
	vjPCxklr+n085F1PZFS4TFGq1d/uhB9RzILC0rBD9EDqrTcfREFnVVkyvnEAPGDz
	WugNz6cPbH/9RPNznHkxoNeIhNyBqyOBd9dn36OW5MP4kDIwRR8P/MhP7Ag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxtsha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6208781a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658858; x=1796263658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
        b=foOqpnS+3n/cugr44g7OgR7+YG8MwZmo0ZfJUqpo65oFtc3NWg1W86ObdvgFKrXLzT
         Mme5mYI3qfIA+ORCPsbxSKgt3UEfcl/xPh3mR8/zT7fe8rB+fkdC2ezlIl0naUbGQZVI
         V755TQc84QWz2AWCEa+wP1577F0UvQiEIdPBH4+KAAbOskA1kr00vad/VC/Ft9tDVR8u
         zb8wfBdTnox8ObYnukBt9z7vbCDbO8HI/XvVcO6fE/cLfSkQtktlwcvlKIFu8heq0oTh
         jBV7Vle5Exw3UOotnimwdF4EruW3kaJp+Nq+akLm7p9yUQQxCEIjCT2188Wsxey1y2lD
         eXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658858; x=1796263658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
        b=zukpQyPXdx+azhURRvv8Ebtjo4+Ubi7sD+SDfLUSr9OPTZ4tX9fzkzd/XS6Vb1sDqM
         8+6pZMIWkPZ+1TcqEU8cJxEOJPSBCPnlUUv5dh9CD1qYqur/FPL3oWq2VV1Ydd6/NG8L
         FnoPS0VhV8WjG7/nWwohXqkpXAWa1gTM1wx+BGuc4JA/J7x8csiqMlN77qkQG7rSvWEw
         kbaWJ8T6bz+QoaWDsf5eUnFNTdcK7RN94qODgLEFJGcbVHpvXf80gZz5vXEgj198S3Jx
         p2LkYBeoKE5fIs21sxz9Bq/IsC2+70fU4uNpoS36dSlwSIdsqLG0gKwVlZ0YW5+brUli
         4cqA==
X-Forwarded-Encrypted: i=1; AL+hErGy2fmAo00RXqrNJLmU0axcavrwZsY3FAoAXzBJrk2C+Hnw+04sO32XmORXFYcixhn9bKYp3djKm7W5C7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tcb6YcqgKC//O1xeJ/C0BuoD6424cQ58YYIy5YTDcXeOjiGRK
	UeFsmk5RLUg5vTGHi9541oY1uTSoacDN7KmcbCvUBCnBF3Dn/97GEPL/GnAyI1AIeUAnYiIUFkk
	FWtjHMWlPx6ue75oj1Kpsa/15bSSIwM/u6a5aiFet+EcZ1FM4SOsDJR04Uqw10v9nFtLsXKJOh/
	I=
X-Gm-Gg: AZFdTZe4LaXhwnx/TUFo1illz9kDv3lEY9RdCSsTPL2aUhXWQCzccNc2pj3MrH3olah
	wmsL+9LtatJP+fmjxwIwMEa0b1tErCZ2jQm0rR1UGxB9Zet8W1Y+Uz6i9+oCFGqBuX4qokRyHOe
	YBxLkG8LUWAKelvgg24p8OtbhJXliPqpDpWGmTdnA5qXkR8ygMnGNG4qDZ7Sp7vU5TUVvvUTyNQ
	gGZYZ366/neYwdR9PYoBHso6P16b7chXMWRWMCKcvAXRDSygs/qm9M07ehAaXt54AhvTPlVmw2h
	S9Rxp3hlBPGDDTMejYKaYJi2I6AxmP0UaO1tX5LXf5di3yMd1+59QCZwut3Xl+OI94a9tXnMbcg
	sXBa+0MWequAcOu2jGkosQJ+dl0NK7umLJTgFP0m+tV6tIatzVPJmMgyjPD8nGPvFPADbTAkkv2
	51LIGmERkpwXsAGNvqKp38TqXQBMtvV019J/+p
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr13705218a91.37.1795658857912;
        Wed, 25 Nov 2026 18:07:37 -0800 (PST)
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr13705190a91.37.1795658857147;
        Wed, 25 Nov 2026 18:07:37 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:36 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 2/6] wifi: ath12k: derive MLD max simultaneous links by hw policy
Date: Thu, 26 Nov 2026 10:07:23 +0800
Message-Id: <20261126020727.3273337-3-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
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
X-Proofpoint-GUID: nvLpyW8qSWY5Fzr4mOVCXywcFCpoarmw
X-Proofpoint-ORIG-GUID: nvLpyW8qSWY5Fzr4mOVCXywcFCpoarmw
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b07946a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HJkC1t53WzKw9mxX8OcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX8BnahMx2gZNA
 G9Q/mQ7ku+qVrT8976Hb2O4wbT6gGNZlrTUqRr+YsT8mnBflhD5kh9IETEiFaDkVpX+BgKHbGwl
 Z4laTTrJRCpxck69VJHnWMNyWdwc7r584yRlUhkb3GQwEGitUtqDB9q6NKQFBMZxKu/9tZEPONw
 IzE41ZcflPNYob55XG8xPDHGDebZM56vpt0pQq1YQ0sCLZa99o8C2jG9tvq4lJ4ly7HsFFF7m7P
 0ny3xn3Tgdj3GP9Rqd2TmsSHM7QfhZPclbKPLAoyKC0GAOrc/AcHJxLfkR1rgyTcxN8k/q4iqFI
 qa/NAc2YpM3sF2/yx8Yfo2ZISkeeB8Ka7xYAo8BVF1yuu/gs2XhIKjDbXE2IYup0/J7Pzhojl66
 oqEzwT98Yz2CPGvMTLfo9W2f6QFxWyu63dwmu/KDsc9biA9SyrLP/C8/mXWx8laqmBM+8+RgpBC
 B7ktOpDOMGt5uYF0WZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXx4T0kTKpB7ON
 TWVJV//XB5dTIW52LFuzHONnErsnEpSmDPF3Xz61D0m0Nau0I2pQ7GuvXSiZmfgGdsT/r4zhG/z
 d486d7iLsaIjXaD+P9hnhcyyeQmLqXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

On infrastructure-focused chipsets, firmware may report a maximum
simultaneous-link count that does not reflect the available radio
combination. When the counts differ, converting the firmware value to
N-1 still advertises an incorrect Max Number Of Simultaneous Links in
the wiphy MLD capabilities exposed to userspace and in MLO association
requests. Userspace and peers therefore see a simultaneous-link limit
that does not describe the configured hardware.

Add mlo_max_simul_links_by_num_radios in struct ath12k_hw_params and
use it to select between firmware-field conversion and radio-count-based
derivation of the encoded max simultaneous links value.

mlo_max_simul_links_by_num_radios is enabled for
QCN9274/QCN6432/IPQ5332/IPQ5424 and disabled for WCN7850/QCC2072.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  7 +++
 drivers/net/wireless/ath/ath12k/wmi.c      | 67 ++++++++++++++++++----
 3 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 138e556ac679..7cd357f9429b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -218,6 +218,7 @@ struct ath12k_hw_params {
 	u32 otp_board_id_register;
 
 	bool supports_sta_ps;
+	bool mlo_max_simul_links_by_num_radios;
 
 	const guid_t *acpi_guid;
 	bool supports_dynamic_smps_6ghz;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..eef99b664748 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -472,6 +472,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
@@ -571,6 +572,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = true,
+		.mlo_max_simul_links_by_num_radios = false,
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
@@ -666,6 +668,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
@@ -759,6 +762,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
@@ -855,6 +859,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = true,
+		.mlo_max_simul_links_by_num_radios = false,
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
@@ -949,6 +954,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
@@ -1039,6 +1045,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d1af43ede2ae..5cf104536dbf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5293,22 +5293,69 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	cap_band->eht_cap_info_internal = le32_to_cpu(cap_info_internal);
 }
 
-static u32 ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab, u32 mld_cap)
+static u8 ath12k_wmi_get_max_simul_links_by_num_radios(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
-	u8 max_simul_links;
+	u8 max_simul_links = 0;
+	int i;
 
 	/*
-	 * Firmware reports Max Number Of Simultaneous Links as raw N while
-	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 * On infrastructure-focused chipsets, firmware may report max
+	 * simultaneous links independent of active radio combination.
+	 * Derive the encoded value from the number of available radios.
 	 */
-	max_simul_links = u32_get_bits(mld_cap, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (ag->mlo_capable) {
+		for (i = 0; i < ag->num_devices; i++) {
+			struct ath12k_base *partner_ab = ath12k_ag_to_ab(ag, i);
+
+			if (!partner_ab)
+				continue;
+
+			max_simul_links += partner_ab->qmi.num_radios;
+		}
+	} else {
+		max_simul_links = ab->num_radios;
+	}
+
+	if (!max_simul_links)
+		return 0;
+
+	return min_t(u8, max_simul_links - 1,
+		     FIELD_MAX(IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS));
+}
+
+static u8 ath12k_wmi_get_max_simul_links_from_fw(struct ath12k_base *ab, u32 mld_cap)
+{
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	u8 max_simul_links;
+
+	max_simul_links = u32_get_bits(mld_cap,
+				       IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
 	if (max_simul_links)
-		max_simul_links--;
-	else if (ag && ag->mlo_capable)
+		return max_simul_links - 1;
+
+	if (ag->mlo_capable)
 		ath12k_warn(ab,
 			    "firmware reported invalid max simul links value 0 in mld_cap 0x%x\n",
 			    mld_cap);
+	return 0;
+}
+
+static u32
+ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab,
+				    const struct ath12k_wmi_caps_ext_params *caps)
+{
+	u32 mld_cap = le32_to_cpu(caps->mld_capability);
+	u8 max_simul_links;
+
+	/*
+	 * Firmware reports Max Number Of Simultaneous Links as raw N while
+	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 */
+	if (ab->hw_params->mlo_max_simul_links_by_num_radios)
+		max_simul_links = ath12k_wmi_get_max_simul_links_by_num_radios(ab);
+	else
+		max_simul_links = ath12k_wmi_get_max_simul_links_from_fw(ab, mld_cap);
 
 	return u32_replace_bits(mld_cap, max_simul_links,
 				IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
@@ -5319,7 +5366,6 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
-	u32 mld_cap;
 	u32 bands;
 	int i;
 
@@ -5365,11 +5411,8 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 					  caps->eht_cap_info_internal);
 	}
 
-	mld_cap = le32_to_cpu(caps->mld_capability);
-	mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, mld_cap);
-
 	pdev->cap.eml_cap = le32_to_cpu(caps->eml_capability);
-	pdev->cap.mld_cap = mld_cap;
+	pdev->cap.mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, caps);
 
 	return 0;
 }
-- 
2.25.1


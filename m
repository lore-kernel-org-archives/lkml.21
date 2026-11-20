Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164179;
	b=AxkXElhr2prpMIa0yju5t682WSYvhqK67muFE/qQCXgW40Ym845yQppUuqu0kii6mn9w
	 zaYesFF0YGDxkV54QfHZbufuGoVj2q3kOP+5juL1mYQVcJm0Wia1nWH4NKkz19yP9Mc6Z
	 IYKjzy8dfR/dITzQ47Om3JJVdvssTlQQyGebBnYU9LpTvZA+eL3B73AnFkUpvdygtr8fK
	 tynhYUnmyMeMtBadC0tCBrXFm0TrpWrAOtzxRltCvKP0nFjlPs0VX1in4OU8R94pwV9jl
	 t4I3sIiStL1NJwLz/biAZVhmNZhCw23e9t0dDq3D6lDAdXYpdgQ3+TplKNS+wQ+k9aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
	b=edGA1yYneITyuZdb+10VGep0KuR3emwnvucoaO5l9SZ6ZQua09BgERmEQOTAL011+BQZ
	 Q9zmd7kIqViL1sISUzjFeaU8PySYhe3ytC93v3RGQiGqfE7wDsZdfM+J7y8DaO8JE8lrm
	 AlvZmMxtmMurG1eG60M4Ca0PDdIwgo4Fx+kqTaFB0B7yuxal42A6orl3F1OE3wHWVDA7L
	 ZH87TCaoxvdS9FcUoiUr//uOFpWyPLobkaA5RryHaM4jdcErCA0VpT7xdLmjc8PS8sLUU
	 2QddCkyEubqg/mm5eimMIl8fRz4zDVMRGeYXx+LR9b9AVeZoFqRpv6U0UAYaE35wDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hOsFZ1x7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZi65oQw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C992606B4B7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C992606B4B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hOsFZ1x7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZi65oQw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7euWP3575588
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=; b=hOsFZ1x7CtTSFPfu
	KjI+6wzyjc5QLrg/seq6JetwneD63OGffpZg52Qmh4j8kyJistMg43AzVergJ1wb
	AOidtDa6X/BaakYDhr5phrTjY63yvgufVJQhd6emyCY2LDlGoR6P/TIOKD6PP9hZ
	RjQJbX5/IHQXVoZM02aZBPODXdrxsLSeqBsqrXancqflAd6vbA+8OKRGIIIqwlRe
	+YJ7DkVYmM/crp9+fScqy/OQm8+QkeUQ1tVr83u/NxAak81IQkbWUEttwusRCNzu
	PpApzH5qprCtiwyB8Wbt8FXxrGEmJsn/xKeoTeCu7T76S5C4TPiRXGuQFpe3gKCv
	ihehog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80hsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso820148eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164178; x=1795768978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
        b=HZi65oQwu19Fj1wNP2kwQO93gZXwhVwbFDScxvQmTqJBT7dLQ5V1JUFtQaSNsKRdfj
         bsaxNoUDCCe6LgChJhGSaRfKAgms7cZRpespjemm2TSBDW3kng6lWE0njAeCPxa1bL+z
         oO1Se0RBK5a/CbcuXlKAfjUysnhYGQ/P/86a8U7F17T6WmtbJecq2pkVEFEPFfhZUmLP
         i99Dahhbd1nbAcC8vgU+qujEziXk2vnRdHTpRIWPRJ6/THuj5u5YCyIZRyMICh6oYPgj
         n+JkXC2ZMVhAC/+BDMKJEMrkiqpUQceDNs6a0Gb0bJY9g25C9HaIDZL0XcFSlkzOH2lv
         Gxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164178; x=1795768978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gq1L5L7pty13ukZWKibi8pt1+KwROY5DYn4hDcrRZr4=;
        b=1ljofAPK+SWVwS9tutce1f0A5gxNvIZPehVFv3YMq2Ffo+K3YYFLFrYGUS9A5Gwnll
         qhSP0pzy21WsaiOuUZ4iVGWvyhzv4sIQNHJQH51SdAkHk9Z/pWmr/VEIAf4GsQNX3EL5
         Sfc9q+hCe269scKk8AxPDEAwlghtsiX82+hLbjy+C0iPlvbyRN8nKzwHnaH20Cjvv02Z
         u2NBXg8+YcbNusLji6y+bgcv56gbIVZ99oEyBhu4myQxb3n9RuuY4rgAP/nDvk6vZrUR
         FZzWRjKHAcEXdkXxFGhd2Vujgh6pg7YGKcr2gABuz18ZiLqhJ8ANroEHdfAjTKmC0oX2
         qOyA==
X-Forwarded-Encrypted: i=1; AL+hErFTktrwHtAhPzDTHQNqkS4YQRhUTkYBsAZtJmJGlpXalWis7IEO8iG7ghEDQrjOkG0MXd7RFrGu/KJLJ8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+voljoBcY8u66k4lDva6hHHzvqLWLRfHtgJ+1L2Pw5hsjZbpxU
	qXi6GV7mSyJWim9persu8cl5Seyoj7FV6MUmExY+gzDxBkPxKVxf6kK0F0UBpIqFo+dqizuCt1b
	rLxOSriwwLHouKiYpZ/eUWCrMfvbURZ0MFHoIzg7ff5nM6nbx+I9NBRrAT9dGujgDeH0=
X-Gm-Gg: AYBFou0NLNnf9fI3kHpJnRGT4EZRhRnDSK3RAfPaqKybprS6lBHFYj5kbhV6AgikEmh
	UlXOVXUp1fV1Ht69usvJx6oz055Gl+6+vLtaiL+18Ner0ZQtP/1w3JvVekdig0LI5TlygnlCKkz
	hY4cFfilodrS5nuGyS3sCxeVwykWiM/dq0GxxKH3l7L7aMBJ4NDb54j/8oyPBwNvWBuIgvB6fFI
	ybUjZGTvFRAjTARV58Q1+VPi/TvVVFP0xfHaVQqEWQwnv8ocPqZOlJ2hij76kUO0rmKyOj3YQth
	/M7mEukec3fLz1KyeW3zc/r7PjkOwD5vxFutr8WEXoHO716btverxRHmTLcaH+ih/tDh2nGydsq
	PXqEtabIXUcHnYP4VMpZEd4oIWWi32hK1CUYkyaj6SLLK5S8j0HTtItRAUDVVATrigzGnvnkUoK
	Sry5A6XdkpJnV2afdu6Q5ZGSM=
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr2104904c88.22.1795164177814;
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr2104876c88.22.1795164177335;
        Fri, 20 Nov 2026 00:42:57 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:30 -0800
Subject: [PATCH ath-next v4 05/10] wifi: ath10k: hard-block the radio when
 entering WEDGED state
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-5-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1644;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=vdDPtDHbfB+QI9Z7JKCzOpKtIqwLhgBWSgRR6mhsMlg=;
 b=soTE0DczkYsUZBwC88XdOwSYKvquC6brPAd1/W1gp4/bb/O5sNbfzWg9Q4FzEDjpN9GaeBiHk
 D2xDN+bNEjxD9aW9zXqrr1U4pPgeNWMwzZckdFEiinDNoTYgdDdRqwO
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX6U9lUw8OzZOS
 yWtxT9OSp1KxwvqcZSs2GL65Yt3vCgsJkhtKXovc/pONaY/MfmGxFuKM+NuwtDRNCc+vN0HXli6
 Sfai3baDhWAsEYDc24TNZeY1OrtdClkDirJHOBT6clrPq3erdYbF28WE4MmkcRdzEpAV7WMe3CN
 H/ZsKDCk6Dk42JFad7wK5N7LWMmoGiKdPPe7v6/fOWFOqtH/q6wnUZNm0i84N9gxK6qg5D63zAX
 QgyBESK40RE4yW9kFFZHFY7QQkato14Kdx6Aly8dsBS092Av/Lyy5nwUm+BPBcG8wEyb2ufKeJE
 8/mleJeUv3By4uKY3J9bix2LMMSonDdu1ajXmZksX2y3iNTvxi2D93kqWDkHptToiBHWrVksojs
 /mi4MusCPa92VcZMGVjbRdE9+qi23u+iEuOK6n9sygLeECiPklZlKmmKPZq1UvcDQh4A7tY6WIe
 1AqqU6wwFNBwH3v5mXA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000812 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 8J5qKkI-glgcgRW2omHnYgfL2OCea2br
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX8fy6HMVI+eeQ
 aH35W7OU17A7365YaEsaILXkeWf9F/bRHUOd/JUvgle6lautdzoqMvTfKRCVINGSovb3wGPUGm2
 tLd5aEtj5sDhncKID33+YgfN6xZqwLU=
X-Proofpoint-GUID: 8J5qKkI-glgcgRW2omHnYgfL2OCea2br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded or the system is rebooted.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 99960f12dc66..676f9657b032 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2562,6 +2562,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_core_wake_all_waiters(ar);
+
+	/*
+	 * Signal the radio as hard-blocked so userspace (e.g.
+	 * wpa_supplicant, NetworkManager) stops looping scan and connect
+	 * requests at a device the driver has already given up on. The
+	 * state is cleared only when the driver is reloaded.
+	 */
+	wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
 }
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658855;
	b=X7lot4UtyHJCHx0bwiJFxP/ExXnvovDkEQXR6QOyVohZDCDn+JXXnDvs6PgUpm6k4wlp
	 nAAgxHLrFNCZRvb1whUMnyIbrsOaXAp+iuLxwwMT0Khjr175e/4hvfoEFStS8uDxuq5GL
	 xO1SNBqgWQcSELbYedfJIE+DT8tD7Y+E+/TeCLOD5XjOdn7H2e3/dlmRK1iq406D71aqG
	 n5YQgxVbxvdQfvn7hbAiWW08NXhpbe7QAYfO1P819IA4h9YyO5oQYMGqJjmFA3ths/uEJ
	 o9UYBmb1vVsEGPjG1boKD/KZETzekIWzFVyEGYrP9KB+d4qhffplubTEs2ZNURDd8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
	b=AL4FIOAQ19jjFntKBJjObKJDPEQzhv7hSdyk5/LGKjWNtelp/s3rG8+2C65LiqFTlHdw
	 Y7uhMxvNtfD+OET4ZJfybrwiHiJbRQUcn6cx3fcPz7LgmbQQtrd71sC/ODJCAOW0610S/
	 eVCJvAOMyBHzdlkQcP5VQQD/SxTvE3Jwg+fUZwizyPIkmDKgm3EZFPdkqIASv68nppp7k
	 +2RfqYgjlnB6EctDkapuAZ/S7s7o5BbjlAkYOSKN2PmNLQAkbow4/wlwz9AieN4WVoCoN
	 k4vKx8tCUoCnvwb5tHfOq0e5Z2RlglatjOB+5tFODLi4Xuo0ox4dcANHkqbwW27zW4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LovfT7uQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuFnxmFq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74002606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74002606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LovfT7uQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuFnxmFq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAomU2028168
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCY
	iSbLV6r4=; b=LovfT7uQsKT8VXLQAB0TvvzbY4t+NUadE6hcBMpPoukagIZ/z+V
	Fd6/aahUmozlYab/03LVqO1+4s6pSDFpOFxcu/9R1ycLiI5/ejPUxjqaBbt1fxW5
	7uwz92aqbCQecoakXhI6qvaOdtPsHgcEBRHfutd+Yzr+nepmLhtu2mnOmNHn91fB
	fmNmQ77uLKcp5S/PlCtj+e9mLex0dckMMBSDNQ95pdyZBsHN8hplCOqer9Cym4VE
	s89R55EFWBM3aZvymatPleqQET4Ovnxve5dkYx8lsuJKrfvEp04+/Sq6WN8Vj1EC
	/dq2dg+li+XlZIBG5XfdhPs4Hh0AjBnuhXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vasuae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so6893198a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658853; x=1796263653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
        b=HuFnxmFq54994INOfQdCFTfYzeoPw9+QQ0Qr9Fifu9pCHmo6n7RUWhlmGZu+Nv5APG
         xeLeW28ZzddkFRMKpsP9yhPyuxuaoeUX0ho5gE6cMfTsNti/MVF0AXu47F3/2P5zEk/r
         t8SzbIt1ZvmT5CWAK8M3HR5kosWzcVV9YsUK/b3sh5+msxpCMVAgG+LTiZnjUAbiBfoy
         ccyyKS5Hv74VSWXb9g7X57of+d32ns66Avr0oQyy4AEA2OW3OqDpHNCd6CD7t9igpchS
         hgZlKwqFuW+69irMdYxgD1SG36Jz/sg4w1/vWu9Svy/dI8MikRIVQR3vE4lV8fQWM9Mb
         Cj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658853; x=1796263653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmqZqvY75C/Qa9RTExYxl08ldl1aSuBOrCYiSbLV6r4=;
        b=UFdUYymZLug7m2FMrCKFVDG5YqzuP3yf60bDL17u8RuuauvB663edD/+NBGubTG3CQ
         eRL2crDhPEO0dcPYZF2KLVcvA6Jij2RJ1MAOxajtAMy+TDUOKAU1e+yyzrzGDwKW2J7C
         W62IJOlC2AXcR/sSMCSDA5bEoBZeYkeTkfIEYOu8+jzQ9YfAJxmuz9n3rrdD6X7cTIlg
         Yu14TJTbbVfa3wUVEjJRwfkyIcWKCrkk0IYBUlulnUx7YO0C1X6VoEUhGJiw/CXSzzdc
         f38psN/xl+4h1mDo9+2h3gTXK3zwrmddb3CBfqKvAWd5e1omJqUW5CLfBNEB5MyvwyiU
         DEGw==
X-Forwarded-Encrypted: i=1; AL+hErHWA/he14ou4p19NScSsH6qFB6na54yz8cPY/WDJNV/9VUfpmT/3MO75+DRhR6djH9xBpGh0nmvTm3mIQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XRmvP4/IafxunakzJwrwekAjN6VsnVUU2w4kvXOvvLnBcCMuI
	Go9jRRWddHG4ESae+atu4jX/58Tsy97XTqAhhXDWvd0E1lDV7C9frBEG+c9mLZcDqOn4DO3sM7b
	L7rJPk0Mtl/rD+xEafAYholxp9bkeXJjBUWD2rDVOS0YwAoBAgmrxVQQr7d1tAuuSJpOQS+U/mp
	8=
X-Gm-Gg: AZFdTZeIpJJyb7of94l3VL2uhwV2Sfbsj7twq4dog3do5eYg5P8tUCWVX85VTTxLjw/
	QVqerZjaD0ynDISpir2+DBVcHdj4kSenX/g2GlS9dNNAIhwWkS1l5TqJ7yXv/N0MRv4MrT+3fRn
	N73S2q2mGw0lPirw0IQkFFOng2+IOOGpkDS39ylzgcvlB0KtRoAqXVvFDgEy00dmzhuXo14AR+I
	b9jb34PqU/9NeutkeNJw63Ycmu+xmZGahwc/wZ9ccGHdIHaFIXXSuoB6bfouDHsdwwzndvpSC0Y
	U8uqUsVqoYASxLcgct3Mp6W1JH3ciEbkSvH4l5H9Rz7EpGG7rBjjEQ9B2PF+CJrM68RzmEif9KM
	LOWrLeVyo9gTDVyVjDvD/3j8oVVPPo4kMk6inATtxDcKhXqhShQ4Nobv6m7rH9ER+LveaQ2Byl4
	lwwvuAHbTZ516LnxG9DOGZN3jcF+IEuy0Rhkmf
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr19245900a91.49.1795658852776;
        Wed, 25 Nov 2026 18:07:32 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr19245863a91.49.1795658852068;
        Wed, 25 Nov 2026 18:07:32 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:31 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 0/6] wifi: ath12k: fix MLO capability advertisement and peer association
Date: Thu, 26 Nov 2026 10:07:21 +0800
Message-Id: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXw2C0uk4XfULd
 nwtsMqBKwQio9m7gHAhG2JNwZ4r1xc2BYffQyBJWhvOfFxS8dTojR0sYeKsGEY+nD+xzKB10tBy
 BDvMEcMfabTsd1TdxAYJcJztBjKpQ5w=
X-Proofpoint-ORIG-GUID: MRcfgbhvZbvIizGNAKwON1bqWKXbKHTt
X-Proofpoint-GUID: MRcfgbhvZbvIizGNAKwON1bqWKXbKHTt
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b079465 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=jwRwtn7Mt9YKnGwaeNoA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX3R8F5Ed8EJUI
 3V/QHmdaPind6BwSPgGltOAvNbx2pU652FhwwtjUIoTMFFrVtMW+/Xx09CNkp+NYB6m5ylXgTTX
 B++LYX1yv+UWzgDYNwCcLUmstQjsDrphoYQ7bQ+AHMeEQmQoTcOR+li5cxBcqPWg1OLxUkqgVlC
 7FugafLbgC2XiYl5ainVXxZUiqWvxEp4YeuY3mEgDGXkleaUWuOO6yaaOKwLzh1HiuM6mgnGYU+
 vvwk05oCTr1fsPJCEs87gXCMJFch6i8nxS7+gtqg6kArIHIG9N68KyrDXrcLJ/HoL1oK2UC9bj7
 496kozcLGvAbO9y1yc5Hl0H2jjsreIqAGm9PfJFEfd8UtgXV2bu5q04Tdc0CDotA1e11wCuxj1N
 5X05A9ts9bFQXQe5DxrVfaTslKy5EZo1wjw9em+Wq2R1vpJTPThiadtt6z9BoRArYuJXdqAwp3m
 hr3+MDOF37HsCMOc1FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Hi,

This series fixes ath12k MLO simultaneous-link capability advertisement
and populates the maximum and recommended simultaneous-link counts in
station-mode WMI peer association.

Firmware reports the maximum simultaneous-link count as raw N, while
the MLD Capabilities and Operations field advertises N-1. Normalize the
value during WMI service-ready capability parsing, then convert the
advertised value back to raw N when preparing peer association. For
infrastructure-focused chipsets, derive the advertised maximum from
the available radios rather than the firmware field.

The series also replaces the shared global iftype capability table with
per-wiphy storage, avoiding capability overwrites between hardware
instances. Initialize STA/AP entries from the normalized firmware
capabilities for MLO-capable hardware groups.

Use the AP recommendation already tracked in sta->ext_mld_capa_ops.
No mac80211 changes are needed. Recommendations are raw counts; values
0 (no recommendation), 1 (reserved), or above the local maximum fall
back to that maximum. In AP mode, leave the new peer-association fields
zero because the current station API does not expose the non-AP peer's
maximum simultaneous-link capability.

The series adds per-radio ath12k debugfs controls for the advertised
maximum simultaneous-link count and EMLSR support on MLO-capable hardware
groups. The mlo_max_simultaneous_links and eml_capa_present entries are
accessible under /sys/kernel/debug/ieee80211/phy0/ath12k/ through the
existing ath12k symlink. Writes from any radio update the shared per-wiphy
STA/AP capability entries. These allow validation of host-side capability
advertisement without firmware changes.

Series summary
Patch 1 normalizes firmware-reported maximum simultaneous links to N-1.
Patch 2 selects firmware-count conversion or radio-count derivation
according to hardware policy.
Patch 3 initializes STA/AP MLO iftype capabilities in per-wiphy storage.
Patch 4 fills station-mode WMI peer-association link counts using the
advertised local maximum and the existing AP recommendation.
Patch 5 adds debugfs control for the advertised simultaneous-link count.
Patch 6 adds debugfs control for advertised EMLSR support.

Thanks for the review.

Hangtian Zhu

Hangtian Zhu (6):
  wifi: ath12k: encode MLD max simultaneous links as N-1
  wifi: ath12k: derive MLD max simultaneous links by hw policy
  wifi: ath12k: initialize per-wiphy MLO iftype ext capabilities
  wifi: ath12k: fill MLO simultaneous-link fields in peer assoc WMI
  wifi: ath12k: add debugfs control for MLO simultaneous links
  wifi: ath12k: add debugfs control for EMLSR support advertisement

 drivers/net/wireless/ath/ath12k/core.h     |   4 +
 drivers/net/wireless/ath/ath12k/debugfs.c  | 168 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/hw.h       |   1 +
 drivers/net/wireless/ath/ath12k/mac.c      |  57 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |   7 +
 drivers/net/wireless/ath/ath12k/wmi.c      |  74 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h      |   9 ++
 7 files changed, 312 insertions(+), 8 deletions(-)


base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.25.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164175;
	b=kF5VZH/B2/Yaaj3Q9loHLRwLosXFhHLQswA+Pn1IZVLEWVq9NDMIYtjQAuO+vihcqRgG
	 chi+lMvY3wQzGs5dm9DNAvgaEJkO+gxtcmEhET9AG2CJ6AfopOfO6MXSRhOFZnoh0wYRT
	 TV9+Rrnl3uy9Btxb/kPCtHIR7V+gdmW8d98x62i3VsCMVp55Jzq2YwrMHCL3fEsIZ809x
	 t13FzxuOLf0rStgavYBIrQm7dGyDe2HHD9jWXS86zlsjsAmL5CwsOvYSHaPJR8ffhiVXg
	 Oo2zfVxOIsWVbZ+xpkZJ7hormwc+04bUUtygaH/XlxI/P8dt8taHKWruohQpbT+49LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
	b=D1/LwvlYwNEa3cUNfMK6A6LiUP3S/6MwwhQHFZnUv8E+ID8/Gh8leTueBlK7YtfjbPHx
	 2bsZkDuXdNS4S6nA7N4keknBj6f2+uARO1sQNjVbGoyUyUkt/6tUIrq0PI+My8oy2EW3h
	 cSXQN/8mvmS/7iPio76KSq1cHnnm3P4pAaKnoQfp7i/y/j7AWIm8Wh0uo3Icy7LlADYDV
	 y6XTppFj5SNIgefUWc9YlnHeho+zgJbrnNn4rpySWieD1VGFZhJ5jYCiseuJFpRSPRN3b
	 jwJtzRYDmdF6xox8aU9OWqcb+OuLJhyVDHWabkhn+qdtAzHr98xJFjrqUc50/HyhWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FkBWzo7W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZHZ/yJFd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E787E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E787E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FkBWzo7W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZHZ/yJFd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqK91268327
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Si9vSiYHm+3mxSuW2rbUZ7
	MDn829iRZrJ39OuehL1dY=; b=FkBWzo7WOI8iorPSIzVQTiDz4EBkqOFDDLdy4D
	uGI4yI3+53Bz0IDQiZA4rmCHxGSNaqPB8361rQGmB/Mgh0/0xunsdW4Q0PsOd5XX
	wSO1gr9ictrTq2PtVu2ZaqQL52b1PiLyT7AbT9TtBy8IIc/kLHVcyLcrcQEHGzuQ
	+ReJCnbGepqD6lKX9Q9kfBx9qvKqBLpxZ+TRbxvx9EIOB0nHrTqcgLYXCbmTSXJl
	jpKG7n+vaEz0MVzbqxw8RjSEz1wPjrrUP1P0Ia4dc6lQY7V1kAIeAgwsDQHdeONt
	ViBpe1M4lGZO+6GvhDRy4KLf16cboEgP2cHNBScFzRNHnAdw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sguf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so679125eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164173; x=1795768973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
        b=ZHZ/yJFdJ7PYT7D0dLqth9MeU0BSGAcWHJ25ExUkjsvaE2wYExqYPfHisBPOucxQSv
         3+r1FbgtExBdU4JMJBSZhJWBQpqNdQF9j97L6ilTsgAuL1z6s3UZK65sFPICkPoG1MoV
         nGs6QfWqRaAD3KGXGXOOJRB2rPc6jgqBbkvjsvVyDUYKRt4x3soNaBXTBohoJ6Z7rHkD
         g5ybsUBaDwl8Oc4mu44KbAIgIpQRGgTiQo6uH5IPxoa5uxtp38EQ46ERzPXmIA36xpYz
         4UTObBBF9OnCRcnxzkPgizsjUGmCL9Hd14XMG2KJPNJwUclkUzEOrht9hAVYPK8B3rzw
         vFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164173; x=1795768973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
        b=L8r5qHooyc0QxxPUQRCuW2CWi0uAEm/U64H1jcI+t94Qf7ppJGCEQ3+9p975jfArXp
         7q55Rk2fKTvTbceN0xbKJs6TlF2Uq8WVLiT/12zmjOHIPNz5HLc0G/AbppyDtA3iMTsv
         1PNc6C8mgoQM4Ln3AYeXvIk58dYM6EaODJ9yX8KZdUlauiiL1FyGFi0K8vDh21ipibv2
         0YDGAZFmb6wZdr9WaII83EJwZcQsHkfjZr5XVFEYFMEPy6ldDZeqmEDB+6jrMwapxvyX
         VNZs4MBwiDJNYSgriDXMturK6XhJqA1H2SAfoPtd+zzH9LKFIv22sZXJdv/TA1Mn5iy0
         b2+g==
X-Forwarded-Encrypted: i=1; AL+hErFAA59oG1NMwLDUKRGqlPLQXIw5uuncI2GIGNqeg4KXW9qqyWRpBGmi8ECFHc1ZGDOUeekDwHWG89c8PV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ayqlOwX0ii9VJwa9IkRhXfBVmF9kIsp40OqYnBbbNVdJY4XEG
	xqIqBy4JLPvFanWYPg75cVYMLWHa48bEQiG0RbIsHO1wGaKGMOhwyu1LHEecQGdQIjNNe7VUq2F
	gP3IoZFcSlCc+YNtAQiT1179UCtX0QjDebEi0V5S5U6HuM/JqGfErCJoiJnb3WRVixT0sN8Eaux
	3k+g==
X-Gm-Gg: AYBFou0So6D0fhfA/vCBVCpQ/+Xa3iQFKyvWN3adlwqJ0RK5ctl+ZoEWjj7mRQJnn2Q
	9f9wj5eTBLYh1mlyVZDoX567CQC5NNU26h5GBdQGmbtIfQA5Lo+blsJkiFHx+JQuhWER5TToSC3
	QLMrnvTgyDy6byJtaswohkahsuc1OpSxkJGyfIMRaybzVw1XaUuDYsQxGIibpnTU9lvrVVP2p9i
	VqyrH1K03U7o86zGV8VB0py7WGr5QNfrFhZjSgMX6ssxVU2XGOIHgG1KAvFHEhvEhCVW69uopcL
	WugFkMRegmIwBWJ4famk7/fW5FO9xlOxZelgl349Vf7TzPoYp6xu5trz2IfryKAseTWKQ28X/u4
	uBOEj45vnIB27xvMgxYnuScNGOSItPsWphzHxsOSiiRE44/Hhs26kaEGCjS/9s0kFWKYzS5qVXC
	H52tt4/vXAZnECO/6EOCXznkE=
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr3603491eec.9.1795164173193;
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr3603463eec.9.1795164172687;
        Fri, 20 Nov 2026 00:42:52 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:52 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next v4 00/10] wifi: ath10k: fix recovery and WEDGED
 failure handling
Date: Fri, 20 Nov 2026 00:41:25 -0800
Message-Id: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALYHAGsC/yWMwQ6CMBAFf4Xs2U0sAgn+ivEA7Sush2K2pYEQ/
 t2qx8lk5qAIFUS6VwcpskRZQoHmUpGdhzCBxRWm+lp3xpieFXbJ0J1zww6tb503N/SeSvFWeNl
 +twcNaeaALdHzb+I6vmDTd0bn+QEBvk/feQAAAA==
X-Change-ID: 20261119-recovery-v4-de5f5df13e9f
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=4358;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=EbsyLTJcbPpWwcxoIURRe2OZYEAFI2SV7FBAuQJJT80=;
 b=avs0+hlD1YKlzy4l4tXP7p9jUGKWqgYp4LvMLHweqNRynlFeXk5SMsoY+J5QsQcKo1ronMcLu
 j+vX5FNivOlD2hm2ggpaSEgqrP4mP3ta+sSo33Lr52KLihZwS6d7Wir
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b00080e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=Kd7kRZl4A1812afGFBIA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: q7Npj0ncsmdX5RbBsRgFc8MprBJmZS4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX+4vfrLlskKqA
 va+eReA7nlBvfRmbXqHtLeMZmtAHAWOeaMMkHSzsXamBaN2UZySDB1/T5g54UYrLxlcVHzEA4es
 WiBQN2pyT5C51tP3Y0uwW1ZBrlTaBQ5nREB01ebKv0CEYLB+m1+L7huSElFEfVWDMcyfuoo0cV/
 J+qTH3WnquyXDQlvO/nHQY0kSGkbUb+aSgsti1LKUGFHax0pdrdPp1H2mUVW+MYhR8HNtJEQS3I
 BL4qFPf18cPW++lBJV/rfeGuqY0DJ0OEm28bafW+0B9cLgJypouYatKOc8qUaT1r4drdej3uozN
 2RrxRTqpxMVE2uEevQtdNX6gyChwaMuJrBaxo4LzQ3IyhS7yhCLyGBO25fwZbJyh1RVUNZLGEzL
 yhJeuDv7Z7cleKyEzM9Rh832TeJ5OlP1Yh4cmMHfxsHsURNVPDi/8HDOhQ6JlpyKeiQABDaWeVd
 eERr2sGEogPXFQUaLJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX4Z4fG0M8Z+8U
 wyS0Kt/+P65HgsXv/6GXjvfs/C0Xo2lzWEMculTG6l4R9UJqOR9Op1ox3rs4K+Nw88Ur6GZYR+l
 OExMi/Pu0LoSg1S6n3REksa6RBttQeA=
X-Proofpoint-ORIG-GUID: q7Npj0ncsmdX5RbBsRgFc8MprBJmZS4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

Recovery failures can consume significant time before the
driver eventually gives up and enters ATH10K_STATE_WEDGED.

This series fixes several issues in the recovery and WEDGED
failure-handling paths, including recovery detection,
recovery time bounding, waiter release, and PCIe error
handling.

Several patches fix specific bugs and therefore carry Fixes
tags. The remaining patches address closely related issues in
the same recovery path because the fixes alone do not fully
resolve the reported failures.

Taken together, the series ensures that recovery either
succeeds or transitions to ATH10K_STATE_WEDGED within a
bounded amount of time, avoids unnecessary waits after
recovery has failed, and reduces the likelihood of watchdog
timeouts on affected platforms.

Google has reported this class of failures for an extended
period, with more than 4000 observed crashes over the last
month.

---
v4:
- patch 1: replace the blocking wait and the failure count with a
  non-blocking one-shot delayed work monitor, as suggested in review.
  (OFF state), and arm the monitor before queueing restart_work.
- patch 2 (new): shorten the recovery timeout from 20 to 10 seconds.
- patch 3, 6: adapt to the one-shot monitor, no functional change.
- patch 8: reword the commit message to match the order of the
  calls.
- patch 9: fix the function name in the commit message.
- patch 10: describe the change in skb ownership in
  ath10k_sdio_hif_stop() in the commit message.

v3:
- rebase onto the latest ath-next.
- patch 1: fold the old patch 5 ("check the recovery deadline on its own
  timeline") into this patch, so the recovery monitor is a self-rearming
  delayed work from the start; move recovery_start_jiffies to patch 4.
- patch 4: reword the commit message; recovery_start_jiffies is now
  introduced here, where it is first used.
- patch 8 (new): on SDIO, mask the target interrupts and start recovery
  when an invalid HTC bundle count is read from the lookahead, to stop
  the SDIO IRQ storm.
- patch 9 (new): reject scan requests while the device is not running.
- patch 10 (new): sdio: drop pending async writes and stop the sleep timer
  and work across power cycles, so stale requests cannot touch the bus
  after power up.

v2:
- patch 3: also wake wow.wakeup_completed, peer_stats_info_complete and
  wmi.radar_confirm on WEDGED; reinit peer_delete_done before each
  peer delete command.
- patch 5: remove the early-return time_after() branch from the monitor;
  in ath10k_reconfig_complete(), cancel the monitor with
  cancel_delayed_work_sync() before clearing fail_cont_count and
  pending_recovery.
- add SDIO Test-on tag.

To: Jeff Johnson <jjohnson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

---
Kang Yang (10):
      wifi: ath10k: fix SDIO aux workqueue starvation in recovery detection
      wifi: ath10k: shorten the recovery timeout to 10 seconds
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake remaining blocked waiters
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures
      wifi: ath10k: trigger recovery on corrupted HTC bundle lookahead
      wifi: ath10k: reject scan requests while the device is not running
      wifi: ath10k: drop async writes and sleep timer across power cycles

 drivers/net/wireless/ath/ath10k/core.c | 130 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/core.h |  13 ++--
 drivers/net/wireless/ath/ath10k/mac.c  |  25 ++++++-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/sdio.c |  85 +++++++++++++++------
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 6 files changed, 204 insertions(+), 84 deletions(-)
---
base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
change-id: 20261119-recovery-v4-de5f5df13e9f

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


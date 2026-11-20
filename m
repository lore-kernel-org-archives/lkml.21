Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164181;
	b=jlX4sm4LLzTzMHThKNth7q3SH8vifz7L4khAftyooWGO4Cygj6cvJVbnsc+1SD0942Bs
	 tMtAy2Tw+Tfea8sWBewXodFifOTHdFAIAS/Xf2KLA1TBGHO1dexJbIatpaJijkbsgA/7P
	 9HThsJ8AjSezbqwZ6mMt33DmW9tjNFq8UvHsRChNNvL46S3lMd3URfhKhbrRtUx3HZQyv
	 3QtcEM4UoA4yMcAaqB/FrvGgdd3L9ex9Q+ktalemIk+6yhtyRj37H+8gOtXac1p8Ta8D1
	 E0O1PYw9jg7JStGMwJdrlL5MYI28qTbJ46bJNFWJiuB8f5vW8MwRlkzGE4a/m4nwz3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
	b=YmFq70RsWKpnhnGATCu624GFRQ3RRtF5Ku/AJsITV/EbYZaRkEqOi+G9eg6y1lR3j70B
	 qmruMyuIvM0XMNUXHCLo818zzeVj9rY6qQWv/egkAZbXYSGIbmSwfKJJCX5xOjFdDsJps
	 fnJwI3Y8icJ3EZxK32cr737OGCGh7tsOIAO33LgZFqPzsuiipGDZT6YupKHg3vrJ33jh3
	 UfXiA4K09fSbKI5lun2fpdfOmfqcak2or7mKBpIPnCCinnKINETB/XcwWbU8gBV0sAC8a
	 hTh41eLtCg7CDdXzUbo1Wc1ysA6LXWaAwqXDIrMHLsw7LvkVm5u7JlOWI9iq67CnAhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jymF+Jlb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxDYk9Ph;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5606C60A263F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5606C60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jymF+Jlb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GxDYk9Ph
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fLDt3576543
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=jymF+JlbJAQA2ODU
	dNJEgJWuzOyjs4i11FyI8zA77NRgIVzeVeMB7IvywqpLqZZ4Ep9xMFe7JOIM3eMw
	tsLJ1QbzVPOGIewiuyvQiwh2ha8EHv1ozcrQkgsET2l1UxD/6SXzlFPxfdi890uv
	BOdly3iMIrA2GShtJR0YgECwJlcrAP3I8w20VL6jXa4wRwLKvmVhXTmHvQZnKZ07
	vSoPUkv9snltqfUDgqqUxCHGW0I/TF8L7tWpFe7Mes3ZHh00OPYI8T+u0gFjWOa0
	FXDvFKcIKi7BypYLAx7aXomuJ5bLXT2fq4zGjE94ffISBPGXWqPvm990RgpW9p2m
	Utbslw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80hsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so897596eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164180; x=1795768980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=GxDYk9Phb1Hh9zXsBWNkGuFAAHyz4YSLmtiHK1Np7jFoNijXYoSeHkSLOJnMSMesdq
         ufpJn2R0c/TgtIE6MfuahDDfK8deRb7aJCDqen2q6taysLBKr1INbRnccMd/LM6999Qg
         KK3XRgz6Tcc8fm5f8Nh9nf671855TpcmwQDokgYh8EdqgArr93LbCBurnmu0mOuBd/DB
         enb73HYW8aSwIU4UumjwCEXgaxcT5BZ522ms6lmDp5uME0iHK6zK6uhkwHmLy/SAtkXW
         ZUw8UBgNKHgdHnO6WncyY7iDsV9Zi27BDmpgkSL8Lpl+F1w+orC/H2mLcNjdCK8Kn1GG
         DFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164180; x=1795768980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=PTOd4Es+71lwSk7tJzfYINncOAZvRt0gbmXvKXrud6nj/qXYg95WmPo5YiAXnDji/E
         BzeCgGAKqIZ2aydA2dhOv5cLVy6xJhVvE49EBUKwo62ka0HgnicuzwgPJ1q23s+Y5ntI
         6JfHihp08lROx7YonIirLaChmd8t3h9giIDtb7hOc5iTCUhZzXiUuuEoD6cs+RcsTAGW
         fzLVRon31x4keFoN9xgGIYH9cP1KjcRUmGauEyLjqcz6GuOJvyAUKRR8r84Y+Kbqyzox
         pJIQIOLxSqMiLUj54unphwYIxckSJEfycFAzZ0d2VcLHAzEByFoN4oribVYO798mUKEX
         tPJA==
X-Forwarded-Encrypted: i=1; AL+hErGLeelFJsKh4BI4XOZS4ZUd2xZoZ/Jl+V9QahROHtSSmamSxV27CGwGgGMGZEf+U0q+Bh1pHF4V+eRj/tQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sduSFJl4qwNrb292oJxC/9InZsI+CXvcRdM66mNZvtJ4ZynD7
	R3woYBl6ta6/TLsiaLNolfId714m27QKsKJJHCFQbVv8FRb2VWv2NIQvCf7o8zSvQG8rlkaRBnh
	BWy0KxjxuXiekjZqZgmi196eZhU04ZgwMcB8b03icxZyVGqxOr0zaLC9gGkQ8Maexuv0=
X-Gm-Gg: AZFdTZcxZkoYzWVH4Hw+vQBtuTkcAlJRXEWooYOttEaX2NwtTclY42ZFeIPX/mQGJni
	pCYWVBMgvaeVFTV8CIwmDuYxpwQ5IdFPhMQ+jZTr2Zu9DHq5eZA5csI0z7Y+LLv20oeb3WbEg/d
	fzukSuT5gCjs2h92dcAUggdkLNs6kbz3mC8DeEVunPSaCdu4KYvIA2QP6N3iGSY8I7prB4fvb6I
	uj/5OyY0w+BJwiQVjsZ1ou7HzE7Xj6a9a984t2Xl0+bIzEdnlkAjbf0DpbM9yTUz0jstZg6NaZo
	RXCWa+5x16jHcctHJgI+nViEwn6/0EEWlbIr58xDGO6gYKrf8eXyEWlF0S/JVjEcfpIMMzbImAP
	hKMci86gC8jKjnYI/XWlXHsOjiQiT0lEQcboUetNCGbAI2QCQk+OpSCeFCld7KratTcgS9k1kgu
	ZYS1g/3mD1UIemDPMxvTnqOug=
X-Received: by 2002:a05:7301:1806:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-38570450b07mr2061503eec.34.1795164179978;
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
X-Received: by 2002:a05:7301:1806:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-38570450b07mr2061474eec.34.1795164179424;
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:58 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:32 -0800
Subject: [PATCH ath-next v4 07/10] wifi: ath10k: trigger recovery on PCIe
 MMIO wake-up failures
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
Message-Id: <20261120-recovery-v4-v4-7-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=8sf0rAmeCFvmk0B+SaOwK1SuISp//KMx+nDrAcdmPS4=;
 b=c5CSFc0PAbTYrFe6noEKoNKEIXHmuFhzTONQ/fJqI5xYZTxPeRXt0SlWiBn1asYALukb7S3o0
 SJHKsBz3ah+Bfxx/OcvizxfPwNg1sf7KL063d1idj2srQkGPX6ZpQ4n
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX0CHOWJUrrLf8
 ThSqdkCcKiyVibhq1Ome3E8AcnMJ3gBa05bi3IYkhvCcKaoFqAheP7O8qtQtszC56nX8pHgt4iZ
 mi1nM5TPwL7dntjcqmGzNiQIRvSj/Xqp0qdCfbk7LTLAuye57cICaPWb6DHJPvf851EVu5kQJ48
 GeXFy8aLPgHH5ddxtzDEUoIlPPqGqEFw5CmmLWlbVrKcg0JniDzgyTU9V8w8QO//tTFNrcF9ItD
 +/Xqp+RX1GvN6FoK8STgDtSy5VGtoZbXmrZEA6GweA9KWfi3g32+KC7CV0gZOoE3ApkgW1iOJaU
 VBcb4zqlHbuNi7/8w7rhH8K9Wseqf3S0wNFkW0A2ttEneH0Fw7LRLvRHb162VDVYcww+dhrHdEY
 tKRtC3nFJc1iMLfLL8sv0LOVYW1QFyDB8rRHYa24yaf8MDQU7bibY6sT6e+h9T14kmfh2Kdr0CZ
 LiBdHpgqxqWOyxnq9aA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000814 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: j27G4756X64GgBV42UNKbveOtiIsP-06
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX9vyEw4zfIdNB
 pPbQ5a6XjzYw/ltgVnHaT/YAJRyVe/oeW76UKpHA5cnYbT/S0DcWVz5LIyEmdDU74ePVNz/D8hz
 rLCvEMRaaKbhmCbqktylOnBF7oDDJ04=
X-Proofpoint-GUID: j27G4756X64GgBV42UNKbveOtiIsP-06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

Commit 77258d409ce4 ("ath10k: enable pci soc powersaving")
introduced MMIO wake-up handling through ath10k_pci_wake().

The current code only logs an error when the target cannot be
woken for an MMIO access:

  failed to wake target for read32 at 0x00036044: -110
  failed to wake target for write32 of 0xfffff81f at 0x00034834: -110

When the target or PCIe link stops responding, an MMIO wake-up
failure may be the earliest indication that the device is no
longer accessible. Since it does not trigger recovery, recovery
may be delayed until another path requests it.

Trigger recovery immediately on MMIO wake-up failures while the
device is running. Also abort PCIe wake, BMI and target-
initialization waits once the device enters ATH10K_STATE_WEDGED,
because no further hardware progress is possible.

This triggers recovery earlier and avoids unnecessary timeout
delays that may lead to suspend watchdog timeouts.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: 77258d409ce4 ("ath10k: enable pci soc powersaving")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..0c671630cfc9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -478,6 +478,10 @@ static int ath10k_pci_wake_wait(struct ath10k *ar)
 			return 0;
 		}
 
+		/* The device cannot wake once it is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			return -ESHUTDOWN;
+
 		udelay(curr_delay);
 		tot_delay += curr_delay;
 
@@ -642,6 +646,16 @@ static void ath10k_bus_pci_write32(struct ath10k *ar, u32 offset, u32 value)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for write32 of 0x%08x at 0x%08x: %d\n",
 			    value, offset, ret);
+		/*
+		 * wake_wait timed out; the device is unresponsive at the
+		 * MMIO level. write32 returns void so the write is
+		 * silently dropped -- kick recovery here instead of
+		 * letting an upper WMI wait notice it seconds later.
+		 * Guards confine this to runtime; cmpxchg dedups.
+		 */
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return;
 	}
 
@@ -665,6 +679,9 @@ static u32 ath10k_bus_pci_read32(struct ath10k *ar, u32 offset)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for read32 at 0x%08x: %d\n",
 			    offset, ret);
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return 0xffffffff;
 	}
 
@@ -2248,6 +2265,12 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
 			goto out;
 		}
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED) {
+			ret = -ESHUTDOWN;
+			goto out;
+		}
+
 		schedule();
 	}
 
@@ -3308,6 +3331,10 @@ int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		if (val & FW_IND_INITIALIZED)
 			break;
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			break;
+
 		if (ar_pci->oper_irq_mode == ATH10K_PCI_IRQ_INTX)
 			/* Fix potential race by repeating CORE_BASE writes */
 			ath10k_pci_enable_intx_irq(ar);

-- 
2.34.1


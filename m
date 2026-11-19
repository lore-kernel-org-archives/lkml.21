Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093035;
	b=viMw7PWDGV0qQhMoV1eqHW0VVOkrQ278CcVvrXf3deGhrLW2fJAtjrQ+6CBW+OFqUOI1
	 lQ6Zz0sNpWfVWrsQDgfXq3w+hiartxed1vC6pAFVxO3KUIz4mbwspz53tI5bt5ZixDjgZ
	 JsGNB6tQPnHtwasr8rthbsv/WFXKDw6Be53F65VJ90LgrXmcvNcrODAyDYiTDQQ9UTuqC
	 GB/JiphZKm4lq2eHBWgRAoS78yJZDwOT/5R/qTvgNPwQtU7qIazLg030F4AR2eXYKE2gN
	 dn3pe46tFwjqZa9HTiAAe8yzvojHpPnv4WAZptMu0QpIEkoI9lxdUIMOvtXxXJQR7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
	b=z/oeX48o+umW0nca1KILu5GQG+E3PdYpsTgHIldeZUgZY60qhV2D3SiQN7iyWMzGH0tI
	 tRSBMe6QOHLJ2ozZBLAjPDPilodfrsWTU3X6spJzj5PyxzQt/vwyJylcgXKD9OswbQTQc
	 L/vnF/BVlRenCOtHTRCftRwSdTrRCwAQk8CN3EfEvudTsi6FbNCZQiPdo0jQ28rnsrhGy
	 XFWwxWTd2UDLxK9yaSiio077FVC39o+yRMdV3yyDTRhyDPt1jvZPDZWMmrpVajS7deh6+
	 9G6df/Vg0WUZTfYh37K8R1ygOy1XJpeg+RXIzIS0+aNoEV1w2RQBH3bMV/XZQPzEknA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J96yC7DS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BE0606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BE0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J96yC7DS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjx9j3319820
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=; b=ZRGivuQ1oWWQGCRi
	sCfEA/ppJkCsTOqCJL+s41gZI1kLSsJDxN9jfB8tC2tt3E+l2SBcZbDTRAQ2Nt5v
	ZOPtBlcVekwMteKFgFVUK/aHwbfkqAqOWSJq7J7uXF4eNAEaU6HXNM4pwrmBb46y
	o3lc1NqC2KrfxfSB5wILQ2xVlMZGwgnlzlphznYFAUi35fDj1icARv5quHfbj2cK
	Z8H8HbTsxJGGs6NVR8Evjyrb8lijApNynaAkgQxY4lkm2/R0B63ZOeg8wwXdfSnW
	0RqbJ2GYL2qrvF35pLsEyIjKx4Jf4CyUgfYNZO9JBSsjkQDHVrBFjAfDBk2EBOWs
	yfC7Gg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx18n9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2699506eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093032; x=1795697832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=J96yC7DS//5V6PtICWu1L5GlNCDE9QG10CJHsDdE1OrNjqkAvbJVx2Z9BSoVhBZCuq
         FN4GQQgbURpL88+Ce8rLLhQto0C3gc+w4vRHQZmTZrwMICaOjFTZtZL1o/x6bcTBqT//
         lziqbsWFFUFCuAvCtuoob3PsSA8gHo6025sHf+2/SfenR2qH/qu17xDdEP6aTnF8sfDC
         9iJ2JPpG+cGkOjpUbg6aFYtgI7a3kKpn36puci+bg9EwiluUeGngIJNiMS9PwudFdkGf
         RGADE5V+vY9u7GtcW+RdrkGDblwnNjNeVqT3VmOAdWfRKuneq9Wmmv/dRec3M0WscJsT
         pTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093032; x=1795697832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=KlSAW9lmX4xd1MEv5C5zyE+d2oxqnKNWeqPpmuebLL36vl4hB8acjho1HjJbt5kuxE
         RRzD4SOGTog+8FLnZyn6rsTxdYSfSlOj7d6AXRjXWvix/He647KNt1gQEz2ApDiK7r+S
         wQtAk5IM/GTdoIKfp2ByDkYLUsCfDMJgShrpTnejUoyKWnDykaNKwAYQNIeumCwjfoVn
         bj+r35PgHo3jGO0Ajp6ZWPtZACIP9STw5EyPaz7gHlyBXuL59efdAUORhWvYYJwGEwaq
         h2GWFcoL6sbGDl7gYEd1Z6VXppVn98D5VGKYw0kLmFGa38RkbGmGpuWFuEhdLi/AEIWe
         i7qg==
X-Forwarded-Encrypted: i=1; AL+hErEvE+bhBNVZK7vPDamOfkI3Ztgj2mHUUVESDymGXl7Jtp07uouAB763P+9+FyGML7TuniLxfAIhabbU1Qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CU63RhXjqoruPWM+0O9H9sx7dMsxRkXzyInN/02syFrZMDWpa
	PNNH/sjHmAP/AlPzvw5J5tryY3Kkyi8R3yMmYRPcfL9z887ZZOGaqe/mvogE8PMfmUMwnd7hYeE
	z0ZDNvIVr0u8ISZ8YCGntQeqyvUz1Eww0gPCgO7AgKlGWZJTUFZcucXnv+2H9YBlyJUc=
X-Gm-Gg: AZFdTZcBt4mbG3zBZcrmkf3K+j/6u3FaStZBUxfGiNPjG4CpffNjzWlaUlfsipyuPXw
	/OAiYYrxZ3khBFkBleMhIbE5oc4M8peOzf5oJQwQB6pfEV+xIiSEYVIG1V6h6HVbNf50aVyh9TR
	kBy5iNpCRuQbLtYqdzqQNZUHy26cdPqmE/JZK4WfrGKTLTWRkVmvbW5Z+IaLqJDcxGijSuOQSD3
	YJSi75M4TcV/6riEfAg5npKcIckT0NXvS+nHplatGD3VS/9MtUfoxSf9K3k3T6s2OqZk0xhT2P1
	anE2GllEx52dx+OMKT2lkrNQs3ihCUtUGw8kNH++nXfhuJzo29qdXQfa4AR2FSufHMXD6dYeoDD
	+ohH6/zJxJCPZMXltqL7PAtN5VIjXeGifqzOAQ0NZsLEpxB7TPYRms1Py0X7YypdCGP9KTJALrK
	XDdKCLT/BJ
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032265eec.13.1795093031601;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032235eec.13.1795093031084;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:10 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:35 +0530
Subject: [PATCH v6 3/7] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
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
Message-Id: <20261119-bwscale-v6-3-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1780;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0zEUl2S9sKA63T0Lpy4WWFHatcVllvfZJQrn5ZSlMz0=;
 b=QiPOhPdWYBohHyIwt2tF1rwyCA1O/3J19GBbfxfpRGsrmthwLR54jYh7vJieyTmuzer/m6ZUK
 +J7M4UBSalZDTdbAAM9bOcqLpdX402IQeObndCBqPYoPYTjrhrq7CX5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6afef228 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: zEyoOeaCTFlBREAvg-Ma3pYR7GlwpaMN
X-Proofpoint-GUID: zEyoOeaCTFlBREAvg-Ma3pYR7GlwpaMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX/fC2KQrODJrD
 ZjoU7ibNqPXW2w6oLJvTy+pAI+afmp3b5+ikKFG1hRZgUVDbdIJXtdxWLgqspbm05gloDS8IYie
 MBNUj7hB767nxr9vBxl2omXbd9c0XD347QIwC7cndFPlxih2v+0dv8V8Zi39qeOBG815I/O2x+H
 msYCTFNmZsB2H1AW83NwmLJSF/c0Ijjn1i3R2lX/ff054qW3L+fAUPkZIcTD5J3UzjT0n/w/Hll
 Vm0DSa8kEHiENdw87RsHIHg1SRobOjjXF2eCxcEX6sH6Ud0bcZbsTaDncNs2Q/ZoS+8vb5tDTiT
 2BS95geAZqFOrRIVzWjt0n0jTx3omAaulTrJA4+brp8imHuc1XAZHlsXS7SUQqIOcsNcJ7tYj1H
 b8NdIM8iMuRBuqTqa+jD93F3AH2hi1CAlWt7j1oVlcdH9G0nYQuOz/9yc53yXnbfIU3KbNX/H8v
 fQtmPTIGSCPkFgNDXmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX3MHzCI08W9pt
 nWgrREV/jneY7BCyfgnNRwbPWN7j3BN+1pRo6QeX0VpfrKFhbYMZa6h35IrBH0+3NrIXV5c5r3s
 Qm2sBhrYRi1IboMpM7Fv8qsGrycr+bk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..a89955617bec 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6056,6 +6056,21 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_bandwidth_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for 2.5 GT/s - 32 GT/s)
+ *
+ * Convert the Target Link Speed (TLS) field value from the Link Control 2 register
+ * to the corresponding enum pci_bus_speed.
+ *
+ * Return: pci_bus_speed corresponding to the TLS value
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 352079393edb..d12875c95491 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1739,6 +1739,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1


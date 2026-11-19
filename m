Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093030;
	b=TYCeMp7fXIhdUYH/lQfHqj/dw9nzjKNeIV5d19n5fwyP5Z7RTnirI0mV+vTqXCPZdA/x
	 FY9E5EYQvLdLjYmtx6QSdKIIiTjVQ2LOtKiHeXUTeFlBbIl/3gDVDDshsKexrbMcs+qa1
	 H8XK0sF2Q48DFGcbJW7F/OVbR9tiLZfmD1T8WHx/sU+ZQ2bUDEd3tnS7kr2uMKsdK//Ds
	 OgKZN578c9+fNsDM4YTMAfrTApJ0OI+l4aJC4RoCaFE3fuJ88lSv7A7HviBF/b66mD2OO
	 Gw8hSE3ZPdaSSPA0DYWBSLAlnGs56rOF0FpgSSdr2jiHDVLXyzA2azEhUrJY7xhjkxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
	b=gIpnRyD7fMYjmuTNW767rQA8QqQoDCyLD7YmAan2VpmE6WKY/q4kohqj4FqBNtdtxNEL
	 GNZlAQZnC0OJNW8nKWSEyu/OtLASKqll2LZl4dh7UpUuL9GoJqbfhjbbkvo9IDAVzqvX/
	 4hbroa6Yf9Gyrq130lr2j3A81L006L2MBCp8AK20pC+wClHEnJlyYxFX0BKSqwm8aW/Qz
	 H4gnFgNWZx4odc8NolDW7TmixoR1uL+VucybufkYGQmmzMg5todGH7Ndi384rWwDglPQK
	 6908UYJAhEsjIjM4GUQo2P960pfUmtc1zbeby3ZcxgoJNIMed+cPeAV7+6HH/VmrcFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8nRjkNO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duggvRRJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97B606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B97B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8nRjkNO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=duggvRRJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjnsr3583472
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=; b=m8nRjkNOW3VPr3Db
	nULsFpFVKB4d+oAm1XxQzMs6sU04/hZg25z6kvlIEnVyHGUyIFPeCuOSC1og88QX
	pD/n3jwP2ciTLpHtt4ovUbDQAHsEt1ONIpuWEaKMjQOnLdePpfS8S3A32A8rjVqt
	gGtzhWhC+pE8rPQHUzbCusc6542yrC0hxHr06nMMaC0B6hmld1rPbdzO3C2mJl5m
	ekCm4Dp7oSZhkKDWMTLnLUq6qeq7v6p169cp+FMPbjks8aavxmMhc+0qBNVzpXNk
	8O4jqv6bKsXxeBCRVwJZw7+SE4+IrwqKi+dVNguahul9MjaixLPoCEgYv+hDnG70
	suRBMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymgmb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:57:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383435e46f9so1188644eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093026; x=1795697826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=duggvRRJ2lKdCPuEUgWJStfwgCvxJnSiJrNM6cmCH/XjQfk6KVkoYuAZsZcX8FciQz
         RCxovNVr+eCl4QyqPViKZVTn1fF1xbHAkwdZOUGcRU+6eZeYfWHW3PK4ZDAJDTZ+s05X
         cJeFiquOV47wYGux8vRWckMwUP28VF/8HOKC41br6MxSjAhlWggMTAsPx2ZUOKuxUO0R
         DtXa0NBp246g3MtvswP+R/N5eW6VK+YdIeSNKVa3BlK05DDheB5m1PJCJu0mN+Gk6I9g
         KMQZ99K1aTI25uIEBrKpucTCjICjr1GlUHMtIUgMYsWhXwlLimSGT6NQxxKHrae5I2b/
         X52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093026; x=1795697826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=Udr1UouBoUKrVdslIq+HIC4e0MnlKOTvJUDhL2kjLlzhIxZp9/oZqALRTn52mXCiHc
         KcfvUt2/O7UQ4c+rwNSGpPOJTikpWzLwULSTb3JUij9gYnBgsDhw57VJL12CM+Y2YFU/
         IRHJLijZwM5zLfPrnBnok/tvMfr9EUvalDb/ODTpIq8xCNpmMqRmKpv3Ru28dTEMMXNn
         DzPHLfXRbnsTuuQHxXxPxWzo+Y/RuNgErW9nA99oUZ/4IL/9ERIlz79uXdfi7sle2aui
         ViKMtw6yx8FXgp7LfV+vOtygCdNQ9UzvQJvJ6tGJmi1JqT3kHgBse/+lldsDcIzn3sos
         2iMw==
X-Forwarded-Encrypted: i=1; AL+hErGAU/QvOOP4G3zQm0RCLO21gw95BfIS0dIFCNw9DNdi7T06FGhX8aHdzd2eqFbwjvrKUXHrgBKsL1Gg5cM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kElDCqv4tTtvLmcJo/hIzkt9n9o/+ZVEjx8gt7CcwIlJQKpQl
	bca0R5WwF5n2Dq0TqfmNfzqbVfoepylxxARHVUC4o2930dneGq1dQm9s9SQk6FUFvmu7uHVDG4g
	+9XhCedaPpCC4w89abBZM6ckf6qnMAWwWGMVohlvmzf9Tkddatc902bVWuFWeZFkdWcA=
X-Gm-Gg: AZFdTZflJdM2s1w7M8IjPau/16JQBG79VC2xqPEiijRj1x3OmxU7iuNx+9ocl2SADed
	c8dCwCj5BLc8UUdGVsBnk2PJDoAJ5pEQsoTtcjLnXUBHRw6t8eiBdEdURM07hEQh8X4wsuectIH
	NPJiUkTYrdRZ4PnZk7Hv51fNQcJSJrl0wXzaFAVqGGgQEJGEaAwNnIqcz5uedhXF9gjl+6F/s+x
	LFYG9e9ijfR8Z1cN10M1QUZU4GhBAiHfXJyKQF+UljMs8bOWzmkga4zKrGXUdpXFs624+pnR/q4
	I1EvFFOllnb5qpkClZ9hWoCKEhSayeNg7Keo1b1O0gK4wZUPhvRC0+jYWaXDQxJYvyo4fBj0xl0
	QhGFMjvpKvr91dVtrEpQCHQ6XmqMFRuEtCRbxdLPSTWyZcfs9CmxiK1RJK1IJEwrOoptCXup4+y
	MDfwc6F/EZ
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4842018eec.10.1795093026267;
        Thu, 19 Nov 2026 04:57:06 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4841978eec.10.1795093025585;
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:34 +0530
Subject: [PATCH v6 2/7] PCI: Export pci_set_target_speed()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-bwscale-v6-2-9a9a715fcb46@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=808;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=W18AFjHkuzlMzGO5/R1VBtRoQyqAsmAJi1evG/8xi5I=;
 b=AkA+fwfO2ceq8nugH0tjdw+xo2pslyfEUD1FzyiS2YWEXpHinZQOqVDEDsAbZ9lUz+gfkXnIo
 AFXVLo0LYELAglKOVKcuHsbzpeARu2iv9LhZUhJLhRf/a2lkOhivbXW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX06G92vm+Fwxh
 TjlxlULvtCQ56N7V7szgcPvtBhDVrC2XCblvUHVrW9dML+DO1/AZoLeA0rRT/ZQ4qaj7NFdCeDB
 mCmwLM/blDE7edr7tXMEdhsYTWqbvj8=
X-Proofpoint-GUID: YzwBRj8FizCvyJAV6zIef8o196a8QXtw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX8mgZEmuGltHw
 HlPP3aldkLEBgA2G54EZ6Peu2e+F6DCjBoQyUVQKZqOpABBWeVqBLy9kgDDWdcvSWM5mGYklsbp
 eI/x1KQhhGJMqaQEZJHppNi8J7llEuj1GlcYZJ/VhTwSAQp3qEVFBQ/HkWAajnWQ+okqacHrqcU
 ExSsKA5Y3RfVJG6R/p9sNlsmhU5s4o/P29p1L1LMgaSnlDLPYl/XVPI3OUz7JHGKi5VKpI2cpqW
 b2zLbCQFJHbPGU+bXrBX/ZorN/YYO5+bt/aXx0gssTwaLHrf5KNDdvJY591ueyEB7gHlVNCCc3a
 K91dHU27SJdb4nyqzVpkUcpDJD1RmsM9ha2T2v8LyAgiGLYvugrVrOBJ9DgIpiDC02WOo9BZwvz
 AT0NMetlXWRKbWIRfCVs3rJEyLRvpfEO733gdasN7dQZVRGamzXe3LnD28F1oQmg1xJaJsQblPM
 acmoDu6Go6+ne8uvB9g==
X-Proofpoint-ORIG-GUID: YzwBRj8FizCvyJAV6zIef8o196a8QXtw
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afef223 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index c1e749df5bbe..0512ec62dd5b 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -219,6 +219,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478663;
	b=5srns+A9ZjLbDEgnDA0HN0VoOx9CzTJb58/8JnknjeWrqfDetG7FhqL2EjCuEDSKeNFB
	 9r3kaJGWmnP7zu2mgxarDGbzvCQ+nqOerl+pzw/5onHDUxcw9g0eDpYsYfM7flVAKUetj
	 zEEEBOU9EDddCr4Q2Fnl2XCNH/0C96uC28agkWdVfHJVa4IZq38PkVGUldeUoVUBM+YNt
	 a5tXRpUHNqPVJkgNrEFHXSL4yB4QHzIjL9JIm6ZSed+g8Tyt8IxRMUKG+YHrAlH9jgSq6
	 /FaB/IFsPpCUHVN+I+m0vkOtVTrfdR8jIGx6SlyK0SVQ58sTv7WtkDCE2nCb5hXsmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
	b=gl7Z5JCRMoidMsmlw20vrHfSKZhxSyZysHwuOEBiDULcX6Wmb4EECMuJ47gfU8aGtSGO
	 Bp4i0oRB5CRnrToB06vI+xLaFandlpKuWFaOHWuIdGm/sUFAXd8KA9LBQcFd4OXzvHtwk
	 ZZaEhu0ACioPnhLZ4BXC1dTplfRcfb2MtjTWW1RIkw7FKKxv5A92l4ye7OacEmiS+nDTN
	 6z93Z7TDIXKOWL/nlw9MdbWtNtXc5nu2r0WikOAy5unvPm14M7Pk1GmM7VkDeuFvCdcVJ
	 qP2yqUG3YslA/xbWZqGjtpPbJerPUvdKw9eDTwzO9Ip+U3OgDUd9I//HgypOX3UgufA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Isdm3+S6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWsiGxiM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F056606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F056606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Isdm3+S6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWsiGxiM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJumXW3963245
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mg80NlqNhIn
	EEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=; b=Isdm3+S6dwSMvWxl6cJiPxQDHYc
	TTBkduGearKIXJFdEyftR2lH0dlFfflobdBqpo6hDwArreDSnh/ZxyTGnIF86bZK
	Q9kMCK/nJ5oH00mm4+4KNjoNnRnn0KNQnekv3uxaxrPDKFSh8SOGl/uUrqQga4wL
	sjy7FvR4lMLkh92tF8ac4Dwv/Qn9DsFoGToNny1oFYm7UHCSGGdND1q7hd5R+5ci
	IhEBWUYXy0qvXqvu3IiqxmktPr9PHnLs5qqHpdO7S/qkecQcvVNeiUa7cU9lAUGB
	p2a2+UDFXTJ/pH5fHscaWQcdkaB3RunPiFJWevgRLwm+gDc2CQgDOOm0Tpw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7uny8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38531c1a566so2489876eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478660; x=1796083460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=HWsiGxiMz9W+RZYRRLNR8QXHiOG5WeU7hChT8rUj8Ic6IrX9b1bJu+JSf9q/QwPCPz
         4cWwc+GceZKxY30vvHQZZBQzQiyz8G3AKsY4n5TrojsCL4xhpaznRfZzTMTsydvh7wb5
         cE5FcBGrTQsgNB7Zz7N8El+Ol2k8P4lE2Ef2kTus7liWU9KzWi5+H1GF4K5JdBG4QoE9
         o0HmKcnRTFPpeuP3aE/zO3RJE05dhaXXLf5AVBqswnzp8yJEhOqYEE5ZkCOx6AC2OLGU
         bAETWFH4Dr7dUmyPYGV+X1WDqEJgADpbvlqhnS7hQ4DFD2fhV11UvIjeaiiyIfiTbwrF
         cnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478660; x=1796083460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=dk0w8gq2u3L3lG0QxuV1btN4buF8LHQAKGumu5geC/DforsWomOn+PIU+X+tPb4pdw
         bhEscV5mnQ6w8H1EMV1h4KkeRFYSiqv3QFD0yFjQZbRlligdvJgaRQ4KLu7lBpsEwoNj
         1dwxKxUQOqcbGtOnf9/1prxT/EZPwWj/4ysKQZdbU+j7dZfnA5XgW3aZP+692ScmJ3GN
         vpeL46AL9RQvDeWXKscY4jkMMkoLu0PN+vOoOLwUvnGMhBU31XOZHmLr20ypYXA7XimN
         QCA+3aMUvjyQULxQpzQFpoQo/C0AnH29WL2QBqDlRukYLVrxqvWl7EI5ssjxVD9KVErE
         RO6w==
X-Forwarded-Encrypted: i=1; AL+hErEvE9jj9u4v8t1HvIoWuRwifFWdrqnJpBV9+l7ht4SWt8HKV41voF0JW8EZL3xLomzXTcsdEqZNg6EQPn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8utFYlmu2QLSOSRVJ9j3a22PKrbqIBfPcIlLuA5q2NMnvfsZgp
	HX8O5Vxt2LI/izxuzc2EOGFYqsEqRGdy9NkVCZ5C5pwtVOD79MJSJmg7CohAeRB7GVoLYe2BNcX
	YO/q46xrP+T21+FFnF3t1Hlbapd48QtVM7vEmrIKgqfg6nD22htiCrjz/S7q1dm3Pki0=
X-Gm-Gg: AZFdTZfWvdnz3VcrBmUY6c/vLDFuqvM8U0j+rJvKZdNRPP9yvqMN9DACiGgoQswjmEH
	vZDFHZIWoyQvbeSdFPIEu/kD30jupHMc5MuXB3mXhQL/jpe/E+FcGOL3kBA8oqFp3NyiYptGVbM
	5cFirkxrfu2QNY6YElNI3kIhcnRCCNMy/6hfXfqHpPhHbAG8vh0qwX2H5os3tsGBo/Mdd69CoOm
	UOWaEIWLNsHyvwWMAtL1cn6xYFHpO3EfuILqz4oVdTTWpZUfl75+hbibFVqxT+uV3lMISQW7kIn
	doE0pD8lQsF3XsTw8S4nnh884vgb5Yd7hlCD45qrdZaMAgoWg89iIAxsjujQ5E22dJ2zu7v9QGH
	URxgUvherl9xFpU1F5u4Culx4Ki6XyCFEMBa2G+InOs+R0uNx7o9nptWTb6J0UvIrOJv7+T/nH9
	qo2u6tNQ+cZpfKF30PcNNFWruJtqr9y4VSODQ=
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650569eec.15.1795478660232;
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650534eec.15.1795478659631;
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 2/3] net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
Date: Mon, 23 Nov 2026 16:04:14 -0800
Message-Id: <20261124000415.4067701-3-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04d485 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=Hi6WPrPG3QlE4bLLXg4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX6WuE3NtP7HMz
 o/NUyzXq+C6XaHwtazuFn3yPsQ2BtTJz9tjbKtDCINkIaM//dUSErL55sW5T/AnTKfIMOlM94/Z
 Cm5SCopI5RTlT3NWRpbpJqUJ9DFxaEY4/lXud/KPRDUqmBMIsoGa0Ub8/u3TzTUwbPyESMzT/8E
 JO+rcoPfoPZubeinGCpzblzWdjYQ6kzKhHwPUM3M1Yr+5ydrQ7daMdSzF9aZVpn7vMwN0M9+CkM
 akOIerCpaqatMD/7Aw8/Iy3gRaApWB8d1bNy5Q15tBgBxmFRtwE8HbmHuIX8LbZ0EbxBglgR9zM
 K6c2dRapiNOBvpOR0eTtODfSl8Ib3GcxIAUzJfVOhTHaN+afTy7M/4NTUI2B6twZRCIs650K1EU
 voGOswAWWUqMdHMCeWVKslVkO4dO/EjTa7Qlc11cXPmdYXWUhwz9MCihOcU+zcSoLNZeyVpzC/X
 cNzoCJUdCAD9CnjuKcQ==
X-Proofpoint-GUID: C-WRSJMXRbQTy59xYA3VJHJk5XcEZQxe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfXyJckmFWV0CU4
 bEpfFBItCgUZhjdm0K4AW4CSyLUR4gwb9Z280x02tGbVE1LsnbrQ+9WOUrYoCzl3AKqTsXMObjn
 0OI463EdaMukv/PCY3EzOs7P2WYVM7Q=
X-Proofpoint-ORIG-GUID: C-WRSJMXRbQTy59xYA3VJHJk5XcEZQxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230095

From: Jakub Raczynski <j.raczynski@samsung.com>

New datasheets for XGMAC (3.20a and 3.40a, depending on product)
support up to 16 MTL/DMA queues. Before we increase max amount
through macro, prepare dwxgmac functions to handle that.

The only caller, stmmac_rx_queue_dma_chan_map(), walks the queues
below rx_queues_to_use, which the devicetree parser limits to
MTL_MAX_RX_QUEUES. A queue above 15 is therefore a driver bug, not
bad input. v2 reported it with netdev_err() through hw->priv_data,
but that back-pointer was only added by v2 1/3, which this series
replaces, and a log line from a void callback does not stop the
caller from carrying on. Use WARN_ON() instead: it needs no
net_device and its backtrace points at the caller.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 21 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 77a54792893b..5b83fe07c1e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -257,6 +257,8 @@
 #define XGMAC_MTL_INT_STATUS		0x00001020
 #define XGMAC_MTL_RXQ_DMA_MAP0		0x00001030
 #define XGMAC_MTL_RXQ_DMA_MAP1		0x00001034
+#define XGMAC_MTL_RXQ_DMA_MAP2		0x00001038
+#define XGMAC_MTL_RXQ_DMA_MAP3		0x0000103c
 #define XGMAC_QxMDMACH(x)		GENMASK((x) * 8 + 7, (x) * 8)
 #define XGMAC_QxMDMACH_SHIFT(x)		((x) * 8)
 #define XGMAC_QDDMACH			BIT(7)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index e50c0f4c482d..8aa69647a207 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -259,9 +259,26 @@ static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value, reg;
 
-	reg = (queue < 4) ? XGMAC_MTL_RXQ_DMA_MAP0 : XGMAC_MTL_RXQ_DMA_MAP1;
-	if (queue >= 4)
+	switch (queue) {
+	case 0 ... 3:
+		reg = XGMAC_MTL_RXQ_DMA_MAP0;
+		break;
+	case 4 ... 7:
+		reg = XGMAC_MTL_RXQ_DMA_MAP1;
 		queue -= 4;
+		break;
+	case 8 ... 11:
+		reg = XGMAC_MTL_RXQ_DMA_MAP2;
+		queue -= 8;
+		break;
+	case 12 ... 15:
+		reg = XGMAC_MTL_RXQ_DMA_MAP3;
+		queue -= 12;
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
 
 	value = readl(ioaddr + reg);
 	value &= ~XGMAC_QxMDMACH(queue);
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478664;
	b=rSWek6mFRgXQ6WFdD8CEHKHqCnwNWAgxpxqiQwCnR1N0mQn7leLyzxlEHZ2ZFmWFUEL1
	 ZQvbwpHmNA9p6TaKwqppawomIMfIrXU5Ezpk5v17scQRB0X+Hct3T6i/EHwvYUA8JupaE
	 KqnuBQbZ4M4XNKzc961edk+PFA/Q6HgDeVTEmddh90uxR0Sp6ckpBBkFHP2Y+apOa+aHp
	 KVWSgBA1SRifcfdmrBhzLLfArsr0L8PGa+DJHK8JidR4eNjyBCJOBCY0uk5eE/Y5cVJJy
	 cj47AnU1EQImpr+J8PEVYQF2WDinJt2iUnRXHeg/mP+ywUfenSeOTeLYLvoe7AaZ5kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
	b=MFofw4wEL06gpSFo2nPUtywcLdHevynUE8mXZFCtigGJ4pPHDFosgJbUZsGtv3lVIVR1
	 4dYxVb0xtpXN1ql/uLPN5XVvXP/DWQmm+fFjzY/X1VnX1sohjGsuG8IzOkRInHnwLSWZ0
	 gh1MH2g90Xy05GVg2RuJTlurxOi6wYLauVmCDSO+UdEOEnZqHpP+xh8QKJHkfEmU9qtLw
	 910qKzbGS9/EJfv8oRlpQpPgYfpbdTe/IDbB22oKQIqPG0A3KI05VQLOo9rSEGOgdr/em
	 3M17Or4BvaLPSSXN9Nj57GNu0cgwKkxsIc58/SZE7kBcG++z4di/ZkGAHnUXMFuAgOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avSY7g7K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pom5NQ1D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C3A606A6A6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C3A606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avSY7g7K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pom5NQ1D
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuVVs720783
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkSEjYs0iAZ
	II4zNsyDNS7uDKaKgENnoiGQDdLvw080=; b=avSY7g7K+veGUjaoH+V+9C6Dj9q
	/3J37fz3iFIuXjNgbV+odze9uz5j6gvfLI/pXYl1+xn6I/SjUNGdx7jfbrmDEx5D
	ppoz9gXGDMr8/MFAEUQ5m+jkZTsd6PFRtPlrOgel/MnN866r8L+4QlBwlvdODSXx
	x7B/tzE2NjyHDpiIglB7ZDfLTXOwWqOD2KK9S+Pip8sZiHCcWzo33y9DRIhwv6QG
	akhEF2BmRga6co4uRbY7XSF60UPDuAWu7YCQiY++gx/PMgN/A3eexBggQ6n4rXBo
	tuyMFrEeBE8nyX7pggQzpyAFTcrUY3eaVsfD3RX5w3wjWRDrjbbDfM9zSqw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgwv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6950299eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478662; x=1796083462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=Pom5NQ1DlQM9WTClFG7Bx9gJcAQm5uhmSz6OLxzWKDH8eVyZbrLSEjbI5rcEbNSNu8
         BVNIkXlpnedJdZtHIj7Dk+4P4bnwvP/t/u8fi5MwvZe5QMRYdu91fn+84C8TCGDr2WAC
         bIjn1cDYFpr++GdaAh1DeFz/Xm94l6Cs4iVcxLCXv0CHVFWw22h3sWwrVEWpgRlfu008
         1PQyL9h34Ut9uqurypf1SDjQ8kOaGpu9Fp2YGzz6b2nKYckLgfjuqVpVXnBc+78Y75No
         FKPrXuYBirvjV4JE6wr+neGJXAc84Qmvdg+hVCui2by8NAdVioD7Xx2Xy9dGE7Nl4O/l
         heYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478662; x=1796083462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=PnQh31OVa/SWwqU1IRkK3ZHS8wDZ5Uk7uN71IGZovHGjpWCPFgp07jxT9uOzQvr70o
         VtimNfSk24JncN0Umt5QpvX+GKy206bXlg1B6CaV/EVz4UOWSKpFuFIHPxRD/1+6s6qG
         ZQOs7Un23kWkX0J2nbH8+MB5kWhESJQnckMHquS4u3X907fRzbHoYTK4RVu3rinKIza0
         meMuMF60dhe3A9o0S63+4KopvmixnuJQ/g2r1vIOutQ6HXm23/TU++LP4huhqFdEiM1p
         T5+zw6BFsaxwoBgWsQCj73nxBGY6LNPyQcmGfEo/g3FH7QoLT0FCO+cYwjSIwJDtRxaf
         5GKA==
X-Forwarded-Encrypted: i=1; AL+hErH+yCvr8hIneYEPnZQSeySFfjC03KD+DzbKgYuOSbAKpumW0xqGbHa1+r/64WtgIhuJufcwxPzIM7E1beE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bcd+mLR3eFx+SALV9BBSOQyd6wQDKlrYjtuFH7Q/Dnqc37I6o
	ut44mwI6jjUW2tFt5cIUfS7MkB53YvuN0TY1nKaI7uaYXwglDcoAhSbhn/vSC33aFVVs6Y526J6
	6UbKpb7r1TRYMWPAxTPRCaOCiaub4267305h7Nnpb6zjq47HN5gkPQmE9XxMcpfifLBY=
X-Gm-Gg: AZFdTZeRzmxDfqLN/o3dgUS8zXr5OSrKMmkV7LBnanh5DuO/fAJznDgSatBl/muhrZG
	+emN8Zq6+YW2WcdNZP6MlhX7m3W9MNarZ6kG2kbX6WIDBkz33BMGfm+hBf+XvmaITr3zB8sFvwe
	v5gDqy+sdZ7qjSvuaeK5RJbh/eUzNatBV+NWFtUHgYWVWNAkmLAMdzSlah1RVfMBO5L7YJ77/+1
	JXQhAbc2VAHVFExGe+QQpsBJxuAiPfDXgjN8TH2HlmcYSldJJA0iYEEYEDUkvBi9Hc2rgwjhcN2
	1dDM8XVdtYExl3VmcrLWtIRL1gC/wuH1vFySr/hMtpxtQoBtkhQKCPtIx28BVXzKqf1kW/6a0eW
	pl/lPqAdO1vkd6RwSJDfqdoMYvRI3XE/4y+8UmTpiZEQ9jHhK10dftukyn3eZCSnDBTySfPUD5m
	ZhQdrWdz6SpGg6N94AvsO6mazl6ftVJnM6Qcg=
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414822eec.19.1795478661463;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414791eec.19.1795478661002;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
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
Subject: [PATCH net-next v2 3/3] include/stmmac: Increase max DMA/MTL channel count from 8 to 16
Date: Mon, 23 Nov 2026 16:04:15 -0800
Message-Id: <20261124000415.4067701-4-sagar.cheluvegowda@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04d486 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=H7QzycyVpUVBSTYqnZAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX9SPgXpQWECKO
 Ioja8iIawSMjnhQnoh/VzF1kn6FXOB1HFXqjejRI6t+uLCl4K8oqJz/es25aoxUwNrgfRLEuyEP
 cykXm3eV/c1UDb9pqrKUk5UdBdfo9SLv2vZeR5++40BCmxYGFLGUQbTPGIJXj1SY4Imej8AN15Y
 NqmwS9IAXqoNqKxB4DhpOjYSQvfft5ANf0oPnXS0JNhsYPQb0EVhydDFrXDEfP452VSaL+hQYEz
 i3g+Tm45T5xLozJFAHKGQ82KnWQBmak+9Uivjni7bUfA6qI1rZ4eithZBI9RQf4BaH1fZmmvXCa
 BGFKIeiNoWU1trRefxAY/i6fePMU6YOAKP+5xdx8XXWEHXC9awMuzqRp8fqYd/XrdxqYynJLmKP
 VXywGmvGlTknfTswH2l0spuCBNQByL04mUOTmDR38x5uk3yaLmoyhmaWUejx0CWY+wdgh970Qfa
 3lceBpWn7UzRxS3m/iQ==
X-Proofpoint-GUID: cdctmId9_HXMLeB0Ax4dxZl8q3hiLHIm
X-Proofpoint-ORIG-GUID: cdctmId9_HXMLeB0Ax4dxZl8q3hiLHIm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX5zfLAnoijN6P
 jWxnvaLHEXROpbP/bghCZd73ITsIdBfjCjPzY7FqcL4ulhIQuq6kj6nzcZHj1u6xxTXPiVeGd5J
 S1v8Am6jNMJCQT1jhGZxoW7V6w0zJzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095

From: Jakub Raczynski <j.raczynski@samsung.com>

Newer XGMAC hardware does support up to 16 DMA/MTL queues.
Add support for these after previous modifications of driver to accommodate
for that.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 include/linux/stmmac.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..b91c8d069dc2 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -15,9 +15,9 @@
 #include <linux/platform_device.h>
 #include <linux/phylink.h>
 
-#define MTL_MAX_RX_QUEUES	8
-#define MTL_MAX_TX_QUEUES	8
-#define STMMAC_CH_MAX		8
+#define MTL_MAX_RX_QUEUES	16
+#define MTL_MAX_TX_QUEUES	16
+#define STMMAC_CH_MAX		16
 
 #define STMMAC_RX_COE_NONE	0
 #define STMMAC_RX_COE_TYPE1	1
-- 
2.34.1


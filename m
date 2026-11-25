Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634737;
	b=CNh/ED+eHyZG6fJGd/nwuxNbwfnsCIhgCWYmJJg8+Q75MSla0JfJsZUcOTt1Lq02/wzB
	 tt4sTsn0xI/xFewU82EgsKbdyuSr2llp4Rhe1VuKlORSx9sF6vkvR+G4f82Qs+82keB6X
	 WEzPYPV5yhdxCFTq5VhLd5baAhNDZIwyafB3/tiA3JIDxyT48IvCiRR4KlHjS63VcvnlE
	 lp8jKKYC1vap/oTKscDGAdoGDNb6wPDT+4+ASCh6tvWRk2lzIcUNQAWPjP7DKCVK2BO7D
	 OzYg9qmuiK3Q1zT+62wIRXEFSnjfpe4hmucBVPAXb98jJ1Ghhzb9iNPLUndZPzDRFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
	b=JjVb5XVMI2XNhdycyztPgPVP315OfVxDCImUhcO6xsDTze83i06sevDfSLarw6E9VRXk
	 fGMyN4PYY3VoA56FmkIv9MwX2IzFzsznLyqezqnOAJ6vjac8fvkBiQvymFw0HcHcjPLT6
	 NqQMjxZ3IKrlNWd8KrtN1I7PB2vJMp3iDsbbd6i0RP0qZzLNdvGLwGAoggRft7Y0slzHu
	 WM6GheMcUzp4ic9DTlaGQxBwkBTEehYozGAcT4fdzAcJMRXc3+IH+gnNuoy7n6uG0ROsu
	 ru1ekieJha9Vd34PPZAq8ljA1G2kCvyGu1QahlJgrX+J1QhA/5cTNLn5Pm20ELxS8Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Leh8WXRt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i38nKeuC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78C2606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78C2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Leh8WXRt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i38nKeuC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB1iJ1358012
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPR
	rRtBfFBA=; b=Leh8WXRt5l7hIe7RtKjlc5O4uK+nTw3iOGPprVdaxO9Wigx3D/j
	yseENXSby6OKQIaWjOibcQI4z6ZjpdRZ7tFGzg33to60FU6kTUT8z3afSAgYeWjI
	5FhrOLjTDxITtVOUIsKra7Msfm52YhkkD6Xt/nvqJg1mtroD4J3sNMWJ2jUmbXDJ
	mHsuaEIdJpr5aXCQCWV8Y2rv/qNGTAHeAokCP189kMSKNkmPlY3yWQaMVPzzcqOV
	SDqPwLCepzTVBQujZPAe8worS+Q6CW7b2d5FR3WJceX+47miYTFXBzwYvCuCKdiv
	ePFT52KlwU9/XN39stnSQVwMP2YfpgzR02Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxsr20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:25:34 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4fb73e868aaso6519688b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795634734; x=1796239534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=i38nKeuCZvZrS9PstHZLOonhmz9vURpO0ke/tlEc6M0mjXwYns0r/eV4+Ihlf67xjb
         z4QtwlYLBk6IRg57erg/PErNC9b1/wUQ0N75T/5ARJF9ENiINwZBLlC3qa7q0dWlq23f
         oqiQZedevnvZrErfmj92whzucU2DBb+nh9tXWxnZSOfChp7egrHyRytAfie+WoydcFsk
         LhkKVK9St39xWUbfpE54ljHFfnQaHpOhkvd+xe59HPOgr74Txc6zNFY16BlwSR0Nubx3
         GXHDHk+tw/jSMR6FiOdaMwRr6T+wm8KGsyTdCReTZGlYzlI5dX6MXh0bsqV1fVwVZbSO
         riBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634734; x=1796239534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=q4PzQCo/k9Ubj/41YV4ntULyTZopMXvlEsCLG2IHgr9z7YDsFjf2zTThkyDXxmEUFs
         6foo2aI5E4vISn3WsQrdE1qnzqqRFgK9iWMocWPwg46OZfULKsGXCvs+7b8T1IoqUPlx
         vPQVX2xO3/YSMenu7178eCrCpZBPy7q1kE8QEnP4j14OcM0kPLAMNubCbK1Yk2uNYbmJ
         LFupd/8lopQosDvhw46MBCzuWrLO7Clgim/zFAe0uEczcTbqiRQ/d3K+/c8UZuk+OJcq
         vQevBANWTI+s6GxJ8uZImvC6F8mtHUDDqgZ1AzfntGu93Mza2kRLR4UxBGPyzO5pTxxt
         HpLg==
X-Forwarded-Encrypted: i=1; AL+hErF12B6aVsjnKTNExhK2LE6WvLvbXhZIB6AnpoFXQfL0hznyLi35CI8PGnImvXIz7clfCVvn0TsTE6tjuw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OWOtkSz4CjoAhP4xVZv7h5JN2WMTTHry/2hU3uhkl3yzieK3G
	vOlZnfvodLIjYF6x7AtfZde6zzFNqU6IH62KydqQXoxiONzYrMKeUZXC/vgCOKjt9XCmjBoEUut
	n8LsSgQuPRNd306FvhyrNVlKIpMaiNJf8ynnAxTbB3W3EJdrI002s+KXTVSUudGYz0CE=
X-Gm-Gg: AZFdTZd9bnSMrqD8sx9UnHqCb8IjQviSRpeXbsY8ndzqrwKb87RvaHPgkgeh9uAGm1s
	44YiKHWTnQpajX7KYNUxacnPlUQagDTRQ4FCJBVOtlQspW41EUk52IsKubpeoYIq4lBDqajOx13
	iwqSAqjPDcaGSnXLstGsFjTKsgLdPAALvJTvccUzW93Sz5rHISszo+TnrHgzZ504KJydiDqqKPz
	SoCutZ9GWl55axfR8Cl6Y5r/oicjot/PriRLrDTATjj+Vlpr+kpHY828EubisvNtjTnBxyu2Lmu
	3ipsth2/GEd81r3Zrb7yelKZqVVuOGbTeO3uSTTYVzu+cD4hcJdeV0w2w4iDGq7thNplY7PFiYA
	bJ72MflThUMo/nywTyIDofD412k/A/kr/8mgQyaCP4wNTRr/9XZ8DuBeiEgEKrBkjFk4uyw3vl/
	m1L2QAQIJDCSVjqWwSE2ytxp87C5gneiefTWVb
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422933b6e.68.1795634734068;
        Wed, 25 Nov 2026 11:25:34 -0800 (PST)
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422896b6e.68.1795634733588;
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm18125768fac.16.2026.11.25.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        Jose.Abreu@synopsys.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net] net: stmmac: xgmac: fix RX split header length on multi-descriptor frames
Date: Wed, 25 Nov 2026 11:25:31 -0800
Message-Id: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: obYLaO5HCU2sGzXc5wCLH3-sfr98uT8p
X-Proofpoint-ORIG-GUID: obYLaO5HCU2sGzXc5wCLH3-sfr98uT8p
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b07362e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ojtf-fZehEoJ8Fw7nBAA:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX7IDbfb/+ZBpl
 O1+4DADPrkgl92SWSEY//QZbdb66y+CMrecSxDBYxn6POQbsUICC5bP0moPklGKM5HZrO2EJ6Np
 p7HoqdYRTJjFgPdBuWQQC+crZKoRpKVsJ0NCaaaZomv37YAkx9/GQBESzUFe0ya8obxcNcUapRl
 5zCdkUGEclP6lmogHhXwbuGQFzZ4DRHf6kzc/wo6W2iTOwtg/jfnJ2y4vNFNfjVX9orHHIqhkgG
 PCACXcbrMmbN3nZHaB3lGkKxAb9UMSMkVj1POKLIgegNFuCJg9eYXs1sKhccKTnFyhG48A3kSap
 FZWxeKANWc/PlYu1uhmiTHP2zA+q1KUNOqBWqsxBPMiHIHsv7K+9iSJkbJP7NL201cwbIZyyCkh
 rrcfEVVQhO0X9JsS1Cag9m5UZBc4x0mNjHlswQMPMPbo6NQfGg0ZWhBYrWvFt58WcIH1KkasDqP
 xQfyBDutfi0p4Nsv7dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX3q/fr71NMQob
 Z1HmKE/vjPNbzxy2i+h8BUaD49qyBibM7Rau7n75GpCAwV0iraSefPad+7Rshlp65r+WSzVqEnJ
 rLKpCcde1/D9hdw3biSVJbVxwLIkQAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250077

dwxgmac2_get_rx_header_len() only reads the split header length (HL)
from RDES2 when RDES3.L34T is non-zero. L34T, like all RDES3 status
fields other than bits [31:28], is only valid on the last descriptor
(LD set). HL, on the other hand, is only valid on the first descriptor
(FD set), and the databook's "Header Length Availability in RDES2"
table states that HL is available in RDES2[9:0] when FD=1 and LD=0,
without any dependency on L34T.

A frame spans multiple descriptors when it is larger than the RX buffer
size. This can happen at any MTU, as XGMAC_CORE_INIT_RX sets GPSLCE and
WD with GPSL = XGMAC_JUMBO_LEN (16368), so the MAC accepts frames up to
16368 bytes while dma_buf_sz is only 1536 at an MTU of 1500.

For such a frame, the first descriptor has FD set and LD clear, and
L34T is not valid there. When it reads as zero, hlen stays 0 and
stmmac_rx_buf1_len() falls through to the rx_not_ls path, which counts
buffer 1 as a full dma_buf_sz although it only holds the split header.
The frame length accounting is then wrong and the skb is built with
the wrong data.

Read HL whenever the first descriptor is not also the last one, and
keep the L34T check for single-descriptor frames. Also return early
when FD is not set, as HL is not defined there. The caller already
ignores the header length for non-first descriptors, so this part
does not change the current behaviour.

Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")
Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
This fix was split out of the net-next L2 split header series after
review of v5, where the multi-descriptor case was pointed out to be
reachable with the current GPSL setting and to need a separate fix.
The net-next patch will be reposted on top of this once it is in
net-next.

v5 of the net-next patch:
https://lore.kernel.org/netdev/20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com/
Review comment:
https://lore.kernel.org/netdev/179548403438.3135.1804854034587814346@kernel.org/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..0cdc0bc695c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -437,6 +437,7 @@
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..ed38aa358642 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,7 +292,14 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
+
+	/* L34T is only valid on the last descriptor */
+	if (!(rdes3 & XGMAC_RDES3_LD) || (rdes3 & XGMAC_RDES3_L34T))
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
 }
 
-- 
2.34.1


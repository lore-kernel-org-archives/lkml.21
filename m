Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593611;
	b=bywTMerNNGamg45nGYa23XY/0haWJWlK/mu663hfCy3H2NtBXduhs2TNrEzwTa/3voi3
	 4zj3O5higGUrsw+HN8cFpNDra/qkjea9EuXcH86oJJbBeYFZgr9PDLRNtiVI7W7khsoos
	 HgX96PCAwTUCuBpww3TWeQf90qyMhrm5OYYD+InIEOCwqlXqxASEUUZl2roa0YbTK87SV
	 0jc8k7JaxiGgfo1JipMm+lu7ZL1DPvs9Ni1n52fo0Ib1jYpsKi/0AZnEFPCBZUTLddDAy
	 6AjRrhU4iKw5paF8O2OwiqL1zEJMbAWQRjINXk8YIMEl6fUAPyHmMs1aXO8uCC9qtmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yli3tMIg8YYgE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=;
	b=hFcFFgSPttNu9Pp/BI73ylJvLvH+I31X/txwch83UjmyRtReyhiMKedERsgpCCTfiNQ8
	 ihUGD6j037Cc7BxmX7XaJMlJKHM1zu8kkRD5Ndj6T3l/XZrb8NFev9oWpos0A/W33AJwb
	 HS9eMDttDFp4QxqdZO6Fmgku65WBvA2xbIx+H8ekb+k1vaVmISZ7o9sb0qk/XmbY74NIV
	 v/s8Ad40Ha7nz+hvkinhLhFMsghfUCcYhfMvQj44Mumd5iTZr+BLQNAhwt4AL/vWIZYLL
	 D2l5pE1va5n2m2rvkdZjUw84eswjNkqBKCCGx6agi0tgQOXGSKmVY3I2uYdKGPGhcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTMwH1lY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961C606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C961C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTMwH1lY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68jWK3113968
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yli3tMIg8YY
	gE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=; b=RTMwH1lY9MsoGdN2QnMSuTv2bcw
	L8q6DRmrYYJVtKTGsFVNE65QE1u8aji7Fc91nS/6uRWK4CrUtQEk+8XwQ5foatnW
	GeNdUPY4fZS9Wxj8V5aEVLRTDdkF0WhWsCXSz8QZ67kpu4Xrd7aCqLwLCnXjqTmO
	JdkMvy5LowrYMbP3zcDcKAUkZYd2EclJRwWei12UtN6fqBlHvS+VaoLLctq0C8tv
	zING0c6N5UnJBfEOs5bEytpTtYhulJspfTKK46vXOCXOn7GA/sI26Xyqb/TXOv2O
	j5/nVyyz6CrPbA/CCw9h13Njmuw6Sn2YVZR8M3CsQjCQoNrvS0zhJmd/Evg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsadhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so851968585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593609; x=1796198409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yli3tMIg8YYgE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=;
        b=WgKQuoa0PECpfTI0d/cOdrSNLEJyfsXzJuqJKsUOyBBu7RHMmRDoluWokrzRKWTHP3
         fOninMelChZF9hi33kVpj8OHIzWtY3DTIIcFTP3yIF1SiyxbXdCdXRNwXHH4LsxT2P7D
         jMH6Zx3X9e8vtGg5lR3e3Ut/SBA8TwmtmAKZ+160IULT8/cHRm120ENiRl8NO8Rj1NZb
         tPmEX1VzpuBBTTpy83MjoyqqwZbF3YTGRDLABEeq+lGzblNSthzx6tJHZdaDaASnOoO8
         ZK6qPd5zOPa93X3UPpF1GXUG8Pstglk6m+d6zxdqiyFC96AYPVU69nj8aoLPmLwUV+3g
         Ol+g==
X-Forwarded-Encrypted: i=1; AL+hErFs1POWm2n7EFe7/cSYQcZcXGLRaLZYrGfJkCtwUM9j1r6yhQ2h1nXQgUH0kcBcSYb9xNrc+WcWMRWrJ7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zGR7+ztcuwKHGEfydNcGEqcNr2nJ67T9weWWPIU9icOWHCb+X
	9QjQH1R3EJX0C4lIIbTJlXMhQUYFjZSvr3uIhXCtyJkYrFR8Q+d/zU2K/+J4h3K2b+8YDab8l0p
	HoPMD6KZ93Y5VhzFwsE5+r42ErJ5IZ0ggZhXpHfoSRsxNq6kroSwZYlWLaGVrkrWTbpY=
X-Gm-Gg: AZFdTZdzLk+B3FAwv2wcg16CiQuAUyiWl+n/EOJNc0nQksUBs/tgWPyehEMTequ/aW5
	xwddvHQfwbM9isFaTG9JLGqLEQ+C0qQwi2X4dg0QyxRAyJBmKlhZVPH68oKYUTadpjgJAmmq29q
	tlUVuJVsJ4ii/+qr9im8B8lOwW+zZIRMpW6T7KAZTaSdrxmYsXHQ0lbrebkjDQLILkVLKlYA+2V
	A9EYBZG8GEJxRfxL0zGMHs9JbPLCZa+45igZqbQRNEQFri8zdPNnBs47y/w25pbIv2RyWZJBpMD
	iYQi2mCxVshHRDS0UPkB62WHYC9RdI15C+1ONBOv+ih2ohERDdcShlCNkeTJERyXF+pqHscbcC7
	31TziBXSaft4hdSWp4Mp+KXn06XyyLteo
X-Received: by 2002:a05:620a:31a3:b0:947:7f9b:f841 with SMTP id af79cd13be357-949ba9864e1mr3058993785a.31.1795593608856;
        Wed, 25 Nov 2026 00:00:08 -0800 (PST)
X-Received: by 2002:a05:620a:31a3:b0:947:7f9b:f841 with SMTP id af79cd13be357-949ba9864e1mr3058990885a.31.1795593608386;
        Wed, 25 Nov 2026 00:00:08 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:07 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 01/12] media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
Date: Wed, 25 Nov 2026 09:59:50 +0200
Message-Id: <20261125080001.2540101-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: XOJDc36rRYuEzA8QvDAnaAoQj41LV947
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b069589 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=XpAv_gt5rlBVVRiKzi8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX8YkijBi0xbki
 /Zv7tm3qZMmcSg3t39H1Zbdropq5sPfGQ5y76IORo7nzFdg7KLURju4C6YccEw0cdj3/V8HyAfd
 LR5CM6LQc8MgQJ2fWfOOhkG3mqL4nZ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX9OlH6eExypBo
 mCG1dwdo7LV1Bxazl8gj/TTKwh2Qi5vyd3LiyMtRUjzubZtr0uBdj4EizpD857ZETr9lMe/Jyoo
 vnmhr+o9d8qlulYv0GFlXfXTndJDCfNW1/739ZQRdXq5BSQgEAiiIU76A82b5nIDVNqdWsnaDPH
 jGF3ZHp0I1BqfyaKK8kclIm8EPH+0kgR149jQdtBsAi23R9gITtPR3jQHNvvFBVM9GI9mNLsRRv
 PFFQLlRRXns0QIwsN117+Q0sik25527wqXuwODlRe+5zHCdR3wDAsOjg0w1F+GeePP5hzkSOAVr
 FAZcB5AyAEyaOilPaLtRB3WYGivvXLP/oqjE1vUrso0w/u4eUppY6nDermmr8R8M6FXe4XZdqRG
 RYRnDQk4vA9mca82n5shFlVAi13ixEzsCKLBAT6xd4isA3ri0CzJVI/fEG1nghxoswnMkWx5/VM
 OA+pGddovOOU6b7SFXw==
X-Proofpoint-ORIG-GUID: XOJDc36rRYuEzA8QvDAnaAoQj41LV947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Csid reset programs CSID_BUF_DONE_IRQ_MASK with a separate write
per enabled VC instead of accumulating the bits.
This change removes the not needed for cycle and write regs
in one pass.

Confirmed on RB8/SA8775P hardware during TPG multi-VC capture
testing.

Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78..231b53d3e44e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -339,7 +339,6 @@ static int csid_reset(struct csid_device *csid)
 {
 	unsigned long time;
 	u32 val;
-	int i;
 
 	reinit_completion(&csid->reset_complete);
 
@@ -347,14 +346,14 @@ static int csid_reset(struct csid_device *csid)
 	writel(1, csid->base + CSID_IRQ_CMD);
 	writel(1, csid->base + CSID_TOP_IRQ_MASK);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
-			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_MASK);
-		}
+	if (csid->phy.en_vc) {
+		u32 vc_mask = GENMASK(MSM_CSID_MAX_SRC_STREAMS - 1, 0);
+
+		val = (csid->phy.en_vc & vc_mask) << BUF_DONE_IRQ_STATUS_RDI_OFFSET;
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+		writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+	}
 
 	/* preserve registers */
 	val = RST_LOCATION | RST_MODE;
-- 
2.34.1


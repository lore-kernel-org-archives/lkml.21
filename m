Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595927;
	b=ip9E0prFOdCGmpGgSJ55ixg45t3QZHaBR2//IFjcZs0ZfA6+JwcRJxREK9t3s79tYYCO
	 JG4qWw7S44tRIPpMcdP8kUL6pYKexBobTHpwHAiEHRRjBzbyU6kb6XPwuavDna7+Y9VBD
	 tSHk2/tVdUCEpzAe7k6YSVemLMumuP2lKYkqQrVEBjLTxLtBvks3a23rCoQZ7JvD2F9fo
	 YqxNrOxus0npTeFScSC/6veO7guixvq5iLpis3/dgUxuHUFYrxgZuXfrnYM8NflupDffk
	 AGWfBuGHxYzPh9wxX63/Yf5THbTq24lEXKmM9gKH35yurUWcRYf8mbOV31ZPxiB/zYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
	b=jU2KoA+MF7c30MyOFMchTCKPo6SNS8hLHpi16Sc3O9XpnFQGoyKPhb4JAW0X+xJdbNZ0
	 zY+qZaM6jbyWsCMBYoPOT655qvCe2iNKGPMoRGHx5snMlWI8hOLliSpKR8maRWdwQYPjM
	 Ur8lI9bQB1Spnlt9+3nDhOaR3tdQ7WbbY6m+8TLCZGT3ykUNy+THO0r0FUpBcHj/TVlZO
	 hOuFQL/15zJGmxIynqdHM4Nlfvd5zOFc+vAFYU1kokQQFYKhm4Xf5zrUnN1NL2B+bpVQa
	 IJ0aIYminFyS1gHsM00pso08j0fvSAoairzjGFv9NkwKHPbRPY9nyWpwAsHBKB+z2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdfVQYu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQTsNpIj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB0B606A682
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB0B606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdfVQYu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQTsNpIj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69uW01006374
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=; b=kfdfVQYubP690LMM
	F3W7D6P6Jx5H6uGV2a3FkvZl9MIT5EbOL+uQEnDzn+zJC9ObIbvsMyTB4XsOlQLY
	Vljb1C1q21o2isKDgKInpKE5/bDxsCovHnPnmS3XE1eYtwEgqQCLIfPNN5GT5n4V
	PIRo2tDIsZuK1UDb9wP7dIkn0QzrIAPFAVz0a8d3ih1jjN2fb1gUapnVo6CZbZNv
	4RlDDCV6qMqsmWqwKVADpoMF4OCBBRUsp2PnjGpWZTbOWBSA3rUAzhHUagHaup0m
	gHOf7EUBwkQi115hUnul2cC1J1Gvi9NWajRgYVJi/moD0e9P8vGEByjqNf+D9NK6
	emA0MA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa298ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso755657685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595925; x=1796200725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
        b=EQTsNpIjOgL9Hanj9vFfi1kL0Y1PXhugpRW03zRLOCoh5s5EVq4IYw2rMxwwd+pdxK
         aHsVOUbr6/RjrCiXkqJ/SQhA8Os2qlUrGOY16hm0j7Rs8nE+gj3kBovzfoaot0GwDTyf
         dSOaPzQgjeSYxBRsg53YSezKedrCwG4WBWcDx5RTJ4EjCUgwgIEHJpRLYN0l9HO+lpQx
         BpB+FmIAftg5N7Re2XvnUQPp3AVLdcQAW+6lRNypcPkLxg57U7p2RiOUNg1M/KU2AdMe
         94F3O1WkUrc6l9qFKSgw/7Nakyg7glSgwpuCC6y0NL/3ebkAKJ7iN7m22G8yTyw3C5eu
         36nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595925; x=1796200725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
        b=wqmnLTDgveayL852VLkYlNZtILTXakPmprXDn+4f7T3VFkEbY5qPpgONnVLgA9/8MP
         y1k9WrQfJVHBNo0kZNCiSZ09o8eVgY5FESBdf5c41UhyE9+K1/pFQwCWOShjXnBIdcvF
         P6VGyp96g1LTgrZOFdUeYL/BxoTSNxwapklGKm76GGvwdX4zU69Cu4rVCxUwws+7Cg0H
         oNUBzJDT78WjhAC7juVmtQlN8TBTAvJZjl3Z92fPUbldCrRdHbDA+xAM0sfXWap9abH/
         0H0qziyQA6mCD58Iu6M8DKdIofSSkaQF6hfggzS9fnsuzmMP2UQsyx51z3WYGL4oLXao
         r2mA==
X-Forwarded-Encrypted: i=1; AL+hErFiOrM4cJwFZlPMWxu51lGhVejnHdIQ4yCohjCzCJTF/lQiOAPkmaRRqQTR+6rndnCkPIwHJ72F/wEWhXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z89haqOk7JJzgPc92lRNVy7Z9g7PDvN1RVNS1L5CXOA5ZUSkdWZ
	u3NTAFVhhP47tJ0H0+JAf751GjwVFB2hkwlriKXp0gL/6cPGwW7+85ldSkTiBKfOnqHLeJZ072h
	EJJ/B2rLqm8EjhKOqVJma+a5XcujHyT/UAoOYEKvTCeZhIcqL37V/X8pgZQcwhpJGGTA=
X-Gm-Gg: AZFdTZcQ07hGaz9Z08b8Z1Y2Jszw4mhSNrqClLc/RbkDZu8pr0Mx3ATXQoIZJDeRlBZ
	ZnjUaUtqnwMZ3ja+msmSRwmD1HeBcU3cmIDUeUStIHUlA+qZNoCIHGl7FscCEI3SUy1yU5S5Qme
	N0oUBXix97BUQIkrlhWbL/hkgYLb71LsAZhdTlEvoEgn1wlfeJia+B3TTCAWDDk3Puf/odfXK0E
	n0Yu/aeZFESHX4Tr0E+HwZWId6mvDHIHXX8Whqo4NXNHsk7Foroa5Rbsms5a3xQ7l+3j+vLN0Ey
	UGDgDyoJZpylF6PbsTNjK7sVL97+kEFm7gicoWGjuEp2QvTsHsCwrG5+ytiMBxbwuplIhoC5ptV
	nbQon+Tjm88IF3d38N5u0a0+IlOr+jqrok7Qx4xS6/rVXPbS4xObY8DzhrE1ZXegqqjMueaGwwP
	g6xwtAYfoJl1Ryb04qi3lCV08bZPbb9HpYbHvp8LEK9O86aZ7aTUdgKLITC+0Ck0niRfcQIO3dv
	40DHPVtPFF+AIUFy8lCvdrJcn4n
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2965155185a.42.1795595925376;
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2965152185a.42.1795595924856;
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:38:40 +0100
Subject: [PATCH v2 1/2] media: qcom: camss: Latch buffer addresses through
 a single helper
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
Message-Id: <20261125-tfe-fix-irq-v2-1-29dfa0955927@oss.qualcomm.com>
References: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
In-Reply-To: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: EqC6LfObF9G0sBlwImohYR8rh_66QEda
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXyHzEhzNnOi/z
 KHu4ZgCfwUBXrLIq6nVZdn+Gzo7w/PvUG8Y2j1UN+6QXct0dfDlZJQp047VVcjMkabxLABnT1lX
 2lFMYbm7UosuNjwh1RnnzPWBSVZsTec=
X-Proofpoint-GUID: EqC6LfObF9G0sBlwImohYR8rh_66QEda
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b069e96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9GQXJzIEsydD
 MgmXHsTleIHzJ47qvwan3KHTPZpCkU00lu1Y7WMDoNgQquAmmsxmzZneTVaz1YLZiJJ8+9fN7oX
 kfv2NNAgDSGKbh7z9hrh+GUurPnU/psJ5B6nbmG0TjlCPS9keAb8J8R4KZINjpKTLvLDLCTM4Pq
 9cxZZseHg4LKbZFnwFOyV2trPCQdpfm02FwfOj1QQtTHIN9ZsIEkifl1Cjj2HeRvxwvbvTOa7Fu
 EOcYL1XjX1udCK9g0qBlj2/LtoreAWRMLaiIHjwjqSDSX4MdA02OqFmZRaQstaAAMSxBtpanIlR
 L5rJ997JwjyZfc6jFAsH4T5t6IiZml673mxcxrLPFQzXB2Foqf8O4Q0PCFp7Sfgeab4VQg/3v55
 DFOltqKUC3jQvKRgvWPqFwyd+TTXHwvqVRovIYnY5k9HXacMX1cht0lbWAdW8aj1JKM1ga+WriQ
 30v/2yAoo/W3xzYgBBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

Factor the buffer address latching open-coded at the three call sites
into vfe_buf_addr_latch(), which calls the generation's addr_update()
when it provides one and falls back to reg_update() otherwise. The
write master configuration programmed by vfe_wm_start() still needs
committing, so vfe_enable_output_v2() now issues a single register
update after buffers latching.

Tested-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com> # SM8750
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
+/*
+ * vfe_buf_addr_latch - Latch a newly programmed buffer address
+ * @vfe: VFE Device
+ * @line: VFE line
+ *
+ * Make the address just written by vfe_wm_update() visible to the hardware,
+ * through a dedicated address update when the generation provides one, or
+ * through a register update otherwise.
+ */
+static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
+{
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+
+	if (ops->addr_update)
+		ops->addr_update(vfe, line->id);
+	else
+		ops->reg_update(vfe, line->id);
+}
+
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		output->gen2.active_num--;
 	}
@@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		if (!ops->addr_update)
-			ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	}
 
+	/* Commit the write master configuration programmed above */
+	ops->reg_update(vfe, line->id);
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return 0;
@@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		vfe_buf_add_pending(output, buf);
 	}

-- 
2.34.1


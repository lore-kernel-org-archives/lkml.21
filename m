Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538865;
	b=Ak9vLKGZqF/YPqky1nJj35fYvuh3AGEGFxh7ZefANmqggaZdIafhpXwzHqqA9K/5Jy9r
	 Z0MetStkEfJxOnq+kr8NtiTlHCf/GBzWYIktTatglcYoE3ewnYWi7bJucQgAZPUPcFgQ7
	 iXZo6vd1yWChoXsfiL/uZN+T7NZcBSwaiskrUX4eR26HjXZF35LcCZG6dLCl0GvT9uxcN
	 cd11mFGgNiK9xfB+vDlM7mwsxAsk37oJsQkunCiPqJxQnyvf9yAKayc6TWqxTFOciQIvR
	 aDWzFLqfP29dL8aw6OcmW2TukQJuFeE8HuJV5bZnoig0TuxX5ZjToh/7vPv3i/oZX1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YI2Pi0bf2VXziHd9nCnIqr+RJXPsJbpEZS48qqU/M9I=;
	b=btHCj/b5FS4WZE2cm247pL3uKCd8WE9zZ1xUM73XBwOKPshmgq7GE+cDqOOu0oCNrr78
	 cNePs5u+sa1vQ4u720UOKCUl7ZpO+6FWTpBB0UAApwquQ/Mlx0cBujqdXblsqLaiHaHr9
	 QSP+tZTMwUtb1NsGo9Tae0Ik3sLZJOI1KxwMTthqWtpKS6qxrjjSVBGjFGPAKJDPxThnR
	 s9Un0KM8b3rVndOkDUrrQP/N1W2AosWly1eCx7Q/WM9uTYE6Unn50ymKf+vNzETBCr9xT
	 gmNMzfiepA+on9lCZ2Uyb3Htoc2DrIVbFzTfwUh3iItF8gq/8N1NDAaiLfWN303owXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvyLtVTY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnbRXIFK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A280B606A680
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A280B606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvyLtVTY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnbRXIFK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLfDH1332062
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YI2Pi0bf2VXziHd9nCnIqr
	+RJXPsJbpEZS48qqU/M9I=; b=pvyLtVTYOW6CSP6yIyKydVhgEQP3GT8A49tkXl
	KNDArmreqXAx8bzesLWr/X5H4Q4DBxakMiYdniMBPQTfoFGT6+beNXWxR45F5IZg
	zE9oSixSebWMJaC3p9YrZtro36NpICKGEvEQMv2cuZywyc1SFEVdXr6k1JaMNV5J
	wLPrc9JP/fLipuS4KoXMOYQRfWYRfXQdXeMrRgPtyyxau3/SG8Nz4EvgWtyipsuT
	zL9FDXZqdA22DYV4SCPFltUOGOLDFc6dTmJND/ZrYtly3ZOraVeoZPEuBLZ7xBxB
	FgqDkXbIXRohCHfLChs/7y3H7IMxRId+ZsHbL7790Tvkz5wQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb3vrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:47:43 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0f1c06332so71999367b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538863; x=1796143663; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YI2Pi0bf2VXziHd9nCnIqr+RJXPsJbpEZS48qqU/M9I=;
        b=fnbRXIFK2AsLbZ+Kqok37o+40ilAd2YqDnyqU/EEL72y5DQO7JrKllwvfFxxs+WcPF
         TPtzn7I36ZnANAKEuBvk9dciojK2moBGkhBGmvfzBvjjpJlpkIzwyjvyJRVhXLC4Wtun
         n/TomkLROklz+pTA7wKZQPHH4QegBZcHuvMX6MMdjEtNc+xMX4Kh0u1UzMMPnwTjiTT2
         UxQWhOuxXqMv1PATOZ1jke2UZnDPtwik6mc6WJ9fdQ2KrZtTP/6k193fVp7SyXIUfUhc
         AeUYXOtSs+/lQuxXCWtywmOVKq8a/vgdEMX6r/tjUz4ksMUPKlJ2R7LaTy5WNHCbvXCP
         tdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538863; x=1796143663;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YI2Pi0bf2VXziHd9nCnIqr+RJXPsJbpEZS48qqU/M9I=;
        b=dW7bN7ZjYLUJvk5BtCNX3ksmMrJqQ2m8Lhf666i008M3tvBoYyope6+IqQCbKege3B
         5Y3MzY6bHNYvczcJbrsJPKt9mjHDQeOGbNE25YKYh7LapiPExKcFUzZtN2Mp9pIbLkrh
         8H8mS+nBFOG825a9QscT4dyuYiyJGTSvWuOJ+b3fe/d1IkbnGfIuJg82ImaS8A3IxzeR
         ZdBdybI5rZQYtizKylj1k+WKBcUzXnQV44rb6DsJUP9fjU51XanKebkyVResZo43mkCS
         f5NoAiFyAA5Hd2Gh4HhXJ3JbW0sIQixqTO2N7NQ/16GTX2MhUcDrPo4C7ighvnsSN/ZF
         J8gQ==
X-Forwarded-Encrypted: i=1; AL+hErEa+wwRcbC7G+3zWVPDwsEe9P/pvT/V/Fte4xKFCtxKj664at1fhYrSxMOqHaVkUHOSwA3zDZdAVF06Zn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wyAyJm9qVpwxae3QUXYvhdMevEQDHKas4ghYGYwsSOlUhJ2Nk
	5jRC7wZFRn/+PwL2ubjG7cbqGHF7UOwstWkcBGPwN6LXAF5ljx2KXpQhqACB+v6/arUlHMRfv/1
	BwtakKr3KtItiBCqNpoH4/v0b4N+KCMDbcbefxPF7lNUvH7CXIKuZGN7FK73yyQ7SxT8=
X-Gm-Gg: AZFdTZcVwe/0OLmJYp6CctlsqEaghJ3UCfoSRJ+aUzFPowSHEwzV4OdDvtNZ77RXF8p
	psZ3HXoC1GiPszA4CKpHNCCNh9BpoA1tpMakIxUstNVDyyLcLjAkKD3KHUDsJubzKThl5mBpomZ
	r6T4yeiNF2yb9Jfp6Ztf5Bnb52ajsRkMhVY/dUEqA5p44/51V9n8uiL6/5uy79mXYse9xH37Ca6
	NPGHVbnclY9ureLzDSRX8L4//Ktuk2yczyZb6yUvVUuaKn7tcYDLVoQRIwY6cAfEE21kBya7cRw
	ESfZ74WVgV0MtvA/Gimdk2c2aTeMZcktA2BrP0dqXX7ZVEudNLscjrP/+wttojH5XNDhIUYwgEc
	PP0yI7M5zqSRHmQ8nAANEZ2LmX2LHBUCGg+2mOLFcGmhBscoACGknJK0bgQcRNmsMgot8Fxyscz
	Yg0o5Ir0RCni6Mpodqp+IjHiZ+K20Se8ZkvXHnL7mmZpV2N09xV5qNR8S/8f4+/7ve3ZaneARxh
	l2xBv2eNjGxnJ3Mr+Seh1w42eLH
X-Received: by 2002:a05:690c:b18:b0:8b4:e51a:c4f7 with SMTP id 00721157ae682-8b52051967amr66012637b3.60.1795538862818;
        Tue, 24 Nov 2026 08:47:42 -0800 (PST)
X-Received: by 2002:a05:690c:b18:b0:8b4:e51a:c4f7 with SMTP id 00721157ae682-8b52051967amr66012517b3.60.1795538862213;
        Tue, 24 Nov 2026 08:47:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: camss: Avoid useless RUP_DONE interrupts
 on TFE
Date: Tue, 24 Nov 2026 17:47:37 +0100
Message-Id: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKm/BWsC/x2MQQqAIBAAvyJ7biEtKvtKdLBcay9WGhGIf086D
 sNMgkiBKcIoEgR6OPLhC8hKwLobvxGyLQyqVp2UqsXbETp+kcOFtAzOKt30WhooxRmoqP82zTl
 /jxMyg10AAAA=
X-Change-ID: 20261124-tfe-fix-irq-eb8fd293791a
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05bfaf cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=f2WnHwzxnJiq5ND5xQwA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: Wwh1qUxIClbGJpWGcJpRXhiZFW5Z5fpT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX1GaVIFGeRUTR
 wJlOSzfHzL1gzIn+EMtTfup0tsCfgiPa/vsCkD0XQL969MadyyB40sqJPqDO+YO2by2bV6JHVlz
 Gs6nt7T6SkXwkxoNPfD9GJRZOHpx29s=
X-Proofpoint-GUID: Wwh1qUxIClbGJpWGcJpRXhiZFW5Z5fpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXzSwRF6rQ+3Kg
 yJPm/axYaToNvydHNQ437dDCuBGpSlHZ+loKrgNJYbeKTO1o2MODZmDOiDuC8LrvrbPXpZDakVj
 k3tv9a3h7eN4xCD+UwUrNpNqcyWC++WTUorWKR7jBZ1Oqka1cn9vOYLZ3bq4MaYDi1spQYz83nx
 1IAiywu6c/o2WTunz4N6by22PU3GuIgAe8M1oAva0o7zHX65yVZKz5l4Pj07TQvR2KXMsqUh4OH
 rCX+mWRMw7xGwdgtQWGDFKfGtgEJsHBpop3o7agnHQxvICFzwuwGV1uaaO0DLbkbTG0XtfBItgJ
 l7lGSY9N29StqctP3mTlaMuskD5Hz3nVlrp2I2iNfhl01fb54qmYjn1TYyWmdp0msgwUUsxg62Z
 IUlxLKhsXRxHk6UCP4hNbO7tRutvjCT76FWz2AJ2VQJxqAG4KalYNThAnRw2WVKPKS+PF9EO4Y5
 CoJVDiojNtN85dt8Tdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

On the TFE (VFE 340), every buffer queued at runtime is followed by a
register update, which makes the hardware raise a RUP_DONE interrupt on
top of the BUF_DONE one. We therefore take two interrupts per frame where
one would do.

That register update is pointless here: the TFE bus image address
register is a FIFO and not a shadow register, so the address written by
vfe_wm_update() is picked up by the hardware on its own and needs no
latching.

The first patch replaces the sequences open-coded at the three call sites
with a single helper, which calls addr_update() when the generation
provides one and falls back to reg_update() otherwise, all generations
implementing the latter. The second one implements addr_update() as a
no-op for VFE 340, which removes the per-buffer register update and gets
the TFE down to a single interrupt per frame.

Side effect:
VFE 1080 loses the register update that used to follow each address
update at runtime. __csid_addr_update() already writes the AUP mask and
then the RUP_SET trigger, so the latch should be complete without it,
but a confirmation from someone with 1080 hardware would be welcome.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (2):
      media: qcom: camss: Latch buffer addresses through a single helper
      media: qcom: camss: vfe-340: Skip the register update when queuing a buffer

 drivers/media/platform/qcom/camss/camss-vfe-340.c |  6 +++++
 drivers/media/platform/qcom/camss/camss-vfe.c     | 33 +++++++++++++++++------
 2 files changed, 31 insertions(+), 8 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261124-tfe-fix-irq-eb8fd293791a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595926;
	b=PmV+ITPlkSwINCKKDOXgO8l12xsaVC0Uef/r543Lr5rFcMiq6QhyGDfixckbzW89O+GX
	 /xvCWAtzz0BaJ2ShS7lAp6xmvTUODw3/BhrC7D4j09dYRe+8hGHeWhFgSYsf9MtsK8xlf
	 IHI8FcEKsgud/T62U+AaZuxQK5Qw9nWB5DQCg5IDVHAxIJxeJApWqvV5PyTRyKT5c51pH
	 IheZANB88BCsvblE4v4jzt2P7EZvyvgzeETp6HfdMu806RX2Xzg5ZbYC3yiTgODMF3TbK
	 Yn5WQRWq5fMggoXC/VoUYv1oh76UDCjgiFcYxVeIcEajGThINuZLBlQ+nTZxTMeG0ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
	b=ukuGyhqYlMqsHNCnfTnGQdY42y6JgghL6hV31jWS1gMldQSI1ok8uwfcBkAeV1tdEmpM
	 CVPboAYpmXPyB2ZiVLBlc3XAw1+A6sFpgW1nDnby3g26ahpFxspyBOUXpc9tb3dajT6sI
	 7RBoSmOgHL8jotYlE/sm5dde2wZYk1EK2Z5BMHa2GGaP8HQp29LcJUctsUNcJYYFgmijJ
	 alZJRCMww++rEjKLaTE83SyuB2j6AtNbmngiKtRcPZy2TjmN2cXomq10FbAwB3VfgpFsF
	 vf2Erv+Ov2hthe3MbgVPyplOIsJinh+vdu8xm27yWRuPjq5JqCrLowjagO8iATLkDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=caXQmvYz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtwPxSr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F206606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F206606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=caXQmvYz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtwPxSr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68frL2629505
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j8mb2yiioJKUWf4gPuStEb
	cGreiM6hFgxHOginPRN80=; b=caXQmvYz1IOPnu/ubLHpLEKDPxrBbYPRqzACyL
	XyXZOtGsSAvRXe1HrEJ0I/evg1zWzykQ0GmNg2qC9H/VQGHEkCC7hnvxOI2hU2A/
	uGNl5uqLWnUgK7f4Dpg+3G2t0Cw7mzDV0i9ZcP9oYC9HhaT0MjCYMvTfniNyrdhg
	NRiPFfzy7omlGG1MX25kfNTxYPGCUhqhRPLwJMqMmiJKvmed1dOxzI9hbT4HV2XL
	xJRLRuAVMkcX4CnOE1GpdSlQ41PWmDOEz+YCSQ+jKyqQKgn6uZE2q4ITATRI0lA1
	MLW8yTm5k4i0FQdQS18PSFN+dYb9pk3VXiwdDKAWdNaixe1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydb5k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:38:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fbso788171185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595924; x=1796200724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
        b=gGtwPxSryZ+NJMJHehmslPBusIW4t1mJ2Fli0neciUIZoF79XnPfBg4nfuc2EWQ0pv
         dpIVamq/TQbprBog7FPkQcSXmT538NWCC8gOo12z3qcCWt9TqPXns61/gKeYwfw4JPqE
         lStu2nI7CTbF8xUnUFC3IbNVmSCtlDe536Nxs0r4O5yqFPdX/bCxt3iFrDP6a6Wp0UAm
         io0tmQ9PcdQbAhUDoHukokl8B4ldQLeF65c/YEaA1ECs4ffTsDqZ5idVYNCUZmFhF1/w
         30XFVWhVFWqb6AmD23YHe0j9/FLE+u292jQnxSR0L2OYQx8hieOlTAxAEe0xrI/e6UJi
         rg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595924; x=1796200724;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
        b=ciEssLXV2fpZ52nVzbTSMEsOk0RLoZJBZkjbfPaMWNoNmaJv2K1Mg4B+v/cxRuhLdm
         xh+13ftuvKSnIMHeBMX5iMo1raJgdXHYELX4t5ypk4Uj1Tp4IxgE+ON1YINswCNHuHrx
         527dAPVhm5QcTIKQ2boX3AdAQwSZ8/HNrSxgw0gnLpGR2t9kPO9Y6hbeSV3toQCqB4eB
         P/QQhxMAApM6e1fBlP/TCqU8MUTbyV7LCyUihueHx152JUCMATGBu+H+Cg2bsJisuyqx
         3oV1F9UQQa58TFUjViMNNZ3IcUQGKNoss0jsJS8tv4XSSgku7+CrYOQo+SdZBHmD+f9M
         ybLg==
X-Forwarded-Encrypted: i=1; AL+hErHPAHjvC84WaHpPTEPKt4Oe9WAnFPgDRw0hgSAznwGO8PhXSv72niQuv+u4ePX0QMaH3c4P88LERuFo+1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SGfeq7MRCXuoWuVrN9gqzqpOcLnc/XQR2aYOM6rnxj55KOYJt
	SU3Rj3Cr+4GdxgRlUUlnOv6AB1ftd9wy4is6sgSikObut7SFSYhkJlYVFM/3TpUfHP4VYB7sM+A
	HvKqgWSK+MAFwtthxzTBwJM1d/I/Tei6GzzZ25v8PyW6dxe0LgDceSOsmUVQwtQFRv+g=
X-Gm-Gg: AZFdTZdUBzod3QyA81L4rcFsbL7mMb8Z2yhlZIP36xmGQ2ol4XOz3ya51pIC7M0bsBU
	HXKB4dsPbl/5uBGKrdAn2GYfAOCdGxsOCZieBsuWPc2H5sSfH8F6SNtUJvCQT9yMwcQAa9aGjFJ
	dIfyHO5AywljDXnzfPQDHeZfvB5D7oMtczCSH3jJXTfke1XgIrIUGk1fN8hh8UNgYQ5k7M/axto
	YVjFZK1GBlo42ahzc9l+MEAR+rMYpPmM6nOpDLYRZG/dwfmco39pVztDNuqTdZnBLKX5I0s5BzB
	jqSSl/o9z1Us6vIin6sX7tE9+vGX0QrNgaQ20tIZuBTVhVl/Uw1FCTHL4UN2z2meSLR9i9NXrBR
	D1tLdX36r5y/gGcE5s0XDWy2I5TG13UM1TtuCkKZXzykI8gDSsvBaI8dBN6bZk8N3fGddq2nDLu
	08AaR5ay7lS4QnpQH8ldxwHZ7U+wgfHXyIZejPFsO/nMroQmiA96dlxCESNuOyR6w0nEqJqRMV8
	ieL7k6zAcf5kHbJVZ/xd/hHHZBE
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr2930704285a.2.1795595924180;
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr2930701285a.2.1795595923496;
        Wed, 25 Nov 2026 00:38:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:42 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: camss: Avoid useless RUP_DONE
 interrupts on TFE
Date: Wed, 25 Nov 2026 09:38:39 +0100
Message-Id: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI+eBmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3ZK0VN20zArdzKJC3dQki7QUI0tjc0vDRCWgjoKiVKAU2LTo2Np
 aAEqRTCddAAAA
X-Change-ID: 20261124-tfe-fix-irq-eb8fd293791a
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX5RGfrzCS1Z0+
 QUHPIkD1f47ya0ozS3PYaQ/Ax4Yf9tMCjgEorUsw1PbAbVOR9T650fk3U9XV2jGm1U7gV3n3HFC
 XpuAWfvmR3jfPbJgevbAcKIqepmAKG4=
X-Proofpoint-ORIG-GUID: 1W0tBZtrAeIMwCaF75Uv0-GzCTZdHbH5
X-Proofpoint-GUID: 1W0tBZtrAeIMwCaF75Uv0-GzCTZdHbH5
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b069e95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wrLyjG2ZGaWn_AwD7_EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9sXsouOzLZgd
 ph+POCj0nAEDdQxNumCr8zkkptprpHqtOBdJSoPxMjDWifqQxn8SD/5jXfhXCR823lJjWWRmmZb
 Q6JevAuyYdhvt/4iq8jRTVn1tDDFmVK+CQMUjYRtYasT+V2ZQJvee/FpM63LUneRC8jNtbE8OzH
 RKyZSeUu3QK8u+dT8MgZm2LtaSDbr3CVVKceFYePRNT3U1Ek3c2HOKz5+igCoHwZqYWjIcgdcal
 X+LIRK6p+ipyMcBwdAx+sdKVrBnEgchSuh/g3Q/RMqsiTX5mOy73+HDCDmORbVNDYPCZhYbY1vR
 yAc4F0o4OT2pXsVNTWRgTX/xsNIXey3mVu9tlirHVPvVdYxygzZ2a6rEwRtC+nZAjwXqJZVbyev
 h/qIEPzd31zrFdXoJ0vvtWhnCKX7+4zDXAYQv0FjOPs6M3T7zaLnofrWrCYTgqNa9RXFTZm3Ae0
 5pXHGgEDT/bfHmP8lqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

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

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
 - Simplify commit message for 1/2
 - Collect tags

---
Loic Poulain (2):
      media: qcom: camss: Latch buffer addresses through a single helper
      media: qcom: camss: vfe-340: Skip the register update when queuing a buffer

 drivers/media/platform/qcom/camss/camss-vfe-340.c | 11 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c     | 33 +++++++++++++++++------
 2 files changed, 36 insertions(+), 8 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261124-tfe-fix-irq-eb8fd293791a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


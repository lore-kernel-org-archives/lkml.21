Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677349;
	b=MqpR6rFBsJrblKGNIBEvxTlMGODqkkQzXQ5vdK2FVTg//ogCuPetu720hl59Dm3fapNw
	 G3DYljvszzceqn7bUtD2M5SZ0rNpNwdwEgJ0/EtS5IJTwWLoTnZleD+ajmro8uBmBl4yW
	 TXyAIVprQN1AH7+8nkkKi1WTQW8GU5d9/TO5/uPuvdbJau3Wb1DSKu9P8+jWs4JL9O7FS
	 pT8/NXnT8JTB+440eJPW4nm2l0aJR9c2oIEj+fMoSLZMhNPv60+xPMxDLMrDDxPK6kUyZ
	 NTA+BWzjTh8Mh83DVPfVzxU9LPRj05+WVjsx/AxcyztB9nSVAgwu5g2MRYSdpYvNwTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
	b=3PfIbAv8oz+v/Bmr++fbFgsiYllLP+JwYlCc+dsIznGEvPD6P5pWNKIuSCpBKdvIvAzF
	 uV9NguJeeB/Ekp1uMU/gr0+jDhHy49prRyPmi+65gtlu60NCVYK7S1acp4PlEGD3GJY18
	 rZFEweSSW7ihj1hr9VtnN7k0IqEv1EOKOJPyQyYAHp80InQUuPzT+iMFwNp2YAemmuea6
	 U1iA4quPVuqaD7QPQVMd95e/86RMgf8l8KUwEjjk8TvQMgfIo8ABw1wMODJL94cV8g54W
	 Du7YSmkOybB3Cfwyc7jxdgJlfpR1bmI2y+D83RCYqnZjFnfXk5pC78q8WuXRaqVIN1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jj0lTIh4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNnT6vjx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8559E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8559E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jj0lTIh4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNnT6vjx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Awof2175590
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u11oCqIyG/ivFyMcZHBSlN
	Bie4mmMzkTAfZjgV/WyKc=; b=Jj0lTIh4XACe/uOSX2TeYKSUr/MyJUXlDu4iGS
	HPo//GpN23LrEkarB39SIBAL/dKQN/dvH9rNj40xkz97gOSUEvNXLnCkMtE8A9ht
	2iObJDblEsFb3VZuCvIhf1p5R8VDmKaBfPXvQpYaLV3Ddlus8kDMDvTGudiWoL32
	JaBlEeFXdVPGr37S57YJe8tv9Apyp8u+FrrMJRn77KVDCmwfkZH7EVXlmMEF1XmU
	UzBcS5aT91le+wn+kH+7MYtn4tcV+l1zcl5GCfUT3QdGM5lBuQbt3wXAA4n/dn+a
	9uVCTDdXv9o4AJ5RPIc2iRWlt71KB7kyj5megYLHHW8NwalA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahu7qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:15:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a065e2933fso1676259b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677347; x=1796282147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
        b=WNnT6vjxBqgauKvXF8MVt624Uq172vLssvDu11Zu71TGm5CUPv/RQhwGDjgezPNQF1
         9OCpapfLy9Qem/Dp4wzaDoXdu2crEpGVguu6ypwTKD/lBCVhgCaeiVtpCb3+skAy4jtN
         7oDgXnb9y4u9oGwi2jT0Yux49nOzILUlmc4rQDea6lM3+1uQ/eforGLv8sJqJ0I5rX/O
         CASnIaqy94vYiqxjBwe3TJBwQufFk/DCW8stXjSQDM6/Ub3jf05awRwKKe2FG7m8O+xQ
         fyZsP2jMHQrFU0TJ7r30TFq/N1jlEeUric+BVwNkA859N+gPODoOqOBmJ9tfZXUvgdf3
         o+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677347; x=1796282147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
        b=pn9C0aRfpFx7ytmte2SvaiYWD5MyG0zrkaxEKKmfEdrxEeCNZxr+qa1fxDx0AME+9B
         +HaleJbSxUyFPPSI0YwhcZY6MTy7xutAbYHbc4vy1aCziviRuzvNeR7CcK3zXwV8GEOE
         HpiaUyhFC7obwXxAelnS8DmCvYjeqKjuuFXGIRiAHw3irV3Z8uvs/2RMpnkpj76RKUTK
         6kWmlIfAHh62WMULh29vWd/U3fmhC0OIDWExlMXMDXRybgxkGxyr+CTerZTHJ3rWUDQU
         ZHhS4XzzPJQXWDEd5Kr/JtBbjHbjbMFNFX2E8uJb3QzZ566es16XeieD42QuS7nu8sv7
         sl4w==
X-Forwarded-Encrypted: i=1; AL+hErEpVTnIQTQF1nMPlcY5EySESq90i2F7yIjKGt1fF9Y1xAz/F9fQHS48r6jBfSnbEm+g5sbnshsNCSvEFJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gQVE04FuocB2+2KA6muwchj5MowWnw5wnyQ9K9386G5VgLJzK
	bkRWfZqeqAkz7rwNM3ezr6QjjZgJA+KRpvQbbaMHR4yBHwyi8FRHnHDL1zmYppd1o96mKfYDMLA
	HMdQOsWKRY2d3RyFkSuAmizJHvxtlICohekeJbdy8gcBGKo4YXEcwfWZPEbrQqkCNRykMS32eiW
	0=
X-Gm-Gg: AZFdTZc9SCJv7Q1W0jtU1Ymnq7y/pTsJEK+Hud1iDtK7WNYA+dN/gWUTio+fvBVQwHQ
	AzTFBlOctbLYuIX3IvxGi191Ezo0ImrzaGHp+MkrRzRx/P/BlqtZlUL4HbeMMTiq5jUxpKRCEui
	Q/34j7MA1Gwf9ZVXddahlbtIQLavGIH8qwRgYU3RbNZtnzHoOr3DLD34H+wdm14t99u9jkjtCjP
	D6WdTtWXWkP1HaFXkmolc25bVrKCGd7q4ZTlcQCzcSHNrAVFUQ6eID+xqKo4xFn1+vobITRJpFw
	SmihYtV2SYC4ZVwKhAo4/PMKji1hpfTtlbzABtm+FiqHzn9B9BO+IKJxCIi/5TBE7uyTAzauHgo
	mQR6uGYjZcEc/sRLwkKZTMWOtHys7zmjy7zmUR27hlxrLPLyYjNZXJOPC4gH/oD8h4wX/21rXqj
	XEmGillZm67hZFfLQE9FEy6kdpLOZ/yzXdmzcSO+3TSIxHPRnmF2QhW1TNFkPv
X-Received: by 2002:a05:6a00:1253:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8c87bcb7868mr18843480b3a.21.1795677346837;
        Wed, 25 Nov 2026 23:15:46 -0800 (PST)
X-Received: by 2002:a05:6a00:1253:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8c87bcb7868mr18843458b3a.21.1795677346410;
        Wed, 25 Nov 2026 23:15:46 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:15:45 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add Glymur OOBMSS support
Date: Thu, 26 Nov 2026 12:43:53 +0530
Message-Id: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADHcB2sC/3XNQQ6CMBAF0KuYri1ppxSpK+9hXMC01Rqx2ALRE
 O5uwYUucDPJT/68P5JogjOR7DcjCWZw0fl7Cvl2Q/BS3c+GOp0yAQYFUyCo9zWNfdv60NHz7dX
 0gVZK5bKSAsoaSXpsg7HuuaDH0yfHvr4a7GZpblxc7Hx4LasDn3vLAGdMrQ0MnDKqCsTSWkSjx
 cHHmD366oa+abJ0yLwzwI/E5aoESdpxmQtpJWi9+yOJr8R5uSqJJAHW2hpgpZbFijRN0xsSuX3
 uYQEAAA==
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=4254;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=0hayMi2ePz5Wnp8iOQqLdAIxXv7N34pLc8cg8te4NU0=;
 b=VMApR360+JhZW2V9+I3VI4uFr3dKZCCHnDfD2nM7xCwCKNx4U5MorfbKwsKEDzPKUvMC9hk7h
 tZ2aFIYwxOpB3qrgwmi77ICbrUpLob7k94Q01VGrZUtROjnWZJAKMyA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: B-s7Kk-wBq6EkA79ha4nTJb_rfeq_Fk0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX9v2F/5S2wTMF
 ZghsXsRZvC7ELCZHo3t0cTISviOin/fNDZ+WSurHyOE2XcBfrKfb82QIln0qn9QEosfAA2szJ11
 O6wbxgfD8VWLVpTNAuuqHGxHNBpE+IY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXwPGND52MSGnm
 U+Dszkc10Zap1t28QU+mNpq62rUpGSD/7Cnf1C69MqSzcS0V2JLCdNwNH28hXDQVdLlY+16dy6o
 lSvm5v9kDE9Uh+iyiultmqRLaCAB9N9u10+FOaLiqdjea1KUJjKn2510QdAOk5jeVtSoVHqwsc4
 pKyuM7ceC2mSvmv0uK7sAN7nmUuK7g7wuiL24UHSRPcuatVWn8co8A7AKXsJeJdEZZWFuhGwdS/
 lAzKWKVoTRiMV96Sn9GcfwrDvCXZ2AABHyZK8UWqO1T42HffkYww7K3r7t+U69ZyAS7zixHm4xW
 HZC8GkRIsA0Z8HyidYVktlVoNGdVGeqgu6qAQSK9ESz8hdJeshbnWMnlf9I4HpfR7YCBkIT/wJ/
 myd1snswyZGKU6fW5LCk7NfEhkM7iiQo8KOwetnTWquCr0boZpnY+AvztYeynbnU0bvUrReF4SC
 fxpmMlOtCZNocKeEzTQ==
X-Proofpoint-ORIG-GUID: B-s7Kk-wBq6EkA79ha4nTJb_rfeq_Fk0
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07dca3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cAW_sDYG8GF9HDSd8bgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, Glymur-specific PAS parameters, and coredump support
for PAS remoteprocs with secondary processors.

The OOB diagnostic path also requires Diag Router support in userspace.
The related open-source work is available at:
https://github.com/linux-msm/diag/pull/26

---
Changes in v4:
- Shut down previously authenticated PASes before unmapping their carveouts.
  skip the image that failed authentication.
- Register secondary dump segments during firmware parsing to prevent
  duplicates on crash recovery, with cleanup on failure.
- Link to v3: https://patch.msgid.link/20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com

Changes in v3:
- Release auxiliary firmware after loading and on start failure paths.
- Shut down the secondary firmware and DTB before the primary firmware and DTB.
- Allocate DTB and secondary PAS contexts independently.
- Continue primary coredump collection if secondary mapping fails.
- Register dump segments from firmware images instead of whole
  carveouts.
- Move secondary dump-segment registration from probe to firmware loading.
- Map PAS regions only during collection and unmap them afterward.
- Place the Glymur OOBMSS PAS entry before the Glymur SOCCP entry.
- Add Reviewed-by tags.
- Rebase on v7.4-rc3
- Link to v2: https://patch.msgid.link/20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com

Changes in v2:
- Drop the redundant “binding” from the subject.
- Rename the binding file to match the compatible.
- Remove the IPCC definitions and invocation from the example.
- Make the coredump commit generic for PAS remoteprocs with secondary
  processors.
- Shut down authenticated auxiliary processors before unmapping carveouts
  on start failure.
- Release TrustZone metadata on all MDT load failure paths.
- Assign secondary PAS IDs only when the corresponding firmware names are
  available.
- Keep PAS carveout mappings active while coredump and debugfs trace
  readers access remoteproc memory, avoiding a use-after-unmap race.
- Support coredumps for relocatable PAS firmware.
- Free registered dump segments when removing the remoteproc.
- Move the Glymur OOBMSS PAS parameters patch to the end of the series.
- Link to v1: https://patch.msgid.link/20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add coredump support for secondary processors
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 370 +++++++++++++++++++--
 2 files changed, 489 insertions(+), 35 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


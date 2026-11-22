Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329963;
	b=AmzdM1Ho2CpzDZcCJTUvYks57wFOaC5L9UgRE1FL270fB0TlbknTB8aalsCw45jA6VDf
	 dowonPi44m3w/Csf/q3QBDvyWOiRxSSng21JP8ZuSQRwrlSdkt6G5LPs143KLDAS+MzJR
	 zS4LBFyZpFouFtKqv+KTVB+XypGfzSy4J+XaXxiwW+mdOV2PFVX3NyBAewicAs7fxtEeI
	 OCXOkmrIUjAecVjSK1XuSNNir74S6CE3RGTJ3EqPmKGGMciLlXlofMJHWdutO8yZ1lBiT
	 eBAkOXBp5cKUG/hC4ATOXKmRckVtLGDpi3VM8VSbRdRimpTbKHrQp32a6ZjYTrMwZXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tuiQQpowNDqgIViUd3V9zwNZ82lxLYXnJLlZHlSUB8g=;
	b=Qm2vnFFUbkVe10OFdHn8tc9t/6GyMuIUqjybsoGs2qXUpGqabAPa0iYLKnaQQ5jB6Eoe
	 hotGGZsRUvcRzMgjWYTQGiw0Ng89I35zSTkh35shTnxeilLZ0l4v2BZl70K2vUuzSkTtl
	 cCj0uxoZThfEXsnD2IqEbO0qfkceY13PscoeSNS9irGcYNB+0bKejlWoxOKg6Z8sTzCtP
	 /P7oPg0sJm2FeujDZjfFc80uB9/dFnhW9yUbDM2BWKXtnWzKDYhyeOQHlmNF/e+ysFwLv
	 6u/GI3zpTnj9ZybUcKE4xJAShgV5kvCPR2KrYGqapq3dALK35IzVbF2g7efNVdBoISQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV0WbZ7v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVMZWAu3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2824606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2824606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV0WbZ7v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVMZWAu3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM3k8fh705377
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tuiQQpowNDqgIViUd3V9zw
	NZ82lxLYXnJLlZHlSUB8g=; b=AV0WbZ7vT2NcAG5tkq4+5Wq87eEDHO/50r6Dmv
	tskHEeXHI49aFcGrDi7gBYrBQNmx2gtvJtDzfz9RSCq+vIkZGfBpoe34ipds3vSq
	xnxnRAKCwrw/YXiMjIR2MDJiz8aYFMNWGvmzbD+tfzxt+c0yWzoHGkV3ziD+MrXr
	lficYUvYtHjM9q+wQozxwth0lAa5CGkkY5LrmZOS7VTrrq4DXnXTlyB8CdOB8xHX
	Ookk7wJu5TFrrYx7kluPWtLIKmWxqmx3zD8XMsLJmjVMm5RmfrSGSyRATQCDWHxQ
	wExjQJcJx30Wa1wHAOy7b077t1zsA2Mq1s1/Uy0Lt8rQ3/NA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk2pm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:46:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso3291234eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795329961; x=1795934761; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tuiQQpowNDqgIViUd3V9zwNZ82lxLYXnJLlZHlSUB8g=;
        b=iVMZWAu3/MXg8/uzA1lhXlf0Fxwcu54+TU7BUKXF+oFqNUk72uHm8g5oW5IFw14wVg
         98eZyUgX24Fm4YQi0o2T/0tMJIXx5x84Hbo6tNHV65L1S9XxoVNnJY11l6YOloYG8D1U
         DeJ/Ws6DwQoG3g3XJYrK75/GCIkdVccw4IBYI0b/8f69BgLSB4Mlgqu4UEQHfgDm5CVd
         m84c4wmPwTgkkpeRSUtr/2e4DzRqbvrt0EGAoRJahgG348dHQ5EZBzTvlGwElOlYDv7u
         quaaws1VRcfKfAibcsEjc7ZXnhn3XiWqp+yHH24PMmDpT2/CAuLG54yPZbPm2cbcpL8U
         YYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329961; x=1795934761;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tuiQQpowNDqgIViUd3V9zwNZ82lxLYXnJLlZHlSUB8g=;
        b=R4lHx9EinRUBcjFbKo3zl1zMYQ0op4+GYeVOtFUu+JrRWBRLMdlRZraHWqfzvlnzh7
         l3+8juOLzz7Zu+bCEynTydMptXXDtj9ZKCWI873NE7e5ARRuzpIbXKtgV5zZhaAuE6ni
         QxPL0AIuG1m0oC8cMGqNwisgFM3Zn0AWaUzJC4zqMXZ6xiywV0Eim8fLffnLIQ9W3cjL
         yD7Rd7fXDby05HTudglrjxaWn62vISW7LkuPbuV5SzqoL2C3qAepe/2WKvOo+wTphUam
         62quRKxiOBUMCNYbtLYh2GQiwjlp3h/r2kFRipC0+EgBCRFNYn++B63uhLJVpD1lvHxd
         UYmA==
X-Forwarded-Encrypted: i=1; AL+hErFi4S8HgxEzWUOZ3Zv6D/wV5/bS2zoNP1ZWFdCG6bRN6NNaDy7M5Q9aX4xroRfsvzOo1tq9ojgbqgbBKmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TBFXr1IEeN4neL66OKGBUlQCTpFZNLOepsHT0+2iHeYO5vyCZ
	P+KPaPV/FBnsm+k4kTitKll0bPC9xe8wUfCrdRvM3SOBBr3B8K0AzwocDbQrqIUQKlmqk6CIUV9
	pjFl+aNr8KbyhVRq1PXjk4a/3FU/KiNw2RU02ChcVUP195By234/NT6WyrX3xb6OaseA=
X-Gm-Gg: AZFdTZfNacYyv7pAz+OML6PPgQCcgNnVZdWfH55yeW8441e3UOk6VuayZFs5XYtsWap
	uLUkOPkVPNvXYeWZN38zpAhKUSPGdjlp+v3M4rFZ+7SHSix3q9rXT/yx+I2zb5IWGZAqYqhGeRD
	OM0J8Ii3T3sy/qyeItpDV26RAvcygITiikMNTwUiQnqhxGLEP02E6XW8ME0nSIry6cAA7HpKiL1
	RudfPABsJMJMl6AAiqr9bOMLNlom0Q4BebDTZwQtPETgh5E/86LOvm4n86xkt2LhfjLqIMj1Pdx
	yr2VkuG4xf+s1sVbGAATtwjZEaeRunbIPGoAnKfl4MWZXcBAlBUP7hIz/ZOwMKwfMo1p4ZjVAVP
	fanXWS55GxUZeznZWH21OG8iWO3i+/ZKIbzHJk/GSJbFH2/30iHwfiE85wwOTg9/o3ZMQlEjvFS
	2sz4NfWQmF
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr8055954eec.40.1795329961144;
        Sat, 21 Nov 2026 22:46:01 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr8055938eec.40.1795329960649;
        Sat, 21 Nov 2026 22:46:00 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm27598615eec.10.2026.11.21.22.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:46:00 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/4] power: sequencing: pcie-m2: Add PCIe M.2 Key B
 connector support
Date: Sun, 22 Nov 2026 12:15:50 +0530
Message-Id: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ6PAmsC/22NQQ6CMBBFr2JmbQltsRBX3sMQU8ogY4RiB4iGc
 HcLbt1M8n5e3izAGAgZzocFAs7E5PsI6ngA19r+joLqyKBSZWSqpBgcobk19BauMabJqqLSRQ7
 RHwLGeW9dyx/zVD3QjVtgM1ri0YfP/myWm/evO0uRClvrXOrM6ZPVF8+cvCb7dL7rknigXNf1C
 2zrkBS7AAAA
X-Change-ID: 20261021-pcie6_fix-cf66f4b8b387
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795329955; l=3040;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nBLbfXrnUeOg/k3lrOwzMPzMyjCM8oeFudQrYc52rUI=;
 b=w0703ZbG7o+IyOKcodaTDYKM0mrFG87bvx0OmCPwNrsb0f1gNsudmjaQoF/ORAk8AdndNGWdj
 gYfEUfxCaXeDzxpAlxR0a/rHWuYGe3GTmExBpLrYgFg27qpjnbhIHeQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: dQ4b4FJOvNf01j6y6Lr5vCWMWwMED4yk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX790hC9pxA/WG
 5xoRgHrH4bTMrwYZkQuhsnsQUCtH6XnE28Bj9twbbUDlcK3TLXE2ZSSbJo8iprEg2trB4nVBcAo
 Adqy4+GGmFZrRcX6c2L9qeawytYWE/DAYYzSn1HdWzhDghchiT4Favq+DSSmj0S8rxx+8N0hfjc
 uNZT2dMHN2pkBNoSL3gErsWIiUJ0tY7fTTiH0R87C8Y2dzCvful94QKbwN/63z0oiAF8DuTJQ85
 vdBs/MoKwb8sDAv2ujm7yptpPeHAk9ykyJX1+P6JJ3TGcCIsff7wmCivU59Zb1eig39r+bceOX2
 h9ubqBUZhyqCwEJzunNKsLVChSj3gbFiMBTY7ltNeibZdcgnFDFG/XuBysdjyvmlyR7FI9orOpJ
 4R09rqtPG4ZZsvAiC7izNZ474ICJYUXioQQhms5h6hSrVHL24TFkMVpFn/sMRtVHoEQd/MAksA9
 gr0gyabHKYTLjLk9/LA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b028faa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zkpMToBQJcapbifWyZsA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX4e5LWvLwEse2
 xCrsP0aJplfBYtpJdCpv37oVThjMSLwNGrAWWO7OFg5BCxnL8B8lWLmTu6c8tcnPoup/A6Z6Am8
 G8ny2eH5rEdvC2tBW0SifHOmCg4COgE=
X-Proofpoint-GUID: dQ4b4FJOvNf01j6y6Lr5vCWMWwMED4yk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220026

Add support for PCIe M.2 Mechanical Key B connectors, commonly used for
WWAN adapters.

The series introduces a DT binding for the M.2 Key B connector and
extends the PCIe M.2 power sequencing driver to handle the 3.3V/VBAT
supply and the FULL_CARD_POWER_OFF#, RESET#, and W_DISABLE1# signals.

Finally, describe the WWAN M.2 Key B connector on the Glymur CRD and the
Nord RRD. On Glymur the WWAN supply moves from the PCIe6 Root Port node to
the connector, so that the slot power is controlled through the pwrseq-pcie-m2
driver and the PCI pwrctrl framework, like the other M.2 connectors.

The series is based on the qcom tree [1], arm64-for-7.5, which has the Nord
PCIe root port DT nodes that the Nord RRD patch needs. That patch also
depends on the Nord PCIe controller support from the PCI tree, which is in
linux-next.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm64-for-7.5

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Binding: describe SATA/PCIe SSD Adapters too, since the Key B slot accepts
  them (Alexey)
- Binding: add optional config-gpios for CONFIG_0..3 with the Table 3-18
  decode, and config-state to fix the configuration on boards that do not
  sense it; defaults to WWAN PCIe (Alexey)
- Binding: replace w-disable2-gpios and wowwan-gpios with gpio0-gpios to
  gpio11-gpios, as GPIO_0..11 change function with the Port Configuration;
  the functions are listed in the binding, with the IPC pins and CONFIG
  state 14 marked as vendor defined (Rob, Alexey)
- Binding: add optional alert-gpios for the SSD SMBus ALERT# (Rob), and
  i2c-parent, devslp-gpios and pln-gpios for the other SSD signals (Alexey)
- Binding: replace one port per interface with one port per muxed pin group,
  with endpoints selecting the interface: PCIe lane 0/SATA, USB3.1/SSIC/
  PCIe lane 1, and USB 2.0 (Rob, Alexey)
- DT: add the Nord RRD WWAN connector (new patch)
- Rebased onto the qcom tree, arm64-for-7.5
- Link to v1: https://patch.msgid.link/20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com

---
Krishna Chaitanya Chundru (4):
      dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
      power: sequencing: pcie-m2: Add support for PCIe M.2 Key B connectors
      arm64: dts: qcom: glymur-crd: Describe the PCIe M.2 Key B connector
      arm64: dts: qcom: nord-rrd: Describe the PCIe M.2 Key B connector

 .../bindings/connector/pcie-m2-b-connector.yaml    | 332 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  29 +-
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |  40 +++
 drivers/power/sequencing/pwrseq-pcie-m2.c          |  70 +++++
 5 files changed, 470 insertions(+), 2 deletions(-)
---
base-commit: dde0308a2f8867806a444df1fdd7e685b1c56d5b
change-id: 20261021-pcie6_fix-cf66f4b8b387

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


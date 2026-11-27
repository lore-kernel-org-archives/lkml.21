Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790464;
	b=pA2uqXptNbD8Fkjihw4vWImae/tlY1OCqPRC0SZ9Q4kBk2YMuyrv6EWoo6otDdBEHMiY
	 4Ed3H6QkryJzP3dqi/TpV3r146uIihCnUHh8841nqLMAnSXHcLoLBIhJTDSu/KLmHNfit
	 bTfJo0OsgAzHcmTdwpq3Y78cBQsKF3Kfs+zAESYhrNBMScS9PpnQwaO0fcdykGlEsRbP0
	 C54jG7ko7Y/ykqQPkI+IbOxLP3VV8GqT8vGAAy88iYXJ1E44FnwhvizbVg8CLQNXnjODf
	 Wu1WS1y+kwt6oS730SirLwjoZm5vyMMjzJQuoIuP3Aferem/0ZxOmEsnfqxLdw/Sg9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SJHcj1ye4onm2ASg3L7GIHvM+mwNs4PYz45ZKyk2REM=;
	b=I1wN/taaiN0MsLHGK4eE/v7Kt/bf7qvssBNyydUE55fBlMHLDtFCfaJjtTLZMj7q3vOL
	 2d5WdOQDiD/2vQb0NDUZVlvQPkcRu7rPh9ENXKtLGUI+WUCDylzy6SltoUbjpODisEcie
	 e6wxntvYsF0QeEvyrkn82JX6feFxVEpa/+VWhCMDNlnJceAiDkNBxV8NKi6poP+jzZDCE
	 RN1rB+lN8SCOUocppmFyhmQQGAPjMIKYq9rH9qSzh40exAHdJDnnHkRnehJxgDp1+6ulW
	 hLtldGuoD1NMJcL0VAgo3K6TZbHHjW+Or20vo0p4t6fcn/tGObzCQMZwfbN56oN64TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfYYWJA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnXszjpS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674F606A334
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D674F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfYYWJA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnXszjpS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1LkM1790969
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SJHcj1ye4onm2ASg3L7GIH
	vM+mwNs4PYz45ZKyk2REM=; b=ZfYYWJA+vdAcFWrPAFNRo6SvLZWCqCpvXd+e9D
	vJxuZhpkpCAFLtAZs9glaQ//3Ma97B0u9CsQQTkpeSMKiSOFLQE0ycqK7kUC/aDK
	kaM/1tMbUJBEEZTxJlJk2VP/RddsyxnX7fcQ2qFtsBQsjO61ayhftpEyUmcjbd7F
	zQOB1+dBKkT3Q7dL2MuCsY98A7RhUx3/yU7ALe+Ia6tpTaWy4eWDxr5/nVT/91bD
	f8YwX4DItjQGcRbzcwMz6HXyg0U4YwXnxtN19F2Sf+VVgM4T26UZcgWDvAxYeyzt
	vN8Bw9acS5SXEs1YKuCunzebUjq2EyzhJBYkIywl3XjZzXJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3b03g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:41:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so7951084eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790462; x=1796395262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SJHcj1ye4onm2ASg3L7GIHvM+mwNs4PYz45ZKyk2REM=;
        b=BnXszjpSGEHr+u/tfM9wFZHyINUNM0MAhhmTX1jsplEay3WW81EkpGD5lXB5p26Dz0
         hYxNvQyKHn3wF8E5WPyCbTniXybiTCSBoYWdkcMuBP2/Jxy6CCUWplL4SPDroWMBSA3M
         JZkmKfbL+9sxyc9sDILjXyyuf1QoJdxwcIrxiaSXWYKH/SWswWnN1yVHVwpJpzJNYhxb
         4RsibooCr/37JD2zCp2DCE1ZATD9StjQ8KgzQCOJ/kg8d1PhBo34fe5DFn15xcOLCKb5
         WS0Rx4PJ3U0qxiFTnw5tf0Y8iJ9xwkhecUoyn/DCcbkZAic/Oej9QLBdaE1prVM8O1zT
         2kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790462; x=1796395262;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SJHcj1ye4onm2ASg3L7GIHvM+mwNs4PYz45ZKyk2REM=;
        b=xMHVD6Rcx+Vc4oorlWgTgkzH/DSUJh60GmfGQyNUoagmIBbIlKTkgMdadVjs/ZOXyA
         qrpAZFnIuVwkWc2MfrFMN5UdjGTDxYGI5E00DIu3xNwQxJmSpjW8XVSDaxZQlmZMxc8O
         gKgg2JgQmYlpCFlwmf9+tnnFJheusS86GDH2ik2qbPqhbai42rzY0yDi1miJHysz8I4X
         xVhUtiqzyaGGLS3zTMznIYdYDGGvSeFttq90UqRzI/Cn89fdRx9TtK53Ib/gpQeLEM4s
         66fAUaOMxuFJ9L6Dt8SZHw3uMHvkNX0NGwGrZ3myLwvOKhM48QO7Ydi/B/LX6K6cetZN
         /27Q==
X-Forwarded-Encrypted: i=1; AL+hErFOvIWNcPQ+2Dw9P4hyrUOKzbKmuB3NPE22B7Xkj6YN5+FfYWpadFkA3ZBZlg4ON+c06LFWIlAhqzyB/4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mH1x3tGmhqrwWeLVRMqX9tIzP/GP8+frdcSl/761Pvb+S6DCD
	rnNvW0xbEesdv9AZjWb8I6CCRps5idmVnN/zzG9x0PPnErRgf3t4VODD10Z0ZvhaaIi/iW+PNJb
	Sp7SCJAePfWrtRiWct0xBkFp/ex65m1TrAgdx96NZQN9LB5FULhVfnmQ/eAbhl0afB1Y=
X-Gm-Gg: AZFdTZcqJaKU8twmObVDBo9biR69PArHlJRmTtYLLvkGD9aZMFjd339z0rKBMHdbs4A
	2QUJgRp7YL1M6H44eLyjMD/Bw1SA2wFnu05hBgJwU4h71OFJ1d1joZ7qn73nPlRHaqzPoAhIT24
	25hnatw2Fg47iJba1guLm7w93hsOZ6KhrQATev8Z3Xy/0HwnF0XSp0pSG4AA/PKqZgdE+d5ay2I
	aAVw8j7E42pi00h/YhGVQgug/fqZfba+C84eUFYFx4zYDD1+oSJWGRMqSJ0PBoz/nqVQjcjW2Oh
	u7BxpKIq2c0KzQL3/nW70T206WqY725LxrgJxT0zf3B9MGl75x5xeV/KMi7WxLK4SB9uISoMhg+
	G+hMjkP6ImcXlP48eXfY8LFW9RJS+nai6WQaUHkKmLy0++WqExmC0ij7WR7Mea8yIHvYOHIeLOx
	uDArqjfg==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr28026544eec.6.1795790462338;
        Fri, 27 Nov 2026 06:41:02 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr28026516eec.6.1795790461861;
        Fri, 27 Nov 2026 06:41:01 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm82970809eec.26.2026.11.27.06.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:41:01 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: qcom: Add support for firmware-managed PCIe
 controller recovery
Date: Fri, 27 Nov 2026 20:10:48 +0530
Message-Id: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHCWCWsC/4WNQQ6CMBBFr2JmbUlbtIAr72FYQB2kBijOFKIh3
 N2CB3Dzk5f8/98CjOSQ4XJYgHB27PwQQR8PYNtqeKBw98igpTZKKiNG61BYPwTyXYckCBmDyIs
 0x1NdWWkkxO1I2Lj3/nsrf8xT/UQbtrOt0ToOnj67eFZb759jVkKKs8qyIkuNbZS+eubkNVWd9
 X2fxIByXdcvt1kPoNMAAAA=
X-Change-ID: 20261016-pcie-controller-reset-8938e4bac060
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795790457; l=1308;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=SRZ1ZNlotCXW9YcejmmVtLhSxwznrrgBDa/mll2wXts=;
 b=HmTIIGhR2oznB39LmlcDi1JIhmJ6ElcnC8fA6ISPHTamLiYXPDzyXm5qGtwrPpEvR+BeppXdk
 hBZ8dFDvef9DGx/rE7zwoTvL68z2Q+sG9eMICouI/n7CThA0ASIk2bT
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09967f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Vo1K_PxMkAQpuwCxzZIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: xf42VvPLSLk_cxEgJLgessh4K6ct3kt4
X-Proofpoint-ORIG-GUID: xf42VvPLSLk_cxEgJLgessh4K6ct3kt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXw9rcXCLMuPPe
 BNc7CW0PF4QDY4OSHQqyhmKg4K8rA8Sp4VVYcaXjdvAF+rr0tDbzUdZ2WNsCbNOdf/GfoEYz/4C
 4lX+AcUHEnfJMvaI35s+v8zFkygsedOXBEsRktJgqmFo57XVXVjDmYVLejEOM7Eu4/r3qKAmTYY
 /1o3mxCNutJW+t3VspfHSXuT2uZm3znYQJ6hM196nE3KiJ0r2+Afegjam9gE6gHr0CjPicd2TXN
 LNr/mi5zuxaRzi5ob9Jr7uNqYk2erebo+OiAAjl5Yi4f/sixapktYnGP8eB1QpGfLsan4dIeOph
 Vlie7uosVdpi2I6AMJDXOetDY0PZIaI0c12lEAwXzO3rApYUsUjVSFZpHUmnh0dLB4Nq3UHMAcU
 RNuC1Cajpbg9FDZx7KUAgld4ohM3w7g72gKFmn3WiBUKNx3RaZEy/LU6wcDADHi1RJn1ppz2BiW
 z1BUd12LUgeMBi2bvIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX8tR6h7B2b+D2
 7xIvtks0FP6AByU7IpDZdCc946RRz9lyxIXX98Dk4Qi8WrjiMwH5l2+ZmXKeFcZ22NBl0rzerM/
 gh31AdFgzVevDUqAjV59NOisXrpAbVE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

This series adds recovery support for firmware-managed Qualcomm PCIe
controllers.

For these controllers, firmware manages resources such as PHY, clocks,
resets and LTSSM through the power-domain framework.

Patch 1 adds Root Port reset support by power-cycling the controller
through Runtime PM, allowing firmware to reset and reinitialize the
hardware.

Patch 2 restores the DesignWare MSI configuration after resume, as MSI
register contents are lost across the controller power cycle.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Changes in v2:
- Guard reset_root_port() registration with CONFIG_PM_SLEEP and mention
  the same in commit text too.
- Link to v1: https://patch.msgid.link/20261016-pcie-controller-reset-v1-0-51779736cf12@oss.qualcomm.com

---
Mrinmay Sarkar (2):
      PCI: qcom: Implement .reset_root_port() for firmware-managed controllers
      PCI: qcom: Reinitialize MSI on resume for firmware-managed controllers

 drivers/pci/controller/dwc/pcie-qcom.c | 42 +++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)
---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-pcie-controller-reset-8938e4bac060

Best regards,
--  
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>


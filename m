Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779755;
	b=3ojYO3dc11cyAmv9IwgkN7C2nfo/YaMpZ9oLlxRkVzHhWkpj+mX+QJdSC3tGdAOgDjD/
	 HXfe+JKgLYgaC6GvGpIwFFyhC0PEfOJOwJ6HO9zGGYV5FF1KJ6ZCDbudteJDgc5fHOAMe
	 CE8YdAZl9Wc5ilJ/rJ/7ZJAxs9zliyd6KDaGFUB4uNsHpVLg8g9JmGdFz64YEyqYhHtVA
	 pAvvCFDgwoKnK4/ICiFGM/09f2EcKEEBRgb2tfbHtYrpf2RghYKBMVJvsELHEYh081jYu
	 zINklNAwyBXHAqjjlWfTzpGPzuIrn4ivkfWaEJfOxMnJyjM+W0emzigSQnsc7AqCA+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
	b=FSpAY2Qwz2UfRJx2gfx+jp2IyWZOT22NIYcoDP0FS+uyKJ2Hf+88bHWx9lHGl+Tjrur4
	 EJKjZcBOoymeJGjBIVAVL67T20urgcSF4GY7j1iEfQjI99JWQrrE/4eMx8gPaHSECRetY
	 C4wYqUXe7+WBYmp7R5fc5cOLRXe6NM8QBs6cVj1BZt+04XNLTeBUB3WCcOmwFJ8r0pFsp
	 /J6d5FUlGpWPf5J+K4ddMZtiTBl18S/DIsDbx3iJJFT/MdOh9U+Vf2kL8WZThi1I22gUz
	 ds2wSHiLN7RDQJGyus0r0dQubHnZ3rmY3cqwSY6F35agXBhZtYBgoEgTAp9NRDaTPfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z7cl/HqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJdW2Dau;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0D606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D0D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7cl/HqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJdW2Dau
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp0Gv1961818
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NyDUwgrh6wWbTckiN+W3o/
	gquXyln8i4quGDrjK+rpw=; b=Z7cl/HqJCSj8mduH7FEaRvabZFow0DwkuHHlFM
	Y1HTH92Y2f8dWljTKMZdM85PZqr9NzRL4y/4I1dAbCZSftgz1Okll7kZ2YpJTk6V
	xnr7lOznw/qUiiD2EK4nazWGiSfVUIMKQGZlseipztNWCkSQoXJYTicPgmh62dzD
	wSwbcM7RfoSNob+JeC9sqRP93XHlpUs4X+TrniKWrC85pSiCiKjBPa/I06//1W9e
	ZsY9q/ZxWG5Fkihoprslzzwngxc3/TU/Gs9ujo0FK8TjlOTVM92gZ1NgZdKrC3mS
	3wsqud8j18MaLe6HonMQF1TqkMeR4d9mHhyjuS09wYspUqzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htugf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:42:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d3232fso1098798785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779754; x=1796384554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
        b=iJdW2Dau1eHiyIzITJ7HUvaLcQ28wTyzNyE1D63lhphhNREEg2oc9nQwdqs1mDoTga
         gccZjtt0T42BhYTW37/sLPDr5vXet1YJNenuZP0gNQOHhw4BDHL6a+YUW3uytxdz81m9
         s++bVTeBzjfF4JDMGUEh3U1V/zTlAXhfEHNSaJjZAgr7KZS21ysGdkl84aDc73OzrXYj
         oEYmrXRXp+Pg6poS8WfEUba8K8Wc6bvt6ZhDlBl2dVagBKaL4N3opWF/cezo3UDdRj/E
         QXskifGj5ezGG+XgLFeWH267SlIaM5iPMN9LIq6QSeMJX1geRh9C2VMuoBX2fTa85YTg
         U0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779754; x=1796384554;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
        b=s7rdDBjUpv3kfZwVDMwG/F9mpHdrvWso77wfKA3ewBfi1uLA3NTnP4T3838MibBLhF
         1/UM9Ur2FAlMx3kubOfyuAUx+YZZ4pcbBFwRb+ZISWmIuqdHPUuG3XVvbaTOmB6VA0P7
         2YL1oAzZhQ7+KGU+WW0qTGsDCsh2789NWHyNdHeMTjGlcinGgilyLc6OKpXpR0B8mxQq
         Ne+wPV/zbtllp/hw44bgatEJuE6O/ptNjHixiqg37mTQxNWTrnw9Bv/HgLFYGcJcuSA9
         mDOofwvtAczVUh02XXmBBoYiPuuO50Gn8At2CFP4YkOffF78UPoAzQf/L+73NEaEPNOv
         x0ug==
X-Forwarded-Encrypted: i=1; AL+hErHSx1lUYSZ++XvRxJqBVBvR+i4oxGquMvizAYhvYSqcfbRcJE/gCENoo7FZUfvKL4SD1bZr7RrdyWogblM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c/abATwsWmrErH2Cw7D+LuGcw0KglAT4tvTOFW18q16nI51fj
	xedxZhHFV0cXwvu484MUS16N4OPCj1GgnkBsyXl6tGRahQo/rrP6Ml8kLbYXo47ss30mCiQkkjM
	IaKW9K1fbOg3qhdswQ2tXKvGhJJez9rdSiJbQ3KJTOYM6sEVu1/Vr4ejhqqfMTWFXyGU=
X-Gm-Gg: AZFdTZdkk4clq5dPkA3V0MH0kdX5cFwjI7BIjSaPL/GXTyjy3cHwv6Bkt60+BZ8YkSk
	252eTrPUSKpG0fAKWEyquhlyivLiR0apOK3iaxuSAIMyZJfVXUXkoaKhS9Z4FZV6GhASsAU1kxZ
	TeMd/cngFVf1sn+h3FyOG94SPYFS891AhSwkAIuaiE3lO9nA7youvXjsJXaNGWfavP4fCZ8eeqw
	3Mtkj1ToHYfPJ6E6vo7Zo2HA+NHP8AE7dAnP7WoivikFGtfVb9Ci3ejsI5wKkZIURxbHWLAasTn
	lKggVkr45nQIXX69SbIQwxo+ZteoqY1QGJZviClxcFm5g2Wl5zapMpHj2ItrSz/PhS9UJ7f/uQy
	PHma1XuLOjOz7gCHHA//PwEEdY/Q8qUJHFue0sa0HafDZkQiDZhuyECEXSIbb/txAW87CYgW2Ri
	EA68iE8K5Eqgqi+98A3LA//drANATXqk9TeAjbzRSUbANoptZM/23K/ZkpUR8yqOo=
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr4265140685a.14.1795779753775;
        Fri, 27 Nov 2026 03:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr4265136985a.14.1795779753306;
        Fri, 27 Nov 2026 03:42:33 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm56457254f8f.21.2026.11.27.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:42:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] interconnect: qcom: add interconnect drivers for
 Qualcomm Seca
Date: Fri, 27 Nov 2026 12:42:28 +0100
Message-Id: <20261127-seca-interconnects-v1-0-a31bf9b36ac4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKRsCWsC/x3MMQqAMAxA0atIZgtthVS9ijiUGjVLlEZEkN7d4
 viG/19QykwKY/NCppuVD6lwbQNpj7KR4aUavPXonA9GKUXDclFOhwilS00/OG8DIsbOQg3PTCs
 //3SaS/kAYkpvNGQAAAA=
X-Change-ID: 20261127-seca-interconnects-891207666a30
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T5L/ehKajD3lC8IkBxCGBFiU3AnyDbdankjiDTN/CUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWynaNU4v9gsq42PA5w0vDEQ9Pux/2f/2KROY
 1Y4njgT/AGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlspwAKCRAFnS7L/zaE
 w9jED/44rFltmRX3o1MM89yXJkc0vId5h6c56ucCmoOZc8fXZxq9v2dbxdYhF7TBEaT/R9yOpmu
 nj10ikKCqGJs/wD6SHZlf7QEr/viB9qTGrklYu5TVoRr18/EqdHxiFStFUm4Mro/MprTo67ngQl
 Obyjy59Ir41JmgXLDZ+0LoYNi6+ahFoQS54/KXWMAdI3MwFHsaCVtXwMDpeucSJOiBQ+JDLojzF
 k5zNR8h5uunisaHi/FfBPvUBSsgc+y7dodqK3+vl71RWLvyYq7qAbRqsFOQ822nT63aiU0lTS2I
 VqqqcSmy1SGn/Jqkv9/Pw1+HmUhG/YsSHPdsHwGamJWmWkMsDTU1noaDmcX15rqSfpqmBHtSRd5
 dCBVueY3m1FTfwRTw9UQFsRE/5Zn4y6oS/qSWt5xoP3whiPBUiBTYU6wi/efENORYfE+YaHFBKQ
 MDohUi0SIE6+n008gXszRiHSKKmlEF0OfPVeMzOV3djHoLFuiu5AwmweySE0vkYqsM1GFnytr2h
 eDvAxPCIPw055CdwPXgNh7qw2z0CL33zktKrbngnGlLtNsT3WIwPaB+ks1mjLYTvpXCGOitmJtQ
 86KyNaELdGt25Y2Uf88A38W69/i9Qm5pFEZrxUKCENFfVLdn6A0vPReghY9K3nFJAPeTwUcWfy2
 YGuUfJdxZ91+YrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX06ByYDWiQK0a
 vSd6lDKcMI1OXUumaMUdGn9RXArJjGMOuGzIjwmFFLNpZA/7IcssZaOok6IwnC2D5BGXq9in09o
 X9cGIZyIEcWM+95+lyZMbfNGmt344/w=
X-Proofpoint-GUID: qHpBap5XK1hf2C9itiJwi_rZ1IZU-nFj
X-Proofpoint-ORIG-GUID: qHpBap5XK1hf2C9itiJwi_rZ1IZU-nFj
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b096caa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0vBr5WPP46mkPm4xHpsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX4UydDoUHOyhJ
 7wQD5rKvNuUp4xMOnswQl1T8k76O0Mgd5zi3jvg5Lwd+6qo/tfJyvKphIHzTR+Cxh1+mE+j4WEu
 lxKrz25v6laCpcM75nrRveVDeF5tASJqiaBuA/uWFqvN0++uS4Kg/SCxTMA/TASbok0+FnXvkMc
 MaGhCeeHevisSzwUd9/70s6sG3tNXOuEfrsUcEd9UsQP73nWR50vuo+h84J8ECpQ9gfmfp/XuD/
 1yejzfv/68vogAsJ/9keFCZytbRunjSNNcFcad7xNqEtlQuQ5DpK6mAqWqomHlNzykAqg+wk/cT
 QI9taPF8TPHTGI5MGEaoBpXTzBzx7u3DHsrb9Dj7grXuki9OZuy/6Cu4Azpg+Qx/fhrmjoexgBt
 6MPY3RQz8gNYOypby+oIY681tr7qJOX1iVoZJ/deTFr15cPN9hs/chbL3MK7vWWgvFmpcloLGxZ
 wlWF9Ly7gShj0qzbG6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Qualcomm Seca is an automotive SoC with 12 Oryon CPU cores that's a
slightly less powerful cousin of the Nord SoC.

Add the interconnect driver along with bindings documenting the hardware.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      dt-bindings: interconnect: qcom: document the RPMh Network-On-Chip interconnect for Seca
      interconnect: qcom: add the Seca interconnect provider driver

 .../bindings/interconnect/qcom,seca-rpmh.yaml      |  141 ++
 drivers/interconnect/qcom/Kconfig                  |   11 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/seca.c                   | 2335 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,seca-rpmh.h  |  191 ++
 5 files changed, 2680 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-seca-interconnects-891207666a30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


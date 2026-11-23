Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414755;
	b=LwzNmruIRQltM9rS9bPpbSsDk5Y4X4fZt3xnot3Q8pJ3PcY3KP3+Tn0dGtRrjjiLsnPr
	 XqBoh/GHZhGhFnUEmkVDhAGtfdvPPbQAHgQbbBdfwHTKi4apFPMB3OdNYuuE89O7jYJUt
	 NrT6u7Uj18R+AvRZXdkDB6o/7oNEVE+UMNdjo9FixJ9TFbNUSf8eGonvVrNu5oleY4qU1
	 4Mn/+OxIAUM+1K8Z4UHoZteM6F0iyeJ50WZmQw7P50C7piVfzVW9sOZrZolHbWdI+U54u
	 oTI5Q7b7y7zVMVrDaV1c9FV4ZDN/C0b/uWuXMg1jhjkvgof3cwgR0wcUZqHR+SUwmBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
	b=zDA1m/VejZLXuH8Yq2rGqyNRoO9B29yqlsOI1Y9N3c7l5qmqBPiTl554TLpS14DUe8ru
	 phYoYVFalUGWON6bTztMIsBG3F6JnO/namVYmaCUMLz4/cj2YBjqyWaW6QrtywqpUIXxN
	 4vsAFEKozY2s0SCp7kQDa07agTGW1a3dt52zgLQ+iJI1UlFmQZMW1mPr2F0/1WXYRcZiq
	 hkXl0pi5eGNSS0GfRiF+yQtsTN8E2G4yo5OZs6oSZhELs5NlWLb4E+o1c5s5w7OV1DfX7
	 CRjnscSigk7g7g2tianhCN00Yb0XWRnyqhI91bqigqYPLLqViPVr/viMWbYaOvvLJjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkGRs3SR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dux0XlyG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3648B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkGRs3SR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dux0XlyG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Fke3528088
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aWSbe8A3Zb8UvFWO3X5sIM
	JbcFwfrEzPaXFLpN8D5wI=; b=fkGRs3SRBK4PfreXTSt5m3RM9Gq5/R7epMFyz7
	I1Tcb3LrtQ6bYFDqyjJFq3tNns+ShU0WQeYDjOG23gAVAe4wyfoTesQjvGb8m/9H
	PuamOppxQUl6lpAlDhCI8X/MSDDTy/hcOL+C6utnqqocOvlVIetBxlqJ5IDDwTrY
	GlhxCywiW8A3O4i7zPT6k2hQK9kTjo5G+20apJfgLVnB7vG4emmhxyt3DcVGpLd5
	Te5kbFL4QTCv3QJNwGGwKclghoubmh0DQ4SPrcC6zWxJxbgLAlh3CbYlaCd9jfdR
	CwXimmhrB0x3eYrwlc/eZvm6mq0YvlWFKtk6geubI9RkCe5Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnwtq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so2368301b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414753; x=1796019553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
        b=Dux0XlyGIDN+T3jPMDioAl47tJM8wze3bwwmCUzMfh5eKA7ZaVNgPcnws4Bpmxdoen
         yMtFHOTQPXeUKvHy99FkFH4FocfhJMUv7weAJR7NaHnHiHeo/1IhjNONWfTtMTNatikQ
         Ssr4B+Ih0Na9AmyLq1DL05KJ5iTJImpmrBRtDTs5qhdySv+B6mZDuFfkAqM35bmSOdeW
         dGibS36Om0hcoSpKMoJdPJYaW3dhyn9urBaCCSxEPm2K9L0ckQQeTGrqftynrLVK7ZyA
         JWPwRbdoR8JQZIFK4jG9DQaGbMR4dP0oG8gjcg037H9pjYxlgxz6xLN5h9kXvHRjrTHN
         MdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414753; x=1796019553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
        b=BApO5jqHdDW1FktKEf6ELWrVLdRona79t2v/AJBBctdNpVUXo+KRbmmpu+VXYiljFh
         llnYmsAPQYRQPYSuo3w7LBQWR7m9OM2Mq1ns6zc8Bzw0Jv0yH9xDaY+bVTcGPoIJL3u1
         2p9Q8cm71R+jQ4lMABXsQfm1e3lU6Q+8mS6/MmqP5Ks7/JQSIzFLXi5G7dNcRHvYzlCC
         UnZVeWc+pL+c46ErS60JubamzhDQPX8H4VVZqRhP1wABgcoaY0xvUgl10YnLepoWq6IC
         v+mQ8u7Raj6t0+QMnLG70IsFddaTMK67WnIW6uN8Z/YPsx7LbkaQpJ1hiHho/p87RCiO
         BENg==
X-Forwarded-Encrypted: i=1; AL+hErHltA85PtYMR+uV8I2o+s6S+4kFS/ze75X2697ZYxHZndWFjrOH+kXtCcUT0FwXDEiLlcxYwKxsT24nq4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wZoQuKaLYz1g7olgSPNwPhWAbcI/wpKyC2A7XnJjNj4J/dJ1U
	PVDiVWpcTNVkoU1IdNF7Q42doiEwB0fFyZEukOiLeKOl/hdRnfHC1jR8V//Vc4qe/hhOpqHIRXh
	gMq9uJoQ8WdmGrhrzzqot3u2E8zuQQzuULe/XdKv8+xpL8LU8mbkQ5lCEczV5gMeNT4oiCIUyKn
	A=
X-Gm-Gg: AZFdTZfuONQcMROzZ+PQh8QOoNTsCfyZSvom9SqsgTnB7NEfZoNN6G2CklxZulu6TZj
	UoLcbqPvgO9awj4KoqU0PWCl85igLsCxQsl9gfh54KQJ5P0CM909HyfSME6ea7aCcV9kMk7+rKx
	iXE23bmB8EEnZCvTEvyZwRTigBx6Bs0nNkpFyB9vuQ8MCLwdF0BKIUIapctO3ycjMsydt4//Imo
	fPNJ09yCnXsQAKlCnbA22wMdpiFmz2e5RwP7MGjWqKq61/n90ym38Wlp6CIyG/UP8ke1HUbJvwY
	6VNT/EUYRx6S07miv0vsi39a5Xrow4jF3zhMKm49XAhHQrHIwTntrXVpWFBW74p7jxsKInIKtLH
	RdtmVLW1YhYLFLZGvaF/gQSxia6QK780nFmjhw3IyNBlvDaTXKrmDLxud8b3SW2U6PS7NTFEZcD
	H6K7OcfiMWWA==
X-Received: by 2002:a05:6a00:9283:b0:8b0:5438:86a4 with SMTP id d2e1a72fcca58-8c87bdb534dmr9611190b3a.16.1795414752983;
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
X-Received: by 2002:a05:6a00:9283:b0:8b0:5438:86a4 with SMTP id d2e1a72fcca58-8c87bdb534dmr9611178b3a.16.1795414752504;
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Mark RPM message RAM as
 no-memory-wc
Date: Mon, 23 Nov 2026 11:48:55 +0530
Message-Id: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANDaA2sC/32NTQ7CIBCFr9LM2mkEGoyuvIfpAsfBkghUUNQ03
 F3sAdy85Ht5PwtkTo4zHLoFEheXXQwN5KYDmky4MrpLY5BbqYUQO0yzR88+pg+GGPBFSHtltLW
 KByWh9ebE1r3XzdPYeHL50eLrRRE/999aESiQ5aAt6TNpTceYc39/mhtF7/smMNZav18S91+5A
 AAA
X-Change-ID: 20261117-rpm-memory-non-wc-c93a6ff3e432
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1853;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=QOvNwqqx4O4iOVdjpSd7/HzP7iVOHcLCpUjNUJzSGAw=;
 b=TfRnkLYYFY0tOEVZHlNqenfl0IClZQqQPXqLGjlYLkIv9UV1M2Wj0dON9sxd1D56ly9xbgAz4
 q8+GvQumUVHCSrezhk+KDg2rYW9vyIIDng0EMd/L7SoUk0qD++sbFOn
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX29NvK8StKfoH
 wRnV4El2/V0K2XG0MYtxz+pzAXGpDbUleHAf+soKD8MLjOyddK0blFOO5wWMFsVZQlcGciTnogZ
 YPjSbo+fDeicvuoxe/RWVIW5zr7tho5hJxHtfqKQdUlHp0dW7lqiBGgisXPuC+IfPgqo5vAU6O7
 L6L2bvLkogFPiUiHfbnlBqzRDo/5zQ42raheupzQt1scVbTKmty/zwBCbQs6C32jyaVVCZpYnNk
 T5o9dVFosIPpLzWJQ39odcxtl4GVv/OUiXuldD4PDogEp9Pb7x+PtucO34CPdpFQunCwBPUqhFZ
 01fr7FgzUnRF3MEYKZY60D7rc46dmd5ndwCFmfc1zky7pFjh9/LSufxXcE9JV7gXqzZGvxG0TmA
 SJznaDz2cd7rlIHHxseXAO4qvYeUzDiZTOc6fQF9IYyjJZLDIrqUncqX8E5iG4YUWU3s58k6P8d
 itH7JBzjyA+PK6pzkMw==
X-Proofpoint-ORIG-GUID: dZARGwNOyeDDCueHvZliP-zDhi9HpQaz
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03dae2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shtKTQ4KWRncmOlHZgAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfXy6hjryoPHLeJ
 tb6wOqlpZo3cBPHqAD7JEc60kXmq1pwWcnf5priCaWZjac/ESWEBKGfUL510Cqj4ROafV1l/c/b
 w3kOZOYoK2q/VeZgao808uEirzUXGCY=
X-Proofpoint-GUID: dZARGwNOyeDDCueHvZliP-zDhi9HpQaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. On SoCs where it is described with the
"mmio-sram" compatible, the SRAM driver maps it as write-combined
(Normal Non-cacheable) memory. This allows speculative reads into the
protected parts, which results in XPU violations when Linux runs at
EL2 (KVM with VHE), where there is no stage-2 translation. When Linux
runs at EL1 under Gunyah, Gunyah maps the region as Device memory at
stage-2, and the stricter stage-2 memory type hides the issue.

Mark the region as no-memory-wc on the SoCs that describe it with
"mmio-sram": Shikra, Agatti and SM6375. The XPU violations were
observed on Shikra.

A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
("arm64: tegra: Mark BPMP channels as no-memory-wc"):
https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v2:
- Explain in the Shikra commit text why the issue is seen at EL2 and
  not under Gunyah (Mukesh)
- Add the same fix for Agatti and SM6375 (Mukesh)
- Link to v1: https://lore.kernel.org/r/20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com

---
Vishnu Santhosh (3):
      arm64: dts: qcom: shikra: Mark RPM message RAM as no-memory-wc
      arm64: dts: qcom: agatti: Mark RPM message RAM as no-memory-wc
      arm64: dts: qcom: sm6375: Mark RPM message RAM as no-memory-wc

 arch/arm64/boot/dts/qcom/agatti.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 3 +++
 3 files changed, 8 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


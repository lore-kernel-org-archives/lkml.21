Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009078;
	b=MG+PGEWK5t9ZjD7tr23+QeMB2+zPt5Kq4DABAA7esNs8rt5/sM+U2afMbCMqDNsX0hLK
	 CKC9xceAvETUcV8cgIz8/fMVV5rkmHWBnyxRvpYyVFQpO1evljoRHnu/02TUqG1UamUvC
	 LuFi9kg991P+ifZ43yNedRG5IEc3HHZun3DNjGmihq7HM7jYTzHPg5O4f0BExpw8gsa0F
	 frnsHQZhSe6kL2Uh/SdUVPbgBE/GzcjVSxDpjE30RuVzI+NgSDsoOYUc0F1hxp538RZGT
	 JH2kFDUH/XsPouj1fNh3ut0SqcydKW9pOJNnkYak3s0MlFQWhLcoCLWGp5Bs2DK0nHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
	b=BxP2SOe8PL6eoVSmgWwuA6PYA+WjywIwBfsce8xhhj5MTURHXm7fg76YCyCb5kGLfV+T
	 RC+D/uiyHvy2eSaCcu5H3DDmvkNwe7JVLPczYq2XSqqTpQRQcIxGFCXvwkB9p5vZYK0Tp
	 KGIdCu3zZN2970YDcRdAar6Grmkcncpk+Mw9tBii4fyPC1TbyMrKCxSuSX0qhXnhKKFfU
	 wyKxkEUmePtHa+MIlvSNab5irk3LKahb5JqIzRLc/7YgiLJ+tdxLpt7Se9SpLJHMBpkh0
	 1D31Uf4d4uWlAjYmCiPVFMxBReei5Lj65RjnlHd1VbloFepXQoEttl9ETU1pQpmauWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK703xtB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QinXnpXl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A49606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A49606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK703xtB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QinXnpXl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQCwY2225991
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fFhEs41KSZ4dfzyxb5QjYD
	d6/8oZJNiaCStnwzmcs3Y=; b=QK703xtBzVmLuyertRufPhXhiZHv3M+NOwMMnC
	H3F683rz9NoD+rlOxQ2G92Ld4lioiTHFXCkLH1RCYthLSL0spIjGM4tNC90rR7D/
	uycQNn0e8vN5C2mhOyN3DEXxkD3YeMR/2XZPfhv4NPJfDAjjzX5Miu7gCHKkZeDc
	BRQusAb/SGu0Zy6pLsctAdokr0eSRis4b8OOfm6HwzajYuB7Sy2v1RKP+NLCx+mW
	xjMX1frRUsEwhprXWirllqSsDMBhqZVJy8TcsKZctn5s3RJdUNO+NOnrcN8iTczQ
	z5qla7DIsKqniO/0EdnhycLibZMNEVM80YqE0DlAz81pFvNw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbb6pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:37:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2cb77c7abso232516137.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795009075; x=1795613875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
        b=QinXnpXljJc1jmJ3I39SgimlorHUvftNVcsFappnDVvWjeTAUTul5BHKHtzQpYdDFc
         3IjdwJre30wUj1zx5ZD+50U8vzgX3/opCmCpxkCrd7Ps5wzQ1vpiUNbPA8T95I1GWINq
         Pe0YZOxqrbT8snME6pdU6sp8I8eIC1U5lKsn6oqb81izwPeBKDAHfs63gexYLQa3uDcQ
         iRoFpelKNKMaSPtslg35E8agoOnqQesnFQsQQfq0+sp8NHnOTQZxx61SMM2kMJtgc/Is
         LiOSowdKRbBCdV+ZNML67QxuB99FSLiFra4VcvFCoSHnZyK/oXRCnrgnL8XEXIc1mQf2
         COzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009075; x=1795613875;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fFhEs41KSZ4dfzyxb5QjYDd6/8oZJNiaCStnwzmcs3Y=;
        b=MU7LmQzkvZpfgojaygQIpyRaDXhq5WAUBoGhDwseIJTkNoqwZF1kNyPpTBif0orcKZ
         +xr8LKWD9r82U+WWsheKPo2O9S3t8fRBpQVEuQsSc/SE1amI8OPHcnUx3wRPqLs/CnFt
         VMZVYLCSAnJwGddoQvaaUS5g6xl4EnBGhmKGeDcewv0zZ0DUuQOPrUYipo4Ns5KAYo0Z
         JqUF87QCcTmaaaoJ9GODq2Ostm73erxx274NNLTH7Owu9eOAiRSMa85Potm7oFVTYbux
         qVDw9RkMG79+TA6xPOpNkIRVFbYo7gPz3s/MGdPVCIrjbUEGiGHXjQzI7B7tL1HXbQBr
         MSXQ==
X-Forwarded-Encrypted: i=1; AL+hErGkgNka8tQPp9DeaMTRuyKkVg+3yyxUwZctVKQhdtvgyjqsCm2CWOcqck3kiC0JnQ9Iwd9oXJw/ziEXAK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xbOLwE7we5cwI+IHzXbFNjZKsuuQD8HghB2LggONb3kzWGDuG
	vlzw3ACgSw6/2dV1oHJkapOJ/jcL6D2qib/cIXHCF7B3eaQNKcvraqPBmTv1z5Ytkm53N2kaHLf
	TUlMnxC+wdvM8LzKsHhLmLBwWKWb9f92WahNJ0opmvugR0T/8Ho7oygURQgcEsPUgaIHvM5z7Bd
	o=
X-Gm-Gg: AYBFou1TXYculk5TDTak62AN9lqioExg1ctHoXfqnG+Jnqf20h+s3KkG+tG1GJlUutG
	EpBLrEGfNRNSBT77OUA1D5w6b2SCiRQ0VyZVJ0TxakBHzTRuBg7UFv2dWOJ7TPzFlL+5tFWUlWQ
	SkPNmLWwogmc8Fu2407SRtEPhQ2rNNGnvmYX6dCg29dzoqGObl4dpZ6ykugkiCF2NYZ6UzauVGg
	P+U0rZzJ4zMm95PQXfJmB8i/tR7zU6HFyk0haZa6BMDf0nxQkA/Q6K8B5RaeP8Xn1ao8XfnNuId
	lv5JQkyaOkWvOACjJcCar5arGF733PCt/4ho3XckTbqd+iDulQCxq3j9CYVTXlg+3pJDj5Z7Rig
	MhWL5ohHLDAOlU6eqXTxLNiJiPUvB1OFkPeYlXbVqxM4WaFg9AFX6jyJiY4GgVt1e5IXDZHG1f+
	f1yII=
X-Received: by 2002:a05:6102:4189:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d6ba423a02mr642692137.19.1795009075338;
        Wed, 18 Nov 2026 05:37:55 -0800 (PST)
X-Received: by 2002:a05:6102:4189:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d6ba423a02mr642676137.19.1795009074724;
        Wed, 18 Nov 2026 05:37:54 -0800 (PST)
Received: from hyd-e160-a52-3.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm1809090241.3.2026.11.18.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:37:54 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on
 system sleep
Date: Wed, 18 Nov 2026 19:07:29 +0530
Message-Id: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABmq/WoC/4WNQQ6CMBBFr0Jm7RBaiFhX3sOwKGWUSYBiB4mE9
 O5WLuDmJ+8n//0dhAKTwDXbIdDKwn5KoE8ZuN5OT0LuEoMu9FkppXGYrUhKRtlkoRFlIJqxLlz
 VaV0a2xKk8RzowZ9DfG8S9yyLD9vxs6pf+1e5KlRYlRfXGlNTQebmRfLX2w7Oj2OeApoY4xdmS
 8JgwwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795009070; l=2451;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=2lmXizyvul/e/Sma3pDMRM3BD6BbkGljnmal79jyzLM=;
 b=sBUfTNcOB7p5tkML481ltXLjh2wlew0tpP0oosaXXdXBszz01eysgOcy5TrSvqhXUiiTDUlJN
 BI2eHfV5XssBr66/mQg+7GotzPIXDql6byfjaPI6RXTQffVzZ9XIAyH
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Proofpoint-GUID: eA_cEdQ9HoXyb9xdgW_JtgSCNyhXNt8n
X-Proofpoint-ORIG-GUID: eA_cEdQ9HoXyb9xdgW_JtgSCNyhXNt8n
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afdaa34 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D0rfVSSvHAGRCStx8_UA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX2EJ2jOhlk0L2
 asMop445fhunETR5R6EkNqixnivPNH8fJA1lq7Y0Tku2fuhdpxWg+Y4RnZZGgzraRvSSfS8evUo
 Qjdu0HhVv232EYv3O7IQR0e+cuAsXuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX2O/kEozM2B5q
 /Uh3GihT9zHqzNaYFfYRPjJs3dL0p3D31zVltil6kCiOEwoJCb147vxwyqT5t24++4hWtJMcXVA
 9Upznflz+PnSHUwAuLSGV/UwA6DKVEcXYm/eXuw+ma2zf1k8OglRP5dblqn3oF4U/l6s5H1kuc1
 eMGgX6uitXowqTfb440rsvfemt7g9MR4FOG99k/AE9nGFZCjma939EkwwXWueMhSWTmLtAidxC9
 4doxOnZncJL1CEQD3GwT1rLlkYLld6cKK3soz4NszUqCwqlnx7uLh9F9/BeIbOJr1/46UiFw5ar
 7tj6HIjN0+Vl97CbAA+/qzCr3p0DtagiHC4LTorV70QORv61zlyuSFF5Qsv7GpMBzuegeUhOXdc
 99iRFu+J2jw08M96AOx2XTUwP+sqQUwF9U7sMd7UNHcY6pUTWHTClktQkRJW1LVaDdRNHbxpQwS
 DmsbuNHcBdNBp2ufUBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180054

The LPASS LPI pin controllers only have runtime PM callbacks, so their
clock votes stay held across system suspend when a consumer, such as a
SoundWire controller, is active when suspend starts. On Glymur CRD this
keeps CX and DDR from collapsing in s2idle.

Patch 1 moves the dev_pm_ops, which are the same in every SoC-specific
driver, into the common driver. Patch 2 adds pm_runtime_force_suspend()
and pm_runtime_force_resume() as the system sleep callbacks there, so
the fix covers all the SoC-specific drivers.

Tested on Glymur CRD (pinctrl-sm8650-lpass-lpi) with next-20261113.
When s2idle is entered right after playback, the LPI clock votes are
now released during suspend and restored on resume. Playback works
after resume. The other SoC-specific drivers are compile-tested only.

---
Changes in v2:
- Move the dev_pm_ops into the common driver and apply the fix to all
  LPASS LPI drivers, not only sm8650 (Konrad, Bartosz)
- Link to v1: https://lore.kernel.org/r/20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com

---
Gopi Chandra Sekhar Reddy Kanala (2):
      pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the common driver
      pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep

 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c     | 6 ------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c          | 5 +++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h          | 3 +++
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 6 ------
 15 files changed, 8 insertions(+), 78 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe

Best regards,
-- 
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>


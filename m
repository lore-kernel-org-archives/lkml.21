Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180670;
	b=2Axps2Q/L9Fhcq282bRq8vUkI+FezU4gRSLvCNn7RmMd5S4teO5qyV1yctJlSxFcL8lR
	 5ZxZg+MNeIH/6zBEcNtEnEO4ePwxuQAaMmLkhMRIWbkFJrjIBUaY1l3nJ1x1ZESf0GB0k
	 9m9LbeTN7pd9mDl7FmhbeY3N7aRUtf5m9rDq7APge723UJ1gdSAlE69I/qwnft0PNr3Hy
	 8biLpoZFfI12jD4U+pjbBs/WOYRIs5Tdg+WU3IL/BL3khBkZ75SRn+Pn5dy6++Tlv+HMY
	 T+YyEXqr5l8IsBS+ACmTnv8s43AFTesOjQVvjVQkJo8XzI2SlurOLrUYJNEl8MUkx1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
	b=YU98mlZNZip6uqznj0udFX7ggCIdsPGgZd/0BQaS/juNlx96DebBck4AOlQeMUIPO0sr
	 EJr0fYCz03J4bSjkVsRANi0h+szmZQVucEqO+dELvB9vcoDMcP2qGqSLNgBc19Bl55Mq5
	 +cxPoWftSYkLOCd9o4ySpVf3idN5TMvapLHqndKh1DxRtv3nhruoqPiCX6g1LqHx6eyqV
	 Th5tg6+PGOq8Z1uoOr4LeGeK8oU3OkBQ80ABBVEZhABD7Osnfv5CcuI7ER7qfpjUm/LEw
	 nh5YkChy/8JMYQGCZSTt1Ipe7qElBfgDPSaPSC2YIA6Ge76XPoGAllkQosCcNCmeCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glPkfccA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyP2CURk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35548606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35548606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glPkfccA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyP2CURk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkf1Y3107601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5
	VymI3MVE=; b=glPkfccAQkvM+KwsJiq8EGJow/vXlIrm8Y3+jclO016Qe6ONnae
	ZKZ9Tv4zv2t+LlcmC+3Q0Uk8O4QS5y2jiIZ5vr8S710K5N5q1hTVExRgO5ErbenO
	A/mZjx2yjTUwpXz0/7Hfig9g1UsfusNj64wwD+N2RaSU7LD4pSt/+gksPO5MQn5X
	6sUR7zFfDS4Ob+p53WaeZsWDk+TTuboT2hcv1Nmsjrpc828ktCVrwFMbaalQUAds
	qKRWBY1srGLtan60fJzFeQ96X6bHpCYrIO9K1DkMdDb47gdYLb/Rau8IxHpyX/G+
	qtKShJle/Ce7dYnInYxjamGJ2WQaYdES3DQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3up1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:17:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so156750485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180668; x=1795785468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
        b=EyP2CURkZsJg0CxkAXvJJnDEuWv8IfaL1K8doDGNHEINRVgLw9SAThGIoEuOaM1Oag
         7B5uRgjOq+bvRwvm2EYfdnhbjVSYFIVukoOYlwsPvEKEaznO9722uqTGOK29ZCz2lE00
         0UuPdhXrUqbaQf2cAcEwtUnwcMK6fGevx+91unJLbcL99mZU/x/++tmVsiePCaFsFwBr
         u0VPmf+4wfF9y1HkjR1347jmW5nX7MTbLyiv24D9+VR25TUVtFWVhhSQ+0rtXVoPlC/h
         qzTj0fmVVVK0zqjrt/4mFBILv/jNhbFTLDUokxsYk0vZHYlXSUBPy3PyuW9/zssZTyPY
         frGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180668; x=1795785468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmAvKTczlmw/BaBQYnANIBlVwzoKLc6aZO5VymI3MVE=;
        b=jFekt005e5dtfjUN1P9ILnkH1uAulwTtqFmDgeTqDTteHTMhNyaSMTyA2gzIXgnim3
         rHJ4QO/7mv6Vn7pFcJOH6vMGVV6exNwHZRbs3z8OP7atP5RiC5GtersKQLKzB0ZLUPHR
         mQ00oFr6egQnRgYKYMmKOc6fLKCfAVTq0C+CdeMLG5y3ay2+Kdu0zDyh4RICXFcdEmNK
         s69WaFQsTt1ix+PTKCIBqDJu0OVjjoUtPJqmfpyfKu0+sH7bWGJ6BThjIcpMawFvsis6
         FWae8gj07ytTc4/W2C35DPwWFAUI1rCFDOj6qZatm8Uc0rBjpYfW2iT8x2lieFkXEhYo
         A5Tw==
X-Forwarded-Encrypted: i=1; AL+hErEGUCkeRzOJ2MzajFDqdUOZXAz8/dDLxLXu1s/Wmp27xdlmEvFbflF2AasSJEH999UJrvlpUFog6ld7cl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V1PxVT79Q/l08AQ7IDIezg5MoGHwGRyrtRPK0JwOVY7v9tnVm
	uf5+2lNqiIFalrAvj/f39rdhburrWGaINtf3hSkwJ3B1hhPM7B9GT6r6e5LFrS52sPK184JXkxm
	h65aRsnHKrjc4NN2q71ITcXJ99iUmKNKc9YVKKA47QN44U42Yu8hHjHeMFsIGjmJb9VQ=
X-Gm-Gg: AYBFou2yuveAPJIRv3b6vXXTX0E+hImZMjEdg+iNM/NKjpcED5lXLDHeEirRjIErIjt
	ShgIy9jiDuvKxSgWhggN8SVZ3T3nrqB/5Du74ew4ijJO4R3FAvA2XSGvqqlLkvffjpgw86dNPcP
	610XFaqSGCAoVHWq1hFErnWisQoaP1/aLgftF66k43jEbO8CFn1gO1uwjZUqrnOZ8BuVfSH3vTQ
	106Hqa3PLZPunsk621ovCd6l8+c9uX+dSfkonKssdvLkEjEylcuRa4lxdHg3jLAtGFSKXsq5Ziu
	LUjzLBSuBb1kUP6I43fTNzZqEOIOmqags1DNvYFSzuWFm6Cw4wrEM4YA7WO6nGecp9BUDaZSVbh
	ZQI6JNOHmbEcK/Pzf1KrUCUFFyK3nbwwdDazeSBYR5+gaOPwommYeIxvXRuZzuaMmgLisVWsdBM
	o=
X-Received: by 2002:a05:620a:4720:b0:93a:1196:ce5 with SMTP id af79cd13be357-949b362497emr696169085a.33.1795180668201;
        Fri, 20 Nov 2026 05:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:4720:b0:93a:1196:ce5 with SMTP id af79cd13be357-949b362497emr696165985a.33.1795180667760;
        Fri, 20 Nov 2026 05:17:47 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm5489060f8f.7.2026.11.20.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:17:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 14:17:43 +0100
Message-ID: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX6+P57gcAGIQn
 puC81fUzflQa2WViZisftK4/cLYRS2rLmCw2haA/uDZx66BhYkNOi1Vr4sL7hOcx3sANlF55f1x
 IKFZt91DPckLLO5R4OuUVD+grZEZ0zPzWgggZBl3bYlxXm7pmQ24UfNfe1FQXfbfPsHifjS7ZbD
 vz+kW8ayM08UgWrzvGsoU+lElQxbheBWtbs0FdpwhU3m7fFVM9TAs30UZXVDgWHYfCpivxBUlJr
 2Hhuy/6+i4zaOSUrjMmoH3AHe4QZuKXv1ORl3B/8gZr832F7mTrd3j7AOmobalYnwoi4jeVWkVG
 CWBpUpfhK4vOeL+Oj8q+UMgEXga4QM3iZiLsQ7tjj5/DgRzldFSrzdZCEtu3Kq++jILFpiMm7eD
 Do8GVfyK/J7jH2Bnn7yzhMOBAl9oAKHn5Ik9LedMPNvV6cKFsOeNut3j7VC2beXf78Bwk6snzz6
 hHePnQEamXGAq/2NPpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX6jm29Xy1j3K7
 3tHKDylUb14kZYnQlA9YPzwdRe+8LUS0m5nS43D4a/fSf1+VGJGPfkLl+HW7+idOrxyM51CTYTN
 MD6yK0Yv/DpDPxZdQslYOYIg4fr9134=
X-Proofpoint-ORIG-GUID: CQCsjHv7OaXeY7aleKw_jNFOVNbkcc_g
X-Proofpoint-GUID: CQCsjHv7OaXeY7aleKw_jNFOVNbkcc_g
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b00487c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=Cb2_Q8YfTQsDjjc_npEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200052

Linus,

Please pull the following set of fixes for Qualcomm pin control drivers for the next RC.

Thanks,
Bartosz

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom-fixes-for-v7.4-rc4

for you to fetch changes up to 21d7ff7d6531b3420727539f04470ddae499592b:

  pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied (2026-11-20 13:40:36 +0100)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.4-rc4

- don't cache new config until it's been correctly written to hardware
  in pinctrl-spmi-gpio
- fix incorrect pull-up reporting for non-i2c pins in Qualcomm pin
  control drivers
- add missing dual edge GPIO IRQ errata flag in pinctrl-sc8280x
- fix a UAF bug in system shutdown path in Qualcomm pinctrl drivers
- add the I2C strong pull-up bit in pinctrl-kaanapali

----------------------------------------------------------------
Bartosz Golaszewski (4):
      Merge tag 'v7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into pinctrl-qcom/for-current
      pinctrl: qcom: fix a use-after-free bug in system shutdown path
      pinctrl: qcom: fix incorrect pull-up reporting
      pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied

Haipeng Lin (1):
      pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag

Joonhoe Kim (1):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

 drivers/pinctrl/qcom/pinctrl-kaanapali.c |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c       | 17 +++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-sc8180x.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 11 ++++++++---
 4 files changed, 25 insertions(+), 5 deletions(-)

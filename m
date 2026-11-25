Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577149;
	b=NoNqEwPCJ9jR5vlPweE/f8rRJbrcCA8UO/y5PxAcfSdKC/in9NHTXd1MIz8UQVgeyG4k
	 ew6zJE1qXW0VG9ilPeZL2ozbAmoEfXq69Idm1W2E6kheOQChPj05zxynx7x71ACUJeaot
	 xNpqB+5gNhoO5oJ18eyNrXAv1TVbWIissHmbKiaXmWikC3+bgn2c9bk3IBZTBgqPWNj2z
	 U9frWntY/bT5uwAHB4TmRwFD8wS9y1UX2lKfx4XDQCvPJDYFvpTqxa/3MrgQfj/XN8o+b
	 7KyBhXkYXPMwJugOe8PrlaPHLOMM21OheBa7eXnDZCSOWRguRRP19vsR/v0v2Hmj3MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
	b=RSwSWByQBtYl6O+t1tEoLDkyINNw2pJf3xzsuja3F8xQmesYpiR0gQqyl9dL2Vb7qZcJ
	 p6uyQxybNE4Kl3xGZ/PNBdJKHq1290R5EhfpLv+c/MvpESwNgUOpKpKvPQVTq4dpssvFu
	 aqkXpAGbHuOIlsgMdIqzVqYCtHyfskeKUQM00IAnSEeerW2gpcnlDXGyHMf9+Fjrm8iJ+
	 x1PUpvzkuBrtNnTsAEKGI60ID9gZUooTZi08r34VgO/utHAjsQ/Jz4sy9x6rDNBXUfWGr
	 JJIksmsdERTCB8yJ2/J44FapiiTSJkvgZwuOcX8xdZHgYH2szbVPplA2nx5OiG5hOeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D7606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B0D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B9GU3014904
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=; b=disey++dQOdh5OZp
	Oq4VJ08I7p7VCR9MX0DTRk9XRQSwk44yzOTh6QARQlpMtUBZwGovX33z1xOMWntq
	2z6hcTnzKfDJSWpj04ZH6sVVaxg5azsnZ9zhKHw68ZNqA7tA05CD12d7tkU7LLmE
	2kZqo/VwQeOVQ5NBT/9/d/3GCyvq/6tqcGGiNNsysXoOigxY3j3Gp9Wsan6eyDjD
	Pl+aFq0rSXtZ/SXt4+eJ5OPfyTharw5PDY6ndx2cLpJf3nO+u19lxtMF1merU5Hu
	ExhTjwpLG6wmHtMAGWXmE/C3COFWm8JDr2wg5lZ/TLkNsD+M52x5csOt7vyxvQRE
	w9Y1GQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbgk9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b203b0c139so3864107b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577148; x=1796181948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=Hhnj4dgvNbMIK0LAs0Oh/XOACn++U00OD3fEVstyHcQQ/pFytKnhIdIB0o9qJ0eJ2K
         TFGI/oAJuWKjluNraPcIgRQ6WnuUA33BwXK3SHhEzsoblMnfXanVKAq2jJlSEXmPV8gc
         0aUMO2upMPSNuMpl47vXtNvudCupk3dg52TrxNA4h6U//3YmUOEXwFIUmHcK8+GIgnGQ
         JrioF8VPd/+vhOeuLkp/N83dKi9lpNL+PMG5mrS/k6RkRwD7ib4Qy8mHC6nMoZJ9pBb4
         2vBfDob+v+GErh/AUloDL55uXpzKpG6LcCIjUPmoaZ9F+W3s/BCXn2vLrIXnev91U1Ns
         pYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577148; x=1796181948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=aSysDg/E8dayBcukBvTu8FUC8Jv2xGtfwolQUv6z63EXZK3E4K4FBcmmRDEU/KftJq
         r46cvroS9MUgjNM9feCut88/Y/FNLXPVwmTHrYVt3x9NteJFCgX09HKPcRW/p58ZUHLx
         9g8bdB8loUdB0x3CcsU5ttWMmf2c+iHyxqejsjJY3VLD2x0YcP0tJh4oRh/oEuE9E6/0
         T57LZ0hwSADvbq+GvPadpAKT4NH8GRTzvItTKCNZw7mLnZTBiHVN48H7ZBUMAEftFX/A
         OBC58CN60/tBRaSakFelZ4QH5ePpJbfP98oi2TwGtO1D6cIwuIvHTZEck4iffMB6JwpU
         MEmQ==
X-Forwarded-Encrypted: i=1; AL+hErEQZ8hx+6PbiLn7AvPpphvKGG/26hUM37INs3cV6TZQ3+rSYKsszcEcA/olh6E/3mh3aA5WrH7oCrT9gAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mldDbS2pQR7+hZt6h+j5q3jP9scM34ypb+Lj4oBN4Yhc1MOTm
	Ydji+r1h3GfNOCXwGQP539OVbCpaPXyqJyJHcu8n8pR4KimACE436O+v19c2zRhjA7LwzQwUrIw
	4DspqmxNb5jCj9ZzyYoRVwqzHdfZJizEHOsB1r5xxn5x7XPpLKyNpb8hs5kjXhYS4W4I=
X-Gm-Gg: AZFdTZfRYK5fpNELTFovTuToIV2v0mjlXgvYz15mqjF/wvvG+wAqwnLX/HfDwcFQWBl
	jzrBHEMKiDDK5RwlHog1/e2aOQSApdTGhcVo/k5NNvkgmjLqKMcunvryoCvgLsOMyNo62KkBrqu
	JpH6GlFV7l351GvbERBoa8xocUYxoXO/78bOPW/nkcq6a9fMpBOCRaLL6UStVGT/jqVeHb6WwNR
	z0ao1EiMcoAjzojD05xgoDH5bsHFBhWpRrpX1lBHs+JMsPT0EadlMecVTSX5J5YywwLs4S8indB
	Rh+40INFGsz4bGvRftNuisk7lvdNwqwgrGozcmM0SjH1hyju59z9rNi/ypqA8qRwHdSQFso8FtW
	gGY3tnjYPuuuARU8qFC8xpcOvAZyzGQf/1p54wESmPi2xFkaYN2VulEuV0ExO/GWpQ1eU4evrv2
	3sl9dxktU=
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051799637.8.1795577147900;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051761637.8.1795577147412;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:16 +0530
Subject: [PATCH v12 9/9] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
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
Message-Id: <20261125-glymur-v12-9-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=1036;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DbPABSYVkpMlvsV5R4AOmReFgmMQAmLdU68WF9AOk7s=;
 b=1+q+G9l1KysEPxNfsT3JDoeLn4WSzohIQEvczL3tRSUJ2wuxSCNIIFZEg9yJPvbeW6cWOMwZv
 j29tQo5lDfrA+/fxKyUQtotFR9C/tob5keXfp/2MJdJx/iRFs6kiK1i
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX0x1oXa4kQxtW
 QcUzOjMAVGU49DXf+pZIYBjTyGXuGnui3nLulMI9P/5veE+lKy9buguF681WuimwCLaaiX/qCDj
 4Ygkra9PXVWhOWvdPcbhzs54VItHuzk=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06553c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AZ0k4gBlmfIc1QQ3fuQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX/RztPFYkPQQT
 gL0HDOuEjN96KQka07GWCvW+ZgiGaBRvqcefsaxmjJ5EUYLTrIhL+Tcfjc5G+Yq0v2j0a3ZXJLP
 fijw7+g12IIdvlg+ZpHBtysHqvo2pZJwwTgYJH4hcVacCoSWDBjzj0zRX9wBeMzCSw2Yuy86aXN
 Rnp/KqUgO1s7YKPOC2+28ROicJNTRQNjPFAnzaG7oi7CEY6L59P1arhF0bH/nSRDEiDqlHwdcPy
 hebhp+rWcJFPfXTcWGrPIYTJ/gw7yJkOqCBgV/rJTCIuLQtTVdjqTGAQNombFQbxb6Ni5iw7ws6
 RUEKuJiBg2W1c/QHVtXsWrpJT8nMZXZE2YkitG5upRLdV8pIvcdR3x/6IrZdEi5I+ed8NCNZ/wf
 riGaNHC9mjEMveF7jqsKgRTwtO/3oQypDu6/fb7My8mX1lrfDnk0Gm8XbFBY707uEQlqiaTIN1r
 n6e02E4eM9Kx8rVXQZA==
X-Proofpoint-ORIG-GUID: NTonk0ESK7KT-PQPh-0tPjaJ8tpz4eui
X-Proofpoint-GUID: NTonk0ESK7KT-PQPh-0tPjaJ8tpz4eui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..17947e7bd6d5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -521,6 +521,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic45_default>;
 	pinctrl-names = "default";

-- 
2.34.1


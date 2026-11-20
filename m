Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203312;
	b=DPtKrs8sxR9Rd97VT4PoFlanearsFJ8S52ONjYeBaMUOxcKxBlGnOaAOWD/ycY4TK9sy
	 VXhu4c3MvF2dCfjorZXmLBRhle+ygoQ9eTl8cFvUPJWzS6Y1Cu5rF0p9V5L/UVsPatxy1
	 4j6mAZ/I310cP5xiHSzhceBcNNfHiF0hYIjri9ODipt3OchO+Wd42grFeba3T53lbUjsD
	 xFy97lbwa0udo1dB/EzQ5qU6Jp4Wc0Oe5Y2x8/hlP19UIPC1I1lXTkMRfnhf+Vug4p1P1
	 t8hTdm38AJA9MJlwp+IO4IWNMgzRWNjFf+4PMfXnPs4vK3QbUcUjeYHxRcvkv6UfuKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PhdJh6TXGoY8x4CEuXnudrJ2IQRnUJH7V9pM0VvSGeI=;
	b=WrUknDrwzU53zuxqlrdkPtkUShH/ZbQgO8nhIFe8VZ6eOktJH0UP64dW4c0K6e/ycs3l
	 6TaW3TVpBPk3M4K4Y+eCFJibj1wCBEwbKzVUpbTSInW2M2OgzjGWz0IrM8L6fdX5emVPD
	 DXFuMtdOorLFwWB+QnpxEE/lXdDfa4q/WlusPmK90GC3BwPMOnJB4eADNX403IvjQoQBU
	 CS+VKgFLkZ/8Or1InNdvDKgfTf15LVUeAwSMsp5cLWX5145g+IYeEZyrAo7knZanD6nXl
	 WpbFjJyaattddzDP6/GRGUTlmXmX4VEFutK5+Qoo1V1fW8tClPZLmAXWuRBw3/LIFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GpNXSCBX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dvKddxe3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B56606A6F7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B56606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GpNXSCBX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dvKddxe3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfZ0E048964
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhdJh6TXGoY8x4CEuXnudrJ2IQRnUJH7V9pM0VvSGeI=; b=GpNXSCBXe7OfN0MP
	GT1E5g2LX6DkVq71XJkygudfswpKNkulrzzp4oaU17lZL31lScbO4rgpgwhmjjWS
	OgTZQKITS5p+f9RTQBv1pt4SShMAIE1l6/owMWWkq/W5Wm3/wD0gQNEMSZUyBHGj
	YPDXwYJWsn79+cdK/SV8zvKdD6myygajmNI+x0khaxzG73qo4p0+4NeX8cZFB3Wd
	x42EPscezoUgl9C6e2vWPO41dty7ZfwkAwNrfVb74WksKZzo9aKsJm+9Pm+OdiyE
	IUoN035W40MbPOR3pLC7o5/r43NG7DOOEqDCZ/EfHx3PYn2KdbyMawsVVFuscdY0
	BltxBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4j62p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5364f562140so24430981cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203307; x=1795808107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhdJh6TXGoY8x4CEuXnudrJ2IQRnUJH7V9pM0VvSGeI=;
        b=dvKddxe3Uq/WAhOBfmfX7oYQtmtU5lYx9O9A3rtdm7IYLpgBR4/cLIIlcYW/JaYzsn
         un2jL7rmGVVcbDG/t8hUUrbG1E5KA2/IO/ShVzCb5noTELcgjYFwL0fDTel0LMGYbXbh
         c1b2t+6hJIs+ezjkdcdtgqnZmmtrnzfSeeouH+eL4tThUlkvj7jTiibbLFzAnVPEZKvD
         YEpMMy1uWCLilid2PTmEmNlFAU+aMaGZJQuF7W2gqErvALcm9S3mIrw8i//Ax2nxzeCC
         RgnefS+RRO4tMtQZWuBcwdD79lgFvVHjeWXmMtTBM0Zawf0jJYc76X+bT08/e4lGHGPe
         2liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203307; x=1795808107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhdJh6TXGoY8x4CEuXnudrJ2IQRnUJH7V9pM0VvSGeI=;
        b=NCOm1vDeq+fLH5pv9I470zWBGXlHCo624QirLXRO+h/pYsrN1XAgvqcaYbFq5BfjmN
         d3r8IiLI2Z09nOoln6ai5Kz4C8lzEGD2NrgT3ChG/0EWe8ctvgtqYfrbO14m62+t5ION
         5mZ3540A9DJkQZudUXdylcWh5/zluw3gOQB+CXrvLEeTVWxbpohPBhcBn55GW6nBJYtz
         V2VDBiDFWRaS/0Td9Jg1uq1fxTPtXX5AqEYAis/HxknDky4kzazRRcatRpM0PzwDxQpA
         f8dT1QGG1nyVsKTrmwp8XJIGlEPdCDonqpSwVO5eeXCGoYUxPNueTvbLyqNNLiwt6SSa
         hPsA==
X-Forwarded-Encrypted: i=1; AL+hErGfa/k8F4R4gRbdLaqsIbkClwU8Y5nL5H+UxR8BBl4liCQQiEXga2BMQ4HQtQa7wOYJsWCMLNXZSzmdKxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K8ARRFfskodhfx0azLhzN7kJQ6B3Nov6mlH14Ql/YXVw+/bBX
	LWqmVUWyNnd72sY2T91xaPd9cGJVdrG7KcObooYAzTaeMYGp79BgoED3KyvF7qi+bhzZf1W/KtE
	HcgiBL+a/QkqVlt1gXZsGh+4ogwizCW+InGh0jTovsGMxNMSkmxOnr/ataGKmOmKvQEo=
X-Gm-Gg: AYBFou2S+adRphTXlsEuaOLRSRHLVZWepINwlziUoSBifI/Fws9W0QsKoTS0Qi/x+1k
	eCLQqSfPyTJd9crY+cEjXiC9yKGoAubpA3s0Xdl/ceceRsJ1hF7y+a0H5PWWbR28Li2L67SASfS
	mBs1lbeVMlrixdyIH0QL8jnnE1RQJLOXuutyNkKT2e80Kpd6Y4rsILoqhP+23RV/v060it46keQ
	iXWOUgRSZH6mQVugiC3FoSX91uDrBr6mUwYdnQCFUU24OL3cV6k1rH9cK8rCD/mzWlt4FvoDwlJ
	Dq0cu3ABZcNgVwzdjRuLSFiQmGzH/9+Ge+CtNxc/QgrTWckOMvBRSw/wZgmzEjMqUJLlPDFDpTs
	Ayq9EqpdXyQe9sJsWk/hWIDBDjXAVNARDGriNC+gUhYDlk35hz8QvVt3lOj2yIQnqkVlVLui3XP
	qt
X-Received: by 2002:a05:622a:1248:b0:55d:2dac:9959 with SMTP id d75a77b69052e-55d6fcf45c9mr85369121cf.21.1795203306646;
        Fri, 20 Nov 2026 11:35:06 -0800 (PST)
X-Received: by 2002:a05:622a:1248:b0:55d:2dac:9959 with SMTP id d75a77b69052e-55d6fcf45c9mr85368691cf.21.1795203306131;
        Fri, 20 Nov 2026 11:35:06 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:54 +0100
Subject: [PATCH v12 1/4] crypto: qce - convert to auxiliary bus
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
Message-Id: <20261120-qce-fix-self-tests-v12-1-b5a2a44bc5ae@oss.qualcomm.com>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
In-Reply-To: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14968;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V6aRPg3B3ZZfmnjvNZMhHTscOixyOvOMOA+CmlKHj5Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDk7VUsmmxFyAo6CKa8iLYprc397bh34Q4Mf
 7TPGYXV/+eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5AAKCRAFnS7L/zaE
 w4iHEACbR86RjEQlb2P1UCw5Oo5kEAsTZsPcc8JDi+bG8IsQSnXbrHkeT/lw3mkuWUigkEAvoPw
 xXA9wNFDczTO5UCe7c6BhDc9nsBg/Wolb1GyxBrjAXTrdKVNqvOYdKaTtVKXL4uFpeVMir6URBR
 rasBU7sIWgchXRzAH6nFpSz3sA/QGuZ62xrRS9FoQ0qx3qPakjI4C+iuLZn/wcrEeulBCByK21n
 xaz/f2ff7q00913RtTDTnoFnnng6WS5pYpWjSNUWiaWac+aIEfuh+U6N9mTUIpDl65OYc5FvSPY
 1WKNHX80oOxCBarAjuI4IzLBBJ2FNoOhcY/GawcGcl0CM/7otroK+58K0cQ55LEmn1eMLXRXwxI
 X7NsOpMeUCx74/0oa5yPkGrhE58ofB08r/K3hYGS/i0RV3kGZcOXcKScSgXS40/gnV2EQgEyE2q
 sMbEzf4hzpCVby9B13BZrIzflKoDNyNSFKwmZQPoJPBjAOGZv3+qw6lRaNw7IRPNToHLtKh1FhT
 0QZn1Ud13kQtByoqgUWGWPXtVMPKpd2xSEjsF15QM247F/UimpS1ivjU0mkma5t4pVB4GYn/hiD
 z6wPp0YObi6fuEdEWzcgnjSG6UZSkwnOtJS6zWz5xPIWJqXpHfuKOFPzNiTa+9yQUCHriEbPoXQ
 maxObfQieJ+Zm2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 9_JGkzdDk4rup_XgpMzZU3g2CRE3baVs
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00a0eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WPyFHUJR_z9Wl-EIX7EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX+HpXAs2SI7V6
 h8w+fr475SkXx2mPHkRTra1jMh3PbDxErRxRzj6r1ESI6N1vZaXpHFrYcgCPGkKGS4aFL/zLDNa
 yAuZSj2621EytE0qPx+7pC14pOtK6PA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX1WeGE2BfNtR/
 4EuDz7xEvTBi77A4fkWYeAOtQUqXkBFqQX8n9g94OS9z/sH2OepWp7vpQiHxqSgjSFtfcvtRbxC
 Mn4+/sXZ0/I/wUaF3e+I0Rc1kCRLNCY4RH1Ym3gJ6q5+NfpMwoWqL/CfcW1QgpGgSNpskARy5dI
 +mop9OKIQFy9F7ijFXsMa3SHTEyQonZQjj4KvtfFgqUPdm9RJyi31jxijsttuVG1GxLJFjdFi4q
 Gh1vq74d3stE6LXzXfUpuHuA6SxsCpmSApc1RidPLjZjUWzmvkEF4AUZokkzuQqq+VUS0KfbAxf
 dZN+4c5gCCEI/J6yxRvx43tdCWgbTNKgiQ1+DMLjD89zcZs15F6pmeO2fCd/DeI8tSLMJuNQZeC
 rQi0tVgSfRz4lai3jVIRv+U/psP9PNsCp9hZzai5fBV4b3ibhDwQ6GcFQQwHZEMk0CZtYFyZZX5
 NKMYMOKCBqt3Y7PBhUg==
X-Proofpoint-GUID: 9_JGkzdDk4rup_XgpMzZU3g2CRE3baVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

This driver is disabled in arm64 defconfig but one of its
functionalities - scaling down the interconnect votes to 0 when unused -
will be moved to an always-enabled core qce driver. This upcoming core
driver will also be in charge of registering the qcrypto device on the
auxiliary bus so that it may be enabled if desired.

As the first step: convert the driver to using the auxiliary bus and
remove the interconnect management from the code. Update the power
management as required and make sure to use the parent struct device
for DMA.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/Kconfig        |   2 +
 drivers/crypto/qce/aead.c     |  12 ++---
 drivers/crypto/qce/core.c     | 100 +++++++++++++++++++-----------------------
 drivers/crypto/qce/core.h     |   5 ++-
 drivers/crypto/qce/sha.c      |  12 ++---
 drivers/crypto/qce/skcipher.c |  12 ++---
 6 files changed, 69 insertions(+), 74 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index adcbe15851899917fb3039efe89a77c8fe712bf1..b3fa1f6135bce345cc58387aac7ba803a82aff69 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -530,6 +530,8 @@ config CRYPTO_DEV_QCE
 	tristate "Qualcomm crypto engine offloader"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on PM
+	select AUXILIARY_BUS
 	help
 	  This driver supports Qualcomm crypto engine offloader hardware. To
 	  compile this driver as a module, choose M here. The module will be
diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 8ce1a9f3c9d80ba46d5c074cc3ef45c69acf52ce..2065c46162c217484016021bbe3ee2f2db082e65 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -44,9 +44,9 @@ static void qce_aead_done(void *data)
 		dev_dbg(qce->dev, "aead dma termination error (%d)\n",
 			error);
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	if (IS_CCM(rctx->flags)) {
 		if (req->assoclen) {
@@ -442,14 +442,14 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 
 	if (ret)
 		return ret;
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 		if (src_nents < 0) {
 			ret = src_nents;
 			goto error_unmap_dst;
@@ -478,9 +478,9 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	if (IS_CCM(rctx->flags) && rctx->assoclen) {
 		sg_free_table(&rctx->src_tbl);
diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ddb4df3d227f801e566422491b488c5fcb777717..7c72f9bd36b9d25f1f1f465bd8488c907f530c79 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -3,15 +3,16 @@
  * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/device-id/auxiliary.h>
 #include <linux/dma-mapping.h>
-#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/platform_device.h>
+#include <linux/of_address.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
@@ -29,8 +30,6 @@ MODULE_PARM_DESC(do_register_algos, "Enable registering the crypto algorithms.")
 
 #define QCE_QUEUE_LENGTH	1
 
-#define QCE_DEFAULT_MEM_BANDWIDTH	393600
-
 static const struct qce_algo_ops *qce_ops[] = {
 #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
 	&skcipher_ops,
@@ -92,12 +91,7 @@ static int qce_handle_queue(struct qce_device *qce,
 			    struct crypto_async_request *req)
 {
 	struct crypto_async_request *async_req, *backlog;
-	int ret, err;
-
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(qce->dev, pm);
-	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
-	if (ret)
-		return ret;
+	int ret = 0, err;
 
 	scoped_guard(mutex, &qce->lock) {
 		if (req)
@@ -121,8 +115,21 @@ static int qce_handle_queue(struct qce_device *qce,
 			crypto_request_complete(backlog, -EINPROGRESS);
 	}
 
+	/*
+	 * Hold the device resumed across that whole window instead of just
+	 * across this function, or autosuspend could gate the engine clocks
+	 * while the DMA is still in flight.
+	 */
+	err = pm_runtime_resume_and_get(qce->dev);
+	if (err) {
+		qce->result = err;
+		schedule_work(&qce->done_work);
+		return ret;
+	}
+
 	err = qce_handle_request(async_req);
 	if (err) {
+		pm_runtime_put_autosuspend(qce->dev);
 		qce->result = err;
 		schedule_work(&qce->done_work);
 	}
@@ -155,6 +162,7 @@ static int qce_async_request_enqueue(struct qce_device *qce,
 
 static void qce_async_request_done(struct qce_device *qce, int ret)
 {
+	pm_runtime_put_autosuspend(qce->dev);
 	qce->result = ret;
 	schedule_work(&qce->done_work);
 }
@@ -195,10 +203,12 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
-static int qce_crypto_probe(struct platform_device *pdev)
+static int qce_crypto_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
 	struct qce_device *qce;
+	struct resource res;
 	int ret;
 
 	qce = devm_kzalloc_obj(dev, *qce);
@@ -206,13 +216,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qce->dev = dev;
-	platform_set_drvdata(pdev, qce);
+	qce->dma_dev = dev->parent;
+	auxiliary_set_drvdata(auxdev, qce);
+
+	ret = of_address_to_resource(dev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(qce->dma_dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
 
@@ -228,20 +243,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-	qce->mem_path = devm_of_icc_get(dev, "memory");
-	if (IS_ERR(qce->mem_path))
-		return PTR_ERR(qce->mem_path);
-
 	/*
-	 * Enable runtime PM after clocks and ICC path are acquired so that
-	 * the resume callback can enable clocks and apply the ICC bandwidth
-	 * vote before any hardware access takes place.
+	 * Enable runtime PM after clocks are acquired so that the resume
+	 * callback can enable them before any hardware access takes place.
 	 */
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
@@ -270,31 +283,17 @@ static int qce_crypto_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	/* Configure autosuspend after successful init */
-	pm_runtime_set_autosuspend_delay(dev, 100);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-
 	return 0;
 }
 
 static int qce_runtime_suspend(struct device *dev)
 {
 	struct qce_device *qce = dev_get_drvdata(dev);
-	int ret;
 
 	clk_disable_unprepare(qce->core);
 	clk_disable_unprepare(qce->iface);
 	clk_disable_unprepare(qce->bus);
 
-	ret = icc_set_bw(qce->mem_path, 0, 0);
-	if (ret) {
-		clk_prepare_enable(qce->bus);
-		clk_prepare_enable(qce->iface);
-		clk_prepare_enable(qce->core);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -303,14 +302,9 @@ static int qce_runtime_resume(struct device *dev)
 	struct qce_device *qce = dev_get_drvdata(dev);
 	int ret;
 
-	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
-			 QCE_DEFAULT_MEM_BANDWIDTH);
-	if (ret)
-		return ret;
-
 	ret = clk_prepare_enable(qce->core);
 	if (ret)
-		goto err_core;
+		return ret;
 
 	ret = clk_prepare_enable(qce->iface);
 	if (ret)
@@ -326,8 +320,7 @@ static int qce_runtime_resume(struct device *dev)
 	clk_disable_unprepare(qce->iface);
 err_iface:
 	clk_disable_unprepare(qce->core);
-err_core:
-	icc_set_bw(qce->mem_path, 0, 0);
+
 	return ret;
 }
 
@@ -336,25 +329,22 @@ static const struct dev_pm_ops qce_crypto_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
-static const struct of_device_id qce_crypto_of_match[] = {
-	{ .compatible = "qcom,crypto-v5.1", },
-	{ .compatible = "qcom,crypto-v5.4", },
-	{ .compatible = "qcom,qce", },
+static const struct auxiliary_device_id qce_crypto_ids[] = {
+	{ .name = "qce.crypto", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
+MODULE_DEVICE_TABLE(auxiliary, qce_crypto_ids);
 
-static struct platform_driver qce_crypto_driver = {
+static struct auxiliary_driver qce_crypto_driver = {
 	.probe = qce_crypto_probe,
+	.id_table = qce_crypto_ids,
+	.name = "qce-crypto",
 	.driver = {
-		.name = KBUILD_MODNAME,
-		.of_match_table = qce_crypto_of_match,
 		.pm = pm_ptr(&qce_crypto_pm_ops),
 	},
 };
-module_platform_driver(qce_crypto_driver);
+module_auxiliary_driver(qce_crypto_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Qualcomm crypto engine driver");
-MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_AUTHOR("The Linux Foundation");
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..6eda6e617b811420c0c3cc53988cb15a23abafe2 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -20,6 +20,9 @@
  * @result: result of current transform
  * @base: virtual IO base
  * @dev: pointer to device structure
+ * @dma_dev: pointer to the device to use for DMA mapping calls; this is the
+ *           auxiliary bus device's parent, which is the one that actually
+ *           went through DMA/IOMMU configuration
  * @core: core device clock
  * @iface: interface clock
  * @bus: bus clock
@@ -37,8 +40,8 @@ struct qce_device {
 	int result;
 	void __iomem *base;
 	struct device *dev;
+	struct device *dma_dev;
 	struct clk *core, *iface, *bus;
-	struct icc_path *mem_path;
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 738454dd35655a8376bc878444fcc3fbd7535956..3dca00e53e473d3d2f2cf02cf12bdd38e51dc539 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -48,8 +48,8 @@ static void qce_ahash_done(void *data)
 	if (error)
 		dev_dbg(qce->dev, "ahash dma termination error (%d)\n", error);
 
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 
 	memcpy(rctx->digest, result->auth_iv, digestsize);
 	if (req->result && rctx->last_blk)
@@ -94,13 +94,13 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		return rctx->src_nents;
 	}
 
-	ret = dma_map_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	if (!ret)
 		return -EIO;
 
 	sg_init_one(&rctx->result_sg, qce->dma.result_buf, QCE_RESULT_BUF_SZ);
 
-	ret = dma_map_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 	if (!ret) {
 		ret = -EIO;
 		goto error_unmap_src;
@@ -122,9 +122,9 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 error_terminate:
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 error_unmap_src:
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	return ret;
 }
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 79f764429edc469a4f06319b0113afefc96a5ae1..7067c4c20c1e7f8d55c2112dd91a9acdafcb9b60 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -48,8 +48,8 @@ static void qce_skcipher_done(void *data)
 			error);
 
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	sg_free_table(&rctx->dst_tbl);
 
@@ -124,14 +124,14 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	sg_mark_end(sg);
 	rctx->dst_sg = rctx->dst_tbl.sgl;
 
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 		if (!src_nents) {
 			ret = -EIO;
 			goto error_unmap_dst;
@@ -160,9 +160,9 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	sg_free_table(&rctx->dst_tbl);
 	return ret;

-- 
2.47.3


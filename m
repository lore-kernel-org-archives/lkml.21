Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065240;
	b=bvPmNoei+wcgW8o2hYhl7V+06WDqwRkWm0sNnQM6ExsKv1yd3gBF1P7O3Xy4lclthHAN
	 IDGq4SXDZWCNiJyN7bBwDtdKwOu/8/R3l/+FyOb00IKfnF1wkNZhQNxGmPw2vfpsx2B+n
	 gK30cVYvm1uC26RiRh6MfjW74G+1eaV/8ZwPohTjvclzqq8NMibsuplz8mTVlwnpb2SVV
	 GB5zmAEjAovq3z6pttnW3kUc73BS2ejuVC0xFmS3trYWhOWxo1ECG0/vCi0hZaEXCP8Vr
	 Tn5xNCvPn0our7Leae4D2IO/fcFTdJq2GuSKc1tyK7vFNlqIMyTPV1QhspFPa6Z0REQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
	b=MurWPP1kEVm7FTC3Y9VcVQ0qbnnZdXVbz6U4g2NImAd5IF6wTa4NjRGJvOpTJGY5gzkc
	 kY7uSsz8OpLzVEDorbW++LJ2MX9f2RhAOwEycqRGAfTphgb7eJ2GGrZvem705C5vVSKsE
	 mfofeBUk62gN7E2Sq3KOiZYXEazmPAP9pqyAJbeNFKrjBEHcgNOVEWP+oUjHrub8IX1se
	 5g4w3V3WgQPjYKFl4uEyPJF9GFmhoe6SaBMWWucwW3ctFoEmwg3HXkhGPFvJHdMci64iO
	 9cvc3zO7ML5ZfTi1vlQkBAY0kKq+/AWZ1B6Wi8PcOe4aO+b84f0mqiMd9en+U/wQ8Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D160A3808
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77D160A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1BBWX935930
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=; b=fP70baho5vi8arhx
	Xn4biNEzc/MhGKMFJnVti07rCRdz5vNjrGAMV6vIhZ/JZkcYsCaeWovz34TVcoz8
	EVdtZcz8Befjj7BeBpg3LAzw04vnii5b8EAJ0MEOBGt5JOO+yhAi12MLRS37qh6l
	5v1MXk60Nlza8B3FLEX8UfI5YOsxWFqMldaAP2SAaqewnP2aW4KRn/VzmRc7D+ue
	D0RuUiqQi8sDrb+ISDt1UC9fLsd2yUM0XAf32MacpPXecJlx5tm9iz4lR1L6u3+5
	X1JfEYgmj0JfD9+FL/k/IxnaUzIaCaQbGM1Cy7mNzaGpVCM2kFyEoX9pWRJjyxet
	++ywkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcryvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1332360a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065238; x=1795670038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=kmcRvppDBhlyvg3obi3MlgamgMj5hQ8zRHeuMQfjoJuHqs97NMTGEcquY2heDTEG9x
         gTQ41XkDmTQpWZLc6YmeMKgSOJWwkHDp5JpyrxK8eSBSjbo1TcJKDD+6D729yU8EUQ+W
         RLKquHw4rTyNzPdhq+1k+YVI4USX9memYMhuDHzQy6uggKSNSglmqCCOIUA5bIDEvMcS
         //uD4vR9Rj4yUhInwVXbmWQeeNv96/LNz3U3VyIrnWvBzQkSGQrSdoDwOSQEp1pWRSKO
         CU3o/V+dU3owtCSGMZZu7tgHEKtZh2QQxMQ9a/XNT8D26T/tKYT2tPqRc9K/4cTzN3Xe
         amPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065238; x=1795670038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=dWN7ZKFVYaxd3c40jHl23d+2EpCxxn0WVe/a2bxvEgUexliHvRvKXbuDtx24pNxwGI
         JObeMlJ5ReXmV14D+V4Aq+bnhemT5xs/KlK/bjKz3H8rmffHTTDnvWQa4D07jWbURsMn
         MaqRH3kpzYyHmoFyEa1xLi5CaOjv8K2Oxg8CIEjj0ECqJyzYZh1qqg/jtPXZqNaaIXpn
         fkHLNGjjC7z19gQPkO/y77GF0CYtMmW54r9PbRm0MRO30CSb0X4bUG+vQ90/SREK87d+
         hD3exbFChY7b8XCBp0NkKcSL2lxbLO+hsqlnVVJxMffaB6cSAEpUT3T12lAljbWFaAVV
         STYA==
X-Forwarded-Encrypted: i=1; AL+hErGv86huh3MHF37vaT5ch9ZDdejRjR0DedDfbjmOWvIFdBlr7C0R5CNlgS1dLKEMvtdJ0CbZnO5oZWlifAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7IQd6rP/iJfBwW7lXqJ3z0hiWW5zVm7A2Q8Ql/3WvnqfDo2Ya
	j30Lc7OYrJGckjBABjRhiMbcZimaBlpyBkBvwt8apHg/Qlxw4M8v4zpL9iIVHjgqUSF2r3YqeYK
	7ZgLmbPjW7aVgfuUqZJK+A+hFJakuXZptvGPSIGx+a/gncY/QQWDITlYB0DeMqmxpqD0=
X-Gm-Gg: AZFdTZf3O0olTVdB3Go3uehd3ZZtppgkGN0EUDWgKTupvsURUMJqatgBMsPNeijuAYU
	iWkPkFQuxZbGHbl/rvtit3YGpPjIeS0z/hQakLsqESTEdNe+MXmalwzitxL1jk+T08Qx8+zgow2
	NvMI4atC6mHwaNDx3Br6QRAiYJjPnkDhkZU4g3cjZbuYe4l53Kr31fV11ndN101kxiq8RFK41yy
	oV2qWjCmaizacBvhDkRVnB5JauABohwduOb/otkW7IXxbA3qQjJpC9dDmRaKHbY5hVJjnCfMeHo
	gVB+Lk3P89Z3Z70HX6mc+a7E/OZc42Swh3Nclp1lY4ry9cKNfqCdacmd+mJqmlE/hM2QALD5K8q
	JOKLzo5CbQe4USXKTAQhCUgPoHJuCtvPDgc7PnjyCr1wgLsi8c3y/niWpT8LpCJnpOX46NZeyEk
	Da5rsJdVY6wzogBqyGB7jCrzx52JUCjVAyR7OdQHEAjBS4sAg=
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127745ad.53.1795065237737;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127555ad.53.1795065237254;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:56 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:28 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: maili: enable iris on mtp board
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
Message-Id: <20261119-add_iris_for_maili-v3-5-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=696;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lhLLo1Rnt29vJGWnH0QVhbx6kqyGmQ/yrLNPDy0HyVc=;
 b=Cf4U79Rz1iV0SKlFCxZpD6fjFrewyq2fm7axjX+nag+IKleAL5x1/D0JHHcfaXjESCRyvrBcS
 LHyetPcgvLOAgraKKTziPADLagUkW+XCusmO1GY0Kw84np83EX/lRUI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: OlIRaFYN439pJjPoxKds4U-S_5vFZ4tC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfXyyXe+gKRP63g
 a8B/6biUkrPn/Nf8eWcRhmWsHhlKUBYlx5j7uxWaDinczxLGYAZLhkwWKNorvcbCvyDbkADtnVf
 pqfCuATuQfXkIjzNT5jP1KLD8PdAP80=
X-Proofpoint-GUID: OlIRaFYN439pJjPoxKds4U-S_5vFZ4tC
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afe8596 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1_ts_jfFenCfOmJzNDUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX3xfiN2zewDEk
 hKJ7dY1AZEhfoH0YYeMCbAkkcXdLXbh52kpdH2xgk+lbAvbGA+GgRDIW68CAyrhiTeyPM6UcRqb
 xzMVxTIjnL2IY2TJGbsSv0QIl7h/AfKIU6ucoiXJwMNGer8oMPHqa+8cvja91d0ocncaOeosEg8
 21/792JgV5mPUA00vRi3qJXT4vzuAx8oJNMyTDPpXjKbLaobtpsJfTmbeJKZjjTZUFA7hcl8bKY
 0dC8hDFGH5YKCQLb9uX4PXyHuzWie/rY1CS61LyGQYGnY32fAtPbu6V0E9n6mWOm+16jz3I7pww
 QvAiPLZP/nNt7AvP0KsQouMsplZTS5A0481NRRtiVMIN57k8Pb1LFDDjPFNodDFB+sUlMzfTojD
 lVYlsf9KoMg939UF7ux4TzNUfU5yiHHR/Kb2MlDvVnzW2ucjDw7bwFeJgnOnFm+BEzB3+jhep/z
 X5KLImwY7ZDz3EuXX3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Enable the iris video codec on the maili MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e07f1de9becf9aaa8b92db6d33707..22d9a420add7773009f95bc37f46f5201af7ab74 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -743,6 +743,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p1_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0


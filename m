Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007364;
	b=Wrg5V/vXYr/mklGig0Gk53QQqeS1dam6ddVsMR3krO0mgdSzT9W44fp8kjobQNCmQEsK
	 QhXym6f6jIUws/rDFbnvg9Q/oBd54+q1eLH544/txazIi7txbN7IXgAbrbbTR2KO9HciI
	 h/8H+Vu/mkwkmZIdLbVeBAyotanxMfInElg50NMN1Rtx7vioncQYHAjr35A2P+8oWA9i5
	 Q5l9heeKd78SgXLym/ueTATjv4khy1ILqrTQCZTZqDAqckHJG+FNwP4xvD8j3YWgdvc97
	 E/7HUBtFfiZX/QwJg1vobVI0X7/v+Xzv7j3aPbDa9Dko6TkzZe2NZJB0TMPCuoPY7Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
	b=u4ihn9OhGYvTAcCq3BFLXplk0uoA0qHPnN0YMcnaXpcUwfyMXiEV83uuqLbprV12VZ72
	 0C4+d5BO5Q2aRTYhMGh4KDLzybE4VX0oa+HCA/vxIfmhgReJbTbQgYvCoP20uMWP7av2x
	 bcqr3ZgWy8eEpC0DGtITLWWut3Ac+9uHSKBHyHj2b3nIA0ted6BM9tWa9uCxQujNR9La3
	 YEmqv0+3/rhF32nizMhekVANAns0lKXx9NTC+vX0zj67b7lGZZnx0xLp4jHicMM57Prvl
	 GUYQaelaF29qrcAT6yOBJMQ8KjYAyCgnZD5K4mp5nhu3Qr9tcsS1mncvqTQHz9+Sbpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g4Mm2InU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1HaQ1B8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g4Mm2InU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1HaQ1B8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLFjv3420537
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=; b=g4Mm2InUlKtWel8W
	AxFk2UYEeAs/Y4adM6uBs6VVrikELWv71NK6QSY0xFKeC4/Uyp0UdKT7bIwkbxiq
	6wXUN6KAsdXLKSFORbje5RI171Uz20MFjy5lebVO2Ye68nboGkj7gHu6JJtP634N
	mVYjKJWldUuMZyf6Y0/yzE5EHwkSt0e9RJQ5nSF8WP9nl6CeSFuNl9ECACDNwsyC
	l2M5X0xl5NXxOkwKEE4xCo7Mvr0rJwGD4o9KI1MNoZc6VEw7izz3icrIHG2NEbHa
	hOOuJlNvl/66byJtoU2aCgIqEmFzdkUzB5jR5doXwFSNBwfYIrWM2kQneRumz1j7
	KxYrdA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u2e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3c3a75d9bso164766a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007362; x=1795612162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
        b=e1HaQ1B8zb8FcwrG1HrCmgy9Wfgu0Trre8GIzBO1Pd8ptm8Em/6ng6vy4nkd3G/hxl
         LMgLecX3Et6Q76E1cbfQisAfzBf/Fl6ZFw7Wfe/YEH4LPlIw6t8zW9L8YdTN2pogbqLL
         ZJ2V5HmUkbVkHYuxEbz4JfZUkMcTQ+mWQyojuqHh+/CIr08tzaMZWaAnKjAP/FryQzAp
         GcuCJPWwEJgxFF9GowQe/1OTtuXCJMWmCh0Zs+akgIuivnFBKTGfsobCcNOHWzw1aOQY
         K2ypYwZKHcd+xxpmfAqIaUAsY++jlaXRQNc6ZL+wi9Ede3dvlYkHqxjfJ9ex258ktSEu
         mx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007362; x=1795612162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
        b=hRSrj01zLy1s62xwISkR+k137BllE012tr7qAD5Se09phIenXqxxL/g+XBlCXnTCy5
         Yzlht1avKoRY4aw8+pzw4HKFIA/4yjnL8SJX0rZWa/Zkwepw6GHyWLhGRK9PLFS3JX+i
         UxPp+DlOYhz0KkJYFftnJIjMbPhqeGl2/VwbSpYzJHVHOkay5ylcj+/1hFU+0mxe/Hyq
         G2JH4uvMWd517bhaiFT1pqYl52baF2u6JXY/mgvMplwWSy6v1QlDtTpDjvlxEAoIF/xf
         ik9HiFz2gYkQHWLLPYdgztEtoh0/+Fs8UnyP1ko9kQkwCeMnBL95qWLJUp+gu0BqIFe5
         wQBg==
X-Forwarded-Encrypted: i=1; AL+hErEWdvcGuUOLE38fTIiZe2MPfOyPGpW24Ua3qCAhmMBR4LhtMpmWSRZnBsplOChCN1SpdbNdhgTjwjprFTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zsIhxTlaguZFy3XGpknBsqqpc2DNI+llUwRI+C2I5uQ33WjTp
	gS+LlQkr2ba1AiFJ+p7jIdwQMzjpejm7xX7zyuQ3PYNAOWpjjPoEvrEStp7PRb/xWY/ITrx5KYn
	RY8vV9wRod1LKkV6L3gmRzopfSDWVVdybZLxbCXqk1zDnQGmUCkCHUGZVtMY0xvgj400=
X-Gm-Gg: AZFdTZeUI3E2jyJcGyLK0+jB5BKrh6ZtcBt/WpIFS6ZLGMbk/EpIdn5wtGA0sFOzoly
	pFrMKO6D0wY3UUCQjQI/FsMUXLvJYaIoafn+9wv9+guu6E/PpLAx2Q1UyJaoytNQIUYdXbGUBp+
	ZwTMyVAXcuFtCFUl4WDcKdDgmeEr5yV719oOwFZ9H6gYfvVSwsEC4+6YXJtrtFm+nYTwqj4t2gq
	kcOwFhP+tpoLuY220F33wjULoyjVDhxkGS6McvPH7Pg/wlKpWzOkdDpbWT6oafS+zlAi48CEDHi
	uvR7d4Ihk5PiAcK4a4pksFdeN7iiWAIwaDPXlNImkQHCx91tZbyCiUNURYvkh2pLAlAM3+Vz0V7
	MKoxW6pbX4J4Bwtra6qQSfrOBtKPCAn0C4VgHiSggj0xJkCjb6cL/xoGwJnGUdoW0U6yPCGYNDW
	CIdOfEG0oR
X-Received: by 2002:a17:90a:e7ca:b0:3b3:ab75:c947 with SMTP id 98e67ed59e1d1-3b3d06a489fmr4456552a91.1.1795007361492;
        Wed, 18 Nov 2026 05:09:21 -0800 (PST)
X-Received: by 2002:a17:90a:e7ca:b0:3b3:ab75:c947 with SMTP id 98e67ed59e1d1-3b3d06a489fmr4456486a91.1.1795007360842;
        Wed, 18 Nov 2026 05:09:20 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:09:20 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:30 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
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
Message-Id: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=958;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=OrV/5vTYv13MHRURk6HQcE68oIHzOJUujrYoLsrCZl0=;
 b=E02f0xCUQ0B2N8YwWTg2OQt6tBwet88oCSzgp/qF8U6IEa/zGvNPhvlA1LLu0l2TD5KGmW876
 bGya8WcAb/nCcfpQ0ad2361m10ugHZ3zS27WF3pmhb2SD5rO+ux7ch2
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-ORIG-GUID: A6QCNNI60C3LkJjCbDrIqHg6E6iV9928
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX40y3ljyS1POt
 +56dElCYnqrtPHgG7pwCGis7eRPQ9hoCGDjMsNg4vJbE+BDJ+9SYHt69PbzahdeN8KJ6HZpSNYs
 cERYB9CWZTJ2t/AjwRIosrcwxaw36hQ=
X-Proofpoint-GUID: A6QCNNI60C3LkJjCbDrIqHg6E6iV9928
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXzxj9Tbb9oASL
 RpRw+qDfEkV/nIe2i7xvxrNg5sFmmx/WUwbtxiPcJAzPl3aAfnBGO+zTnFDMewmgC1JfDQx31qi
 7d0Co9uP+oyZB6VZbb7XNMBOTRWZ4D/rguvUVgdqmnucduVFSOt/x003sgSbUEFROSa8vWtM2T1
 CSbDjr0UqMJouNoq6USfWvfwqBpysITCql9V3LXSxxDfmmRvFSN1zjbWDns2eEIYB/7ENwmPgxO
 UESBAOTu9ApxLdl1KkRQ1eAn6lKIETr/D55Vamhrv5kWnGEfFAGxm9B6QzXqp6Nv03JOIYvCf7O
 1KyWzHSCoLmUJy1b2xUymv9FLpYKOGxXgzhQWdthZrkRwb94TL3HUNshlylSGoRsut0rSW5jPZ9
 6v0UTkSCQ7112f0sOVv3pcbQf5MD0fsKNjqbTgroAtUaijjqwXv1Me+r5gGDUpYlRAA6/8nckJy
 t8gYeWtiMQ3sX7Kncgw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afda382 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KBsJZNVkQGKO3p3TXRAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

Add the CX SMMU aperture register region to the GPU node.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..ebbe5e23d173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2647,10 +2647,12 @@ gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,
 			      <0x0 0x0599e000 0x0 0x1000>,
-			      <0x0 0x05961000 0x0 0x800>;
+			      <0x0 0x05961000 0x0 0x800>,
+			      <0x0 0x05960000 0x0 0x1000>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",
-				    "cx_dbgc";
+				    "cx_dbgc",
+				    "aperture";
 
 			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
 

-- 
2.34.1


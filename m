Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145319;
	b=OEse9HgZKUktbnbLxDLIrQp2kcd8NoGf4fwgHnQo6vQjUBnyxSyH1it9bprcy1SxD6IE
	 /X3qKv0p8Y098SWAC98fGiEMrU905wT5qiaqspXUbwkzsdC4sGCSqioiZL/aYTaRng7xf
	 HnIkgrN19LbWoEZsK9tAM+PMxn+EOUtnKgrJwHg9dQt04nFSSmQK0k4wisR7YEZE3SH8i
	 ul0M3ezVXhIfn1iieZ/Feng0vEnqKB6f7ouyoaN1EhTBpibXO3n7HEc45lTWlvKHcHSNQ
	 lwsWhgIkDCLiR0NDVRcGbwJ8Xl2bSkz9oAobddUFpvwihUTt6xsAcqLGzXMQmPDMMog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=IDBtripq3zy8Xb0fJdfPYcwi4Tke31vUAVirw4yDMYwZruJoEskYWOFLDE5kNIJo6rG2
	 goRuO6Kry1aj/6lrkLKU8FJLzFK3tYvJ6GhTZKJbvm4Pg7rMBSVRwLW1FDl4TNtGuWrCk
	 MKBiqqoRGTrrJh5dWaDNs08cM1GJbTkOQj8hjvXcwNnXrzJaypcaryIG4PuIRd1sRyNX7
	 22y9fUcofd3qQ1P5OeUvPL0KjtV8fIkS62fRHqDsnMF1xveZOH0/nMqSfoijGzCdNLPvx
	 rIx8sTOwR+j73VrQTEe7uu5UpSf2mJ7rj2lFKkc6dSR9tv1m1cXANSPDSNfOdKOgw1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDeISYqx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeS22c5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF3660A260D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF3660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDeISYqx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeS22c5y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GJj02608023
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=GDeISYqxhLpiI6ZT
	/h4DSsdKrFb1/tGHg0KZEKVBTogTGlp5Y9yFstQKcw7FV70qzlJflik0NpvQpb+w
	2myyabskudEXvvVQZ+3lZmbctOif+sFbr+m/QHoT3YZM8oafKTc0BIPzGSfcF/wK
	bN8MpisJsvqUlllFjs7gp39eeawYaRtydA0EcPhm84CYCcbJS1YrdhQ5DFE+kzPr
	LKiZKyui0dbacYuSCzVjqdgyLoHw3hn7tZbldtYHILiUFPCddLKN4olbLB5YEuPV
	TNdpcZWHBFzNFtAPOMNE8T2tPlIfjUDEir31HGNON+dQ1p22qztJTeu/XcaogiD6
	JOsb+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j22ugu975-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso626948a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145317; x=1795750117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=TeS22c5yjgARcQcnfqvwlRNBPd7s2Gjr3JwrVSp06wtiCR2mBNIks49DInf4wO9FvH
         nBlrJyZrJ8yPZytRshFhqZ+cu/2R8DxDBntmZP6qDygFA+Tr54iLBComfUpMWW4TYGEM
         zZ7Q4JWkXoeQ0t7NNQ04JBr2/xuR++5dZXyu52SYtF6neFlep9CW5ln8ISwxdJShhV5R
         MWwX70JRaCpvOmPGGIfFRRRglO8WsYogt1H0jYzPLOXvoOgMwO7P8013bvvgNhIQImu1
         aQTnfxeEQ24F0v0+pYRe2prW9j0p4onVF5t+3ihpxfjEfQso+GuQ/zcl+h080Xm0hyjQ
         BwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145317; x=1795750117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=D55yPMrlkkujpIx2lsa+28gf27e5gLSCTC6Bo0ugpj3jQwfjb/G4UJGgIwREoRle5P
         FFmkhUTwVIEBepyqQXZisTVlMuzXACNgYTKC1QlsZCo3AUi2UPxDg2aAjRChOruIHYBR
         DHpfDdcmcXVqMbrq35tdJjHmLxwtKaIpvtOeTAz8s4FfBxHzpNznoBdj5lk6+jxMlktg
         MyxYaahn7IyNeO1VKNbMiYD1F6/HD9hoCXjRjYnVE84hmJ7i37UMW/ubdZYkGGmIOXiA
         s6ZSXfMRKeV9KArcbCTPAEBaeuN/yDj19OGms5H9y6RlOcAn8jPETNcPJNVRjMFxWvAO
         +YzA==
X-Forwarded-Encrypted: i=1; AL+hErHqR3/a+XHPTBF9LkF+WHUaLGLw8QPeJgm9IkvJw5m6qf3owm/FVvd6J1jcdjf5yBWjZy8EZNPooU3pUqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A1sIhlSFKFm0jRMV8fUWBLjuMYaoIKbvR+rRv1oaAekjnmYUY
	fI05qUVw4zvlvywzrMwI1zzs6x7TILBdQRbJEauTnEgzPyzpjTGbU2mJWcq2Qrlx9uccw2o9NwW
	Qib2KkeAtNHDm30gs6SMwy3b2fNo4nITbj893vmgroaZed7BEQXM9YDXn8nb1YwnTWJs=
X-Gm-Gg: AZFdTZfVJYeE4CMONKw65PzVOiXxZPwc6+gJZErQqWvDAzpwIshUwKCTTJOHXzaXd4k
	h7+La99uneY5M+Qd+1HBkR3kJpLQboyGU+SOrT/IXKGeci+GADdLQzHfUWgOFG7Zuq9SjzoOKTh
	p8g2M+JchUGbBjThrSRuIfPAJRyk97BnMcw58GFO9F7a1lVu0e9W0efwv9poo5dhtucEXafDHQ0
	h87W8mOu21r7a/crgAgAl44n9iDB0/kwbcto2YU10KP3CioI4ZC8x/aMVbqjhPEasjZdQp8oBTz
	xqb1ZIn4D0CY30lN2Wxcz61+OR/rkq8qoz/dAZ70lofyO0CoRNlfGOC8AULQThVga/PXmprViGn
	IAHqMuZyYD4+g/JWnHzCghJ1QTBtrfJSmD0HB8j45n+/8jGb7XcelFyiPEg2nwo46gIuV8Cgr3O
	gbbI8XEqTMGC3TEUSdHcH+YAiiwr63VehvCs4=
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408370a91.19.1795145317156;
        Thu, 19 Nov 2026 19:28:37 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408334a91.19.1795145316683;
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:27 +0800
Subject: [PATCH v24 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-8-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=u/eNLPiVv6GIj/TZvX/nOtN65AZ7hldBM0ZBlHkuJ1IXZjkOses6gu/4+KMJnP0y8AMu8IKWV
 ZuDjkVOffhjB6SFchqtyVHPdp4eVjrvGCoWJMfiwPCAs1uKEM8zh1ZO
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: C8gIp9IJmBP_JU_V7Avlw5xUS_druXI0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX/idD5dDQrP/A
 TTW8KGOFFzxxEgkGeDHcYqmjUui41GTOzxTdoy4zOMANHD/Uh/+vbvJifdSu21fSYap7DDoaN/R
 dD+Qy+K2zu3mxqKEUu1GYnsiTvOWBbs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX1HM9E4NOvvQf
 iqn4OLN3xj7KKR660VE4IzZXJBKXqsAfyv+Bkil/JvBbpDcjK0qm4/L+mRZY3cln3Y0DWuLI8i4
 cQ6fGItanTgao6uSe+VVPyvxIUI+fLKBdEODwOqwSEhtpvKCUeIPVcVrPvpNVhlj5f2MNVnAV8t
 VYeg7qyQnL4C4ZBDPrX4qMd4X/jZSYbCyijgUPkgiUUeUQsBPgwQxaLUoSwENnhNnzTiY+r6pDE
 j7dWVuU4DIi9vws64gXZzuMiD8UKwaaDNpdf5uGzd/lxQgKfjAkEHp/GxQQbf2ycvOelBLWbNjf
 MsHGruXjeAPNTBAivHVzY/Qa6VqP62LBWljoRPscfXp44GhNI7Dd9tO0EUKrqDPFmDiODJmpJR3
 yjZHuRIlEMjInUo9qDA0BkcgYJ+jSyiiDUlmKHcXNYw+frrR8bN3mhNXajcWmb3K5UKBwBkgIRq
 2C9h0bma+sKTyfOfQGQ==
X-Authority-Analysis: v=2.4 cv=YeEodARf c=1 sm=1 tr=0 ts=6affbe65 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: C8gIp9IJmBP_JU_V7Avlw5xUS_druXI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


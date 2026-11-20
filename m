Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158681;
	b=sRxrvZqi4ceA7w1sqNmR0lRzVV0HTIi+fzFEE2JGhtwe77Kx9wR2CHXTfVac5x0DM2EY
	 kFh7Dofd8sIgwY6SMTLKRUb2x7nIR9jUpzrzMLoOdYaP9Q4bl+nR33I6eImxLpT7sfQS9
	 u223goV4NtXQ9+VeVkztgaZ+8qbGtYOswu6Olf+fYVnUIJUESiXECLtblFRdL9ZwfVRyA
	 fm61KYS9pntWGmdyOaoE7Ovk+XMwGDfKhL7mF2TxQ+sZRDvxlmlUZuQB3J3e2PlDSivqb
	 P+91Bws8XXsHmElGGEeEfpSEp4FqJq4656UzlBiZH3m7AU+7Sg9pUGwfRIFrLW3ifUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0XhKNi7q9TqgECVTc7DgpZoiDl+GIaqHjXrFw+UrhyA=;
	b=MfqA+YYNlQNmbNIGzHeNpQZp3T7HV+GWX5DrhxMN8jCr7P4Wq61GbwkYDuY2VrTGw4Kz
	 DQK+wnmSkupeQsLV60tkNL1xtz4QjENGwrG428eEWN+QgkpxSnIuuQZfW4jHm/k4SKwRA
	 HjW2bIFbWzDNGEA8tcmZSDP7/8hPRv8llXLz/FDUApiTB1ZHlsYB5eD0MazcdnUIPhgFT
	 jjCbCw9P6lWtDHKHmIVxdoRpozzBmOFhf3M/FKrW03NX+b/upshj8zWCLTR2GI4DQB4gk
	 cdHquP9iTCJoZgcexMqHlO9UsNZ80UYUcTZSbWFQ2oDlkAOg3ox03PGUl6RfAaMyiMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nKMxmGmK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=esfPP46X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB0D60A263E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB0D60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nKMxmGmK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=esfPP46X
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK4NhYY1304398
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0XhKNi7q9TqgECVTc7DgpZoiDl+GIaqHjXr
	Fw+UrhyA=; b=nKMxmGmK2Br0gLbiWoTnwA71LBdVZH+/Ohi8Ckc/jaHrdqjFFrI
	tbgeTkdd5vra4OoWDVemvjjMImfRDHAhAIREsNDC/jYTkIKkOeT59VYfwT1pLG+d
	/P4ryAl2a3EyHvzOSugMj3VPtqeHhxOHDuQxFs3GqeefEk4CZz5CCkxz6Cw0ezNH
	mJeOnjIzG8A7jepXpaSEoVPcWJF0ttSOiOcY+0UesRBthr+B+BB+cQiB1q3dAW8c
	No5Mq7FcHTGeR3GlSUJf+sMLuKrwwkNX+qcri7wN8HxuJfUHE2DctSx3+7ip3zQJ
	Z1ygAxkuDbEHuYuVn3aeOh7GYtFMC0T3O6g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygkrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:11:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-86313f7f4faso758605a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795158679; x=1795763479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XhKNi7q9TqgECVTc7DgpZoiDl+GIaqHjXrFw+UrhyA=;
        b=esfPP46Xa7A4swF5faQXaluzc/IsWjLVZuty/W8re7nJn90ni5u+vWxwtfflxyTpHc
         +sPFd3jseeLOvIR/D2YLAZSFKZWJzF3/Eeefdd6eE1zXQnLQxhHRtmE18X8TilAFQzJR
         UgXIlnhIxoO4y/P5WKua+55vZuw++XTO/Un7KZfLb16QAtuGVojbYgOPofO1DRJuFuHJ
         EWFgP6GGvRtOfVQkRMuPdowwvG0x15pvnRXvnapGWuyZ9y0JjnHe7yOeBeuWRztiRMfd
         Gp8ZqprOln6eR26adPEiwcve833Rn2uSb4hVpFX3+nfYe8sbuDX6F82rAsLoLa1VDtaH
         84Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158679; x=1795763479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XhKNi7q9TqgECVTc7DgpZoiDl+GIaqHjXrFw+UrhyA=;
        b=EWfxh/dZ6xN6KnAxU/aSRSUR8ZBXNse2VI7xK5mwVbN2H6I5RtiXxIreuEYk6T8aRa
         ep34ZnJPQOTAMPCU2m8nr2Ep5vTtBcHxjFVzPa+sTWAAoL8IwNxpIdIFWacIXhIdYFV/
         QD/zMR4/ubhQtL7zVUtLUnOjYdwnGqVHkjk6ZXwHfl1oBxaDCml3zFfnqF8SdcleABJc
         wjotSzsWY17rAxoe02y7wLxEZOh3aKoe0NH8goL3b71Gulolyo9H5YX0ySna3Tnn58Xc
         4M1Y8pO2/1elPj8tKXPOqkDoOe4kMpZpbaXxMBSejbFquTuTTpPd6oQpD6V0L3KyAI8W
         1zCQ==
X-Forwarded-Encrypted: i=1; AL+hErHR3x80LBIsfqcsDR7Kif4y/3/GyO0w0ijhIIa3sI/uY7OBGO/1lK+iRtpO9TtDlcLtatvZzfpEr3XpuQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hNZmi9w0yNJIz0HjfVXAQ5dyz4tOrWEDUHdhgW1VPaCD0nlZk
	CeuQsBD10hDP/fdS4i0bxXBN7sxa1Cn6Xw4dPbeotEvB3jdpM2eF+kKdQ5UKQ8+oRa/Md+NAvGB
	6sXFXhotDEalmgkshRo7Xjccn6PpYKofBdE455XFA7NEG37HkEwcw49i8cONyIMojBBY=
X-Gm-Gg: AYBFou1HoOXTEbo0ks8IsBlhI9mxzjIH4VCSb7gsL17BoY083aoRmyNyGVNGrg9WXT5
	yxT/hmPSCvGodMFnfuitKacM/UcSvRv5sc+rUg+zfqr/kmTxU5k0FPDinwzeJQqbmj1GbKTJFcX
	ZID9nvKOK+G3Eru1agLgeys8EMF1kbg97MfOIRDc4bBjC1uGNbXx4uA/ESGWBet+IR+mg7/xTx4
	LbGtDF4zGEM6+Ur/vjvgdL8iLiEyGJ+kLWkfuB3bR3VTjWwbNrFFBraz2sLDF5f5gqL35suyIMl
	+5N6UhHLBNg2KI3LZD2VSc6v5KbK4Vle+qgldr1Ik8FZhsc5Sudmywais3amLvZ5BiduUXJ9Al/
	MMTa+Xl+hBUNBU9KmKmsZtQtY3TyrPCWu/nq6S032MOSZaGx4aNnfm8PUV65cyI6RmdYvqnz0ms
	MyJ3aM442HqLPaJhKOw285ACsq8sOOOw==
X-Received: by 2002:a05:6830:6816:b0:862:a0ce:f558 with SMTP id 46e09a7af769-86315a00e5amr3166302a34.22.1795158679111;
        Thu, 19 Nov 2026 23:11:19 -0800 (PST)
X-Received: by 2002:a05:6830:6816:b0:862:a0ce:f558 with SMTP id 46e09a7af769-86315a00e5amr3166289a34.22.1795158678637;
        Thu, 19 Nov 2026 23:11:18 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631681f30asm1491320a34.1.2026.11.19.23.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:11:18 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: add entry for Yuanfang Zhang
Date: Thu, 19 Nov 2026 23:09:41 -0800
Message-Id: <20261120070941.2814556-1-yuanfang.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6afff297 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=7mOBRU54AAAA:8 a=BY5PBP3jAAAA:8 a=1XWaLZrsAAAA:8
 a=COk6AnOGAAAA:8 a=n9Sqmae0AAAA:8 a=pGLkceISAAAA:8 a=yC-0_ovQAAAA:8
 a=Q-fNiiVtAAAA:8 a=eh1Yez-EAAAA:8 a=UC-uwn1rUJi2p_lg49oA:9
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=wa9RWnbW_A1YIeRBVszw:22 a=gQW0MTutLl7eKD3OLfcZ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyOCBTYWx0ZWRfXyFceA+0YHg9y
 u82gdCCa7kWe08k82SN0JaaR/2wU5rM7GR3MTuzfx65NnuqQtqnk4QPsguz7BNsNfdqy7cNtXBQ
 gja6wt2NQ7gD8jVREO4nFpugqtdUSZOAAcNxFaRK7csc6hqjUT6yENQNZEyQouxD+MLtnyhbPQY
 whkVE0hP9QAnubpRxly7kxq5plqStTTYOJ/AfDPPdrfYpBO8n90yCsRXDeWoas4ZL3uB1cc7/72
 /0h+EwC82M3o5ePW3n408cWz4niFnuYnQIr974boWJHf6/7orw7pC/TstbTcAm/AHMdU2agu33J
 iW/83aKVv9GEqRvUN6mJNURASbTp/kjc1VKSBX368kE02oy699TjPdZyQTk3yrKB1qVhPJLFLCE
 0GG3YiS3uwLNt6X6O4Fuv6QMgdIzJUyF7hp/ujsRwUEi6h2pOHP2zR6dIvY5qC3Kb0QQv0uxhw1
 I9XWSbXjfQ+MH3txgVA==
X-Proofpoint-GUID: 31JIlZWPzLfaK5m8c2o2zQhVWySHeyqH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyOCBTYWx0ZWRfXwGsxuttVnZQL
 Tmwwyt7ymltNghSqpd8+S/0CUnuu5hn9lUb6nghz2nJGtBoBzm916JtxojsNSExwmObaVe1Gnvy
 PjZhYdQdAAqquG8EpoLhhKuWjd91dtA=
X-Proofpoint-ORIG-GUID: 31JIlZWPzLfaK5m8c2o2zQhVWySHeyqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200028

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 6803f3bd2865..8e0f1397ba23 100644
--- a/.mailmap
+++ b/.mailmap
@@ -980,6 +980,7 @@ Yixun Lan <dlan@kernel.org> <dlan@gentoo.org>
 Yixun Lan <dlan@kernel.org> <yixun.lan@amlogic.com>
 Yosry Ahmed <yosry@kernel.org> <yosryahmed@google.com>
 Yosry Ahmed <yosry@kernel.org> <yosry.ahmed@linux.dev>
+Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com> <quic_yuanfang@quicinc.com>
 Yu-Chun Lin <eleanor.lin@realtek.com> <eleanor15x@gmail.com>
 Yusuke Goda <goda.yusuke@renesas.com>
 Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
-- 
2.34.1


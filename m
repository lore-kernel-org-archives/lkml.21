Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562008;
	b=PAmlkp72v08DQ4WL4d4/5nwM13LGwSoEz060A/9Ym1OlSwmdqO4Y4kl3D5cXpG+75Aey
	 1SWtaeriM4smrmoFsj7Hu29r8U7Q2uIDvQfnUakiS/xmZDhM2RKGKKIiXlVws56yeAvY5
	 S8m5n9l2GUviQ9EYOhF5sR1ToR1iPX2Yh/2EvB5opBwS3NKAh58UrgeqEvoKCqYpjgDgM
	 1S3gQsyZHuaKAeEN/qpvSK0UxfTkvzDSltLU72C9sxtWlGmQNIPER3sjEgdBmPj5rCd1v
	 kkZskehUY2Yrtb3A8ZbeWaVFXBzwT/5DIUQqbj6GJmZmaczimP0ugesW+q0Pb4RWC1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KnYVmklcEKzX5HQD3rqpVe9Q75aZhNP7IaHm1JDGDZc=;
	b=P3lWyCqgsfqy4fAtKdStc/wjxB70pFSj2RtGkVSRMMX6YX1/0VG0p8MC0wn/rWcfWFiV
	 +7NZ5onppgwWFwZZY+0GwaxlPeDEeBnw/lcyQkWlUzouS1RB7QXKwy4KDLqk+6aRIs2g5
	 KZ4pjRxlhV8M09qSm0bgBTTIPbgzc2kyP5N8tAcq/8ePY/i7a6kN4l+SobSlFBqKr0IxW
	 as1eJNpLmcfau75vUUM6OiqPipvHmGCXtKKxBrfuLmv24+rpwCVd9fFs2sHWDikNLt7JF
	 hGozvEoIjWmIA+bdkf1UZp1p14B8n8zqa5i+5PAZ7qfC2pNjRVFaGewia/FpqYTdhIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PMxrgm8r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJfFxlaY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F6606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C4F6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PMxrgm8r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJfFxlaY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMabQR3520041
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnYVmklcEKzX5HQD3rqpVe9Q75aZhNP7IaHm1JDGDZc=; b=PMxrgm8rijRevEe1
	hdxwShTzJF33m1F7TB4f2HS5e2h0kfu3Fk9Ng3/ubb/Lif6OUKy8m1LCVtz+sRb4
	CytfypEiYG738XfyHAO5X4I0p7nLd+LNG1BmJdqpBqSuhauyQlfogMlrPCvYorhP
	0VUOsWJZiXqi4DON2umfxspXGLzrUwc3zSd3EDokhCeoUHZJBkizPq1trarldAe7
	PmzkpC5ggZHD1epF8fXF7K9He32e375C07pXL2NnFGMkppbpI81FJttuQgFVVa4R
	6S7X7WTi3gnqdvYJK1+wo9NOLFcrZoY/HuoT+9LsMFfJjtqj5ftzLYil6A8mYzen
	5Xy0Jg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00h863-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:13:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961511b61so853016985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562006; x=1796166806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnYVmklcEKzX5HQD3rqpVe9Q75aZhNP7IaHm1JDGDZc=;
        b=AJfFxlaYXqrP2+cb/dY9MGxQxJCYYmPPoPJ1DU7JBzptmXBulQpHdzFjdYNslG382p
         mtEPu3eHPUseoF1O8W+GeiJOZTfRXOtIPjCEcQBScWefqffiodFktjFnRCDI4BL8+9XW
         gNmWyudxdBgYkc0rkuSluLZNMHZUtBZyzRT90zY7bu3hyE04+lAIECVIHCQuLqStuRml
         od6LOH6Cw/7GWvZx0mzyq3sOrHEXgt5oXnQs0fhbrnYGZ5SflxmRHpAamDvI5DW70vFU
         /TSzu8x9ormVJfm9uTlSfA68WMucqUrNBq5TebP1I5tyOQSX/bbRlTyaT9ekzkwGJ92h
         O5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562006; x=1796166806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnYVmklcEKzX5HQD3rqpVe9Q75aZhNP7IaHm1JDGDZc=;
        b=TEdMjivRmsPad//QHnCvnj49bjE0lTRc4on+XBVBgF3EbAF64pr49Q+ic2rxck9tut
         xs0RH4dOK6GvG4rcMrBgdOSoc6dmGBx+K7FU98SX7BgKMpA675sATjP7y5X+/Cw6gYdy
         a74zQjd/dmE1lJ9mFS1Yarxs6/miFiRYygAhN0rKKW6h091/QdE9mYQrK6u1GZBfJu15
         acftZD+VH/VuT+u8lEBTAhpCCpw5QG8iV6Kzogq7aqD+TxKbsMX1idakGuV6jduWHF7S
         wnxFpgwXbTk4JEOyzr/seYJToTwUkl1liAOp2tQQsOcrOQOf1em+nxG0hlzj7xa4SmsQ
         A4cg==
X-Forwarded-Encrypted: i=1; AL+hErEUIkh6XEwfFJKIkFEeNWtBlMBsc6yHL/xKxNDNeNWvCJw6E17hm/D5PXwfQb6UXjPAUJsJsr4lIESGuaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z92lUy9Lq8BhBL/BuDr74CuGhtJdCV0pUCn9RsB5S3oHvJGYwr7
	b/vc+Lx8swlMKc3NDEaQXR+gQHlPNC863lapV/n9vwdMJGqbqsR/hoyjiHlh2d16JV4OzXqYPev
	X7WTAswVs7JaDG6Z6N7Me0/v7t1dYpqBuuIN+2FIh8lDGHEoxnFFJGvdr5wfoRiOMO74=
X-Gm-Gg: AZFdTZfRKExzVYj9mZXERvN5Hb5zbNfS2Yho0e/Im+8jJetGv6/e4HCbXTWi/zzxnaE
	stifmtLlieYpqAh/ZgI5I2YbHNRtCjquHkAuYJKvThmlUXf8peZiLEdtCxMW8IXdqPo+vYx0NRO
	0Aqylywz7o/Sf5FqVTCZAIa+HU5LtreVde37h1tOQHXh75XjMXu3Y0FBbJB/6XbBQtTUf9g7kXc
	Z0eFEyLjKEll6MjNuXZPGvkDIy/h3NBgk3ZLsw3+ph49j1eLO3M/ukw/hUAQWKoEHyk2IJH08M6
	K6WJe8JwPrOR04IYJhajVjn+ewKfEG5SRqlR3cRwXDwhgPEYUqPjzXZMIFR5S3OC78RrZjg9WEy
	FJqj2r5vZPMgsFgXzm8HqIsgYgSbsLamO/R2KhJ2KN8vImPrRCgAXF+XxPJ42UVV3uz+RslOwVD
	1eiCKaaMc+1nWLhvP+Jy6Ih0TlFFFAjecGw1bnu42yrV/A5CfZHGy6QI7b4zz/jQ==
X-Received: by 2002:a05:620a:4626:b0:93f:1936:b229 with SMTP id af79cd13be357-949bab30868mr2963549285a.77.1795562006154;
        Tue, 24 Nov 2026 15:13:26 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93f:1936:b229 with SMTP id af79cd13be357-949bab30868mr2963544785a.77.1795562005689;
        Tue, 24 Nov 2026 15:13:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8056b207sm43708401fa.37.2026.11.24.15.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:13:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 01:13:15 +0200
Subject: [PATCH 1/2] drm/bridge: lt9611uxc: read the flash back in read
 mode
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
Message-Id: <20261125-b4-lt9611uxc-fw-verify-v1-1-7aed8dec8018@oss.qualcomm.com>
References: <20261125-b4-lt9611uxc-fw-verify-v1-0-7aed8dec8018@oss.qualcomm.com>
In-Reply-To: <20261125-b4-lt9611uxc-fw-verify-v1-0-7aed8dec8018@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gr54EZil4PL/PPKq1UdQmO2RRJWRmBbBqf4s1gcyU28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrBhoR4tY+PNCLgfQblSdEZWQlmIFmhzM2RdTei
 xnywX3ZJgyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawYaEQAKCRCLPIo+Aiko
 1WiGB/9arMxG9H8EbVzFJnlAWzxI15/nLYEPyzSI6grUL89OvJDROKm/mLvhlQchuzv6qz4W+X1
 ABWg9Xr8F1I8qIrPMJvFuaF2MB6wr/gJ59YTXVrORKThiVnkozuBLnhW1vFll0cuOzP+OFZzmGS
 BkucvBaWYkQgQTOh+DoHoqovb9VfpTiB+YTRTwGCGdInuHOG3LMrnZYoHC/Nxwv+jOwjSHNreS0
 PXhKJ0JOfY6m4VZwtmlOirY8uAHfenBRiJ9EibY5wDzkC25x+17lP3lzjR6OFMSlpB4YhKaqRZg
 Tw6qdVcltVKPpE/Z+EXXHTXoA2yu9j3N3BHnbTv9vC0TJm/Y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jvuvWZ8kpf12koML7MJGl--f1JZbxc4w
X-Proofpoint-GUID: jvuvWZ8kpf12koML7MJGl--f1JZbxc4w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX1vpE6qK3fPJF
 aknJN7llTFlheRlGFFNX97TjgH4twGGPmy7yC3uNL7oJTI2lAffNpGLvPRnfyWZciG+aXxgfV9g
 z5oS9f1uoWV1T9R4BahHq4fI45n+cno=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b061a17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=U2cYV8cVrZmoYxG8c0kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX3J2ZHQj0levM
 CcfrupFEzJFlE8rm1LS5DYPkdI6z/bTk7Sy8WZCo0BX5Gp9T7MFySm0Az8837CFtcyXQw/u/2l1
 ltm3uQgJNnpkujjz7hJ2cT/57P2btOh1rj7lLfOLW6gIqhpsOx8+p1cDAnADxj8qrrqEEFijwUK
 aq34kbzDZegEx31ajkBJ76L6bKqr1h8L9a5CSXukh71t45vjinUWH3WQ0GzQNenB2ALFpCxS597
 CMLqc62MoUp2mQVcoxrXCAPdFDEnbopZdffHcDCdeRPdyrHc97wStHFMcVIsS81Fo+NFiYKy85/
 afsVrxh7AHGwgb7kLQS14ZOoYTul6bGIoKoYcsoyYHxUJXNJKVJfDPQ+JnBiGTHfHMDGopS65zw
 MtS2qf9E1c2iOUoDK3f3sJzzJQe8vRWRU+JKz6irjJ/9VfUpo7m8/dN2ZKExe1EAMm1H9YpIh/h
 IefZk5LGt2R1rqnqVkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240091

After flashing the firmware the driver reads the flash back to verify
it, but the read-back never switches the flash controller from the
write setup (0x5e = 0xdf) to reading (0x5e = 0x5f), so the data it
gets does not match what is in the flash. On an SM8350-HDK the
read-back differed from the image although the bridge came up with
the new firmware afterwards.

Set 0x5e to 0x5f before each page read, as the vendor driver does.

Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..6a7d479e86f6 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -587,6 +587,7 @@ static void lt9611uxc_firmware_write_page(struct lt9611uxc *lt9611uxc, u16 addr,
 static void lt9611uxc_firmware_read_page(struct lt9611uxc *lt9611uxc, u16 addr, char *buf)
 {
 	struct reg_sequence seq_read_page[] = {
+		REG_SEQ0(0x805e, 0x5f),
 		REG_SEQ0(0x805a, 0xa0),
 		REG_SEQ0(0x805a, 0x80),
 		REG_SEQ0(0x805b, (addr >> 16) & 0xff),

-- 
2.47.3


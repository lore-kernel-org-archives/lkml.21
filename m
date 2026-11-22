Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318020;
	b=xNfFLYmzvtRq0Ootq0V3ESsq2dnGNmvS1xCWjGwBwuevcUDArGH8fjKPGP5H0Z8K1YaX
	 9FF36Amtvr95zDOw2D5PPAJfCW63lAI5mudvFaSB1P5X/ErYPwAWDXfyV7X50NkWOKqH3
	 hy8oosHoXGXqlJj5n+5FX2IsN9Kdf4HaEHCpvl6UjiKz4Y8+hLdEQT/4DbDSILY4W64zN
	 J1/m4Or9yjXFDjBFXcAbEMk49rvjlb+5rgSAAqBnN/Y+VN2oJ33+2TeIN/bK8jbRR7uOf
	 zvi1MI/HkrPmbYrSGxsxCY9055bpuFwxgVT/RL2kHYqivGohXlFrf8j6MwT9DkNXxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W7OY6MxFu6gAkMGCReTmSgJedpxuJg01UlJjHzDgArU=;
	b=OuFYPbSUUdOyHOpG7j1Oq2ffiajRuHEr1M7gMq1pzwJlGbmKv4XpvaSbHzeAVHRFQL8i
	 RwvNjIQNbut7RaTTYffKaqaaudT/YSkZ/v7xjVDix4VlY7JfFbOtKoL8wf4AzVdjybqLx
	 GWWK1iUk9hf8lW1QQGnBRRW2Dj2h167o6OqjkYJgrkF41LOnI+4ifQdAdNplRv+OGFMSx
	 paC+f7Qi6pNbEwUVYiR1UnE1qxg2MQGlfYa/g/xrBdmHKnZm8a7bXACMdtqCaWelgoRLD
	 fqsJVBullqg9ingICrJLkH4ipLc6iASt/9NSyyQGU46GSalfHz2HYolQTX/6PfFWcrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gBRbKbNT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+QYnvtQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B712606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B712606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gBRbKbNT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+QYnvtQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM099vl013089
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W7OY6MxFu6gAkMGCReTmSg
	JedpxuJg01UlJjHzDgArU=; b=gBRbKbNTv1kn166qT1l3fsVBHKPoiAQrlOCTQL
	F9QsWm1XFiQgzQ6BVsN6n8BmcS9H1R1XWDiHWkoeY1T3I+Ds4cc4YcEhftTjIRUe
	oeatucmw8KAq8KmgkBlBexlC1WF1VCpEmoPKr7Her0QV8/BHNpHFFDk9XPMEo+cG
	n7G1ED5Ke+79hprWPANEsJiMcjOvnXDTq7IN/nbhEhpRIQA/xSLP/pDYUV+FeRnf
	5bCOYGbLfPHih+UgVl6wWVwKJgJMATUnH+0RyafkE2WbbrSNHDiII59oD/3GyF86
	7bqsRSafTnqBuW+x6CShpjD+/catdIuiyBd84PCI96g+6tJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnty2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:26:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3847a8f4e77so298681eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795318013; x=1795922813; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W7OY6MxFu6gAkMGCReTmSgJedpxuJg01UlJjHzDgArU=;
        b=U+QYnvtQgm7+rgHPIXKmkFYX0Haz/W6ptyL9BYZzdvL9FqU3jfnlb2JsHYMYZQ1pkp
         QfDX9iVJWwgeggmu/ykIOyx974BmH1i/7b50AcJCZ/zlLbgLYb+ha5K++RtEQb5sxxbs
         Aeq+i1QO3fQPXBvCUvqS+Zt/DB1reemVnPYQSVKHeVTVKbmFpOsem6hxuy6Ll2t6+nEM
         /zjVk7YmpuBfuJ/9LTdZResbg9Hwv87jiToymqQbw28QQH6Tq1fi+/RAIym9iza3gqpr
         WJJAouwFx6RxGymQCfked6LJnSEbukZRnkjcbzIesmfYyTPj9h6qyrs0wHTBWv5LTA5S
         n7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795318013; x=1795922813;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W7OY6MxFu6gAkMGCReTmSgJedpxuJg01UlJjHzDgArU=;
        b=TGQqrgUZXBDmi+SwBZ5ziDvq5eirkbLfO413ZSyG8XMOKaXQhgyA4BHiKxZj64E3TA
         RP8p7tM5kczX/mORKoXCSO6G8xrVUUHixqmcUuCBMZ7PD6qLu9rdkcxd9CBRUXuEyEql
         Vcf0RjTUCinMVow/0uQKqzlezezQSjm/Lodm55X1JaI2ATC5wTe814sxQbN+xOF3liRE
         2eTCbwxdmveehWnIp+p2qzwRZ7y1HNSPTORxtc+xOUkahGkXh+VWepzP9Kss7KpOlcNg
         +FUTbF/fQJaFWf6ibh//rL7KuRUsB6W4V8OxJrMt5+eaqnpIlJRFnYir9KW3wBY0lVt9
         m3Jw==
X-Forwarded-Encrypted: i=1; AL+hErHc/MJTC52LzU1oOeVNsonx5pFBK9GcFB8oNYOdkSdDb2JyaEhN0V3nUQSAVZ6xAOgvp00tYxeOMnhEQfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jXP5gjQRp/3k6KwNyZ5DsiOuvOZog+MdZZojCTgFWO0vtXQYM
	n4F46n9uWvXq1Y2PsLcuphSfx9NBHtiGlSr5KdV3haTVgCVND4zI5RuZUWPVgBx8BVI+Uuh0y0Z
	jgYNDlRebxiU9+lDlYkheH2kQryvDZkSdyAHdSrZ2SuWvi+CsrItNBlly+vo5uOO82vbqTj+Skh
	c=
X-Gm-Gg: AZFdTZe/lfyPtLYQuQKppWHKuWq1t12ho6ITLw2qEe1xP8y2pxMjwIppBzeCHdNNpvH
	wRF8ur1REn0tSIhKltsEjEsh34xZX0MqFIHZUqY+l16+uvUeLxdJeF3iA+7de59VQstrg5whf7Z
	Yg/Z7IV0FmxSbmp9ve/sL8COMKgkCGoWner2bc2D2rzEwoCsojGSA36a+IQqRiOSkzNReBP22m8
	uYxeQu1dLJIOAnvjOeRZ1fZ7/bVlFAjXGFoBUdptQFv0ZWB9ljLQcdSrvLOZmhMlnCtbpUJRmh9
	R3E+VRVscuVfkPyeTsbJDcw0tE4qlpqIMD5Q2lBxr+X3reEvQcVCrxg7DJ6vElSzecstZfqAfKQ
	KjiVIZOXwxl9XzSrnLadEpweVwlTqHH4NO97tiyk5HSfmaCh9o2caDEX5cv2kp27VS3oPS1zPDH
	Vd2es42nqMrPzSr1oHwWcoq22fgolkKhd8jFzlIV4tUJgZShoVrrTaSjjT0k0mP7aSQ8J2227py
	Dn3+U/zmdm+p6gug7EUqQwGMVq7NQ==
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr11364087eec.2.1795318012382;
        Sat, 21 Nov 2026 19:26:52 -0800 (PST)
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr11364051eec.2.1795318011756;
        Sat, 21 Nov 2026 19:26:51 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm21117766eec.29.2026.11.21.19.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:26:51 -0800 (PST)
From: vishnu.saini@oss.qualcomm.com
Date: Sun, 22 Nov 2026 08:56:36 +0530
Subject: [PATCH v5] drm/bridge: lt9611uxc: support displays with up to 4
 EDID blocks
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
Message-Id: <20261122-lt9611usc_edid34_misc_next-v5-1-00b562fe4a24@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOtgAmsC/43NzW7CMAzA8VdBOS8ocb4aTnuPCaEmcUYk2m5Nq
 UCo7z7DpZfBdrH89+HnG6s4Fqxst7mxEedSy9BTmLcNi8e2/0ReEjUDAVYY6fhp8lbKc40HTCU
 pfegK7T1eJh4EGA8JRQDDCPgaMZfLA//YUx9LnYbx+vg1y/v1X+wsueQGIacmWuV9eB9q3X6f2
 1Mcum5Lg931GVbRgn4pAomgI6psnBOheSKqVXQAL0VFosMIIbQ25wafiHoV/R+iJlG7ZJQ0Dcj
 8m7gsyw83R5I2wQEAAA==
X-Change-ID: 20260517-lt9611usc_edid34_misc_next-b02592de0b25
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
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ravi Agola <raviagol@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795318005; l=7199;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=NTQaNIpTYJy5Bg7EIKV4sTcHmVS3gOpADRjFZ5rUNIY=;
 b=4PL0aAbRLLgHbZDheHdCQrnlX+TFHj1FopcgaVs5Z+ltVWLN8D6lzQIsEKFWHkXC8Wy64oDxN
 SlwUH2/VWsfBcsAO2tzemgZ6NYKUHfkJLIhSB1smvWBBQJM9xuTT+rp
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMyBTYWx0ZWRfX7GJEOYT9K4dL
 HrU5AW5X5WIaToaUq542/NRukjjD2xfsXhHNnwzd7dB7m3uHoGW4clvAVkk3ZPiOpv8gqvRWdo0
 +Eq7UZJPJtxHmRe3AYdrzww9ItkmINRKy1PIgtLglKcQp/aEacuJ/QmcCVrU4/zSyBvuu7nzFKO
 HvgqIf8Ul5F1aWjU9Ef4DqAAM7LhzSwldypPuT65o433Pyy+J9ucifpwWmjJWPGVsZYyc2A2gEZ
 jSCD6pcHhpGheU1Oxxgi95T5/TuaF5WOzY7pCe86OPcpag4srnmJ1xNOpImeRe0IIWZpSo9uNCx
 lLZXfDHGXJvzZwc6hUPoZxY3dGwZGGjF0fkVQXfYVUucJasXvDYJ+rMuKl6WkJ8OFVeeYVa8H2k
 ba55HdmgB2ao3uGpqoR3VXObTCoKqihNZBSQaxCb5Q+a+Oa7dcTvcO7KugGgj/3ODJoYzOL/DgA
 rY2fsprMxNT7pUFbbOA==
X-Proofpoint-ORIG-GUID: Ga84JQzNXYoz2eeYhibYGh1v-Zgfbkaw
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b0260fd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uKTj4MC253UD0qxwTz8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMyBTYWx0ZWRfX49p8wvNCB8NR
 /woEDafDHeOiTpofZVUbZJctYLJvkEmDD/b035nAVXzJWuMqFup3ON7LO+2TtWJsllbMsGsftLO
 rDAdwxD1qE9DbU1bePCephSziLsCuNk=
X-Proofpoint-GUID: Ga84JQzNXYoz2eeYhibYGh1v-Zgfbkaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220013

From: Ravi Agola <raviagol@qti.qualcomm.com>

The LT9611UXC firmware buffers only two EDID blocks at a time, always at
the same offset (block % 2). Until now the driver read blocks 0 and 1 and
stopped there, so sinks with more than one extension block, such as the
Dell Curved Monitor U4021QW, could not be fully read.

To get blocks 2 and 3, set the EDID ready flag in register 0xb028. This
makes the bridge asynchronously fetch the next pair of blocks from the
sink into the same buffer. The bridge has no "fetch done" status, so the
driver polls the buffer until the new data shows up. Stale data is
detected from the EDID header:

 - Block 0 always starts with the EDID header magic
   (00 ff ff ff ff ff ff 00), so it is accepted once the magic is
   present.
 - Block 2 never carries the magic, so it is accepted once the header
   left over from the previous block 0 is gone.

Poll for EDID availability up to 10 times at 100 ms intervals. This
provides sufficient margin for the observed EDID fetch latency, which
can reach 600-650 ms after the HPD interrupt.

Reset the edid_read flag on HPD disconnect so that the next connect
triggers a fresh EDID fetch.

Also increase the EDID wait time from 500 ms to 1000 ms. On the
Qualcomm rb3gen2 platform the EDID read interrupt sometimes arrives
600-650 ms after the HPD interrupt, which made the EDID read fail.

Signed-off-by: Ravi Agola <raviagol@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v5:
- Updated commit msg and comments [Jani Nikula]
- Rebased onto latest drm-misc-next.
- Link to v4: https://lore.kernel.org/r/20260922-lt9611usc_edid34_misc_next-v4-1-47d5315821fe@oss.qualcomm.com

Changes in v4:
- Rebased onto latest drm-misc-next.
- No functional changes; replied inline to the two Sashiko-bot
  review comments on v3
- Link to v3: https://lore.kernel.org/r/20260722-lt9611usc_edid34_misc_next-v3-1-7ec2bba6ff8e@oss.qualcomm.com

Changes in v3:
- moved edid_read state change inside mutex lock     [sashiko-bot]
- returned -ETIMEOUT when retry_cnt is exhausted without a match.    [Sashiko-bot]
- Increased edid wait timeout from 500ms to 1000ms as edid interrupt is sometimes taking around 650ms time
- Link to v2: https://lore.kernel.org/r/20260624-lt9611usc_edid34_misc_next-v2-1-24ce3f5770b8@oss.qualcomm.com

Changes in v2:
- Removed memcpy and doing edid fetch everytime. Required an update in firmware as well for edid block0 reset.
- Verified patch with existing firmware V5.0.21, patch is not causing any regression if V5.0.21 firmware is used.
- Firmware V5.0.22 is required with this patch to support edid fetch on more than 2 edid block monitors.
- Link to v1: https://lore.kernel.org/r/20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b@oss.qualcomm.com
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 93 +++++++++++++++++++++++++-----
 1 file changed, 78 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..d5924a8df1f9 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -28,7 +28,7 @@
 #include <drm/display/drm_hdmi_audio_helper.h>
 
 #define EDID_BLOCK_SIZE	128
-#define EDID_NUM_BLOCKS	2
+#define EDID_NUM_BLOCKS	4
 
 #define FW_FILE "lt9611uxc_fw.bin"
 
@@ -167,6 +167,8 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 
 	mutex_lock(&lt9611uxc->ocm_lock);
 	connected = lt9611uxc->hdmi_connected;
+	if (!connected)
+		lt9611uxc->edid_read = false;
 	mutex_unlock(&lt9611uxc->ocm_lock);
 
 	drm_bridge_hpd_notify(&lt9611uxc->bridge,
@@ -380,13 +382,39 @@ lt9611uxc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connect
 static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
 {
 	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
-			msecs_to_jiffies(500));
+			msecs_to_jiffies(1000));
+}
+
+static int lt9611uxc_read_edid_block(struct lt9611uxc *lt9611uxc, unsigned int block,
+				     u8 *buf,  size_t len)
+{
+	int ret;
+
+	lt9611uxc_lock(lt9611uxc);
+
+	regmap_write(lt9611uxc->regmap, 0xb00a, (block % 2) * EDID_BLOCK_SIZE);
+
+	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0, buf, len);
+	if (ret) {
+		dev_err(lt9611uxc->dev, "edid block %d read failed: %d\n", block, ret);
+		lt9611uxc_unlock(lt9611uxc);
+		return -EINVAL;
+	}
+	lt9611uxc_unlock(lt9611uxc);
+
+	return ret;
 }
 
 static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
 	struct lt9611uxc *lt9611uxc = data;
-	int ret;
+	int ret = 0;
+	int retry_cnt = 10;
+	unsigned int edid_ready_flag = 0;
+	bool header_matched;
+	bool edid_valid = false;
+	const u8 edid_header[8] = { 0x00, 0xFF, 0xFF, 0xFF,
+				    0xFF, 0xFF, 0xFF, 0x00 };
 
 	if (len > EDID_BLOCK_SIZE)
 		return -EINVAL;
@@ -394,20 +422,55 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
 	if (block >= EDID_NUM_BLOCKS)
 		return -EINVAL;
 
-	lt9611uxc_lock(lt9611uxc);
-
-	regmap_write(lt9611uxc->regmap, 0xb00b, 0x10);
-
-	regmap_write(lt9611uxc->regmap, 0xb00a, block * EDID_BLOCK_SIZE);
-
-	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0, buf, len);
-	if (ret)
-		dev_err(lt9611uxc->dev, "edid read failed: %d\n", ret);
+	if (block == 0 || block == 2) {
+
+		lt9611uxc_lock(lt9611uxc);
+
+		edid_ready_flag = (block == 0) ? BIT(0) : BIT(1);
+
+		/*
+		 * The bridge only buffers 2 EDID blocks at a time. Writing
+		 * 0xb028 re-triggers it to fetch a fresh pair of blocks
+		 * (0+1, or 2+3) from the sink over DDC into that buffer, an
+		 * asynchronous operation with no separate "fetch done" flag
+		 * to wait on.
+		 */
+		regmap_write(lt9611uxc->regmap, 0xb028, edid_ready_flag);
+
+		lt9611uxc_unlock(lt9611uxc);
+
+		do {
+			msleep(100);
+			ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
+			if (ret)
+				break;
+			/*
+			 * Poll for the fetch to complete: block 0 is only
+			 * valid once it carries the EDID header magic, and
+			 * block 2 (an extension block) is only valid once it
+			 * no longer carries that same magic left over from
+			 * the previous fetch at this buffer offset.
+			 */
+			header_matched = (memcmp(edid_header, buf, 8) == 0);
+			edid_valid = (block == 0 && header_matched) ||
+				     (block == 2 && !header_matched);
+			if (edid_valid)
+				break;
+
+		} while (retry_cnt-- > 0);
+
+		if (!ret && !edid_valid)
+			ret = -ETIMEDOUT;
+	} else {
+		ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
 
-	lt9611uxc_unlock(lt9611uxc);
+		lt9611uxc_lock(lt9611uxc);
+		regmap_write(lt9611uxc->regmap, 0xb028, 0x00);
+		lt9611uxc_unlock(lt9611uxc);
+	}
 
-	return 0;
-};
+	return ret;
+}
 
 static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *bridge,
 							 struct drm_connector *connector)

---
base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
change-id: 20260517-lt9611usc_edid34_misc_next-b02592de0b25

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425031;
	b=KSpEsnv6wtjoXf/XXgNqwdE+I4+eN7fE+STq6c0VAudL17ZOJzCqR4jXHBnbB+jcz424
	 EJWR5eZH8d4b7s7YMIpcywuLRRDV18klF17QZfrI/nn0s6igmjMJlzJwwRyXTJpaB9hBX
	 9HqwiWXWm97Hx2vHRGcUPB5cJWUpC09bAH6nPVxnSf+vFIJqBa8lJOcEM3knC+XZF9J+x
	 t3qMHd47G2hT0pAd1RKWMoHwRpuRjb+v1Q6irRZ3jf31NuLuimXpNWLEn/zKTGRkwKGjW
	 Gappmvwpp/Vh4J7zE2pszeBj0xUY5zb5DUfqJeL5CYIpI8TGmiTBfhZ4NGsjjw4O4vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
	b=CBtaBp7d6VXDGsWlkJy0ct95Ss673CuC/pOiDs7ogj1n7o7usnj5254f58Qt1JBBpUG3
	 i0oELd4plEgSufpXggI6bkD5+xB9CM+TwJmeeApLiOmMdbwNGm1ZVWWeQF6C/isj6GyRP
	 0dC6Q0bZlPKfECql1pWo7uGhpkXZHntgIHMUbci39Y174N43r4u95g8Q1phIG7d2ZQG+0
	 XxZFPn9GennPCCbLffByW4GydFhEDBpH1R4JE7hablsPqzsE0TThji3UoYmN4Q+18hd90
	 ACV1SVC5MFhOoZJU75DEISKBP7QJm/i0IEB9S5t98wfSOorPEzC7ZUfTVHAncHlidaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYCPx7X1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4C606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A4C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYCPx7X1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6PO313712752
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+
	gub6KOJ8=; b=QTu8y5jPqvdgr23dwcsORrMr2kFBYxoTCkR5Ob8HhGgwjsJqZnm
	BEK7IPo4TFAuRNyiIOFJ0DIMJN3naxKTAWcYallI73tFa9uOHIzaADMRjGQ9sQj4
	Z+QsKUDyiaRfMS2CLQ8tC3qEiKs8JzQqpQmP1uqpxdhDtJRIjj3SEVHgSRZgfQUY
	bBpt9r8j4CRP7I3D/I0pGsDLcKKyo8uSx+oxyBxYAhCP3d8dElXbp8DlYCtBsnkk
	smQh6XImGky/xAlmiUTvRnocH6I73U0kgsNkYhpwwZ/MqMb5b1vHbIB3Q3gV3dG0
	HgbCDPKB/xcofnIiewTqcPnl7+YAaz83Rwg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g740kys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso5766684eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425029; x=1796029829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=IYCPx7X1sJIfumthgSv2OlpRkfIwDUSVhqwukYx5mbxcizxpIzrvBuIQjc2/NBj24b
         bqssmxkRzGYre1ZQ4viz+5vTic6dAcLeqO2HvXGbQTwjVLKXcQlt3DAkWouevv8thVG8
         hxmp823xoFkXbJgOQiNXJYVFh9NUDeKaOQCtvg4a2mQryn1GWHcSYzVo4kfpYLGdq8GV
         /Pxli0ySRjaGG+a5nverAB3gzOAngoa1Yn5rjIyiFyTgdGbLJfgZMb71sNBJyzWPysSk
         A8ykCGnWwgWHqCIyYYqNgA1+Cusg/dz+pGCeH4duJ0TQ93zbw3MPmdjM8BMprZpaQTTM
         itMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425029; x=1796029829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=QfUHWBl0iJlG672uZmzg7IEg814zn1b3Qp9WKuIrZ6JaYrthV0DAjmaSfSAXT8MyDs
         z+fHXzVzjjQACrHA7xV7IliWxydpbUi/fNdbtGdHypIGX5Bx+4oT7qcnL+vQTbeBhHNl
         ZTXwtQ31yxrH9Jbt4hUGGZcCqBVSk5V9M5hQAyDaKSPVnRCgYZ0vFas7iDGuFU2jbs5f
         yNa624hqzoq9xIFio3hFOpm0rfPPSjb6EI+YoH6v3MJmPZVf3bKSTPQi8trfd66uGrRG
         nfnIzTumfj7NUff9r+01jEW492TqmQf9u4G6m3J4VuRw/LqWONeunqIZVn5R/oz3XDI3
         2Cow==
X-Forwarded-Encrypted: i=1; AL+hErHSe9lac1b8GwKIuzxxLOKZ+iqfhcxPmHD2uzRS5IBz26rGGSsvGMeSrIZB731nAuQa4l7/jLOjUeR5Bjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OwNjB8PqeeuWetbqZvYHS+gVlXBHhaCJBOeRfxIGx2pdtBhsh
	Cb28nq70V+Mk6mLPFEPpZbFBvET4ZGFB1xcUP0+quTzsC05dn8I5Dyc+CQfuU8CUQbCFRELPKIF
	TkT0QWToqP5Lp/E6PehA9UwGztDnIj+UHRA8wH33Nh2r4whG/sIfB0KprU0Y2cd9szxVii1V5Js
	M=
X-Gm-Gg: AZFdTZeAK5SgQaYIUaLkjMw2cC8O/Wq8nipEyNiIVvqmdK1xmDcPa2QRDw+pgZpmCnJ
	Iy/kMB9eS8U7X171eNhX5EqPJ0Op3hc99B5CsCxUMKB62rVcwRdSF0+pFOPlKwi0q488ZpWtBUH
	do0j4JQZDVR8OkC2YM+eSNrxvFRYHR6XAaWbBXujyJ3p8l3MD/mXqGrxAelXlNpm02lxlMZNIp3
	/1xTYnvHq2j9cCTgkFa5AcrPih+7veI4M55JOcSkLBJ7prw1frIOkOMWPTknQiVanwGI+/Yv9nJ
	jGhU1Wt85KS1MgWCGLPv+tRpVbjS2YaFYxngXeZcz0seJuYz71pdW4DCyjmqtFFDW8sD5OLkBZO
	L0aLtuUyHzum59XblnFykxZ29HK6TFhZJoqRtcAihgoYUXYAP/U8T588ymsY4/hV741zgDVydcr
	rPLg==
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6162020eec.29.1795425028509;
        Mon, 23 Nov 2026 01:10:28 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6161977eec.29.1795425027969;
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO
Date: Mon, 23 Nov 2026 14:40:22 +0530
Message-ID: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: f4zlJYCMa1p-i0doCrw7U49F6ugGNMfH
X-Proofpoint-ORIG-GUID: f4zlJYCMa1p-i0doCrw7U49F6ugGNMfH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX+w/YbP8wXe6C
 IjAH5piztmHfJQeuMKbrozXUNpq+YrWhWQlHZHyNxYEFMdzphjbqro/I4o/jRzYwrthHmT5W0wt
 f5RidIj74Tdz57rnkPcXuzoQxTGQ+Y0=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b040305 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ho7CR9d4k8WB-Yxh2A0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX7P8P+ln4UKmq
 lkHnUDZj0ek+AW5suVVT8URjiqQN5l053eTul+n3gPdjR5pu4J/kKLbs+Xaq6IVI4mmWpMfPS3e
 VWU/ACDiNOjC7Mx7YfuPuZ6bt9Wpuclz2MAPKIoB77CM1JQlPUq5UoSI77EOL9MFFn5dYK5iFeX
 X/WO5ug/xJLgBsPBRYTSF4em4i0sflyRAmDwFhy63wmt54wD1PgIcrWBdKYih6bUdcnbYDA6hVW
 HTv6z6Ic4O/s14SxnjhTEerOjCZju+v8Gda3BZotZHja3lpWnCuBKjO2atfKoZQtV3u9AeNt0Ti
 mSgiL1bOx5Mj1ForIfxNjP95NeZna/OIzRkRCB0IPY60RA9HVcQ3uB3HL4Mg6yxclwLN/Ht8wsH
 /nUl66MrDZgtHrVHN3GitcP/a9ziJejbY6FpO4JpNI6yX/7EarpXOPLi+6gdVJbZqT13Dz+72wD
 sXn7ePNnwTi1qtsg7fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

From: Akash Kumar <akakum@qti.qualcomm.com>

The CCGx chip has no HPI register exposing CC polarity, so on boards
that wire a sense line to the connector, pick it up via an optional
orientation-gpios property and report it through typec_set_orientation().

Patch 1 adds the dt-binding property, patch 2 wires it up in the
ucsi_ccg driver.

Changes in v2:
- Reworked ucsi_ccg_connector_status() to return early when the GPIO
  read fails instead of wrapping the call in typec_set_orientation()
  in a positive-case conditional (Heikki Krogerus).

Akash Kumar (2):
  dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
  usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../bindings/usb/cypress,cypd4226.yaml        | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 77 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)


base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
prerequisite-patch-id: 0ffa67d7d9ce66074ffa2e070249ee5b0cbedb2e
prerequisite-patch-id: 65ba14bc52b50cdf47ecdce1f4b3fe678704955e
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760239;
	b=5FmWpM6cQoCpSHucOCigPGv4SqmPyEbmftJENkK62LXLF5kb3VlAdcANALwbqnG3g7jl
	 tBDwS2k/UDJQHj8i/zqomuz0TD6HSy4rCVaMNjb9EwkDR+kpYsXAmG1IF64cDhA6VJwwx
	 ctNIL8v0uBT3VthnIvhw6gcW+tDiOkLPXy0zqtEDOoJfra6bnGySjINWxWjbLFc3kax17
	 YGux5mHOQe1oBQtiJ7scKb3ivIw5o4D2QGz/B+bkHnx5FsvxqWTwQeXM8Z9swvbRIWDbV
	 NT3lkeOXncSDAUG9ggl2F3mNJyPkfpuovmSabKBXSy/UUi7gBfyDrETtjEYDHKIxoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5qeWnZ3dCE=;
	b=W7tn7w9aahGxv6sImjn01X/iH4HZPzB7bUuzYwpCvuVysR73J7AByTd8Ph7PzfuvA81n
	 HqpOAjIAuzJr9450iCDrPQ/4PQvbNa+E1CkwviA3PIGOdfWOE8JdfVLZEuR6b9v7uKqvR
	 6fBOTrS499wQ++hr1oCMXi2ykv2NdJJ9RH6GzwqbHA/EAuF0UTxuDcfjgEKap+CVWoW0D
	 K6uCIWwOqv2mTWgXvNBOyuxe99wyb3q5GIDKJQuBiedsZg0AmjZEvJ5ehvdexSBUyWehv
	 rKhe5oxP9O+IfLWjS17bEvokdXK0wyKMqn3+c6LiV0Y44AxkVo/nFruoJDQ4Ogcc73g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtfSIil9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcjW2T1y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB59606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtfSIil9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcjW2T1y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6AtDQ1010037
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5q
	eWnZ3dCE=; b=NtfSIil9QhHdQAl4WCehJcVv9oRyaWe7i2Ns+NuZMskhfrrKqzF
	AeDvLzQ09Fd1PIdNMkoy2Ji+cN6lrewrsMDPMFTKX8PE/y4HSO2OZJh0gb0D+uUW
	sqbLHCQag8LxGVIddpcJvoE/OIePpLcI/MNs0SfHVJRhQdeYNLdAlZHZTh6m/F04
	MozanR5n400uT4kWdQZwB3FMMlYC8qP/dl3q6RpbroBCdBRj8tA+7g46HewWPERR
	4MJyWxqDZOtmWmY1oNRZAah/gVO1so8DnZQzzjV7ezrt77828nMA44w8soKJ5vph
	bbUHWA3EzeoE49OrW+hI/l+ikwVxiEBIVhg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf922g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:17:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so6521900a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795760238; x=1796365038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5qeWnZ3dCE=;
        b=CcjW2T1yUbxMOy7quZlaupgDC0904dpBNdQHLq7rQRzy8kwHLirAwkHf0rNzstcG7s
         XVdnyoD6PdFZb+ekcXOGvyt+pUAfQvI/K1IveqU1lKkHBgX2jtI3WeiJLCp10NDFOZl0
         3GBev88NTtpxS/ODlH3AaxQ2AD7rElLrfU5n6VnD8EqX2bo5mbIe7sT5KjeV3N0ysSTV
         cojlAfDrHh1+vmQ4X/fuTDs+Fw9RdOk4lR1WR4iJVnItjSrOZtKmj1ZKG2GtK1n7FyZF
         EK7w9CgX1XUUmLS500UmE294yMe9x8Y/2hsqQJSdBK6rl1Lcsm6otg4pKjBNeTQL9YXN
         fOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760238; x=1796365038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1R6G+j9Y5dC8NY0Dnd6V51TKEM7xLf0H5qeWnZ3dCE=;
        b=svxHI3OTOAy7tECzI9ruuQRS3qYDfO++IifZOrkNO/Keh1ochg335M32nbfbrwKJ89
         8mzol0OR3mPQ0JP0p2Tj+iA0DjArNYozNZ7wHQycujy6A3XKckwixxFLUKZQBCKKq1E+
         K0/XH78ktlOvQ40M+SGMExMcKi7jTCfUhktgCsFJPLk24f5ymOU6hHOM1un9ojjWMXCW
         sjycW46Nu0TEzpYDZIB5IxdtWvbT0ZgMeGHWEKvIDcuIZCx5bd2EgV/iUFeDsNpvRe1g
         JtpR5H7h6gRn2tQyqtX1HHTU2/28wz7YQ8BLuCUIkM2r+ut7iNQnCFbFXTBa9SG3XQvb
         TR9g==
X-Forwarded-Encrypted: i=1; AL+hErFJb2gM1cEab3OYE/TZPtMc4Q668JufYsu1A/bOiq8VbhI18MgiTrxY77k8PQbFnAng7Cj1ZHIXtdfPml4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W8CSLgnFfY1j0ovKwQ9YtJ99gCjXzTVRJG25tR/U3SqESRjKx
	rnxnF50cvJfKaxkZI+wX8f8XcL6zGhI70bBtPYNHaK0+LCsKivD7KM52Y5AtedT4TPoY0Z9ccyw
	jBgjUcgn+WYtLJ7qT25UIHThhQVLXCYsD6OUlTsfNlgnK1YBlPoQ1XkgjYp/e1Gdfu+Y=
X-Gm-Gg: AZFdTZd0JAL8KPUm+vIKGc1zXCu4UBZqQXttpF0Y21D4+RqesWdh/E0rZgDiDZsR6Yo
	v+jPS6QmetskxrCXwuef/PtqPaju/1c4LamCk8QCf029gA5pRXp/Pt6W6fAzDCEBeQHz2rIH2GV
	/cdbUZyUbMH1CCCFPJLmUvkQRrolLnjIJjpAaKSpRCI4hVoCxyDlU41NvT0ofPzqCCaO8u85zeu
	EXq1seGyMWVnl4oF9jG+xL2r2paDCs1hNqwlhi5GuXJGfLASsf+6xUYojt34n54nZucgcDqkgEp
	XYhyuVVz8IhjzKmGmVVtNXFsWMhWNKuzbjeKbAMBA48YvPWOd4P2LvCWPFs/O14aAfnRzUcYaJI
	vx7uuST9NzfwJ0MhYBUMGStffpnjaxx5jpfJevPZIpukKsC1evQcXcdEE0mh0X2VIAw==
X-Received: by 2002:a17:90b:3f0f:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b41c925a7amr28431839a91.27.1795760237607;
        Thu, 26 Nov 2026 22:17:17 -0800 (PST)
X-Received: by 2002:a17:90b:3f0f:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b41c925a7amr28431810a91.27.1795760237169;
        Thu, 26 Nov 2026 22:17:17 -0800 (PST)
Received: from hu-amrianan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm36174483a91.4.2026.11.26.22.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:17:16 -0800 (PST)
From: Amrit Anand <amrit.anand@oss.qualcomm.com>
To: maz@kernel.org, tglx@kernel.org
Cc: radu@rendec.net, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Amrit Anand <amrit.anand@oss.qualcomm.com>
Subject: [PATCH] irqchip/gic-v3-its: Export its_cpu_init for hibernation restore path
Date: Fri, 27 Nov 2026 11:47:11 +0530
Message-Id: <20261127061711.1837870-1-amrit.anand@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fZ9wji5QEcak54wq09E6pV3c9VAp89Jx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNCBTYWx0ZWRfX3G4jeX4BEb0m
 mII4n89ASaul+bZcF9a7BUT71sAdWlvJNTJuo3K/VzacsyVZCMWk9k5zZlPYxTx6xI0AOgWrsFe
 Xtma9Tg8Nh52rmXBVimzgDdyAO5b8NyQ596fm9iat5dZxIOGFJ9uxny7+7gsgMh5+bd5m0vjTxm
 o5Rxhwo6lE70HHpAfcFCAoFiiPJCSpEkJ9w+0NuOZ4vMBPiOTXgYLukJ+KpP3q6x7E8nuG/FOy8
 hVkxYB2E7KHR+hV7FJ/uAYAI0bWfcFVdu5x8SOPloZ1Xkd8cT4jtuK06dQsVZNuxCf8EwBfnXKB
 3t4xyBrRuEXfyTxeaq+uKdf+nV/fl0YYbn96ljEnXjzR/2YgNu1jxZWp0xVIHjt8f4nbIgqLdD4
 svCQHdJtVCX/MukcTZFU1tq3Kt66hNIVkaRd4TOal2IXl0ZJqP/ST4MlUO6Znx5RisiFrioqGBW
 kI0mN8CeW9WzMIwp5kA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09206e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VdNlaMo01x4upjs-fioA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNCBTYWx0ZWRfXzJX3svSDLQiE
 f6e0j2pTe5oKMDUVKjg9xyyeUk++qW8z6w+Bb94AYmUcTtDApQ6Uia6PzXC25gLcSAel0zM+720
 QxLb+335EinupogD0DcIU/avuZhAUTo=
X-Proofpoint-GUID: fZ9wji5QEcak54wq09E6pV3c9VAp89Jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270024

After hibernation restore on affected systems, MSI users can observe
timeout/failure symptoms consistent with ITS LPIs not being fully
re-initialized for restored CPUs.

Export its_cpu_init() so restore code can invoke ITS per-CPU
re-initialization explicitly at the required point in resume flow.
This also avoids relying on fragile probe-based invocation.

Signed-off-by: Amrit Anand <amrit.anand@oss.qualcomm.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..6cf156d1aee6 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5456,6 +5456,7 @@ int its_cpu_init(void)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(its_cpu_init);
 
 static void rdist_memreserve_cpuhp_cleanup_workfn(struct work_struct *work)
 {
-- 
2.34.1


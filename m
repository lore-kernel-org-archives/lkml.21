Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200143;
	b=1Gs8xXp9NyPUp9yd32oMOQ3KDwGeU7Wayzp4+jM6oI7K/4Q8YP93EM4YoJxQgVVvwxjN
	 yTb3O2H0CpiswuYYmQHgk5ep15CxQ8LzZk5yif4uNlbOkWkDbAmdunAE1hAX1FJ57sWB/
	 FKqI0CziJd7tFtKncXbqY3SmE+seTzsgfZwkND5h0C6lIAGp0pfw0fCzGcAO8jxISYqX6
	 U1wZyPhDUwfv3dNe+cgd5bStDDjJaHECyYAK8oTPg/EkcNAPzuH5ht+zvP1BHfhve2Uic
	 ma6PxmGER1tbvi4FuCIduCDDqUJ32Uc0s9o9vJIIClRoz7TQ2JwubDaczRYv8LBuBuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uB6Wtxz06vMdMNj6Z6jJ4VbMDyZslEE2FTR0Qhz4yDQ=;
	b=PJmyBPDqRMtLGQRY7Rc8o0/hJkmcQBUdx+mNOW9eUkRCz6rvmv0jTIGsiUVPe0xfroC8
	 6wpvaVlMcqU+hEJncMlboEsuZsu2sS1lMB1z82VMl4b29hbwgduzJaBBHJEJRbYlR2m4z
	 0PAsPrKLEZS9Elo7gz1UJmpFiI/g2G8r51o/cLl5BczTX2KreEIF1BiJX7hfqdXGVWrH5
	 jHcjHsPS6Ss/uo3hdyP6kwhUYdJUrv3u0yUXZiUK/HIgrhNlUsdxHSIu4Ol6+dndeHhgy
	 k9O9krWVWPXEpPnW/hcRdjTAuSQTXP3ZXp/N66TMcoIxqgEuPQ7QG0GeBFG/F3FBf9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=vUxleCYI;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=exTF7Gov;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2F60A2634
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF2F60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=vUxleCYI;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=exTF7Gov
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHYTr12543084
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=uB6W
	txz06vMdMNj6Z6jJ4VbMDyZslEE2FTR0Qhz4yDQ=; b=vUxleCYIa7LQ5WfLMCpE
	+neRa0dQfNehF0u+/2F4sX+OCCXRhrMzVKgzDksDPaIqb6cyYEYHHDzl+e1Rd2uI
	CY10lXg071r8+mP8m5p1WUCtxDsmKsetQi4wBxcXR6BsckyIZkqEW34NJYq5O3zY
	8pYtgPYQV/6vjuVJkHD82wKe6hMdJoeccdJ24rxQgRG4bG7bXuvrB4PBlL2GhLQ/
	9ctIFMowxEh4Pb6k6QXpmB+IgmZpk/2/MEjwZKfnBNPjtHQJ8Dv5gH7qBJcFhs1s
	suHgTG8G2Sct66g6Msg5T/rPNhfYJcu95ZSNGBapcqGziRVrJx14qJAYaoh+pLSY
	+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j2ser9d80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:17 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55c644cea0bso26180471cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795200136; x=1795804936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB6Wtxz06vMdMNj6Z6jJ4VbMDyZslEE2FTR0Qhz4yDQ=;
        b=exTF7GovnplLOIOz797vkSLSr3QxOrxlYPV3JToF8dNr42dl/rPm+EvSSv+YM7gbPQ
         8dpjWSR1EO+ijoek+Q6SfCl+B/iaOj+DsGLA+Rgo9fYic7xuxUt7PV7+SAtIlOBryvHW
         QDDGhnbud9IuA0GW+jeXMZzIiv+hihRHB3SThBkUpEdu6SMnu3TV8K4mOE0G/cFI8By3
         2fIHM65FFXdEPl/iZH365ZNQb7nrIjWe9Z/RO8qusaQR75Yu5EZ7yAfSGgu6u3oZq7F+
         WllOa93jsEv6mVscTYrSS/+Vzo4cP1RBtObpPtMXXtym8VoXgQ8kjyTnGfzBi1kyD0Un
         Trjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200136; x=1795804936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB6Wtxz06vMdMNj6Z6jJ4VbMDyZslEE2FTR0Qhz4yDQ=;
        b=aPCWzvKG2Ex9TfiSsudWuAGqLw9ojF+wwCyeEKUm7r3kDOgpaYyuwyfpSyNsOIMK49
         UQynfld2EOvyCw8sA7mf15BPWQnLc0JyZbCuvjMIsoDdQp95JzSwOF4Y8jIts9BcGJPW
         L8u7EuUobTBPBZpucwzg6ATxY1YWmqBq0qXLph6/js0AoxivVVP3ocl9+0EUFHjAMQJU
         rEiOEzoNDovWb0kdVIBUB/k4WPiIcPr3Nl8HCrY3xEVt3otLiH9UdYmRCRiJ1p5xTujc
         isL2IOkLnXinXqUeBM2fzq37HceB4u3DOr3XP5SWvNPXplGoyeW5uNzSYxhrXxYb+7sX
         h/Yw==
X-Forwarded-Encrypted: i=1; AL+hErG3Y8o6dDjKYB/mkrMs8wr2zTTdd3BgbFeCfhzcyU7ilSHVEeMWb2ljUkAtIDf8TY1wAoLGtRxtvMChH7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z81wEVU6b5n4XnyiAwuFsBfKqPDoyC73wBmh9aNGWaYoy6ToT+q
	VtxVyqZT1Zvh/FqVy62jx35Irnb/tJyX9APDZOkbRiW23dEiESivSL8r1RoApAhslq8TNztILA9
	syfxLxlbIvSyBOpKyNZ46a2Fc/uVGAxl5BHTyTwmrqL0uJAT6VWp2kkA6Tgta1w==
X-Gm-Gg: AYBFou3GaRUNtRnRrhj68YkmXiDc5QC1G5m8DE8yrKke6cfewWzo4WDcHOrWkLCU6YF
	P/uyFwq50/jG5kdwgHridXPWjak75MlBLkezuQiPbx9a839DD8kIs6NjKlp1MkcDz+7w3rsJg3x
	E0Z0dRXorBQY7flsdMCJxgbQfFBOOHosO7d87WcOGJTMpCMMAMbecUGpO8ixD35xUUjHElImmo3
	AiYcPpYGpwy8Ps/qrDMbXN0Lo1qkqppMfQQmJEig78ByrQLIGq3atHr1RxKMZrBf0o3EUh0B7wf
	twxRTGKldJgZhNfxli9kL7toXOV+xau66snuO680+yZ/gFK639QHoX78+h+VGTiKfT8zXKW82rt
	WAT9xBUQl/A/1hnYn0YGQbfRTS7DzONbGXZ/TUPT34JDDSoAOU5da05StQpNN6GlWXTtPY8ZQpo
	XL5Do4ql7b8LFPdoQzmQLJ
X-Received: by 2002:a05:622a:5ce:b0:536:b7a:2ce8 with SMTP id d75a77b69052e-55d76a88b06mr74193131cf.51.1795200136570;
        Fri, 20 Nov 2026 10:42:16 -0800 (PST)
X-Received: by 2002:a05:622a:5ce:b0:536:b7a:2ce8 with SMTP id d75a77b69052e-55d76a88b06mr74192821cf.51.1795200136180;
        Fri, 20 Nov 2026 10:42:16 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-178-217.net.columbia.edu. [128.59.178.217])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm28895301cf.29.2026.11.20.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:42:15 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 20 Nov 2026 13:42:07 -0500
Subject: [PATCH 2/2] md: free the superblock and bad block pages with
 __free_page()
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
Message-Id: <20261120-md-sb-page-cleanup-v1-2-117d8d686737@columbia.edu>
References: <20261120-md-sb-page-cleanup-v1-0-117d8d686737@columbia.edu>
In-Reply-To: <20261120-md-sb-page-cleanup-v1-0-117d8d686737@columbia.edu>
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>,
        Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795200133; l=1612;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=2QvXtn1wYHVVOm/IWc20/yG/3xx5860mWyf6um1peOw=;
 b=6qAU+WjRmhTUxSVMLKxIty9y06V3VGx222XrYCEdRYsLHX70B+D5APINxDKfItl6NDyntUfVw
 GoQDnfd/iEDCHwXmQr2n2xf2K7EIHjiu6CDxIeCrArm4fn98x3DHjHG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Tr9zFzXh c=1 sm=1 tr=0 ts=6b009489 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=lnglQuR7XRqnmjDHco/WZg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=UiJXAB5W49XqtTlGKSQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NCBTYWx0ZWRfX0CVv2OfZi40B
 Xwqksz0jHqQeHzrweYkg3yQbTl/vb26GZcKTU2Bt76711onSXOXwMbQi1vK/pYhhVMXZRgBp+RK
 0sS97E4NMgjMM1L0jIElfQH1wU9642EVij1j70JC+LfpCMEw4g+w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NCBTYWx0ZWRfX3MmcCYc4IWmg
 1gGn/vrkFP/dnSm5WKsJzhlxAIJj87m6yS6JDqFXTDOngI1r1ZiN0nZohVL6Ab6Y6n81pXj8jLP
 2hDtyCntPlW1vemqhqNpWi6ZoKoiSX1fJ+KzE46XtUyYfFNY71FP87zH/RSCmXxbumT64RNG9q4
 8qid6QTpMTe+khFar0wfJ9HNWqPWsM/zbkEdESSiC2vayKARSqSXaiB0c8SUWRETmuj4lSKQ36l
 ZUoIR0Eef9CDm8Pnvwr9vtZb8qbWZAtfJtiqVuVEhktnO2+pyz5xoZ23EOb+fmk6L7IAykI2auo
 1s1A8Zs8jj7+HEDd/A5OFPsemWdYSDe0lah4Vfgt53nCcvnmtmuUrFJcoq4OTD+UxW1lTir+kED
 lR/iJA/K3r4i0PUrq10bTFIEgruoDEz48ZMb4+3hweoWtIHkvTArQ4McR1+YzSY6eaTlRb85zon
 SF8vSoefli9RXHXKfyg==
X-Proofpoint-GUID: Dj0P1mQFdbjkag7VvsJCUHaZXgw9qfB1
X-Proofpoint-ORIG-GUID: Dj0P1mQFdbjkag7VvsJCUHaZXgw9qfB1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11972
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=10 adultscore=0 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200074

rdev->sb_page and rdev->bb_page come from alloc_page(), and md never
takes another reference on them, so put_page() only ever frees them.
put_page() treats the page as a folio, which these buffers are not. Use
__free_page() instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/md/md.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index c5a7f0697f7d..ef4a1141d8be 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1089,14 +1089,14 @@ static int alloc_disk_sb(struct md_rdev *rdev)
 void md_rdev_clear(struct md_rdev *rdev)
 {
 	if (rdev->sb_page) {
-		put_page(rdev->sb_page);
+		__free_page(rdev->sb_page);
 		rdev->sb_loaded = 0;
 		rdev->sb_page = NULL;
 		rdev->sb_start = 0;
 		rdev->sectors = 0;
 	}
 	if (rdev->bb_page) {
-		put_page(rdev->bb_page);
+		__free_page(rdev->bb_page);
 		rdev->bb_page = NULL;
 	}
 	badblocks_exit(&rdev->badblocks);
@@ -10961,7 +10961,7 @@ static int read_rdev(struct mddev *mddev, struct md_rdev *rdev)
 		pr_warn("%s: %d Could not reload rdev(%d) err: %d. Restoring old values\n",
 				__func__, __LINE__, rdev->desc_nr, err);
 		if (rdev->sb_page)
-			put_page(rdev->sb_page);
+			__free_page(rdev->sb_page);
 		rdev->sb_page = swapout;
 		rdev->sb_loaded = 1;
 		return err;
@@ -10983,7 +10983,7 @@ static int read_rdev(struct mddev *mddev, struct md_rdev *rdev)
 	    mddev->pers->spare_active(mddev))
 		sysfs_notify_dirent_safe(mddev->sysfs_degraded);
 
-	put_page(swapout);
+	__free_page(swapout);
 	return 0;
 }
 

-- 
2.39.5


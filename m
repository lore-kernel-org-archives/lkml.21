Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200138;
	b=jjcB90nRBf3cYgCuf8N5YKk2ex91oFHCOA7OeLiFJL8JZOXOrKsds9BEIDeH189AYONa
	 Dc99fhZWK0WpB2HDRhGddRhW5gMGAdS5ZxZx53gGP/vGudJitB11QZ5LFBpWClvdwm5BT
	 9eCsO6jN0u6hmK1EUKP1e/fmLowI38sTT0S54o4ZMUpwvdmb8lfckHaFWy1RSbEEanEkt
	 3l7x4Xj+mQXLDcWKfEHuWjDDkK6Mp8pQJuSEeI9MJsfoeDs9h6VMVoZEEGpRJdmODP5Gb
	 YU1oQgIoCxbWChi5E1odijLYIP4Feku1I1+SxsxRHAPwWxhgTQ3HHkSiRWN8Tp/7fXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xiUWDrCGEyCx/uwQdbOrIDGnkXqbylBfLpHJy8XTsWQ=;
	b=U81bQ2stnCYp9KEaqcRwRH7xzB3mF2OwdXePJwDp9gy9iJl4ROEgXCbloYExVtNijWFK
	 lsdutCBL4ndReum6XuMG+dKBnReSo2e5ZpW5lLO3h3VHo5iXrEK2gvbTW15X1bNbeJMW0
	 5ATqv9gyat0hXQ1scBeNfyYCndQiWtP+LsqBzTyjr4wuw0EnL/TQSJxrDbi4KNAo1YBEa
	 +YKhruEy0YTRPMShs5/6+CfllXwG9UPnOpGOCS5V8xGOoBX9cJH9R2o5ZUgb21Hs/dEhj
	 eoaawteH4O9glQm+MvT7tnj1Us8ImSxfdXUnxFBOTgXhvC0/W+BO9Cu5TrgwwR0Pzzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=REcCXneO;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=EzEfUw+I;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831360A2633
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A831360A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=REcCXneO;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=EzEfUw+I
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHYS7d2543046
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=xiUW
	DrCGEyCx/uwQdbOrIDGnkXqbylBfLpHJy8XTsWQ=; b=REcCXneOPYbpyCmfGUMP
	pOZF93uc4L8vfd0VFx0ydzNSsXS+VueRfsq34gtjmTOTQN2dtL9KHITYKufJ8rLW
	OaqT9XzCcZZ9X2P5DHHHTHUJT1VYUDc9+xdrDdw4sWfpoDhESlg9hWHIgl+z/YYA
	7Yr7l/EEvKFlaf8xpAv1tThHQX1UVXaMGOF24+Kc/zdvSIOaF51NueNSLWP1rtyA
	BaQZYwOXaa+6qjmAiaWcLz1ok2mUWHXrRpzKuhlZJx56aw/AM7z5+2C14VkgB8V4
	sSS8bXSJvPG040v4kPEyPaDFr7b/5QsXd4JZv8yeYKvEj94uLqf5X+6aUmnry7NA
	MQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j2ser9d7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:16 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363763b556so24602141cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795200136; x=1795804936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xiUWDrCGEyCx/uwQdbOrIDGnkXqbylBfLpHJy8XTsWQ=;
        b=EzEfUw+IuT09XDs2EVfi8QD3CQrbHwxWuF51+m82WzXzNs32Pj49nG6OB5iW+vlwWX
         /52SS5YXXl6+1v8k9p9sMqcavAQuCdiABGVJXvQTg0JZbA72vylXA6KAHzojpmuV8qC4
         AW5HT+XiOim7dAM2OgzoGf40wGhEGkxf2EkEMcRTohludXiycmko4F2D8aLXAuqJyBo1
         m2Isn95+3I2NCB9l8HELa788t/Nwfk9TrVBnej9VxwzNNq5bEJoU5iC4qUFw/RIsOBHP
         zAbT9VDSU/sTDPe6ol3GLEiqtcc+lFhzvBQEQDXYRy8fCLxGccQitmPRiFLMiu166/qF
         TGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200136; x=1795804936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiUWDrCGEyCx/uwQdbOrIDGnkXqbylBfLpHJy8XTsWQ=;
        b=KMN/L+1iK2LE3PFIbBqSyvJd/hnaNEokJcVQACZho4ykEJOI4nR2HDgfVbUc5IIbJb
         u2P+oDaWaKUEAUw/EWv7dl4K1krCFUomfMex8/0Y62dhqCghIpdhjyS4Eg/KJGRFJ6Q8
         aH/b67v9euWQSf0dbSeJ07uVt/TD9nDfWxa9JrBfz6WRt/b+uNVl5QnQHLEhVb+Gy56l
         YMSTFzVXImj4saCDzVdy8ssBo9AEntZowofETnLHQXHoRMhHwY/9Ap7ksglGkwViFAD1
         DBvzelpuQGIx2ZSXEEacNZKWUt/yOyYeSRMEka0oACOjof8Ow2LpMxq23+bDCgToRyQk
         WIOg==
X-Forwarded-Encrypted: i=1; AL+hErFgCm/49m4Lvy2Et8skFpH+VtXb8i2A1y5+L3D7TBABloM1A96Rp5gOck21voxCWKXJ4XrE7y30clh0iR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I40hLbfrze3Rmd33kokBhW1gthqAiqS74laiuaa7NUZZMp3Yq
	x2/DjUA/Td8GbkIu4XVxBt3LhRFDu0Rhp2ACe6uuQR+3BZgawA3eZnln6V5hiRN/vHNi/Eh+2a7
	zPLMnJNdLu2pb2wx//+s2WhdtsNaTgg1zoIIOpA2mIPJeggEhM305VXgkIzJR4g==
X-Gm-Gg: AYBFou3b04zPJn97Y/hoqXDporwFN2XU1g7Mm/8BcNex9xRdZZwSJdBrakpa7kbHv7v
	1Fba49Pt/EiHSyWwDFKme8RrFkShOM6cGKxaQvLvCwEdkku5ETJNqvWJ9hCswJCnEWT9+RE0H+9
	R3fNwJOUuwkwC+HOhw1HWyym7txPTYBRgiXJ2EZUaDdzLkziDHMjGFWThCafuc3i1vFvg4Uml5d
	s8S+FF2r2/pGVmHw5+ouuSS8N1WJIFeXdgXd/R/O47gt049CXkQdm744NtbBE1FamkRW4O/aAL2
	wZMy08YHrbIXH0F2h0Nlr0aVTIHLFpvd4gMHgbPhiVina6wh9KsGuZH2NuZOK28/rEg3A3Or6g9
	8hH8GgnBQyjWlpRRhxuaVFmtH+AGOepHNB8EBx8zNTvT5cAuZ4+P4+wkV2XiVm416LxuV1BTsqG
	dN3uAMeztgUmjMw9QfaNh7
X-Received: by 2002:a05:622a:98d:b0:55b:ba5b:c60f with SMTP id d75a77b69052e-55d76ac73e9mr63060201cf.64.1795200135792;
        Fri, 20 Nov 2026 10:42:15 -0800 (PST)
X-Received: by 2002:a05:622a:98d:b0:55b:ba5b:c60f with SMTP id d75a77b69052e-55d76ac73e9mr63059941cf.64.1795200135426;
        Fri, 20 Nov 2026 10:42:15 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-178-217.net.columbia.edu. [128.59.178.217])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm28895301cf.29.2026.11.20.10.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:42:14 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 20 Nov 2026 13:42:06 -0500
Subject: [PATCH 1/2] md: remove ClearPageUptodate() from read_rdev()
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
Message-Id: <20261120-md-sb-page-cleanup-v1-1-117d8d686737@columbia.edu>
References: <20261120-md-sb-page-cleanup-v1-0-117d8d686737@columbia.edu>
In-Reply-To: <20261120-md-sb-page-cleanup-v1-0-117d8d686737@columbia.edu>
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>,
        Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795200133; l=821;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=+oFMMptBtYTbW8cg4Pb3z8QNEU4fHnVT50XtPeMAibY=;
 b=SYHQ6YfLAYGBTBZJr8B4f+Izhf6lSaW28AZsCVMHorCOWxGSLB0NynSdHFZnSAiSPWRmSJDGD
 TVqJlUU1TV3ARoV3hIS0foQGXmA3d06ritJprtQoGeEiRLkXE+OlZLJ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Tr9zFzXh c=1 sm=1 tr=0 ts=6b009488 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=lnglQuR7XRqnmjDHco/WZg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=Tkn2swf4pztK5bFHqvMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NCBTYWx0ZWRfX+QNDnstikBR8
 61BckL/kMShp+wFZiK+J0lu2r+G1g4cVCvsOfynzjiWmgXvf+11k0GL8687INTjv7VNXTRi4rsr
 VwAPyAG7VxJv3UiiSaz3v7Zsrf22sTHLdtMmDQ06d2Ar59g6BJRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NCBTYWx0ZWRfX4Mu9nCDNpsVZ
 K9MuFtJb4ySm7DgwiNuE6ipTDtopuSsteEhREOx+i7lfwzsQPXBrMSXp2g3CFQkMAav8glwU1UD
 fMEiOT1UUxA/Qjmb8baIcilg5duPrSxMqEhzX4ddIknTPE5Vp3a8acm+ss8Oa0T6zd1/rS4MGWB
 QJ9Ydknlkl2ikZ8bRtAbMn0gse6ahtYo+jYf5ViAuN+ujeCRDdkQIP9FRYZNaOuHFvkrTV1x10V
 /XEakU/2FTxGkNQ6LJCDqI4CRIxZphClZWT//McngHGoonKzTsjFHUYx4DIgMSpRwLbB34Kxluv
 /+gnNapw4C3O3D5Cjp1ofv3mYf1u/xRje1I3cV6mVx3G/BI4uC7pdPwjAZRYthlsK8u5IjZ2K5j
 buLoIh9XdsFvqTeEua51mhAdZAqZmkyljFq/Yi3Qgr6ymXwWa2OQ4ncAlcOS6GWv4uxaW6Bj78r
 2syFQZss2TMjb9TK1vw==
X-Proofpoint-GUID: f9FjrqHcSKsDLwKCM23_z32NRhgR0i3Q
X-Proofpoint-ORIG-GUID: f9FjrqHcSKsDLwKCM23_z32NRhgR0i3Q
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11972
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=10 adultscore=0 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200074

read_rdev() clears PG_uptodate on the superblock page it has just
allocated with alloc_page(), before reading the superblock into it. The
flag is never set on a newly allocated page, and nothing in md tests it.

Remove the call.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/md/md.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index c71c3b043496..c5a7f0697f7d 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -10953,7 +10953,6 @@ static int read_rdev(struct mddev *mddev, struct md_rdev *rdev)
 	rdev->sb_page = NULL;
 	err = alloc_disk_sb(rdev);
 	if (err == 0) {
-		ClearPageUptodate(rdev->sb_page);
 		rdev->sb_loaded = 0;
 		err = super_types[mddev->major_version].
 			load_super(rdev, NULL, mddev->minor_version);

-- 
2.39.5


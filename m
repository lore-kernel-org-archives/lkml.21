Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204486;
	b=1W9/fGoDlaeFR1UlzyTbO5QPJELPKFs6FkGykF4hKm6dzqMHlmOcjg1hj28oL/YyTSZr
	 mnI5azD7ALCNDRboPv1wYYLGJUtAr+wT3WFvkl9ywapdRSaCDIcCvjt4xFxvMl1e+tjtl
	 fNxDAPGw/o3pRryoRDYuJBohn6PrXAAd22sg7tnegpvRUhat5XRe0nxajNMJhdrHqLPWr
	 YS6ZBI0r5rfQc4pi6KRXM4+bt5ergtsWDq2X2P6eJHA2oxVXCPoSy8s/uUVy8sqHVXOqb
	 9faavn/rI3wTiLpZZF1Y4uXuXxLp5QN7usy9o7ULJ0doz5/0MBcIxAqm7Vun2vvNPAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204486;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=jf0k2jZ5GT4jqtEGuqrJuKzcyXCpPc0FQ7ztUI+mW1o=;
	b=3AsFzVCrH2cXOdkMQ42ZZibnvr8KuXuD8uJpJ8xS3n3SwGJlG/4natlqK7VcP3i3cBgg
	 oDfgijpR7L+jzsvIQ06+p9AWz9R8OudwiL19FQtGfSbz4KJOHgE8SsQrk4PBRwMYvteEH
	 QX3Pm/jqcq56SIo3rSWwjuLPn7y7bPt3Ohl0DzpmUgwKE7VFHBYXKwWZdUEFGFhfs0Vqd
	 LQP6jikU3LFSYK735YyM3wQk1mCyvzi6tTghYFJIUqiQfI8kDTAWe3gN5WSu36R2NQ5eU
	 v0w4ppKJ7f6CNU0qkmGl4EziT4DPBikYOBvBfw6ovTpHv0p6cWKy53mq0EKUr0BG5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CF606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619CF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHAegR2935013
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:44 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tcjha7x-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:44 -0800 (PST)
Received: from twshared98463.15.frc2.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 19:54:40 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id B6B8F2F4934E3;
	Fri, 20 Nov 2026 11:54:24 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261115012806699yIujDZo6TywlxuhhSIktO@zte.com.cn>
References: <20261115012806699yIujDZo6TywlxuhhSIktO@zte.com.cn>
Subject: Re: [PATCH] nvmet: fix the CSTS state iteration in debugfs
Message-ID: <179520446474.200156.8716970202832870904.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 11:54:24 -0800
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
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX6ORk1mUSQumh
 FNVk2D3IDW8bvas31jWeuzsETuO8RVngJUwiQ6sCYpSBB4ICuufh1OnTFsv8C/Y7ARsWOVfZPvd
 C2C+eGvhByrvNBlxZXrKzsNiNnp8JRs=
X-Authority-Analysis: v=2.4 cv=bMWDs/+Z c=1 sm=1 tr=0 ts=6b00a584 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=n7hJ2mYiLs74TmPVfwwA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX4YCjd2ufGkgm
 HxuqxTJ3wqyAVaRTG5/7/6X2lm/tXDVk5aNrkIeoFqokibgHyytA+vh2CfD6lTszZKqdoLPxUkT
 RUPoZw1/AvIIwtjF4Qz/ecdJ/JTkMa0zeD0EnnTv8Lr1wwwcMOwhOm4lIeeTHf/O+PSc7W7q18i
 JM8wiKlpwPma48X5a4HdCCusovMY234iYXyvhbe67MaQFvw2atfcnM22pUhXKs+Sc3FQ9/VPF3v
 FltPFVBUuLZIdW7xifGLB+rJNewqOFvokKo/WcVQIOSgsMP5TR1jAD4SW/xQeq/qK5fAzrx3Qni
 6bBpFxqjO+zWPAPHZGYhhDLGHGIyKDaDXQfcz1mL6DAqeagVQhWx4xgEeW5AAYeubU3HCJDcA9o
 0fZChUxIoEZWDM1Cs5wByZdwE0BvEjUYPoHwg/wH00Tf0LWm+9bDL4SzEveiJUilF34pEfUmUdk
 BcpRl+40wH2iZoNYuAQ==
X-Proofpoint-ORIG-GUID: xv5PTs8T-YfJHjcdT0VyQ8z63vWfWHHk
X-Proofpoint-GUID: xv5PTs8T-YfJHjcdT0VyQ8z63vWfWHHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

On Sun, 15 Nov 2026 01:28:06 +0800 (CST), shao.mingyin@zte.com.cn wrote:
> nvmet_ctrl_state_show() uses the size of a sparse name array as a
> bit count.  Its last index is NVME_CSTS_PP (BIT(5)), so the loop has
> 33 iterations and evaluates BIT(32).  This exceeds the width of an
> unsigned long on 32-bit systems.  With GCC on x86 this can make a
> normal ready status print "ready|ready".
> 
> Iterate over the 32 bits of csts instead.  Check the name array bounds
> before indexing it and print unknown bits as unsigned values.  The
> out-of-bounds lookup requires a reserved status bit; the current target
> code does not set those bits.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvmet: fix the CSTS state iteration in debugfs
      commit: fedfd360c2f6e00d7c566ee5ed52e2ee46c99b8d
--
Keith Busch <kbusch@kernel.org>


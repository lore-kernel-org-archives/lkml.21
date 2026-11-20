Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204489;
	b=kfxvvRQhkWcrOU40PWlseeRBhMOMEjLwtR6z2RRJZRW1rSmBt5nF/euGh+8N7BCltlBn
	 zykiN5w+Fk6Bq5UBni8U8hfAtzhRxkfTY2wryemUU9BMLc1OFFg29RsDZsOvwuqJIVXGT
	 ggPHz+KmZ4nWCVm8nCFynMIqYvGgYYHnOkOfV9KdIIM2BvWuK4rfGjfHYeIt6a6hMRDTa
	 A5aIL5l/HGYv+HRdkBSZ4PIJ4xb89GfSoA2lvSXX4n0pbeClQ8Eia0WeKzCcZ+sQVT1+n
	 iUoefLAglG843Ih67WtuIL7TNY18TNk1dj9fCgH/1S37E0vBenPQEZxXeliIeD/QxDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204489;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=U9gRtsTUMVPtmFehDHVSwkvtxQ+EsTSo46abZRFq+Ic=;
	b=0I24AhG05yAQfe5rXYa/vlF3QgP61gxEmLcAewZIpWC2qceXhIHIZ3sO416j8XsdscxH
	 gMTQ7Nek7I//40HcIhjKhAYPrTqHPeKSo3CXyJ4hCROk1WN2vHBWW78POkPG6mAAjYXmJ
	 LBt7uLsIlJpbOcejwy1KSTLR2nxqDTKu2Sa2gvN5jlATvrbGUBkltY9js5KU1Z8AJ23N0
	 xGxhkk8lnghonOPqPZLNWQGs2S/GEj4jPgTIF4s94Xqqo0NT61WRvEhvp35zCDtGMp87X
	 /1fN/zhXautWaatXeT2BCe0XZ1KBgoPkhMtF+bli36lFiskvp1yQpQbSD8hX89HfM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171160A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2171160A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHAda52337671
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:47 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tcjsamx-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:54:47 -0800 (PST)
Received: from twshared24494.03.snb2.facebook.com (2620:10d:c0a8:1c::11) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 19:54:40 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 797982F4934DE;
	Fri, 20 Nov 2026 11:54:24 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        <justin.tee@broadcom.com>, <nareshgottumukkala83@gmail.com>,
        <paul.ely@broadcom.com>
In-Reply-To: <20261115012809000VXL8NL9lZ4gQEKv-NNqUP@zte.com.cn>
References: <20261115012809000VXL8NL9lZ4gQEKv-NNqUP@zte.com.cn>
Subject: Re: [PATCH] nvme-fc: initialize I/O queues added during reconnect
Message-ID: <179520446449.200156.4138844829580902457.b4-ty@kernel.org>
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
X-Proofpoint-GUID: -HmkFj7QHQFJ7tKOYLaKFNGcGUdAK3Xc
X-Proofpoint-ORIG-GUID: -HmkFj7QHQFJ7tKOYLaKFNGcGUdAK3Xc
X-Authority-Analysis: v=2.4 cv=JYcpPkKV c=1 sm=1 tr=0 ts=6b00a587 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=eF1Gjh7KCRU0b0vJ23oA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfXxeFf6BejyfOk
 2VMli/fUsTE/2NmLBJoXDcidVqkDM3WtjBbMEEap/RwscPDLez7yOfpe80yGDTi5yi2t402BH5F
 h2BenahFT1VNeWDsTlqFLgym6dfZHcn7wY9Wd85LroDm0ZRW3jTQQNHySmtFKFanGSkPrp3Ozy+
 BAgfbRuhQKhSaqdj01jhvPb4uuRc/W02c0hcvBqFLh29+qz32NxSoRBUI37JrGSAo6TFpdhSxeq
 GZQZ0DwI3L4k8qCq3aw2kPnZbgOD5aFABhUsJ4Je/pKHb0I1W3iTM2PE8DJ/Szlc4Dp5GSvIb3Y
 PnrzSq52nYRs9t2s3nsg+w9VhGIWSFW1RpiawQ9Fk5wesOCzl2ENQ1gzBmXpniVCxWfkiVdwF3l
 Y1WQgeCaDolWcOBIwjswCxPiurarHmUmFiQIgBPt0cppz5v5Ia9Ewe4I5iCZnU4TLJZWiovksWE
 yHJpk4hgYaZmu+kYdlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfX3a5H4j0530ow
 7M3Cl7SJuwndCLQ0B9KPW04rusrwLadJaxGpqlGnX92Te55kuJts1AmFfRJZd8VvhsJh4B3yGUv
 Dm1dj56X+HYoFgM7kxUjdVFe8is32P0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

On Sun, 15 Nov 2026 01:28:09 +0800 (CST), shao.mingyin@zte.com.cn wrote:
> nvme_fc_alloc_ctrl() initializes only the admin queue and leaves the
> other nvme_fc_queue entries zeroed.  The initial connect path calls
> nvme_fc_init_io_queues() before creating the tag set, but reconnects go
> through nvme_fc_recreate_io_queues(), which does not initialize the
> queues it adds when the controller grants more I/O queues than the
> previous connection.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvme-fc: initialize I/O queues added during reconnect
      commit: 828408399e142ab52298317f478646dd61071aac
--
Keith Busch <kbusch@kernel.org>


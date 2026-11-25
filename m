Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602544;
	b=zeMhFjxCcNRD6SC8i1Jwdb7xJvvD1pw6jYosUQzBPXKZBMRRiNHUzMLnil+7BdoZZ2CW
	 HqfwU33sw6G4rJ5KOXi6j3swTLcdcLcI1JhW7WFl409pJYmMh7laci8IiVHwmM4r6hFIj
	 3dQbPyeeIgUrCpIecO0zRmH2dbhdP2fgaCKRdajbDs1e5CReymdNJBc4+fTpq/M6e30GK
	 ZHCcY1UGVJgHV17B0eYyJyCdjcF2Lu+zfn/VLQ2uR+AiMgpOkYBIMIkKt54rzwGyzmKHh
	 eMAQqBnHWwC2Gcstbxm6/jdmA3KH0yqgFSdP4k+sOZbu/0PwR2NM8XNa/fZUKyP0sIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602544;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-Sendblock-Type:CMS-TYPE:cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:
	 References;
	bh=xFlN4rclmJ3cTwSoXr8Ud2HB/tsk3Wve0CUo7sMxAvo=;
	b=2J56pexpVez0e4U8HcCjPgKYnTqSqM332sB7CDRv4DMVtAPL8HawAhU3B1MNbRoxzHuW
	 u2nSVJ61ocIVu/0ZUaCVRbkxrAw9YIJi0e8i7IBizUuYyN7Wa2OxhA0qVGfy4TFvW4aqB
	 YXSRow3cZBHCuh3pCcVvMmXxh4ZNyTuwYM064it8CW4ayIeI1H+Qrzm3c/Hhczr3reXMx
	 6UhfP198TgY47B1YzyGYjbzcw+6MEVJeez9KqZOyRTcRhkWwNaXEJEsTpBGObMEwH5+tH
	 5ShyJNj1/u7JPyDWBrhhUuRzQv5mwR1QVH0HvKf5Dp/waYiveHxKlMRi03R6hRY6n5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IaPqJDfY;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD730606A684
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD730606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IaPqJDfY
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261125102859epoutp03963aa567ffce8027d228849d00d8eaa6~rQv8bS5OE2630126301epoutp03k
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:28:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261125102859epoutp03963aa567ffce8027d228849d00d8eaa6~rQv8bS5OE2630126301epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795602539;
	bh=xFlN4rclmJ3cTwSoXr8Ud2HB/tsk3Wve0CUo7sMxAvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IaPqJDfY2Ezy3MpR8ljLSiOz0O+P0b4vFneuttWJk9xIn+lvSFVBnb5S9oipbTo7A
	 qCeXi+y4jAXosBQshuTtS3aK+0r3lf2JwN4hFt1aAl9UOPqmRw2ne0wPobijbiakaY
	 GerV6MP3kYoBrjaVl4e5z3EKZZVfh4Hwk9mSunuM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261125102859epcas5p1f5a9e8472cf6d472e27e339ec3b48683~rQv8EdnHT0425104251epcas5p1e;
	Wed, 25 Nov 2026 10:28:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jZGB233Vnz3hhT4; Wed, 25 Nov
	2026 10:28:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261125102729epcas5p13bde0e5ffba2e9660726500efb20ab59~rQuoqdnWa0487904879epcas5p1u;
	Wed, 25 Nov 2026 10:27:29 +0000 (GMT)
Received: from green245.gost (unknown [107.99.41.245]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261125102728epsmtip1facce2ecf66c1f2173177a007f33f963~rQunpYMbD2682226822epsmtip1S;
	Wed, 25 Nov 2026 10:27:28 +0000 (GMT)
Date: Wed, 25 Nov 2026 15:56:39 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Andrew Stellman <astellman@stellman-greene.com>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi
	Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, Steve Wise
	<larrystevenwise@gmail.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-fabrics: limit nr_write_queues and nr_poll_queues
 when parsing
Message-ID: <20261125102639.ikftz2pvdwjuuagd@green245.gost>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261122233951.8912-1-astellman@stellman-greene.com>
X-CMS-MailID: 20261125102729epcas5p13bde0e5ffba2e9660726500efb20ab59
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----oDladO6Vwt0H_RtjxHNT8.74ezodDQj_tEbGsjA-MAFMp74Y=_5226_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261125102729epcas5p13bde0e5ffba2e9660726500efb20ab59
References: <20261122233951.8912-1-astellman@stellman-greene.com>
	<CGME20261125102729epcas5p13bde0e5ffba2e9660726500efb20ab59@epcas5p1.samsung.com>

------oDladO6Vwt0H_RtjxHNT8.74ezodDQj_tEbGsjA-MAFMp74Y=_5226_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On 22/11/26 06:39PM, Andrew Stellman wrote:
>nr_io_queues is limited to num_online_cpus() when the options are
>parsed, but nr_write_queues and nr_poll_queues are stored as given.
>nvme-tcp and nvme-rdma size the queue array with the unsigned int sum
>nr_io_queues + nr_write_queues + nr_poll_queues + 1, which wraps for
>large values, while nvmf_nr_io_queues() limits each term to the online
>CPUs and so asks for more I/O queues than were allocated.
>
>With 4 CPUs and nr_write_queues=2147483647 nr_poll_queues=2147483647 on
>nvme-tcp, the sum wraps to 3, three queues are allocated and 12 I/O
>queues are created:
>

Reviewed-by: Nitesh Shetty <nj.shetty@samsung.com>

------oDladO6Vwt0H_RtjxHNT8.74ezodDQj_tEbGsjA-MAFMp74Y=_5226_
Content-Type: text/plain; charset="utf-8"


------oDladO6Vwt0H_RtjxHNT8.74ezodDQj_tEbGsjA-MAFMp74Y=_5226_--

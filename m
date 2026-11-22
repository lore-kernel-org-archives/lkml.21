Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357755;
	b=t2EzDi/NYWkBSdg3bfEN1DjgaQ3xRzNnKSDYQyZ+B57eyc4r62Nr8efh//MR4VaGpLaY
	 M0ZNDqhw9FgGf/F1rwJh6CRPGOp4kPMSM+w+UI5nmHHs4YB4sNWWwxm4e+s+1cDR7DPi3
	 yTo9nZYJY86pemub41c+xVDSYCVs15WtIXggNHjGrpKNBhEufAM36h5+v+37TfPGemqsE
	 m2nlpKljrdQNOD8wvSFzxFMoqCPeKDMRfJB+u9GYkuqWhTo4JoW7alDXj2UQoij6oWRtR
	 kfHg/fLwu01EbAMmU+6Gty9sIEWLJZ046LF0LSp6Y8c9TYiJRNtNePogTxZ2KYMEw7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357755;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gWqmUjLgWcC7CA4bGukXCIfetYhnHSufytFvIvJZj/w=;
	b=AVcgQUGq10mIZ9AP+2FQKrB/zN2PEM7p2+7MumcmPBavMNKeq4gvEFuwIO4dj2amzTCb
	 t9nESciTqica16a8nzM6mFunbkKXOGMqc+0QjYqQNsqoaqDnBX/HOMMh20aWdgYVvQJ6Z
	 TPh82V7QgmGUXYcXWQVy/4mw7Q50fgsf+qAc3WUvbigeFz4JHouKKhiiUztcEz+JT4k4A
	 kpiE8ngCOAAtsfKfs+55mli60TYrxvKQ5lVNqqWFs/NOpQxcGdXLAdlHarHrHm5M9f2Ok
	 AhgbH+M8YyHf8pw2rlD0y0Y7M6Mgue31AC51a0MXTcfQQnhMLyJ/QaVe3fZe5XArV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cNcWsEY2;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9AD606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cNcWsEY2
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795357745; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gWqmUjLgWcC7CA4bGukXCIfetYhnHSufytFvIvJZj/w=;
	b=cNcWsEY2oUntrkRtXezTRjoastgMTQCLYDVeAZe+UXGvNmM2+a7vHbyPh+ap4/NWfntusGB0CtFApddorbg/nQYrcc+DGEW8D3bN7XQf+De4xhLTlvvc2yWVydnT1jhWA+FxDr5RCk0WaiSGL7HijMLfH9p0/FLkrrGlDn4TLQM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFB1Vv5_1795357744;
Received: from 30.180.33.101(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFB1Vv5_1795357744 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 22 Nov 2026 22:29:04 +0800
Message-ID: <85cd5f2f-5b08-4aa5-9b4d-7e271d021c1e@linux.alibaba.com>
Date: Sun, 22 Nov 2026 22:29:03 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v9 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce
 iomap feature
To: Christoph Hellwig <hch@lst.de>, Heming Zhao <heming.zhao@suse.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261120060014.12087-1-heming.zhao@suse.com>
 <20261120060014.12087-2-heming.zhao@suse.com> <20261120183415.GA2450@lst.de>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261120183415.GA2450@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/26 2:34 AM, Christoph Hellwig wrote:
> On Fri, Nov 20, 2026 at 02:00:11PM +0800, Heming Zhao wrote:
>> As part of migrating OCFS2 DIO read/write code paths towards the modern
>> and performant iomap framework, here introduces ocfs2_map_blocks() to
>> replace the legacy, high-overhead buffer_head based block mapping
>> routines.
> 
> Do you have numbers to antiy the high overhead?  Or should this be toned
> down a bit?
> 
>> In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
>> mapping flags with the iomap API requirements.
> 
> "gridge"?
> 

I think it is a typo for "bridge".

> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>


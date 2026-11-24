Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487974;
	b=AwWlDZf/WxNvVSJPa5pYmR3/S3W+n575oOojyO/fj9mPKQPr7wJgAWozFMp5Ohl9H0/V
	 ++2pwW3Sd8ZckqzeVTsRgaq0Fg4yxhqkD6BcwIlTCKPHcPHiqO7TirohjmYRtQ67AP7xo
	 9lZ0JQuw6FX4F9vZ9rnhErhWBrY/8DMHqgmaCXL4AM2p0Z7LRHFC/5QBVs5i/aXqWYBYt
	 yH1aNTRvaukCGMpVHwPN2rUmoQrYrNiB5ZjGkCFIAE6vSfEMwylcBu0woubj0YfZzOqOS
	 3RELIGygCK2y3iMPQwSYXg0iBzsuI+mqDFaCcR6y4EW/ISU+Jl28mute31XVChjzI/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487974;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=zve+A8EdEpj67a/vh+Dk/itIDrtlVGR/8h1o6XoTsvY=;
	b=HqTgqYpwhkqKDAznDPabaITUhjZW32OxtHb1xbgtLDJljldC/qzjzWNzxJiA5a17kwMY
	 /zE5qE8W2zrXZxC0eKD5yp3aPmbQ75P82Xhfe9SsCxyHxRQvMbaKP5DQp1IGiQKtaQWoz
	 ymSx7ZrNu0qcsoS/9UXAsEfvJM57aaVQFTjJDDy0/fyIRjyE9Wpbxq7Jrb+DmmM8VAoZv
	 ouZur1eGh9ZV+ZXHqZ44ssNCQN+syx7A0zn1TyyiP9PN7MibF8YLOv8dl5USPeN28Y6r6
	 MAllkQDATvVvDX3yg2PIDm7M34VS0vDPUbYPUtZR+y29ZDPt6npO8DsVIixIptKVM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JsYnWihw;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E9606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=JsYnWihw
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261124023932epoutp025c08d310b3e8f9a9da92a68b5f4994fd~q2sxAMlC00932709327epoutp02U
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:39:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261124023932epoutp025c08d310b3e8f9a9da92a68b5f4994fd~q2sxAMlC00932709327epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795487972;
	bh=zve+A8EdEpj67a/vh+Dk/itIDrtlVGR/8h1o6XoTsvY=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=JsYnWihwvj4VSfznxdeU7r964KoPaIavrYKTdXrS6OnHwajtZ7PhCbcNPFQBMuVJj
	 MM8H/k1/NsvrVQ/HXIziFPMBY8xG2cRRTI8jhM0W9O30wrqHthSGH1VBeuQbsFWfsQ
	 9HFBKg2PVk+7uCq42OdKdaISmhGQjmMyL++lIUkE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261124023931epcas2p3d4ceecec60dda0cf69412bdac06060b4~q2swqFO3z1035010350epcas2p34;
	Tue, 24 Nov 2026 02:39:31 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.208]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jYRpq3q0Rz6B9mD; Tue, 24 Nov
	2026 02:39:31 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE:(2) [PATCH v2 2/2] xfs: skip the fsync flush when a later flush
 has completed
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From: Daejun Park <daejun7.park@samsung.com>
To: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>, "linux-xfs@vger.kernel.org"
	<linux-xfs@vger.kernel.org>, Dave Chinner <david@fromorbit.com>, "Darrick J.
 Wong" <djwong@kernel.org>, Amir Goldstein <amir73il@gmail.com>, Brian Foster
	<bfoster@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20261120181706.GB1954@lst.de>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261124023930epcms2p76ee61d14c5333dd04b4466b9f11bbcf8@epcms2p7>
Date: Tue, 24 Nov 2026 11:39:30 +0900
X-CMS-MailID: 20261124023930epcms2p76ee61d14c5333dd04b4466b9f11bbcf8
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261120181715epcas2p3fe7b223290792dc835b5dff5374b2cbc
References: <20261120181706.GB1954@lst.de>
	<20261111-xfs-fsync-flush-seq-v2-0-b5c00c25d276@samsung.com>
	<20261111-xfs-fsync-flush-seq-v2-2-b5c00c25d276@samsung.com>
	<CGME20261120181715epcas2p3fe7b223290792dc835b5dff5374b2cbc@epcms2p7>

On Fri, Nov 20, 2026 at 07:17:06PM +0100, Christoph Hellwig wrote:
> On Wed, Nov 11, 2026 at 12:17:12PM +0900, Daejun Park via B4 Relay wrote:
[...]
> > With an internal log, an fsync that takes the new skip can miss a
> > failed flush on bio-based dm. dm drops the error of a preflush sent
> > with data, unless the table is linear or stripe on a single device.
[...]
> I think you've fixed this bug in dm in the meantime, right?

Yes, commit e92cd41e8e5e ("dm: fail a REQ_PREFLUSH bio with data when
its preflush fails") in v7.4-rc3.

[...]
> > +	 * DAX writes are not block I/O, so DAX only skips the flush when
> > +	 * this log force flushed, as before.
>
> I don't get the DAX part.  As far as cache flushes are concerned we
> don't special case DAX anywhere else, why here?

I was not sure that a flush issued by another CPU covers DAX data on
powerpc, so I kept the old behaviour for DAX. I never verified that.
The existing log_flushed skip may already rely on such a flush.

v3 drops the IS_DAX() check in xfs_file_fsync().

Best regards,
Daejun

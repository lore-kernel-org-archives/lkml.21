Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487916;
	b=J0ZnBbez8/w1gLQ0ny3yLc+zXpPTJwZMuqMWAyJZrUop6QKMnrmoLfNtDCG6hNHu0xCS
	 jVp9JInPK9W9A0Ep6LLPKyGzqFpDwqq2ZkEgrbi68o4wKOn+uWWlsNXFcNRMYi+nuH+Mb
	 +EFhiDmB5V6aABf1Tl1PMAKsmKslsFsL57U2dhr1h235mCgVoOs+T71Ws1bshRCcQK/jM
	 LiucTCQkxeYVOwUkFSD4gnUuG2p16j+nAxviK1DvZ2XlIPZrqVipTHSHPui0SaB6KLqua
	 4oZ3uBN+4zH2aG0Nny6xCzD1LXByxmdg3wFwKA+V88HHsLFeYB6qLmEt/EBVEhpJQQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487916;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=HKYZC3rzoE+ZzWxOI/rVzbevkg65KAdLMa12FNrpyAM=;
	b=nFmfmF1XzBJ2JQa7RDxa5PgCwyDT+Kg9SSckGVxpe25VIN3QHwWWZy4IbvZ+2sygYhHw
	 L/SLfksb1jsZFB6Dr1oJLDXYeCbkqnNg/QwlARuzUTncBHRWQOfVWX4+YjRTRJGpxF0YH
	 u1eTSOGLO1VqBJkHiYpNuslT2JLsIAuXA+gPwm+lnYhyn1jLABw2fYRqcQpVMtQbR5XMD
	 4azU1nwiq6qvYUpCfHWklhpBPokWzvjTUPa0ofb716L/wWexTDxeQOhrEWA+k3smEN2LS
	 sBKQe0qmZS/xkOTYyjfAml6GOHHTjACOMXZlzIuohot6BAzAj6iWa9+mEmI6mTLZhmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nBlcyjm3;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B3606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nBlcyjm3
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261124023832epoutp023af26a6720a778b5f3e63ea82172aee7~q2r5sSc-y0873908739epoutp02E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:38:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261124023832epoutp023af26a6720a778b5f3e63ea82172aee7~q2r5sSc-y0873908739epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795487912;
	bh=HKYZC3rzoE+ZzWxOI/rVzbevkg65KAdLMa12FNrpyAM=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=nBlcyjm3TLLJbi8abKX+SG52Gvfryj03aEvZnSTzZYeD+OE0feB27zgHLqUfaA+Mk
	 TmxlMlF6gENCULIzF9yjK9sZDRp4PbwZlO3WU9+8tHavtOWzpqVrs/caGr4UpWOJ2S
	 TVYs53tZBLs4kRdfjGbO4J94ITXNSQV4YczjUYzA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261124023832epcas2p3f9fb0224a5adf118fb229811a08e40bb~q2r5fLSoO2445324453epcas2p3D;
	Tue, 24 Nov 2026 02:38:32 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.210]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jYRnh31BDz6B9m6; Tue, 24 Nov
	2026 02:38:32 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE:(2) [PATCH v2 1/2] xfs: number the cache flushes submitted to
 each buftarg
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
In-Reply-To: <20261120181424.GA1954@lst.de>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261124023831epcms2p795c1d5742991c1f6bb416c52db43a312@epcms2p7>
Date: Tue, 24 Nov 2026 11:38:31 +0900
X-CMS-MailID: 20261124023831epcms2p795c1d5742991c1f6bb416c52db43a312
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261120181433epcas2p26ece3eeb06a9aef1612ea1f4f13238a9
References: <20261120181424.GA1954@lst.de>
	<20261111-xfs-fsync-flush-seq-v2-0-b5c00c25d276@samsung.com>
	<20261111-xfs-fsync-flush-seq-v2-1-b5c00c25d276@samsung.com>
	<CGME20261120181433epcas2p26ece3eeb06a9aef1612ea1f4f13238a9@epcms2p7>

On Fri, Nov 20, 2026 at 07:14:24PM +0100, Christoph Hellwig wrote:
> Can you try to merge the two patches?  Having the logic split over two
> patches is really confusing.

Thanks, v3 will be a single patch.

> > +	struct xfs_buftarg	*btp)
> >  {
> >  	struct bio		*bio;
> > +	s64			seq = xfs_buftarg_flush_start(btp);
>
> Nit: we usually keep variables that are initialized at declaration time
> above those that are not. 

Will fix in xlog_flush_async().

Best regards,
Daejun

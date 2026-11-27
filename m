Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778352;
	b=wf97F0l+uIxPdhMMKQNudb8vPzLyH/S6E4q9A75+DccUk3/r1Zkd4fCi8WWUNzbPYiy5
	 YaQUnKjF6fedLSh9YYTKsTm4mPmrTkCGDhE6F3QAXrISNvgiRRiCes/7AZXUl+IRlaRC5
	 4XKpztvho++YCgjgbLJuFhAertMIEGt417x0BMoA0XkDtppLre31G3zOcnpouGapo436X
	 dCSVGZXrGCI/ycSF4MwkJlFi4/mCBFLEAwbqjnTGaJ20ArRzJMu+OAUx9E4jRPMdDwo5z
	 3KlEDnofWm093yrGzMqYqTEUq7Nlbi3kWVsBe658mf1+DGxHAWVEIw6KhNjk0+Ijhqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778352;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YBXEOAJiJfCQ9GE1k0BvVgt5VxsFrrFndRGxSCCHo0E=;
	b=hZw/5TgCi6JgBir1Mot7jm5kPlMjJY9YMk6w1HzmSNTY58+W1tIVoKilFvXFxWuOhx0g
	 JNWPNAMniQIMcYNVZSCxuP7V12DF3IE1WpvP0Sl912ip1sSZoxVv9IP37LsVWVnp+YuAc
	 2TKkPaaIKkIxlA1GiVpjLrmT6fRuCny2g/YG8fEPmwqJWW8T2Odg/0fFe/xh2ZMTJU0lu
	 wTGPBNd2uVUXQT1Fll3uRLjag9SNueIRFSYo3KeOqXpbqImeOkSy4nC7n0d2UicF2qoCL
	 CEjqBVO3dpOfdDrj514U29co0tnNeYHWdxoY1jEGQ6/JAvRa9oTvrmFr+uODoEaRw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA6A606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA6A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8CB8224539B;
	Fri, 27 Nov 2026 12:19:04 +0100 (CET)
Date: Fri, 27 Nov 2026 12:19:03 +0100
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Qing Zhang <diasyzhangqing@gmail.com>, iommu@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Krystian Kaniewski <krystianmkaniewski@gmail.com>, 
	Tal Zussman <tz2294@columbia.edu>, linux-kernel@vger.kernel.org, 
	syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] iommu: Fix dev_iommu leak on mock fwspec initialization
 failure
Message-ID: <awlnF_rpSUDAMwiV@8bytes.org>
References: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
 <20261107140000.1-1-diasyzhangqing@gmail.com>
 <awQGCKf4UGKO1bjw@8bytes.org>
 <20261123145150.GA179082@ziepe.ca>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145150.GA179082@ziepe.ca>

On Mon, Nov 23, 2026 at 10:51:50AM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 23, 2026 at 10:23:32AM +0100, Joerg Roedel (AMD) wrote:
> > On Sat, Nov 07, 2026 at 10:00:00PM +0800, Qing Zhang wrote:
> > >  drivers/iommu/iommu.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > 
> > Applied, thanks.
> 
> I took the other version of this in the iommufd tree
> 
> https://patch.msgid.link/20261106-iommufd-folio-dirty-v2-1-3f0b0be58c4b@columbia.edu

Okay, dropped this one from my tree.

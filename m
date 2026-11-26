Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686610;
	b=0E3IgyjRfKIvPXZ+z+P1Vn+O3LBzYlOu1dFiuNfRl8QvanaVkiv9v5Kw/LH708E4hAjG
	 YdztznngMJbfk8A4avSm83jSPO4fIPJG4LybdIm/k7oZBIuYseQsTa4BVemZx/fb0vlW3
	 FJhjMGuuULMFKM1Qa78f5W6VPIi4CHmFGRjQuKYmTxKs1OaLTxLGz/ZtrGjkhLJZ37nMA
	 VN9dkJfGcIjZ43GLQcaEyf8xioFjRsVW3br7R5CyewK8X4t4o+b/mVS30Dw96Vkr72iMN
	 lmnkIowUqrBBolvg/sH5C7odz72yxjLtCi7i7MfxIEs+UlyGJ4WOpn4VzTFnmi63osQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686610;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6+hxN4tu2eYB95Jsuzz0VEPWul4QOCQPBHxNySL90II=;
	b=JVd7HUQkY4wikmQSj27FX9nZ3hjxTrjQZDU+sBYpaIRcQ5vieDNYYwQlxvf16g1/jEej
	 x0lYSzawd2fGe6Zw4jTgadibXlM5ztY7AwuqSzyAVezlf3WGzeabJJSKc9MhefWmIvreN
	 AhXqaI5kj3oOhewyFEMrheVMzYfvZFnfLdPGIN195fH+Uuh4qCNFjPQxCKooeyhTr3Eek
	 S9nJjVrFCS/4iVO2RdIosfAkjPtmk0uOgBIeLT1CoO5HGKG1x+k83i2g+P2u9Ycz4Ilvg
	 IQmi4VxJLd3CsnYLAcUYxH+PKNI6uLPAkr8/YlpOi2b/Kb8zfAxw9ko1RqayVfzYujw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NEKUn8O+;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51630606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51630606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NEKUn8O+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6+hxN4tu2eYB95Jsuzz0VEPWul4QOCQPBHxNySL90II=; b=NEKUn8O+VAYmzvR6T8MRCMO+S1
	1L8Bfo6at5en2xfTH1tRsulDWLgqEZdN5TadviuOwtVjltLG7NwdXwqC+kCdaMfGYrgz3/rlQSb1d
	0jOSms//XG8qMXTWbophjoJhNmKb+F6EPzbSdXpiDL7TaBW/MloJumyT44vboM4n3/ryP2/5nwhaG
	W9K5Jd5/ud95lK+tX8VRDe1MOd0otZ61TBcuVE6feFUfb6EnSOuMlFMnLKN9m9aiWMeD1GUtLD6av
	x4eL7bD6SgNKsshbD10QSN83c/5c+SVI43GyWLMRdMH1OddJtTovvRdXJGEMRcFySours7c9QZKJq
	aHfTcZLg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW7D-00000000JdI-3oyp;
	Thu, 26 Nov 2026 09:50:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73D27303082; Thu, 26 Nov 2026 10:50:07 +0100 (CET)
Date: Thu, 26 Nov 2026 10:50:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: linux-kernel@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] cleanup: clarify scope-based resource management and
 goto guidance
Message-ID: <20261126095007.GB49833@noisy.programming.kicks-ass.net>
References: <20261125161205.65809-1-przemyslaw.kitszel@intel.com>
 <20261125164443.GH2668804@noisy.programming.kicks-ass.net>
 <d4f08ffc-fc04-424d-b13b-41df7fa94e74@intel.com>
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
In-Reply-To: <d4f08ffc-fc04-424d-b13b-41df7fa94e74@intel.com>

On Thu, Nov 26, 2026 at 05:29:33AM +0100, Przemek Kitszel wrote:

> > Then undo_pre_bar() is inside guard(); and that is very much not the
> > intention. The same will be true with ACQUIRE();
> 
> ah, I see :(
> 
> would it be fine to relax the doc and stop discouraging against
> scoped_guard() and goto in the same function (but keep the "don't jump
> into/out of its scope")?

So I don't really understand the problem we're trying to solve here. Is
this really about AI being stupid? Just wait a few months, I'll catch up
or something.

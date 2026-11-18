Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985615;
	b=uzKKM4yN85YxTJNeZIrTJa+ybgy1gPdUa0atRXPKhcaAcmHBJRR/4FK0u3/7PPOghGnc
	 O12d/eSLvkWa1tI/DJOLJHHLVPPD43pouw1Ja89b9DRo+1Mji5aruXrCRYg7+cZCfrDN2
	 NBi8FycABh8KwwwG19KiVX5sJICd0yb4lIFqU2MXpOmCZzmR6diCf2k1UQpSI0DTRnVPP
	 YzdDiUGDt5IbviqPKXC9EaSzDK3Hxi1+K1QyQmdk16qyOEcw0mFCH2ofvXlBisIM12ixt
	 xhNrwHKQVdttrqVMVcMuFFJq6h/iGeoTzxOTZsaz3ykFsKbHpnLV/Xnh0t2/Kd+Xdbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985615;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lavIvmK0urfTHmvVury1Glpuztzy8qTc3/egbY5arcE=;
	b=nKPA6YBIwHSUHcs4DFWzEi2fa6Ct0H0an0CiKvU2Iq6TX+zyohbQLCziwLZmgVn9gWAs
	 DWY8n8Ur9ZsDP/9UR9ezG/WabpjuzNbeqwsqzrVBuwTsuHyi/bd/uxrGXUelRcespBzNk
	 JuTRonEpIAYb1uomfeGNU43PrMiH4F+mzFMaQqTlQHKlP+8jhz8GiqJO5XHPf80N2agiG
	 WWAUuWlZTpiK29WTqojM50FgFqLxckbXPYEhFNhpdPUI3m90Durd1ltQKNGl6rAudn0pw
	 R+TUomUfDIzTQ4cC6rsSjK52KHDTmxm5WCHvkXBSoIhKkgHZ9pMhWDTbuyuEmE85jlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dJJzPrgL;
	arc=none smtp.remote-ip=91.218.175.40
Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE2606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10AE2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dJJzPrgL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6DGn/R9oKAsdK87b39nDdkeh8fsr4sCIVdI0Xj/b8fk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794985613; v=1; x=1795590413;
 b=dJJzPrgLrI63mNW7x06jI8qibtBICPfeWiToWIxtxRy0RXH+poXP0quG8BLWZiDWgR18k+2O
 XC3fz1ShL6+kmL5JgsWpxTEl9jc9H8oPXaiR14g/7pWlfnZgxcz5mFpt/eaUlCMJjryxAabtjow
 dhL4zQy/g7qXhm4vIvLRAhzk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 52a0c46646173832;
	Wed, 18 Nov 2026 07:06:52 +0000
X-Mizu-Trace-ID: 52a0c46646173832
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 15:06:38 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Justin Iurman <justin.iurman@gmail.com>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-ID: <av1OftpFCWPLimPx@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
 <20261117035021.e724668d726ecce54e091288@uniroma2.it>
 <avwUzLyWxZl9cBIX@fedora>
 <20261118035010.e028076fbd99fbcddd937156@uniroma2.it>
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
In-Reply-To: <20261118035010.e028076fbd99fbcddd937156@uniroma2.it>

Hi Andrea,
On Wed, Nov 18, 2026 at 03:50:10AM +0100, Andrea Mayer wrote:
> > > 
> > > Without NEXT-C-SID, get_rt_sid() drops the adjacency, as the Sashiko
> > > review also notes: "4>2:psp:End.X" and "4>3:psp:End.X" would both get
> > > fcff:4::0af1. I think each adjacency should have its own SID. The
> > > SID could carry the adjacency, as the C-SID already does. Then
> > > __setup_rt_policy() needs the new SID. Calling get_rt_sid() there,
> > > as suggested above, would do that.
> >
> > Hmm, do you want to set the adjacency like xaf1 or xxa1?
> > e.g. ffcf:4::2af1 for 4>2:psp:End.X, ffcf:4::3af1 for 4>3:psp:End.X
> > or
> > ffcf:4::42a1 for 4>2:psp:End.X, ffcf:4::43a1 for 4>3:psp:End.X?
> >
> > The second one may also need to adjust the End address. e.g.
> > fcff:x::ef1 -> fcff:x::e1
> 
> The first one you propose, fcff:4::2af1, seems reasonable. The adjacency
> takes the place of the leading 0 of the Function (0af1 -> 2af1). Towards
> the host the 0 stays, as in the C-SID, and the End SIDs do not change.

What about noflv? e.g. 3>4:noflv:End.X, should we use addr like
fcff:3::4a?

Thanks
Hangbin

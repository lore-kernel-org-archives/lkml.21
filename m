Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428692;
	b=kJNEuLtp2TjSsoSOnn5vhhjBOj3XdNy0x45YD8Tkan7shPsesXVcx43hCO8u4jh8DtwY
	 +iorxBsj00fy6b9pnOf07oGp9kFlgbn80Kj3+oFBGRZy/X1KjPGsug43Ne1p6VaN8sdgS
	 Q2zYktvSEL5/3Hn/HCopUUppJQpAghuL/EGU5W3O8OPmWtLuWjZLlA0cfRhDMS2sx47+X
	 cuQpvxkfMOfIuY2NhanadUx6X0sSP4KhllQulpewhY5If46inefzcXB68i/ng/PDqyquF
	 GhKKV5OWfzqJhjgK5YMElrRcBpn9Qps8fen9KKBXmhizV+4J44f9tdG5pCxez7zB0xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428692;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1hEHGiO6uEz58tvETvrQT6zis242kXKP0Vd6EXhx9Qw=;
	b=fUH3i0aE5yyDOjPQ9im96ahRdSCkKQVcyzYlrmRrgglYL/2FUWQNBLFuOK2WznPrckML
	 Ixvic+Fgpjyd41PNXt0OIPlAc05nmZUh7nRuNFJCsrBkVCt8jJPjViF/Pj4rN5ihJ6pY+
	 ozPDq3xliDDUrMGjhlVtcucgRKkj0ONtQXArmDlFotWp+aFnXGWPBOPtLSucPG/6BTJ+k
	 Pp99JNp7gRGNDHv6MfvpdQhm1LRWFLAL28CHgpWVur96BiI47t4xs+hjtKnXbK24aVZmg
	 hIdzyl5OVliYUgVoj7F6sk7ab5DKswQvl+lxKUMvwOvNidYPJFShuh4ONInsH4cL1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XCJ/Km2d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C1606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XCJ/Km2d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112CA1F01568;
	Mon, 23 Nov 2026 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428692;
	bh=1hEHGiO6uEz58tvETvrQT6zis242kXKP0Vd6EXhx9Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XCJ/Km2dP7kS+Xu6vHqHRzPB4/wgCYBJC/QSXn4G3XG0jDpGDd37wsVV+vPI1KMjp
	 g9XGGVc01oFwXUM2Jm/lSCnM2Yu+zt3zsDgAEJIc9KJ9Rj3xmnUOm/QzN0djeIGCoP
	 56Jdh0cIp12gOyQxY2ky+9jESIPqc1NQ9tlIhxaCRbYXJ96vTj2Z3vTf4Wbskc6vko
	 K4w6AaPzF7IVPCHNTf9mgJYm9Wkc8sw8p6Uw1CgLM9J76Zf4KLxjIFw9wpf8hx7d8L
	 +93G9vbLFNxRqvRQMmqJBrKLVGBNqBX5ZKEacQGFkUcSGl8SmCZCERGTaehOAP3PU4
	 U6Cb28oa1f0wg==
Date: Mon, 23 Nov 2026 00:11:31 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] workqueue: Fixes for v7.4-rc2
Message-ID: <awQRUwvY12hZDmqG@slm.duckdns.org>
References: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org>
 <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>
 <avs4uWg9ch-Bqobj@slm.duckdns.org>
 <CAHk-=wg+MO19H7KVgA+SaZvvt5O+3Tp8AxHVhpN23JtaSq=G4g@mail.gmail.com>
 <CAHk-=wjm3vbiNYsR+aHxmM3KCEgsSWb379ZQbCuZEsN1dhvbKg@mail.gmail.com>
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
In-Reply-To: <CAHk-=wjm3vbiNYsR+aHxmM3KCEgsSWb379ZQbCuZEsN1dhvbKg@mail.gmail.com>

Hello,

On Wed, Nov 18, 2026 at 11:27:38AM -0600, Linus Torvalds wrote:
...
> And then the drain_workqueue() logic can just be changed a bit: after
> draining, go back and do kind of what you used to do, except don't look
> at just whether the pwq is empty, but also at whether new work was
> started?

Yeah, this is a lot simpler. Instead of trying to detect events across
flush, just make sure that empty test actually can test empty.

> A *UNTESTED* patch like this, in other words...

This looks correct to me but lemme do some testing on it.

Thanks.

-- 
tejun

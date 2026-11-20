Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168756;
	b=4YLBLzyYGR6q+SOAUVCU3CMe0T97b1L1SHSRPUD3KOWudq5WH2A0tG9uZVf56MUUFrJS
	 lc3y4KyRFJPxtJmonRHn1XlbjMnj8qRDEXnGx/JmKm2lmsrHGetHy8hOJ/lhChCX+5IOK
	 zA805TATVkY71Y0SOwJWhAwf6u4Ey81B5n4duiDBooI4RPrS9aQCkqBovJvjOTs1X3w26
	 InIYuHw2yOJCd8RK8WLFtuhqdscUwd1BIVrX68UCazQQn2PZV4sJ9trOZRDKeAXvowj5y
	 Fa8l9Dr3fMTaKDm+tJeFrtK4Ly2xPaVgp1ZhVwOCxkIUNEXlh14UTQWi4sQt/RWGS1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168756;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aNJVgiuqS87QmiPYqOjVcz6sjCHusWRo9ExL6mlDqFo=;
	b=Fo2aORt6mcTgGV0F+mqWUyFa6C3p23XdyOETOQnZDp0wlidIu+pZiFYnlpAS2D0ydeo0
	 wiQKF8XNIknlDfLuaKCgo1x8Swkh8fINaHpNOhRHMRwPGiic80tUdcWs09gX8lf9ltgGX
	 W5GVc7MKhPAn1QOrvnUZT3jgtwWHVuY4ohOnLuJPhIkcHTmCAwhoSg9TkfT7oOpBA9DgG
	 RW5ynMk+zbCQ47FfsiQ6BmghuKE0t2fUkGl50PK72BQKfz2naU5QaapPQIt+CSzupO7w6
	 MeO3kj74MfUPp0l37DjSlgLODSbPQ2GTSGcCMdFeQeucPsVlz4qM5JD+zvHwgbVwBEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1bxCYZF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B4606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1bxCYZF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E5E1F000C6;
	Fri, 20 Nov 2026 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168756;
	bh=aNJVgiuqS87QmiPYqOjVcz6sjCHusWRo9ExL6mlDqFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j1bxCYZFoOt0X9covx9etBcBFCdrVjrT1Yau1iipB2H1WFuFw/hyKeDw2BXO1pJYO
	 FLqi0knnY6DjMsSJChaYtgyWNfwY6Fr+fyyna2cw61c+AMlpAeTFVV+mFYq+t5+hCQ
	 M90Zl03QwDRQMThFZrDF56aw9B1J8UfcEKu+gCTtzfAP2z/oymrFBt+GZf8qHjmJti
	 9nBBye9aWjcfrGWnnLbk+NySGLzq5VgomrY3Qa6munH2MBr674g12YZISvzZJXflmC
	 9aHiyKMPkDx/XZnhJToSrHiKm34Iy7FDktYBwOBihJxgNvKJ03I8CQq9IdZkVv7Vdm
	 TYKmtoLQT3I5A==
Date: Fri, 20 Nov 2026 10:59:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
	rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
Message-ID: <awAYXcgE4RMg3Hqi@zenone.zhora.eu>
References: <20261118153205.2432736-1-haoxiang_li2024@163.com>
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
In-Reply-To: <20261118153205.2432736-1-haoxiang_li2024@163.com>

Hi Haoxing,

On Wed, Nov 18, 2026 at 11:32:05PM +0800, Haoxiang Li wrote:
> i915_vma_pin_ww() allocates bind work before retrieving the object's
> moving fence. If the lookup fails, it jumps to err_rpm, bypassing the
> fence commit at err_fence and leaking the work allocation.
> 
> Jump to err_fence instead so the fence callbacks can release the work.

BTW, this commit description, along with the title, is too
LLM-ish. Can you please write a simpler and more descriptive
commit message?

Please do not blindly rely on your LLM for this. Write it
yourself and use the LLM only to fix the grammar.

It would also be interesting to explain how this oversight
(because that's what it is) happened in the first place.

I'll wait for v2. You can add my R-b as well.

Andi

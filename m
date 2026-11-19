Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108162;
	b=hGvCXnEM4rJSGbgU90va2NHPY3AXi/TWzAYiXgitRhZcyvEzuDbmA573pUC1eSpZCCR+
	 5n3llMySWdJFOX0Rb/5TAPMpSYC5zQ2T9UJZ9I5q9LgKHuSgMTHYC8oz979upYJRpy1dT
	 EN1rhk0S1i+QGCz9WOpZs5OXIjxurii7iSekTrC2kTH9Q7rJtjWQaS1dgFtQGcOrx8kX8
	 fu85KJQfhI/q5XL466ab/W1nU3134NWtRXnKNHPQVeDLCo4vS34+76hvQD/wALxxdlLe4
	 jsI7oI9G1NG+RTdImAsnIkvd6BvtoF5EVyqgRCDoJ9HdLHV0rjhwzufn4uz1upTIY2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108162;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZZYo7BTg/OspHW2z+gQ20fY3LpZ1647QT3K57+/Cseo=;
	b=N+T5PQZbX8nzIpG2wsQRrbdsPX1Zqg+NQOBZj6yqGOISNW+QWv8cPBAvlsgGru8II1i5
	 5tef1OtRNUNcTcU8HBMI1xUasaHf+XVXAVuIIAYlPcWvg6TMsOW8eboHb6bovfU/rsQij
	 LI4P6RgGHRC9H2kGGIrPLAKq5Ie/sgKQkFl2Ow7JRXccRGRau75MWikfdIYf6RSXF3+y+
	 y/u6dzEvByGMnAtoeckYhWpPvLpnLmdAjJheS2xulYpnGg5ayJltZLLnp9vafxGLj8Zmb
	 mKYYYFAHo914GLcG7EtVhf/MU9jkqdFCRkL0ItP8jQaPa6IhBzJcmrcKnbjC2uLFcVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WyEP66l5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503E606A61D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WyEP66l5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95C91F000C8;
	Thu, 19 Nov 2026 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108161;
	bh=ZZYo7BTg/OspHW2z+gQ20fY3LpZ1647QT3K57+/Cseo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WyEP66l5JpaErMF73MU6HcqTO/M++5tngLzysUJRKl4DMcy6KKPXXT1sFCiazU+ps
	 WDGglzAiDhECZdZv5IeCvDm/zAiuoCdCKS0PjVu5/89VVaohKevUxqwNyATRobn+Ki
	 /rAZM6Dekh6nwdm+7q0PdPb5uscehC2F2KaxRrvloSUHgwtqxG7oF4tC5JpZRekiyT
	 kmPDw/K8CTFEvYLJigAgXT7L4JAXbEUbEnIs5N/tqFmG3l2Xmd90LyBB8MxBC7bOqZ
	 REMA/rOJoxKQznLUHvsduxWTuvHsSfAQEzpv/4W2l/vKYcDD9G93+FMhocs6z5Yci2
	 LAooyPDNmMKXQ==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id 927D3198003A;
	Thu, 19 Nov 2026 12:09:15 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 19 Nov 2026 12:09:18 -0500
X-ME-Sender: <xms:Oy3_asEALaEDUzWNz9b5IAy2qUNB1g-JsZZIxHwHVIqHAgPsmJ1jBA>
    <xme:Oy3_anMgsYHD2PF0bJ3tHsej7p-EVqzb_Axxxntj-uKM8qb8cA2KT37PbDQmbO337
    hv6QixpHAe3fhzF2hROP1CfX00dTGTXWlBEa-WkK_re7tI3e-eh7ezo>
X-ME-Received: <xmr:Oy3_aqxfVgqsLYchmiVrx3R3SUq2BivcB0oCIAt3kJCPb7qTNcks5bCXpPU>
X-ME-Proxy-Cause: dmFkZTEF3TVf5r7IbOXhtuYDc0PGVM21qzYzb8+T9W0KgkbjJ3b8gi4CUwjGWKEkHnDJui
    OR/IDs+HZxIewK1JeuXrcsR9e7dAC6wOXoHLV/Y54rheFmUdT+GdQf4/K73KmiOVUPU7Jb
    ofCwxmqEEJbKJ/2Frpwv7FS/IX/dxgP7NjDV9c6EkG6LPusKlkj4dpXwdUfm18Em+T1iWm
    CAnPHjGMGeOuF6ekQ+68Oz9/0kXo0d/O2QrlnXoOEuUnIRP6tU82U5mQthrfKiiUUulsg6
    +j6Ze6V5gvYgODAuc3LfdKbCHPfOrOdwvBIwce+TLkvvuDZtpjnKmJ6q+3QflnW9P/47Nb
    s/8fRSkUoLsaPdPhOBpBzTB6Uw80s6E6SnF75MWg4cD5XB94Xd4Y+616OsLdJLmXDzY6P9
    BrlGAroCYNw8Z+yyvPjmqeIMZDcl+pQ7OMzT/kkbnK5+Dcr5J0AOpoBPfrLFSnNAaLRWrW
    WEm6rJoGwFmBx1vBw9DzFmcu/i5l3b3aSS5ph2sdsHi+y+kojJ1sGnsdnkm15JsApHryDK
    CvyU5owdnbqzmwp+PWtjAjk0MRK/extFEOa9pT3tYtu32PjAhvGAkFkvpq//vAxuZ0ewse
    r5lWsSST02dH4yRaaBkG2VjtAzAJ8xBt197agVKAuKFO93PYQ/PiS5PaDl6g
X-ME-Proxy: <xmx:Oy3_asmMtO528eJjjc_ROIzlOuxH7KY5a-L5x3xs-7xnYv-SyJU-3w>
    <xmx:Oy3_aiX9NOJ997vscLbawlI0zzTzOgIxg6iWrr4AsD_o2dOc9jCe_w>
    <xmx:Oy3_at2nF7_pEmEvxYUlZB7t_tDV6Nu9TBD7Cz3LbzeiScP8mbpJPA>
    <xmx:Oy3_aimc_0F1kZifSc6qi9FhvuntaQxcUXgnXcy6TWlUwBnGqBKX1A>
    <xmx:Oy3_akGM39_LS0JfdCRDQxGmklLZKDwkTlGKziWP0BlsWHPN-HlwnE3x>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 12:09:14 -0500 (EST)
Date: Thu, 19 Nov 2026 17:09:13 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Doug Anderson <dianders@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Huth <thuth@redhat.com>, Dawei Li <dawei.li@linux.dev>, 
	mrigendrachaubey <mrigendra.chaubey@gmail.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: head: set __entry_task along with task setup
Message-ID: <av8sxUCg4m492Tx6@shutemov.name>
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-4-ada.coupriediaz@arm.com>
 <f232d0ff-3286-4d85-b9e3-cad8c6bc7178@arm.com>
 <2ce350f9-4dc4-480f-8a53-07ef9586d49b@arm.com>
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
In-Reply-To: <2ce350f9-4dc4-480f-8a53-07ef9586d49b@arm.com>

On Wed, Nov 18, 2026 at 03:30:06PM +0000, Ada Couprie Diaz wrote:
> However, as far as I can tell this is not the case for secondaries :
> their first task on boot is set to the idle task, which they go to
> without switching until (and unless) something gets scheduled on the core.
> This would be the same path taken for CPU hotplug.

Secondaries brought up at boot have run their cpuhp thread before SDEI
probes: smp_init() comes before the initcalls. A CPU that was online
before still has its idle task in __entry_task. So only a CPU onlined
for the first time after SDEI probed can see NULL there.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

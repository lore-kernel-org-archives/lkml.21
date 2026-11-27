Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794181;
	b=cM2H+rSI0w3xfQtGQlI9Vpi3xHKKqf3Ev5BjxKWIncxld+74TgcIdDegvWO2ojgh++P+
	 lhEd9SaMtCKmTtuYhmZf4gxiaMh28qpIHSh8CxdsgE1+DRMNmO1WQUJnY+S/qmkdP92Yh
	 Z8e77qXIuhwNOi/KI9BNpXwL0krGI5LG/tzE3Szv//vddCgq0wuOU3k7dtMxHKspx+Qfs
	 PJjgDB2tTPCDRT5sbrw4xmdmBqdHioasSc9FTcPppY1PerAErBr91iLH3mRWsFn7RLAeX
	 cwjnHCNvw7ppYmbKo3ncchivgAHYEik4blqnNjo/HXrYX+ElMcDbCWW3gupQ+A54DAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794181;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HW535fhRt0ZSG8UC6+5xRrpecism4VkxXodiHmQIxHE=;
	b=y9mnNJQL1n6v7coTiBA6WaBmV/VSNbvk8g6xubS0nSwOEU40BBQXXA+M4lrEFWHbZ/9L
	 V5VPd2OirrHNRB1IfRozZtwDw1gwWc0+IskM72w3lnYPY0sXV+in9wQymMPIFM0oLfPO4
	 FYuWfF7zzI173av+MpZpPCbtSsVnKr4JGu/TV7yeUpm/GGvidgjXcNjhohFL3nz/x73gL
	 r0OJrA7HM49LwJXd7Rcya2mBFDnPyVluBZMM93F7dR7JQOWHQp3JDFL6K5eNSYs5ZTCIs
	 oMTiyVhn6ZA1aBal2UbAq2iw2CzYeceCIiyZd9X/ZPtOQ6NxJYXkx2A7sgfW3xsGljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=avZnggnq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8849606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=avZnggnq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547B71F0092F;
	Fri, 27 Nov 2026 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794181;
	bh=HW535fhRt0ZSG8UC6+5xRrpecism4VkxXodiHmQIxHE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=avZnggnqZYxukLttE7d/L0JVz9raUnLYIQuelpyfhI3KnrSODFSOKi9o5bZ9IGuxw
	 ChK+9c1SlFffoIaeEanJfQQLvmsCgQ2IMMU0R8WAXPovHtd9G0mgcA4gDyWwuvZKxK
	 QH+Lh9RFSoto9MzjESC3EunwXnUeWkQFSy9VSJaviw7mQIrRCC8+haednZtiLJrqlN
	 84Er/MauykQSuloU4nXcrVeOYnv4ySIIBtU+FetrWZvS0tM+Xt9Rv80tAAZzUucw2A
	 Gnz2mEgwGPQ/UmIlNLh0yowzBOi90Tjn7ZKZjKOn7G29r0gmxN8UnOci8DhVWDqj0O
	 o1puKCA1NQ3Ow==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: berlin-sata: count available child nodes
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <1795076106646-11-85fca065@mail.zgclab.edu.cn>
References: <1795076106646-11-85fca065@mail.zgclab.edu.cn>
Date: Fri, 27 Nov 2026 21:12:55 +0530
Message-Id: <179579417560.13164.5559872381370143082.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=776; i=mani@kernel.org;
 h=from:subject:message-id; bh=DSi0CZ/DNG22RGWJDTjGLf4CthblbWJRJ9F0d+CXzyg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaUCpt7E2VuzxaKn4u/Zas4DQs/2stPQ9mEOT
 lYY4Bq0Ta6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmlAgAKCRBVnxHm/pHO
 9YAbB/9J8LJ0jl/MFw2jgiSgGnGFr//6phVS5u5Dpl2zGaoW5NJlpSWjO+MzYEz+14b97EiX4Eh
 bubo7Y60qEZX3CG0lFcBMfJxkqdduiYVtIXDy8xZzHjUv8aiN1g4CYWm8QvroHXNUcA7ftd4qrW
 va4KohhRM2HeD4U9yY6MwdEjPt/T9nUQ1N7BHr8oRxwtgQz3WTQ717btKwAgeQTElC96wcAQTXa
 c8IYROH4Y39W0ZWIaAtitTWVErItEhfryFO438ggLYDJyCo054hCQYigb0yslfrMXRrzAl0KH9D
 p6PtYTH1W+wJLOkKIOOOK1yFKwLveoDMNPUCtK/iUhgnGyjv
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-19 16:15 +0800, Wang Haoran wrote:
> phy_berlin_sata_probe() sizes priv->nphys with of_get_child_count(), which
> counts every child, but fills priv->phys[] only from available children. A
> disabled child therefore leaves trailing NULL entries, and
> phy_berlin_sata_phy_xlate() dereferences priv->phys[i]->index for them. A
> device tree that disables a PHY but still points a consumer at it crashes
> with a NULL dereference in the generic ahci_platform path during probe.
> 
> Count available children instead.
> 
> Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
> Fixes: 942a31b52191 ("phy: add a driver for the Berlin SATA PHY")

This isn't how a patch should be formated. Please read:
Documentation/process/5.Posting.rst

- Mani



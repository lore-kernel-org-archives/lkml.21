Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424804;
	b=zJ/XVQN0SnMp4aThWjVjhGt51ivgn6tDniaFAem86oJF3z80j1tFMd976ysRvYwbONUm
	 wrggsJbVNVul+XQs2ruUfYXDeMBUlAoE3QYuuZQFJb4QLMTF+XXyCfKS+idrjpheOJ5nA
	 zue5U3+o9+sEMCwA2LVEq1k4DWmgNeVZ50eIKw94GMJdElV2vttc6gv24wQG3z72VIO/v
	 B6+2fbZ6rwG3T0n1Oas8/j15uVxxihygLWVGxOOLdmkIUSeiSg0vAB6LLx/XSY0MPQeZI
	 c5KN8lLQlQaOOgm3Uhxyc9/86CKbg0hrehqtxyQN0Ufgu9okxr10cz/THqHswP/ZR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424804;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qfVG+9159819Kzvw9diB4DBZrJSQoGD8HuiVS/PJANk=;
	b=46CZVRAOcDj/7qVl9gZgptea27Dp5oKi+A7CD34smIIV+vH+xEMIZF/dfmSyz4ZRXxvz
	 hhjm7UgHvlWA6UZ9DaLEy4qQP3NoU3OCOZh1hWg0zylBPKVSL8t2KOmbXr5FL6UmvmVzZ
	 g353vmb7kALNuzUQB3DpNxyPTurkoRTTcbiq1q0Y77ZxWXc9hiJPgLO1JG3C7uXT8TUzy
	 mMykRyaoDqm02AlSennKtGK/Tusr37WStcdA2c7YD5VXySpIJ2n5/tibJzSK7FY8SZNjq
	 1TOBRZDEqYiwCg64NDufOjTkZ3uG2a1BMY5IvExNM1ykuB+13lWVwpjkWqCJBoAMGWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BDD606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BDD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 74CE4244C20;
	Mon, 23 Nov 2026 10:06:42 +0100 (CET)
Date: Mon, 23 Nov 2026 10:06:41 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Will Deacon <will@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/sun50i: Report TLB invalidation timeouts from
 iotlb_sync_map
Message-ID: <awQCEz3ip1AwDBjR@8bytes.org>
References: <20261020170324.1223144-2-oss.patchbox@gmail.com>
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
In-Reply-To: <20261020170324.1223144-2-oss.patchbox@gmail.com>

On Tue, Oct 20, 2026 at 01:03:11PM -0400, Yuho Choi wrote:
>  drivers/iommu/sun50i-iommu.c | 42 ++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 16 deletions(-)

Applied, thanks.


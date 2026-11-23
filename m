Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795455775;
	b=Y/H95sxiiuh4j5oMdmzqzgThgoSqWJFc9GvoH8868HqRK5BunRrGKMfDZgvZalpGUbmy
	 EfFv2ehXa+NGyHIFed9RRya8tK7K+S6aCoEus8YG9x/t6R3GyEXaW0ulkv9fahJAbwI8w
	 dI6D3LbGqxcUec1fN3itRZjETibNusaS2sygM8o5Y+nFxwwF5Adudt/iPOnbZclu4dqNn
	 xzCAY+b1xCtUgVDRx9GxZlueD3AkU9JSCU91dBDJrg3cRZrYRB6LV5lldt5zbGCD0qadB
	 DNanfascNKbV1wL8qxoHCGdSk+T3mjBIRVrlQVUL7XugeCgXiNwwx0wb/nuKaUmU7eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455775;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wm4D2R2fUZcmyfdUwMn9Zrbt21Lpi8FA50NzkPSXeJk=;
	b=hQnV8bwiR6KTY+1VU0PDZIokRWR0oKPlgu089jNnrFRTaFJQ3wO4Nhdey6TrPHkeXzcq
	 Ug3/WrOvlyEhp6pJF8JG91RPe9JYw7rwcHW4e2nUak+FdxfsdjAdrRdAL6GvKanuKwTKy
	 lq9fBqLUQ9qaymv/r4BLlPGx0CEtKw/cOEt1b9ZU+L7wDLr7l+IPFIkHC7V/Vv36Fb6Iy
	 2ObWO3S/zE7r6/THjYlnjJHD6Yo5vkVsGjNp5+k87w/zIU1sksEprDGXzaY6wqAcokGV3
	 Ox54OOULs5p3uRFlyQAvLTjUh95bKwHZgNtB1gX7jV6cWJK4mn88rHXYFHYq2M1ZQIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ROaEf9fG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727FB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ROaEf9fG
ARC-Seal: i=1; a=rsa-sha256; t=1795455714; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=SwreKrU3R4DY5UQLmxROrMTAvJOzV/bwy1uuct9TMHcJUdUJpWZdG4gEz4KaLfNI5D/7ld90JoIM2A9iBDHIT2k8f3/56g4fwn+1SjuwLHw2MzOm2J2Kmaihy71CspObQaFmDHD3gyDbGqmkWMmnrw3JdsKrAI5r7FxyteusvSA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795455714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wm4D2R2fUZcmyfdUwMn9Zrbt21Lpi8FA50NzkPSXeJk=; 
	b=Zo6r7cdYaLdgg5Tn9B1qBjoHM0yvdYKpb3+YlXkId9vOgnFJyafJtPY3oANQpi7WOK+L05F1C/sb/XsxWZdRHYy+8nN6p7UO2TPYZM+OPnxQ8dkBreg9Lgw270p+QWWIF0B47Ho41x/Okkw+9v47gwxVxeUBRJb1qqPJ+eXBwjA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=ROaEf9fGu9dgnJESKk7Pq+FC/c3IEsHSaFpIRF6suDhiDwHvAsC7hdJ4NYMkH6AhU504mikDfbSfwu30qklszRLOEvphSa3SQMkFt7ewLIGi7BbvAEOIxnbCVIbhMAIWWw5hZfygAECqRgJZbUi1ZcPuflRNFR8mFOPGo8CxlK8=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Wm4D2R2fUZcmyfdUwMn9Zrbt21Lpi8FA50NzkPSXeJk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795455713979281.6369456863033;
	Mon, 23 Nov 2026 18:41:53 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime suspend
Date: Mon, 23 Nov 2026 19:34:34 +0200
Message-ID: <20261123-panfrost-rk3399-pm-rt-price-reply-1@iav.lv>
In-Reply-To: <a9a404e8-66fc-4595-9d14-7ab97cd08583@arm.com>
References: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv>
 <autNWETrwrHbD2H9@sobremesa>
 <20261104-panfrost-rk3399-pm-rt-larumbe-reply-1@iav.lv>
 <a9a404e8-66fc-4595-9d14-7ab97cd08583@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/11/2026 15:29, Steven Price wrote:
> Other than the somewhat confusing commit message (e.g. a subject of
> "Enable GPU_PM_RT for RK3399" would be clearer), this is fine:
>
> Reviewed-by: Steven Price <steven.price@arm.com>

Hi Steve,

Thanks. v2 went out a day earlier with the same code; v3 [1] is
retitled as you suggested and carries your tag.

[1] https://lore.kernel.org/r/20261123-panfrost-rk3399-pm-rt-v3-1-04c7c58d1140@iav.lv

--
Igor Velkov

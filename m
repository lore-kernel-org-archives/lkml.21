Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940504;
	b=KKK+V4DJ10H2VXDxjwLR1jfA6odbbzlISAnDz/Bjg8BTUSw0nANCN0FzPhPPixbU2Jv1
	 YktNOMnboVBpvuVWxLGJRh8ugGGslHIDci6046jghdiD7VT/ZUPWWXSEjkO+t9ltr4ES1
	 rtQe+hb0qNd3Y3QFabcIH+ivBj4ktF68LpUBJ1oXYu6gXx3BGqgEYgZEId1FWOurW2V62
	 TPVp7if7ufsYrLKOKubARNsor3en40TjIfhc/c9E8wvt4h3UevOrRtiDDPMWjTALrXUEQ
	 Szy/PYfyUn0Gm+07uZZ5nAbkbs0wjlp9Cd0qhkcY3RVFAsn91P2gThnw2j+e5g/bMXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940504;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WdowVhTt2pNe6qG9EqOlUeWTt1BivkEqoKFHuGFn3X8=;
	b=3a0F0u6H4Fkld7yoiWwV/E9+IHgkuO59T+nf4NWiEKARfCJmgKX0GT8i/BgauC+NqHPw
	 XHJeuHBRPybhHiTDiuIUvSOuczBNKDMv7HkhB7GGszGUSsCfXUqaTzJU13AwhfKtU3lgP
	 sjh1TrEbaCFsYiki7OGDwRVHqaR1VwEzHDPy9UHKP5Q1SQ+40j/y9XDf+nAuprkVWWC9D
	 hbD2W8fynWa6TRqV7C/J5xvh0Zi1WtSdL4Ay3nZsqDvQ5NKu2mBcbUImZ9is8YaC2UE00
	 f3HYhWPUoBsiWPDrL+Rl0qcRaHhzqSAjHDK/PuVh7j6cS1Bpex9gYW51DJe0uvW6RoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cwooper.dev;
	spf=pass smtp.mailfrom=cwooper.dev;
	dkim=pass header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=VvPVaEH9;
	arc=none smtp.remote-ip=91.218.175.105
Received: from mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BBC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=VvPVaEH9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WdowVhTt2pNe6qG9EqOlUeWTt1BivkEqoKFHuGFn3X8=;
 c=simple/simple; d=cwooper.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794940501; v=1; x=1795545301;
 b=VvPVaEH9KL6e98hZYELJdx9awLXti+fzdWgjmgA/nJr3pbiHd5uvKMQudhma5L3hrAgfKx41
 u+T6dEaV8vtyMZ8JemS08ameUAx7QiHIA95toCSCtpOVVOxfA1g2GuI3+mB0kGKx9IzzOpqyjfS
 ilgJSD+4c6Qdh0iXxVgOgkZ19/YvAzcmoLki6V8j5TSF4BEDUl5YPAzn9u8Avt4ReNAVxrQt93O
 I6hSvZE+HAmAvF3Ecppszz2bj/bS/EgK3ay2ebOCQXcx/iRwmEhbQTHOSLI62/NjBkEXruMYeW7
 l5LxiEzDKwCmMG6O7FcThr/XoeG4i15aklX5DvUqgLkYA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1609a2da680e8095;
	Tue, 17 Nov 2026 18:35:00 +0000
X-Mizu-Trace-ID: 1609a2da680e8095
X-Migadu-Flow: FLOW_OUT
From: Cooper Morgan <ext-github@cwooper.dev>
To: Wayne.Lin@amd.com
Cc: oss@oysterdaisuki.com,
	harry.wentland@amd.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/amd/display: Fix FreeSync infopacket refresh rates above 255 Hz
Date: Tue, 17 Nov 2026 10:34:40 -0800
Message-ID: <20261117183440.552477-1-ext-github@cwooper.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113010529.11514-1-ext-github@cwooper.dev>
References: <20261113010529.11514-1-ext-github@cwooper.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Wayne,

Thanks for picking these up! I noticed they went into
amd-staging-drm-next from v1 (bedad38a7ddf and ae60ec4dcfc4), not this
v2.

The code is the same, but v2 has oystersuki's Tested-by on both patches
and Suggested-by on patch 1. They tested the series on the 280Hz LG from
issue 5988 and asked to be credited, so I'd like that to make it in. v2
also drops a line from the patch 1 message about my EDID test that
turned out to be wrong.

If there's still time before it goes out in a pull, could you swap in
v2 or add the tags? If it's already set, no worries.

Thanks,
Cooper

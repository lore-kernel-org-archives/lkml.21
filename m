Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052501;
	b=odxIpUzk2ZOmNTPiasMS+3AEIoZQ4HJuvBZknkJG79Airs7PYnOTNQYMmCMM/Sf7AIsb
	 Pmgurjq19xl1DH55FX2/6erIh4yjRqU7/vT1JHAUbcOktOvhvGg2O/hOwkWeQOyuulJMx
	 w1L0A1YCClpCAP7uCEaiHoBBNVxc/H934esyP8nuPIwrn0pz7ViqpwKjuesT2LDWuznV8
	 mQmEpE1V0mZ7pEDHMfYQiCFWpaMa67N+i7fXbHsFKe+/+Fj1E2BvOiVDKAefKeiN0rvsR
	 94SAXjn5UqEaHvQvlZR81c0zFo/x0c6GLHQgxCAUgg2sF9QLfy4tIDRVTB5cg/2szVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052501;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=78jCQYAj/2CHdToyXerZ0OobA/hCp5b2KM82DylRDl4=;
	b=Z4xRkMfz1lbHDdVAWPhOjYKGLEU/F/Vkl+qGposQbCmU71mwxNsj/DGxUARo2u9KlRns
	 D2fUtpIB0vaQGtG2U7hYynXnXwlYOSCUecgIvzMdES18VkySVRtIulJhdxlXYxo6OvTWe
	 FGytVTTFeb6S3Yp+MWwkPjT5gDj62LAh30RvjeBUdGOMhk1U9pgxuvzhIGTsPP+A3p0s9
	 tl1ksryN8qW+G+j2SPL7zTZUNDXXTDK8jPdS2QHrTIGsmApAKaQBfNsapkTYEgxDcYwNb
	 4x+AxrTyk+2/JKFUQjYpwZzBerzU55avxzcviyb1E9VuZXzTQDQqoGpdey6IWz5zpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cwooper.dev;
	spf=pass smtp.mailfrom=cwooper.dev;
	dkim=pass header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=UIbUL5QA;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEA606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07AEA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cwooper.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cwooper.dev header.i=@cwooper.dev header.a=rsa-sha256 header.s=key1 header.b=UIbUL5QA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=78jCQYAj/2CHdToyXerZ0OobA/hCp5b2KM82DylRDl4=;
 c=simple/simple; d=cwooper.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795052498; v=1; x=1795657298;
 b=UIbUL5QA34LJwuz3zSQy2uAcDuzMEov18RuPQGx7FRJtWedCa6gslMJXjHTGD72349JchNYe
 3FxbwODUIeiAESe0FqF01x8Dt+hxAtpM8hLezIMjm4Vvyi3vuiMDdjMVGQCrkOvXdZ1F2/R8od1
 O+Kyjv5JYQf6F9a9m2A1gEuvkH5K1Efeb/CLuqZoeI498BIp+emWgebj9LxHy8Xs994FfzWvYt/
 I9WNRqHRx7csEDpYcnTfi2HCzNZgxU4uM5fZjjZz3tM7nvscjDc0Jpwgy0Om8P+LivNURt3HCIE
 VEAt4ts2bFPszQ5Q2SKzBQ83bKLEFAxfmWmm4HIidgG6g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4d7e63b37adc295c;
	Thu, 19 Nov 2026 01:41:37 +0000
X-Mizu-Trace-ID: 4d7e63b37adc295c
X-Migadu-Flow: FLOW_OUT
From: Cooper Morgan <ext-github@cwooper.dev>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: erenozen@protonmail.com,
	Wayne.Lin@amd.com,
	oss@oysterdaisuki.com,
	harry.wentland@amd.com,
	amd-gfx@lists.freedesktop.org,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/amd/display: Fix FreeSync infopacket refresh rates above 255 Hz
Date: Wed, 18 Nov 2026 17:41:15 -0800
Message-ID: <20261119014116.3632450-1-ext-github@cwooper.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <HftAWPKURVjBtK_2BmUiLXOb8ghZxaEzAJSg0tlsmy5L3ckJyDWc6g65vrsVGdA3ZcytB6mPuyxaQbsPawfOZmdC1dyAo4lCbaK3Tj7Tm-U=@protonmail.com>
References: <20261113010529.11514-1-ext-github@cwooper.dev> <20261117183440.552477-1-ext-github@cwooper.dev> <HftAWPKURVjBtK_2BmUiLXOb8ghZxaEzAJSg0tlsmy5L3ckJyDWc6g65vrsVGdA3ZcytB6mPuyxaQbsPawfOZmdC1dyAo4lCbaK3Tj7Tm-U=@protonmail.com>
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

Hi Alex,

The copies in drm-fixes-7.4 and drm-next have the same problem Eren
found. Patch 2 there (6a9d5e2f, e1c26823) is missing the
amdgpu_dm_connector.c hunk, and its connector test went with it, so
nothing fails on those branches.

Could you swap in v2 before the fixes pull goes out? It has the hunk,
plus oystersuki's Tested-by and Suggested-by tags.

Thanks,
Cooper

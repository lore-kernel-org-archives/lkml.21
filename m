Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245934;
	b=h7L+E5QQqf9KO3sL4VPLJ7L2g2rUwnzHTvFeoAAX3kb1/XeMjfwub6qAb9vxy5qNWmZS
	 XA8WpbaYIhKTWenjuXFbkq2EQP8drfO7mgDnwSvvccfwCfIoSIpEzM7d3ZsTYMAUlFcov
	 qeVRr5iGUd5vVB953c7ps0KWJckD5lIU4beACWPZ4APRNRxgJvDPz/VoIK5mYQcHXHTxm
	 hFeQzbVG9LZ6K5DfHWHmUpBrsg6ZdZjR29V+xX8WqUvoEpJolUtzkMy8fVqCpXn5NWuPg
	 gpD4YABH5eakfqoFqcv4C7voViWjTZJVySe5uya97KG4EgHaR5C2Z0TCtXPrhkT716Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245934;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=geRRm6+nqiwHvHqpQ8MJCSugM9I4R96/Wkrdv0T66fs=;
	b=MZSwEUdGEyxECRb7I5ninVZMzNdkwN2PN8OlFTZPcIZ1w8da1Yv1SwtReGwvx00xJQI+
	 rSCWPUpfr9oFXcWDXGHH+gHwQCV7tppQ8l94hO74W2qZXuVtdSuq/AF3jhwqyNK8rWt4X
	 vNN+d6QovTaRe2iQ5gw1BA0BnnRROyrcVlf4mtBACzOlAim2bq1fee8iBIWovD3hAqaQX
	 syUd9Z38a/QsZY01H48me/4ulCHwJuWB/TGrpo2CdZcEhJ/4wz4K0bxMNcY2ro266Aufi
	 2+4r6fZ75+lqUEwlYchZgdbUL2xunuVnmcLrd9uPGlwYo1sXL/HgpEUXDq8v0ndntTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=om3wJcOh;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342E606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A342E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=om3wJcOh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=geRRm6+nqiwHvHqpQ8MJCSugM9I4R96/Wkrdv0T66fs=; b=o
	m3wJcOh0OJ7Q4htwvaaFUEdt6Pn8QjCffi98gR1MRMeGw6NUa1RDFEYBGC7HZdm5
	GPU71yjtiIIJCpn094SF5M/JYUoScVgdtXSPgJEX6p9mpv1avc+g0NREi68clypa
	e2Txk8Na+mnLpgQtAKkikgjsvQO18RrjxbWC75GjIE=
Date: Sat, 21 Nov 2026 15:24:38 +0800 (CST)
From: "Haoxiang Li" <haoxiang_li2024@163.com>
To: "Andi Shyti" <andi.shyti@kernel.org>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
	simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <awAYXcgE4RMg3Hqi@zenone.zhora.eu>
References: <20261118153205.2432736-1-haoxiang_li2024@163.com>
 <awAYXcgE4RMg3Hqi@zenone.zhora.eu>
X-NTES-SC: AL_Qu2SB/6fukAs7iKRY+kfmUwSj+s8WsO0vf4i245fO5B+jDjp1T4OT1F4NHjp+uW9ICG1iDO4agVRzeJlcaxVXYswds6f9bj1OPmK5UeZDBaO1g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <773b434.18cd.1a1fcfe2c1f.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bygvCgD3j4s3RwFrPglzAA--.93W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hf5aGsBRzcGRgAA3y
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksIEFuZGkKCkF0IDIwMjYtMTEtMjAgMTc6NTk6MTIsICJBbmRpIFNoeXRpIiA8YW5kaS5zaHl0
aUBrZXJuZWwub3JnPiB3cm90ZToKPgo+SXQgd291bGQgYWxzbyBiZSBpbnRlcmVzdGluZyB0byBl
eHBsYWluIGhvdyB0aGlzIG92ZXJzaWdodAo+KGJlY2F1c2UgdGhhdCdzIHdoYXQgaXQgaXMpIGhh
cHBlbmVkIGluIHRoZSBmaXJzdCBwbGFjZS4KPgoKSSB0aGluayB0aGUgdGhlIG1lcmdlIGNvbW1p
dCBhZGRlZCB0aGUgY2hlY2sgZm9yIGk5MTVfZ2VtX29iamVjdF9nZXRfbW92aW5nX2ZlbmNlKCkK
YnV0IHVzZWQgd3JvbmcgZ290byBsYWJlbC4gSSBhbSBub3Qgc3VyZSB3aHkgdGhpcyBoYXBwZW5l
ZCBidXQgaSBmb3VuZCB0aGlzIGlzIG5vdCBpc29sYXRlZAppbiB0aGUga2VybmVsLCBsaWtlIGFk
ZGluZyBhIG5ldyBmdW5jdGlvbiBjYWxsIHdpdGhvdXQgY29ycmVzcG9uZGluZyBlcnJvciBoYW5k
bGluZyBwYXRoLgoKUmVnYXJkcywKSGFveGlhbmcgTGk=

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110619;
	b=tul3cDqWf1OcjDB9axGOvIILTFdPqxiOq2/2EIxfiYa7Kpjf411SeSEN1jUEQGyf7Rcz
	 SIRWZkykSD76mbCd/lUrV65fPqyctE1JKWY//cVLQDbcG/2KB9qy5G5jbw6hf0vDz4UIV
	 QwFXmQnMYkXF5jkG4x70bvZSw78BNOnyj5DM9JwRaw9MwvTN7m62TyaXkofxTLw77np6F
	 CQZsxYJYmoyY5A5LpYVOEyYPlTm6M28MGPs/RYGMpVpL+I75k9dflSjcA0Sea1Hq/rYXf
	 2s3ACkGMHy/yLiCFNOC5UBAWSu5i5piIBKr7Dik3chdcgWR41Mbl8MhQOBqwZ1JKcwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
	b=0x7/sc6pwLKU9Vx/MmuiyJF5rBwj2TMj2hHhvXAOjH2ZUd0CigxNjxUpNAiHLKM8w3YQ
	 QEC+1DdtD1zCxvgU0XNeFBqLf/F6+rPRF0gBJgxzxcOIKvFtW4BJaj2xo8DoXY97XqAqd
	 ohQJIwlmmkapnMVP87okFBAWV2FaHtvic2oPqvDDK51NKrmnrblUlKeQLvXAQWjTEnHUe
	 W/nBdw0IcXyZkN8tLKWsAGxrvAly6r9sPoA4VWV/VpYPpriAvBrsGbmECtIDmQ1agzDFF
	 r2f1xrrqtI7bQHhdIxZhy11uvoZz4Hjhhy4Jjm2fQjfajfjE4nKrXUfGPCh/C4zGNFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n8OX20cE;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275BF60A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275BF60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n8OX20cE
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so27643185e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110616; x=1795715416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
        b=n8OX20cEK3rax+Ru4Z9EgjrB3T4PAKO/53cZnU3yUjRICzEumHI2YCgRq8WNLgRpgn
         OBHkOALaNHdPMil/CNWAGiKiOqLJzmAMh7ZLFtTDEkCKr4fTbnk2bFe+qlXX8Pyz/2+b
         n8IwyJ9QPHfScy+fZ6/4g/8G3Jc4L+bQcFYrMWcFzZ+a4hTyJ9aK+UDSsKfFgxwxBqtZ
         H6w37pNrqwAnN5wDR8kZBRVz0NJbbVETUmjr6wxwH2mNq3r2m2fLiDnEB306wyBEa9ke
         zTEVPvI7K/nreNvBST4wY2esXHwEwn9Xszabzl/pcUNtIHTdrM++u1rwURLk/NH+36mR
         Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110616; x=1795715416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7g0KHNL5drVX1lZb8pGjmAF0NrBsrB1gG2lDqfKoWg=;
        b=znPs8U+nEJSg/9XhRin6av7ESbQF3iCVLz1FMLya3tVnEvEq+hA/GHUgCxaWno5jAj
         OPmrgF3tO1k6G2xz+9wZQYRB6xJxMpkNgvkEqpaeBdS36K+f5YsGss9vtFU1X+gFPMeD
         PIBc8+7BZihqSyFUTgnZeFYn98VkbZHxcMVbttgcdJE97bMNFGEdxWQr1ZuJUs4msWpr
         r7pS6Nm3eOwhxB42scRw6DHDulHQKHyX9gog/dxDgQw/fGQHflTdgPKghhvSBlFMKK0f
         JpsLzrQ+qp0GGWymjib/KK9XWo07CGgUUZHsALRD/LsJodPyHyxTW2tfdjyN8u5Q8F0+
         Fpzw==
X-Forwarded-Encrypted: i=1; AL+hErFggWeEgxfzuatIDGk6wY/1ti6OdV7Tl5S4Y0peRLo4P7xVgftENG3+UgsYE+XVdrc+jJV2AF/H0fUXdd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YFe4ZacGatJLhVnTIPwf6dDl/OHlgQa3xII4Z548a+vInYfTa
	/AkEABpkIUjaE8OVkXpKctzX81QLvGjxE65UXh8loj3IWLyGq7S29iHPFUhaXcu13o0=
X-Gm-Gg: AYBFou2uV8dPwKZ7Hxot8VH9I1iRjZwlDMaSaXqBl1czD7Xq0qDknn7UlXzl+nVEZfq
	CUpVzWckt2d1ZiNuQCBhrZMi3I3s6xLxA/Y84qgcPSmEOEqSzvHRaAAS3nFqEroPyoVbQja9drv
	vJOgu8DMQj2vXQdQWnxOtUoNg2xoom1h0vrS4fGfLvncqwLEFIMeC0Rjl1j7xyXjZcrL5tivtSD
	TYD6ZVlHER5lGFv8KE/SaWdym2Cmsl65OHOxIZkfCRe4n8v69BWCBK6uEpuT9cBttt6IneBNQMn
	xz3WMsMG5xF6QZT1/Lh+8/6+Z5bUPY01Dq2ewA0s3PcconAhF7UgLF1L2MNMIsoy3X5or1CgVKC
	ibuzkq/NSAlmtMwaNnAgAEgsvAyoA3O38GWnaLFmJh0w9oRlAPcg+cdjeeBHH3AFOKzEkS9FgT5
	o4ZVr7Zg1/hPNm+5S4VuFz8DnKKjrwL5+y/SQT0NZBGchUohBKsoDeCGC7EESSJYuEd6g0V+YRT
	j3H1js5Qr83LKKza9IEqLQzRlM3R2oMwOeXMMhJgoDwViE2PFBZ6/xW9xerbfVzziQ6hGpx7QLE
	cTzPsJez9/kMI3p8yMM/nVDyHxfs+QQZxLawZIPcsWiXewNgfbZuau7CZ4IvWdN7NpUDMPwNTMF
	joFRLYwxyFdsdq7W1ktiT5gJ6uUoxcaJXMChw9Q59QXQLfPi97B6JFMm8qiLYuMCyUTecA6urtf
	QH3Q==
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr7534355e9.2.1795110616543;
        Thu, 19 Nov 2026 09:50:16 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm66709165e9.0.2026.11.19.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:16 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 10/10] MAINTAINERS: add myself for the cw1200 driver
Date: Thu, 19 Nov 2026 18:50:02 +0100
Message-ID: <20261119175002.458988-11-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

The driver has been orphaned. I am adding XR819 support to it and can
look after fixes, so take it over as Odd Fixes.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e7b5f6beba4..3ee6e717bfc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7209,8 +7209,9 @@ S:	Maintained
 F:	Documentation/process/cve.rst
 
 CW1200 WLAN driver
-S:	Orphan
+M:	Arthur Heymans <arthur@aheymans.xyz>
 L:	linux-wireless@vger.kernel.org
+S:	Odd Fixes
 F:	Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
 F:	drivers/net/wireless/st/
 F:	include/linux/platform_data/net-cw1200.h
-- 
2.56.0


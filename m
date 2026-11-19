Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110615;
	b=wTxPnN+mzmf+hDCEp4L8m4nJEGeObAhM7gdxBqMHH8umTreMDGsYtpGQUhJPbpTECAzT
	 3OHyDtJY98X/K8E1lYGcKDZEGZNoX2ECyq7I1hA5qFa/ypk1Uohc4RS1UVDUJRPNXhAiP
	 8uC8HwoXQGahzw7OJOzwK7/u3ia57h6qNiMfB8CSXIBX6ft/tfd7ZtfdByJWiU/BlFAUe
	 J82ZAdT9/bzjhlmPi+gKin+kr3zNV8mdQxV0bXU4pH0BHUNMo87PWYnXE6o72qvtlirgS
	 rHlkfrGT1ruVPZWR9ERkEiT1e4Z4gSzC6WLzxm/DYmKH49GQO7z1vz5olL5VtadJ9HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
	b=tts686QoUaUsLVfZGV/EOlpUYtiLzyoaOSo/3dfLE7D1teDpm1blcikMKNlewT5U7pZx
	 bul30zZmNJsZ+iI9tP1jubZcms9+g7qSXV++owawyljscy4npn4FgxE9kFYF4HAedZ/va
	 sdIImP4O3sFg59tCijs9AfejmhyLolpZCiGdWezNF7IERuQw0/9CkkIorZTiPYu1XSCO9
	 MteFKPSk8+aCgWtf4uYJEo+jN3EcYyApb4IlWIfp0KecAm3iXK2s6Yg61+cuAqwWU62Qj
	 VEksx2pSPjSPzm2SnECcAYrvGE19QkGrzNwM24/TIYPh90F5FnA9h10VXuO+1MEvaRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=g3XD3WOn;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0560A3827
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E0560A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=g3XD3WOn
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1815037f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110613; x=1795715413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
        b=g3XD3WOnMdsJFDEykQoDr1yoI2Ub/9w2hyjJixXgE5sY7EuEC6aXaSUX4dGIt6DqNK
         SOHsRGi8PSmlch6qy3qjIgF7U9PrEyx/Jy5IwrJXiqkDYDivx/QbQY78tg96+LVHBKtD
         jbxR3ktY4KV6imDUzRuVrMSdMHEbXesVNc+sD4j4SJrJlCTtIC7/El4ddJbDNzU8+L7S
         yOLiDZW9FtRRJz2KmT4q9auuwU6WN+ZSLQ+aZgBh22Ix7kGanQOsiQW+gJEeCp+2I5nS
         Kfn5BrHHYT2Q4basE0JG9NfGfgEbWJvvk/kaVA/RkyaskTLPbViRN/4qaEOoLdLTYB0I
         G5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110613; x=1795715413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaJ32hdTW6OdgBsH5EJWCERCqsHcMt1Z/thd7ws6mpM=;
        b=uXwbKksz78p3W8mp8zttdM9LIWjxaq5LlaLWT0oOtrqr1Q6g0Cn++dPpywG8xeRVxl
         ezJE8zzHMNkxmT1iXkhWKLmXWdCTLO4zQRDKa04U/yIHbcDcv9xtXWanpzZxFBSdYfta
         8GYyhJQpHTEa8T7QO4lgMdCAovTmGLzFdOJidLfp0iKF7ePJfBkoyRDkUlOWBTfqaXa0
         nkfSS3EY44VCT3U1a3nHPA6uyaqDX9L6Zebt6Uv+yH5xPzbd74Yn9lfpCs3zNG7XqRKf
         y80MPdNM7MTLNmnUlW8wts4UBg698d46HAVqfjhZzWbaxyFUVgqBUnnagyZz3AushXgi
         TVKg==
X-Forwarded-Encrypted: i=1; AL+hErFOZ8vZ0W5ulyEZBkLkG+G4Y9TPnlcrpkUraxTOS4/WxmLmd28VzaMT2/GmFkHGbqKAKXI49jZ8HLi85PA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YInUGEek3H31jgSY2JN898GGzV4bO8e0hYDdKhyLlXBNb/Hbg
	RLwxICVjHijc5h5NCXDbdJN9uWjPrZXTNcDasKEm0eJiI1ysVIPJ5M+tx5B2CPbhetA=
X-Gm-Gg: AZFdTZcU+jFMllSlyD2aUvmvOCJ6r9au6RxWI4NpwhGtMRAianL30rTHMRLm03aQ/Hs
	lV8+dRFgZlr4YYMarjf49fPYy+Om9xBruIOIkIljA3dQtmAHyzoBLO3/p/qGEUD017tC7CGtktA
	7cLVffRrxUHQL1aEPO+KIqKn1KLNkEdAn55s0xjQ1VrFUT0GqYQ2QvTmetsw71r8S8RcRMoEPMd
	yuiICzHNF5/WT+1tAteipVDLHplgUu34w7MvQ7+HxYCh6R5oAd6mOw8J+il2otrw4MXn1MspX1/
	fOMdFQKEj7Q0vx8bMX2EU5UbwsEN7un0DST076FYanQBFGLI9IeSGCLyQNQplh4XUMtSYmtWGGZ
	4o+MalbCnwXv1ER1k6/ZJcCgDlUXufrqKq4ahiMbUDBpsCIvkq6PQgDHSLxuA1NOJFbLo+Rif2E
	DS5VSwVBdhQJbn7V18299LNFdIltNqgM3UaruHfnququ62eCOu5+HomGtq9K7H3loIP5XgJ3gZN
	wbN5xfHaQ9WCQcvg7qDb+2pu3SXCeV+DpH4OdnVG+k9YNojWGDrkr5kPhI13NJXzydr6px3vPKY
	dGrjqDN/gn+mRg4ZxF5lft3k+gVKI49I4JPMdBI71q75SgYAVflxLiXZWTJBoMlVVSn3u7epD2V
	0Fqu1LUVOuzRMGGoUyWXRHmNukBzA8iCtqsT3QHeQz62XNPMm2fKEg61DBLh+R/SDl1dt0xn6f/
	duUA==
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4abb4d70071mr190135f8f.39.1795110613162;
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm310363f8f.45.2026.11.19.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:12 -0800 (PST)
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
Subject: [PATCH wireless-next 06/10] dt-bindings: vendor-prefixes: add XRadio
Date: Thu, 19 Nov 2026 18:49:58 +0100
Message-ID: <20261119175002.458988-7-arthur@aheymans.xyz>
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

Add the vendor prefix for XRadio Wi-Fi chips.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..066c2e90f289 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1959,6 +1959,8 @@ patternProperties:
     description: Xilinx
   "^xnano,.*":
     description: Xnano
+  "^xradio,.*":
+    description: XRadio Technology
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
-- 
2.56.0


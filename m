Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=qwobwhFsX/4hHI0jGCR2piQI1kC6ftFE2EJCR19lPL1MM+GI1iqORZMGVmbcjR3DWEg3
	 y4zjaVJhGOzQPk5u2Xajrr3L7cpaYyBBVWxbBfnDRblUTroQlvXkHhfsyqHXqUcZHAeF3
	 LE7OKFxhyH5+BoAD1ukTDjgL6G9hOXnSk1Y8JGt1+PEd0ANtfHRts3JbHy3RqxQMzUZX1
	 O1TwF/LrsbHozPkEwhtL09tUYSLOB2IZF5kRP+9ZpE3k3Bqj88OQXwSFF8T/CxWgMcLyd
	 6ouwR2qm7WgHn88E5olgAOOeQg4ChnDQItKH1UpCVjObPMDP7xik0vf1biE3bMM6W0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
	b=PtOJdm/czwV5Jv7mHwScTgwgtYyc+mtN+I5FJwnATkIp3af4pFET0d/423dp1jyWnknO
	 ZjFrhHnczqbcM6BKgS071Bx6q2BsVJYcTV3ACS/DkQyNZ4HtMfQW++CYCB51tUZgtHOQT
	 0g1U1rts7h8dSAgRb/NAYA468Fa6WKhqUAnoKStjUVBOBlA6SBo2ElENwVzYlblYiyf4p
	 1n+A9hrB5hd0/xgEBN/Y7C7134Y0eWEiy21v2rg1G9wAE3p6vsiDw7dXmaY6TeEF7FpTR
	 YuaLDBn9mzJnAz/e2f6MzrhqbiFFHo3flG1Ty1Yt8sP77On5emC73ndz+zO+CqYoHbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnEVLE3Z;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16A2606A6AE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16A2606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnEVLE3Z
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so6744219f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729480; x=1796334280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=pnEVLE3Zj8JRaPnukXM73IKSuY4i7eNUSfAHaH9vo3XABHI9BvQhcP7N7h8XXrW01r
         nf9RYYG5btSl5KY6o3gyp4qIrTJBcnXld6ynLda+Jh1h2MmuJwnmk4iZCK/Rdo+kqPkz
         tkiwHc6H41tJ7L5mUh7WInIbvNrvUtj1SyNqnj/O0xLpQ3GxxGWdVvgGg9ej6tAY30ml
         rYjjyGJ7YR1Ct2Y+0CK1BmoMo8vw4I4WdJdwRQ93Y1QW+1PX7MlTjIjnOf/fRn5LoIIr
         OUivlcU7VMPsfvaBtON1+PrcUxLJQuHXNMGe4/z1jMbXnbfgBt9EZvCamVXjScXeaL5D
         kOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729480; x=1796334280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=Wihy0th1RmvL7WLcRR5AjzLLLuKfVbvsBQ2TPto5pMdlN64/W1NEidtO1dsef702H1
         cyZrLEIxh1w7slXCnSkJx9qwETFSldsFngdACi1QEQeAOULHhFvUJPRnsGYxHbyqQQf7
         g+IUtQcRHRHpWvKRYwM3DHMAEDIkVpdBK2Rgi/cRgp+in50+WbLv/iPEzDhbJ/mh/4Jj
         QK2YSaEIQENbIz1MECkOLCxNZepIwSApvRagZuGF/aFo6JkeBKhqyzjrxIOWokhpJ/iM
         c2tP92pj5Fs1rZTNC89T+TrbM+y244HIMHbUdf2/BqTn/lLo/Y8HckhQE3y7iu6jeNNR
         goWA==
X-Forwarded-Encrypted: i=1; AL+hErGfEN5iY7OfwtnXTuY6XEwtRwCLQYIZlBDO4wcY+INtADFzBM3MaPwyF+rv4RUMSbUaXV1F+fjYbr+vNuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ip1tfL0nqvnYa0Nylg38fzq7jGyTREGGtQdjq1TD2+CUv4w4M
	nITfu89Ypy2zLyegGvxNcSN01t0XVE5Suzw0uQMGNvDF09eYj3pLER9T
X-Gm-Gg: AZFdTZcDKWc+k0AbJeec51rjt1KCEeVm7wnYT+Djv/Dcm3G/UDFWsbsKzyDf0fvo6K9
	XevxwA8I38McnxCT1a1qcEL43R+lVbdmsC3wsSn0HdzwWR8M1Qj21ZCHjqTt/H0bP1OcfbzLIbr
	btVowNev62mELqlQD8Ve0VeNuax9S78KJhHlnFTTm388fTvL6QPmgv6zS+x0HCBHC4E+Q7i3C7N
	iK1W4Csx4iX6iRbKQ4FgP1BnqvzIXhyk3wchc/1O2E2KneIJCANBYuyUcM3l8UhnQadlxqQYW5Y
	mOZI3dxu4bqH4bSpxWZVmBxP5Bmf+t27IgNAy24IHZveE76B+wrAwjgpqITML0HhCL/Ehp+7qqY
	2zzwT3FWzpGkeJ8ZSisqp0PT5foHvq90f/B13IjdfQ0c1thKdro6fpBp94G4ntoLYFiSsOULIFx
	icqxaeXkei48n3s4bt/sYk23nSEcEkPJsh4BAmS2vpawt0Jje1iagZmb6urS3pGgywmzAiHMvG1
	aVYutP0S8v36vc0zRf6H1Rv3pvJbKzDY3GTQNkNxR7Ffe56CccMqRyfK3B66Dlxc3QTdjcIiL35
	fin/OjCELUvive4IIM8i9Wjcgv0Tk28gBYd7NHqHtAbDItz+O54oDp9grSqLmDkWSNE3N8ZqXpa
	9lreLo0lhJrQ20qvkZ4+NH6w/6A1co8NfKy8yZ8Hu+fap4JRl5Y+Fov87f/iYllwdi1eD4K6fSp
	inlSgKx5lBJmgRg6soDsxhuVBkG4uXC6CtYgDf949QSbbK5AhBwdOWHcQ/rky35lHnHZzYpRmC7
	5xqhq7XAxNzOupL5worJq1zZ7+VSSdbwbEA9fAgo7o=
X-Received: by 2002:a05:6000:2997:20b0:4aa:d196:f325 with SMTP id ffacd0b85a97d-4abb7f2ee9dmr30913744f8f.40.1795729479959;
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
Date: Thu, 26 Nov 2026 22:44:23 +0100
Message-ID: <20261126214433.3562326-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

R40 TCON LCD is similar to the A83T one: it has a TCON clock, which it
also provides as pixel clock, and separate LCD and LVDS resets.

Add a compatible for it. H616 TCON LCD is compatible with it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..05ed4ddcff3a 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun8i-a33-tcon
       - const: allwinner,sun8i-a83t-tcon-lcd
       - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-lcd
       - const: allwinner,sun8i-r40-tcon-tv
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
@@ -231,6 +232,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
@@ -280,6 +282,7 @@ allOf:
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
@@ -297,6 +300,7 @@ allOf:
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
-- 
2.43.0


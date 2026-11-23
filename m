Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441315;
	b=Ba3xhL4aP2+2V+d/N1kqz+YLjfw0Rs4ibii6Se10WXRf5qBdPlm3rzPAbsbPOnYEF2OB
	 T3Dzbh4iKZha8gc79RSi6tdmOf/wJHrbpo9uZn9PaD0vx0ywHbR8kFLoBsLl4rYoge1Ai
	 CI750ENhsh+QSlIJ/rR2x5GigCiktuH04cLekmRVG0XLR12PiQ9MnqCMyeIrfnPDcSnLC
	 nNM162bwiF8Fc9yDC8mhlw/AHlS2wetzFcXyNyMFLM4jsk80Wke2zZCbdk/OBTejB50uu
	 qZqlVQKqmT3pXTaNcnoGbw8miHr2LmYD46yCIuzqAZuYFfwqrGvxM9gpHzcBJmr04cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0fwCy0JhhA2lRss9bSrLi2rmUykOiCxn4Yb5yOnWwD8=;
	b=knnV4RULeZBbkG6u9FrgoDn9NE/bnPiAYow9XdiuXzCoOuPrHYJHHKGDPQgaMkdPzWDl
	 OZxuh0qAUlxa5D/LyHxWQS6ixs5+UWXoTiE+1pwtwqKh0FfHfsbV7qL5FSWOc7dzwGxlw
	 mwZyIeW481ggC+qkGZUwpgGsalkOhbbxDXLFfCFe8oGcuFqGwKjJCa7XGjbHftIcQwATw
	 VzDwNehM9mK4K+YO2r06t4Ybe+FWbEVIpGLrTBmgdxjIX0JfI07DChlLkwHK44Oxv/2b9
	 mMGUhTw7crrUcLWEFCGciLEiwljYrq8WA5fvlcnDF67PL8jMsPVbPtddrT/qxtIxJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyvfIlCc;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDB9606C164
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDB9606C164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyvfIlCc
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25874895e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441313; x=1796046113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fwCy0JhhA2lRss9bSrLi2rmUykOiCxn4Yb5yOnWwD8=;
        b=eyvfIlCcGTaSKz+XVlurAUDJb+If/4fbsS1OApjTLARCHcvgzUuPPEl00pB5nTTfZo
         L05lG+Tw1hSNssWCqBMSAAD1P/GmvHMGOGK87SWO/+LcdsSVFVDsCS4fCd4AMKwgs22f
         8tA/aLYtBosOMt+ND9jySQycEXKXTGKkRs08EDYO9IfTKHd5/zqQrozd3OnCvjN8iv2z
         7Ti+SDpPT2HBKpy2Q5YZ3+X5mdemSxtPiTKlOrlQAcpAfR9lNmjzB1ztyrcDs365PWsQ
         vxlBIoG6CANyTPV/yBqku78YmpVsJJOKqmdNgSv3U6LlmFjKXays3yeoYvsWJelBAmJ8
         Psaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441313; x=1796046113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fwCy0JhhA2lRss9bSrLi2rmUykOiCxn4Yb5yOnWwD8=;
        b=2PUBLEgZeC5PWmAxvIN47wWhjUBsFu0VSVmMZtwWjZCAxQaHefVIuUJ5+D0ktWF2O8
         QGIe+Bl6HEeynkxYtaIl3JIgpyLwyP5VWUVf4Jpj1r8tp1YL6dgHNjtwTNa0mvanzAcc
         /ntm27M5qmL0TeK9h3TMb2N4PnmGm3FSMlKqXjQHez6Tr/RKJ+52VVG+FTFDlttGIdhx
         9OzGdkUxuh35Wq9mHrE8oCXJoR3W0dWdZmxB9CvtjoQT1qmjNGKQcNVqNmJJ9JY95rL4
         n83hpVq6b57BsFKqZ3ZCV84CERLSv1eUQL919Hesu8kPwqK5ny8u6INXUIr2gYUQMwG5
         wZzA==
X-Forwarded-Encrypted: i=1; AL+hErGpFBJHDkpn5kF3ti13d2Cz6SyDCh9phtjSaReJVZK9tqMf4er/LYiSW9P6zMI4INvXa5zKAuJOYmOGVqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z96DahxRP0ci7CeE/nfIbbUk2YsK7JnOL6S9ONUIpUERQGj+AET
	Q3NWot8DElysOheNGtnK7RVCtl4Tki9fXSZO/epS9VQ9HTwQf7AU/5ET
X-Gm-Gg: AZFdTZeRqVoRjYQZSx0i+dOtzWdGNERRa8G6lIxOXYJuaH9hS0CwgrkZFzTKcfjrtmW
	SIVshj4SK28VC8Fe0HW0NrwUZznG/OwXCPR19t9r//EYTHcyJ71FN1ktBHbnsX/5IXKVnQOxO6d
	Ru1+zRp98xqfTWpES4wvxWn1WxT/3N31SELrT2zCTgHChZ4T7zJMz3oN1jrZTq3t+oIkic5R1N8
	Akez+t7f11ws8dA2NkXbxIimPjgcGIknxed4eNNtbCDErCFNCXCDOs7mHNMS75ii3M4TYZ3PLkF
	4silE7YNBXheBgRL2RQRuUQM6Hd3rt/p30hkt8bTo3PweDiQctMiMW3ETS08F2E8c4MvlU+s0v6
	pL6F/jK+KB3PDxJ+SdNYp468X96ooA0U+COopxWMHkPfi/x+xzjsZOtT/DWkyR1kuk274I7KHWf
	g8EOwwYFAxeBDC8yAvdOU4EHljXv37s2SvMLhhoEPKjZoPulv2WfUjDFLYBynTwzeP0CNqmSuzB
	N/tMepTL87n44ZBU7m/jAJunLwF9ZIpcFCztY0VGBxQeUCVbZi9Y1voOo+DTvn8oUdFrJRSDmtT
	zziP94mz39tULsoP8TWIookEtCibLulrxvRhv3o=
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr228475015e9.16.1795441312887;
        Mon, 23 Nov 2026 05:41:52 -0800 (PST)
Received: from HachikujiMayoi.amicon.wifi ([83.237.12.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm395444895e9.12.2026.11.23.05.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:52 -0800 (PST)
From: Daniil Iskhakov <shkiper325@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Agalakov Daniil <empt1nesss@proton.me>,
	Roman Razov <bonenooo@gmail.com>,
	Daniil Iskhakov <shkiper325@gmail.com>
Subject: [PATCH V2 RESEND] media: i2c: ov5640: Fix potential integer overflow in sysclk calculation
Date: Mon, 23 Nov 2026 16:41:03 +0300
Message-ID: <20261123134104.12152-1-shkiper325@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Daniil Iskhakov <shkiper325@gmail.com>

The calculation of sysclk uses 32-bit arithmetic because
sensor->xclk_freq is a 32-bit integer. The intermediate multiplication
result can overflow 32 bits sysclk variable.

For example, with pll_prediv fixed at 3 (OV5640_PLL_PREDIV), xclk_freq
set to its maximum of 54MHz (OV5640_XCLK_MAX) and a pll_mult value above
238 (the maximum value for pll_mult is 252, defined as
OV5640_PLL_MULT_MAX), the result exceeds the 32-bit limit.

This overflow causes the 1GHz safety check to fail, as the truncated
value fits within the 1GHz limit. Consequently, the function returns an
incorrect frequency, leading to misconfiguration of the sensor.

The expression sysclk / 1000000 > 1000 now also cannot be compiled on
nios2.

Cast the result of the naturally 32-bit xclk_freq / pll_prediv division
to u64 instead. This keeps the pre-divider operation 32-bit while the
potentially overflowing multiplication is performed with 64-bit
precision. Once the 1GHz safety check has passed, sysclk is guaranteed
to fit in an unsigned long even on 32-bit systems. Cast it back before
dividing by sysdiv to avoid another variable 64-bit division. Avoid
64-bit division in test.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
Co-developed-by: Agalakov Daniil <empt1nesss@proton.me>
Signed-off-by: Agalakov Daniil <empt1nesss@proton.me>
Signed-off-by: Daniil Iskhakov <shkiper325@gmail.com>
---
v2: The patch is adapted for nios2 thanks to automated tests and a tip from
David Laight <david.laight.linux@gmail.com>. The first version cast
sensor->xclk_freq to u64, making the division by pll_prediv a 64-bit operation.
Keeping sysclk as u64 also made the final division by sysdiv a 64-bit operation.
The kernel test robot reported that nios2 GCC emitted unresolved references to
__udivdi3 and __divdi3. These libgcc helpers are not provided by the kernel,
causing modpost to fail.

 drivers/media/i2c/ov5640.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 92d2d6cd4ba4..dbe767afefd5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1377,13 +1377,13 @@ static unsigned long ov5640_compute_sys_clk(struct ov5640_dev *sensor,
 					    u8 pll_prediv, u8 pll_mult,
 					    u8 sysdiv)
 {
-	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
+	u64 sysclk = (u64)(sensor->xclk_freq / pll_prediv) * pll_mult;
 
 	/* PLL1 output cannot exceed 1GHz. */
-	if (sysclk / 1000000 > 1000)
+	if (sysclk > 1000000000)
 		return 0;
 
-	return sysclk / sysdiv;
+	return (unsigned long)sysclk / sysdiv;
 }
 
 static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
-- 
2.53.0


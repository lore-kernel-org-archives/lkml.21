Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369473;
	b=XHlAFEOHOU8dfBMVgJr1BvvFrnUCA9bLfkLywnRTkEA1gTWZqbH7h0yunLHJQQxeHl3q
	 oW7mx/hUGdCqS36G84pSkxPdouGTVIFYlIsklyhwfbwJbjZzaeUA47hflY8CE59LFmOsr
	 848pOa6dODTcS7dvX7LEusyhCWDst2FU0C0lwgwmXfq2G4+BOGIJUEv0I3LCSi01dfWsz
	 LvJ8s06QzIFROk5lc7Q2qIGubXeqz7MyPDGtAjqedypdvC67YQZKvrfIcTVGK0Hdn5OsJ
	 EahiFHvZAkBztWBVIeeRT7Gu3yC0+1TRacqD/Sl2S66VpgLVY9AR7tnXZbqps9Xit3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
	b=ysLG4s4RiWn9Zj0lJ5PiPwi92jpJcbP/3/5kd/7tBF4Wj9v7rCvitWT0EAsR3WKiQP7r
	 h3EzgEnQeoeP9vmX10oAZ4kyuCaaWbRy2zRp1/2RRynE5daXPy1DLIIpS80CboW0etSNy
	 tMl10grpvhASZzTcYwCjBkRhPk3P+YF/AZVqpkRt+Pyng2J5cGVwo+Y6V2HB3OTURyUpx
	 RoVAvbYxN8Ge2Jc4TaMpFJgLZ2LvYNIS4QHYlqtWv3KU4u9cucJ2NpXH8wyIQlHu8PZyq
	 suV5sframjGGtP5ONvYrSbJzIsOZd7OHK32FEm/9fmsBRUnatUQLtePoVQLYyZRP2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLeiBumj;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8F606A336
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A8F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLeiBumj
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1864888b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369472; x=1795974272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
        b=rLeiBumjk8TQGxJxb12x1jOoBNcpTTZuMgD5FoSJfFUr1x8u3IcRvBDV2aKGQ+EWLj
         CWgtnCaNl1IQzgFGpJEZ7w1GuGVfo/XjnJkSQgtGBwdSGwTvGx5PngJq4I8AohwPDdgQ
         ZdLAJ3Wic+Yl3yqokWFgkZeYNK9Qyh2I1AQ9GMJHWn/KC/BFELg9DvZ1elIhDEdJTEhm
         Bab8jDUt7R5Qtbk1LcHHuhzgnxIB7BDPwCH/ZYzkh/Xq1WZ38U2f/xBeqrcdrd+BhWta
         30U6TAWHv6yfzN2NTLWK6vRrIwNt3Nm2ydXoTmPbMgpOvOo40VaErfViSOU/JMbmEqmh
         N57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369472; x=1795974272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
        b=PSUGE0hcAaE7pTPCaBAI4iqkUeHw+XyFWtPnOdwUoc59VgdC7f0oEgqHp+AfaWMxw4
         SeGsXWQIhFjg0yEDm2RmRe6Xo3hErzaPM8pA3mj1dfL0fduiCyOa5kJkEcxZPFfCaUIv
         mUzG9RnfOS/syRZoNNalAz9lbYvGFDB1S6Y6f+4LEbS3ceQnxaT5fDpXEM1jjS2zdZjL
         jeNIqdnI7hBmzlsKrxbV+i1YXoL8YNlJZhYX99z8PxPA7qY8XEPq6oyvDdU6E5ioHB/r
         R9OeW26bVE30kGEH9CL61SmdI2A0sEyzBCu3CS5BnCLCBxIJloey5hNn99nzgvFDH6SB
         z+Xw==
X-Forwarded-Encrypted: i=1; AL+hErHnKOatKml+7uF6VWveiIma4SOCRl/Md3O0nGGnTIDVvYtRYnHkOMFa7TAY08lqqsSlapLtglmXbrbIm2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XEKf0Xt6YzXa9cAQ5GT5DJsbMTiEMangrqJSDiIy9NWLkpXqi
	y+B4Cg9waPx3gLHpR6Cg9TMA4atBGyG8dp9tldE7g7MvbxZ1sjXhJhvz
X-Gm-Gg: AZFdTZfqVqnIRpQNJ9hC4Q3Fm0RAckk+pfq882RHzFEQ8Jbj/XP2i52Ibe1lMreuud8
	LwZDXJYOtiYdCFw673PBayw1Rb0ihCDbyRE4e/OnkAFcg/T3HW8kZ9etlDp9iwsHVaNAlpt9E4m
	MUOzOH159okA/WGm1HP1ZmPO078IL7/H5GqxOPxnNQGOe1KlP/0zUviQRGd+uExykvbxGUhY18U
	8fY8J+TCEuWeqkw7qvZAbU8/PHws5B/xMQ3CV0tqrt0nsv7LrZihg2pQqNlpK96rq5v4a/cCQNL
	Binl+NEKPhUewUILNcb0v0v0ehoImAlKAR9V18WK+42/hYxLfAsSZvocHCX0BQhQExpK3P4QMUw
	EW6MmednTDQS3wpCfe4RaRwkF1H8lInjsayhrAWwk9BuWFzaa/VpMgAckCM9AWToVzTsvmQI9Ti
	ATVntkK9RxkN7z0/88SftXHczMtQ4eIqfBle7V9jxZltOu1G6qzvlA2Hz4UkgVBerSy2Zbznaeh
	j4C6tftZ3qgorS0tuLS63gKV38co/bglWPwGPax1k7T3sX0SksFiPuYOk8j5i/mw4BSKccITdPV
	e5dlYXDSCR5vI4F4asgBYVI6mLJEUwve62sQ44mp87YafDSzwEQcCaVAWQgG7+Csl03rvhia
X-Received: by 2002:a05:6a20:a106:b0:3fa:53f1:abf2 with SMTP id adf61e73a8af0-4014de5db77mr6772027637.29.1795369471685;
        Sun, 22 Nov 2026 09:44:31 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm4060108b3a.21.2026.11.22.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:44:31 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: geert+renesas@glider.be
Cc: linusw@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] pinctrl: renesas: fix typo in RZ/A1 driver description
Date: Sun, 22 Nov 2026 11:44:27 -0600
Message-ID: <20261122174427.276446-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Correct the spelling of "Renesas" in the RZ/A1 pin
controller driver's module description.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 07afa4b3abae..7a2ea8add139 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1401,4 +1401,4 @@ static int __init rza1_pinctrl_init(void)
 core_initcall(rza1_pinctrl_init);
 
 MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
-MODULE_DESCRIPTION("Pin and gpio controller driver for Reneas RZ/A1 SoC");
+MODULE_DESCRIPTION("Pin and gpio controller driver for Renesas RZ/A1 SoC");
-- 
2.56.1


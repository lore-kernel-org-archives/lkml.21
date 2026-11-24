Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514915;
	b=EzmJGEQ8QEivnV/SS9iybCHw+KSav6cn0/P+jm2WAolFoVyGBv7HaUma+nyk/ScB6bPJ
	 baiII+Nh9694DnYGtjLa35VYi7POd0z0mZPDc0Oa3pjlUhZTivbqUqFcmvqpjYz7ed8hh
	 cDsXF54z9N1iTSeHWMJw4xidieM7Mang67yqaPwxVgNa/meGmu9Qdc2neeSwBq1JAoHfe
	 bnts1Vltbb5OinCR1NWnAuRzzD+Y+XjAd+uAoPyudgLWgYEDqSmWidppGMlOgxnD1OI+d
	 0+65Uo8C6NWZFdkekSGkocQuds7ekjMgTkqpVxU/AP7yzv1tQC4T3o9E/N08Y6ErQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514915;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uJKhkqQTI0HVEH1WXrfpiN4K43UAH5Ac9jOX2wMXXVc=;
	b=13ytaVMw1Uo6RAyGU52rpyZa/9viVLuRPO8oCZ3f1W7dhJ02lc7S6PTH4vmct2kLeY0M
	 P7stDkXa2bptDRuR5z3GC9Ha2mvZmcOp6Z+mIDhJCDnXFnswpe+Q8An/8PtA4rmAvJPUi
	 uBF3Ptwmvp+aWOKLo42yNQ1tDSy+M3ANEuaW10eQe2vtIKi1alb9cZrbAqKcfRGknzZHZ
	 c6JST8uCzu9nAudXI7wd+R3PoTkkTioxCyc9AY3fdvholCuSObOnVFc0TlzI+kS80xcE5
	 2ZwMsRlhcDzOfI+1nbkP2jU7Nwgsp9Mvd8u5r0vydYaLcnVEVYpYhYKqTTWznwYkpCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CYUi+Zjx;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12CA606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12CA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CYUi+Zjx
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11D64DDE;
	Tue, 24 Nov 2026 11:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795514757;
	bh=A1AjQIfR+LVh5QY+tWaYnITJZOQod6xmvpTtTt76hb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CYUi+Zjx6zj4PmjBv8Ge5i2HTAtcNJ+8xXCYw4qrEenyMXawP0FT4BjebQcxvzeN6
	 PAKQ8FUu47lgSuvQU4EMg8aVGSd6pjEkpQyXtPZq/6SeePax6WUGulyKT4H9XSQK46
	 Ka2eQ+Q4X2wV+L7xHUrdbOg6XNHMKA1PwXRSMNAE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 24 Nov 2026 12:07:53 +0200
Subject: [PATCH v6 02/13] drm/bridge: tc358762: Improve SYSCTRL register
 defines
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-tc358762-fixes-v6-2-bd38fed6460f@ideasonboard.com>
References: <20261124-tc358762-fixes-v6-0-bd38fed6460f@ideasonboard.com>
In-Reply-To: <20261124-tc358762-fixes-v6-0-bd38fed6460f@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=A1AjQIfR+LVh5QY+tWaYnITJZOQod6xmvpTtTt76hb4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBrBWIWyy1xI8TNvOPi+lJ8YztWDk1twL8rjcAFf
 Z0//EkA/e+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCawViFgAKCRD6PaqMvJYe
 9WzVD/9v08IViWYGQbafTWpCEUfIIHkDUj5fG8foHMIgG7+o7o0j/NVxpyyQ2v4pVt/dHf784f+
 KyysYuB6PtIUd40Pdn3fDwei4mEiN7EwbGAOZtBzGA1BPfvPdwIowpyt4PKlCyL/2MP+W3GIJoO
 vOeM2X25jXHGrK4U+yksILM2jXltNmW/YlIqKlgpVsVFqpoIRGu7caj5a0yWMUbxXz2RwZ1oVA0
 q882XZEpx45xqH9YbNL5qlZ39dFX0tEC829t9GPWCUtJAcn0IV6bIUwXx+u6xzrynWJsZv6Dqai
 Azxksg8+LQw1lMFWdboUpkTzf9wFNDD0jNXzhUi+5k7TsTdhyJrFXaHmD/uKHelHZrNswBLvxgj
 jum726Vpx7DZal2ipy+rb37e4kU/7wkLRLmn4GIetcVROOH6FwJ7on6ujkaHJat4xi26AdtDhMX
 Mi1eZtPzYuvk3rZz5PPYxd2UNXM227mUGpYZRp5xOB4AphmCGgriyU05iRBh/IWuPLa2tWEeJ7l
 WOZtEHt7Ny3gIpWfTrj4MIG/dfA+ZP6cRDxPvX/4JdyEXmLj54kgbj24KYehE3IxZyelJQqVvM5
 s6jJc+AytJ6Slfv7Jn9OKid/VczZHsqqcf52M1TFh80xzIfvG14rfhmhSN4owYZuPMaaLhvEDCg
 r3Y6e0wbWe7WsUA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Define SYSCTRL fields. No functional changes.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 097d2f331a16..59c68432f8e1 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -10,6 +10,7 @@
  *  Eric Anholt <eric@anholt.net>
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -63,6 +64,19 @@
 
 /* System Controller Registers */
 #define SYSCTRL			0x0464
+#define SYSCTRL_DPIDATA_IO_MASK GENMASK_U32(1, 0)
+#define SYSCTRL_DPIDATA_IO_1MA	0
+#define SYSCTRL_DPIDATA_IO_2MA	1
+#define SYSCTRL_DPIDATA_IO_3MA	2
+#define SYSCTRL_DPIDATA_IO_4MA	3
+#define SYSCTRL_DPISTB_IO_MASK	GENMASK_U32(3, 2)
+#define SYSCTRL_DPISTB_IO_1MA	0
+#define SYSCTRL_DPISTB_IO_2MA	1
+#define SYSCTRL_DPISTB_IO_3MA	2
+#define SYSCTRL_DPISTB_IO_4MA	3
+#define SYSCTRL_PCLKDIV_MASK	GENMASK_U32(11, 8)
+#define SYSCTRL_PCLKDIV_DIV_2	2
+#define SYSCTRL_PCLKDIV_DIV_3	4
 
 #define LPX_PERIOD		3
 
@@ -136,7 +150,11 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
 
-	tc358762_write(ctx, SYSCTRL, 0x040f);
+	tc358762_write(ctx, SYSCTRL,
+		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
+		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
+		       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
+
 	msleep(100);
 
 	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130896;
	b=XwtoIXquIxBrK0z74cFMC3eDvo6Xw4pTm7YftNQHT49QsBQwItkPZdMF2LbZTAxj5sRb
	 gHTMKqGgijMLL2xn23g5Ktj45NF9wetXILe6WRqpD/gFhL7PZsreY8eewlbKa0LM0V4An
	 SDlQCKxz8xUzneD95ev2ra1AdL7HAzntCx0b5Qgm0QxV4iWCbvFSCPvL8KqLE/TXTRJrS
	 Xrw3JUIj1Au9Xmep/RbvcDaR1WGkzNW3n63S5VWJo/Rjk9KAVB5slHMXcR5fUHumaxnd5
	 mXHEAipYv6Tq74eSJuoJLHllarNMrrBpv1uQb+OM+KkGZ6AJXy1QbDTjkah+xp6iXPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130896;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=Zqe81CUvl0CetbkbGMnAV9O0XTNAJxsTRcckQyPgzXA=;
	b=qf4xxRnvPwNd4wCSforF3E7W/BHfqhrNbonJ1ms17N/jbNeY4DA7U2I7tg2wUR7nN3BX
	 5Lr08+IvsxU7l4I9guR/ibWyjBXAjabSaKn1ZneG13k7aexoGFsVPNdx2Ulx+lHD/udnc
	 hkCB5OZuDq5ST3kDNbecHrhCrHtzeu5B+C9NNcIzDjazDPmXGQ3aL+AH6LsgjPtpMTJ37
	 u5qEn30KylTdq1FQkxiY1iGvEI0yXQGDRIwzz5KCr76BZSkWQmLIJdSVHu0QLEzwIpbHV
	 5qPNFiV5UOggrIoJ9ZJtPgvrYDwvfkAJ2pQhZ6w9+XfXsck8NzGKlJQGDXEGAYzuKgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=QVQsCspC;
	arc=none smtp.remote-ip=185.136.64.225
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955D606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3955D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=QVQsCspC
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261119232810f5cc1be5c00002076f
        for <linux-kernel@vger.kernel.org>;
        Fri, 20 Nov 2026 00:28:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Zqe81CUvl0CetbkbGMnAV9O0XTNAJxsTRcckQyPgzXA=;
 b=QVQsCspCFZfh3pzaqigWEG1tCg6xZUDZBU23sFlStAwf7/eOetWJdBl27yBAzWk/XchqyW
 TPCr0bftwmNuwxDJ9bSp6JxhU/PwhgLODtSmZHysHsbbnF8TTNvPxl9IPQs02/+92zFe70pp
 oFlvLQnfcz1BKI20HSDGnvmh/bNZa272exjUis+N7Esb+b4RTfRCqrlGap0AJuAdvGmCCToM
 jIpG8gED4OwVqlh7mLDsOwRd8hqaf5g2NXeEVKPkccOlRLdEerWqd7mccWlkx4Ln7+gTJqRG
 oZkuYM4dUVYnQu3IqN7s3TkEcFAwmiCK12GsuzAPK0oIsaU5FpUjbVnw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: single: Also free the pinconf table of a duplicate function
Date: Fri, 20 Nov 2026 00:28:03 +0100
Message-ID: <20261119232806.4093754-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
References: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

pcs_parse_pinconf() attaches a devm-allocated pcs_conf_vals array to the
function pcs_add_function() has just allocated. When a node is mapped
again, e.g. on consumer re-probe, that function is a duplicate of the one
the core keeps and is freed since commit ad2093840ca3 ("pinctrl: single:
don't leak group/function tables on consumer re-probe"), but its conf
array stays on the controller's devres list. It accumulates with every
re-probe of a consumer whose pin group has pinconf properties, until the
controller is unbound.

Free it together with the function.

Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index d72ebb186b894..64472465800c4 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1107,6 +1107,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	if (pinmux_generic_get_function(pcs->pctl, fsel)->data != function) {
 		devm_kfree(pcs->dev, pins);
 		devm_kfree(pcs->dev, vals);
+		devm_kfree(pcs->dev, function->conf);
 		devm_kfree(pcs->dev, function);
 		devm_kfree(pcs->dev, pgnames);
 	}
-- 
2.56.1


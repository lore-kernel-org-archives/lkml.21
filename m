Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707945;
	b=TjuFJbwuNMsJjPRIkhoptAoJMM/th/Xqm0Wgx4ejxxgCRuZVf4V0Yph9DKUOEc5fj77f
	 vfFi0D6KNkMazDBqzbzoNGQVvTDA1L3jFtTChSX67Foo1ng2k8SbGjvH3LbrhkW8Jfyf4
	 t1ev8pkX7SmmDvwsITQsJGunwrT55y9DIEMr+Hr2ZSSqJKRAEWG7CKGw0HD5oQLWJmip8
	 y3xIOkGF0HyMYuul2MzqdoSzXdORayw+M7Z1B7bl6H7Med5sTbvGxZIfbzc9VeJyVInt9
	 aIUW2sZvBcEOsuCAfLMZngnH/R0kPZ4/EzxqI0mt2vJRrMItEpc5ovfGXJsnlJ31nQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707945;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=9DMDsUj4wu9ouiC6uWgd/VZi3mi0jlavk3gy5YlGjHY=;
	b=yzszzI23FiMPj+TWYjQWIODd5bjsuz8BNWFB2Q8FVtemp6bfG5cMTWF6jAqkpA/WaYO+
	 6DV4ZN1Bzba1LluNweC7ZnLBbhidLNY0FI3/cp8MFMkxRRNYUnbYNwP6pUxr1r7koSFU6
	 n6gPMwk0sd3MreoruFZ2Uh9KPsitqspLhHqS0qoHl4wXAr+3k9SRNqVLszjWrpIfd+h3i
	 QlJHlWStb2jC479PKjoRG2faVKlCJg/tUN2f7TaSiamwZCfDWSTxwDrQZw3Wxgu1it315
	 kYsvI6VJ45II1mKIt2GDD4s3KCqBJUTHYFM9ANVeqG9BUNej8Ox/aq/38cCfNrTcjbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=GzIPB0dS;
	arc=none smtp.remote-ip=185.136.64.225
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66537606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66537606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=GzIPB0dS
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261126154535f4553cf3af000207bb
        for <linux-kernel@vger.kernel.org>;
        Thu, 26 Nov 2026 16:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9DMDsUj4wu9ouiC6uWgd/VZi3mi0jlavk3gy5YlGjHY=;
 b=GzIPB0dS+8R+L5kEFCMd71KhSvGadMNqjGnrED8yttZBFrzyGN27NLq5L07RNcfjuHNQsS
 2qu1y0sq9QtytHAYlNXd+R3bYK4qhKVpi4ox3ryGU+d6fgxzWmYcs2FqMGXpw38QAp+JwLkA
 ZzV8/b9yQ4m/KnNAH0sC+THRVJSUd5whblrbJhuayZlKMw2U1CG1sbEIpmiMEJrwgxNcDK39
 T9EsIq6gk6ksJJs2095zqqjI7E5XY+6grl/yG6mqMjMtHAWZkCtmkywVrELApvdAyuAeMw4Y
 t80nA9WtKJob6LH3wG045AyMRdV2nOUjaqxw60BBm90rBomVQG8cYUBg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 3/4] pinctrl: single: Reject bit-per-mux without a usable function mask
Date: Thu, 26 Nov 2026 16:45:24 +0100
Message-ID: <20261126154529.1599568-4-alexander.sverdlin@siemens.com>
In-Reply-To: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
References: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
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

With "pinctrl-single,bit-per-mux", the number of bits per pin is derived
from "pinctrl-single,function-mask" as fls(fmask). Neither the binding nor
pcs_probe() requires the mask to be present with bit-per-mux, or to fit
the register width:

- If the mask is missing or zero, bits_per_pin stays 0. Probe succeeds,
  but parsing the first pin group divides by zero in
  pcs_parse_bits_in_pinctrl_entry() and pcs_get_pin_by_offset(), and so
  does reading the debugfs "pins" file via pcs_pin_shift_reg_get().

- If the mask is wider than the register, width / bits_per_pin is 0.
  pcs_parse_bits_in_pinctrl_entry() then allocates zero-sized vals and
  pins arrays and writes through the returned ZERO_SIZE_PTR, and
  pcs_pin_shift_reg_get() takes a remainder modulo zero.

Both configurations pass dt-validate against the current binding.
Reject them in pcs_probe().

The patch was inspired by a sibling fix
("pinctrl: single: Reject invalid register width in pcs_probe()").

Link: https://lore.kernel.org/all/20261119205013.2563811-10-lee@kernel.org/
Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/pinctrl-single.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index f5f0b95dc4282..ba5782b6b63d0 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1860,6 +1860,14 @@ static int pcs_probe(struct platform_device *pdev)
 
 	pcs->bits_per_mux = of_property_read_bool(np,
 						  "pinctrl-single,bit-per-mux");
+	if (pcs->bits_per_mux &&
+	    (!pcs->fmask || fls(pcs->fmask) > pcs->width)) {
+		dev_err(pcs->dev, "invalid function mask 0x%x for bit-per-mux\n",
+			pcs->fmask);
+
+		return -EINVAL;
+	}
+
 	ret = pcs_quirk_missing_pinctrl_cells(pcs, np,
 					      pcs->bits_per_mux ? 2 : 1);
 	if (ret) {
-- 
2.56.1


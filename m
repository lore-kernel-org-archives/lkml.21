Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985390;
	b=i/TmTS+46jkqv/6Y9mD5djAIhCqRq9Fn8RrxJvqoTW9vXFczp6yLAeSBLPP1jD19F2sa
	 iqWaGvVRrhRvXpjHoORsPIT6uGlv/UosdbbWSuwG9l/51oIA9iSGePhER/Mzq/+SBHXnw
	 nTUtcyX493wFfa76FF6jUCgjEYGMz8xX4FGM0uBjOA8HsfRqphMXlHnZ6zQ2R6AS/XrS8
	 ZzE2Xm2THvyNaDBo6FX7A3gvXkFlZ3V+L3m7KjnClA+jQKSflIkOwn7AT5s81uE6ecoOv
	 MGj5OBJlSoje7VFwgsjgHM4avBBdakRmWgH9S/J6HqWpVTXxn+aDCjlxiTHlzU2tEag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985390;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=BjcLRLO1ri+BpH+GCxTtQvyte9QyaKnD+yEnGC08KjI=;
	b=OtVy0jkV/7/1PdlPPMAy/+Gq9qceOF7Yol/cD2M1K5v04TWZzKy/7f9M/FxcMLSQy/d/
	 DoepHGCVI9cutCFzpd0YP9IxbQ5O8KIN34Wh91HXLDn9T1ujfVQMgLdQCMOlXjH/7IZ8q
	 w4nDsJCliXEcSago+zg2En2MPvBXq/qFIT0gTdmSTGAnEwOt8JtMwCcFnvLsVCLcBWwfO
	 ad7s6WqUBmLMRKmJtmYRoFM3SSJpZqDkJ9xh9Ub+jUuCz6qlTyuUYOTbyHigfnyaeOcZb
	 hEYS0fKllw89VYZDlk3ap9LMbUUS77kEI3CznwL1cC0PiRoFinPBQz3qp7ODc6GBl2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sellers.id.au;
	spf=fail smtp.mailfrom=sellers.id.au;
	dkim=pass header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=Tuz6ZCbx;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05B606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E05B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sellers.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sellers.id.au header.i=@sellers.id.au header.a=rsa-sha256 header.s=default header.b=Tuz6ZCbx
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id TT9Xx4mYVAR1iTZhFxrB44; Wed, 18 Nov 2026 07:03:09 +0000
Received: from just2044.justhost.com ([173.254.29.206])
	by cmsmtp with ESMTPS
	id TZhFxt9Qk8cn4TZhFxElVV; Wed, 18 Nov 2026 07:03:09 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6afd4dad
 a=pynxHT4M0AVwz8ROpNtnNw==:117 a=tbVZtiplu92VKpH45hjydQ==:17
 a=zJRp6_cAMcgA:10 a=QzMiS2WfBm8A:10 a=ADz86Hvpe3RKLVHNFJUA:9
 a=sW6rCsXrbcaOzks2YK80:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sellers.id.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BjcLRLO1ri+BpH+GCxTtQvyte9QyaKnD+yEnGC08KjI=; b=Tuz6ZCbxPnpY
	OamOpQ4oc/6KVLkyQHW2S5GW2usE5DCXNYOoNhYmUklON3l4RflNV0ijhWfMxPq0iNL2+AAWdnsWG
	azvdn/cnrA3WkF9UeN0If58iCUaL5514vsOEFhuwSC3Ni2x8+32DazG8bjeoApwQOsuij6UzEU42P
	z/Q9W/9HEHX+ceEi6Hqs2Qb19Oz2Rig5+XlrB1O4kcicPlJ/cx42Pnh4oS8wZUOdXAiMHfRVnB+jQ
	NbO9Gm2rW2MlSk6dcnEpec5h8xKBuLIo/sx6ATVjloBfeDl8mMABOB2/L1n6XZDyrN0FmA8L1+pj+
	bfR1EHGm5tr1cnigVHluxA==;
Received: from n110-32-20-158.rdl21.qld.optusnet.com.au ([110.32.20.158]:46974 helo=localhost.localdomain)
	by just2044.justhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dean@sellers.id.au>)
	id 1xTZhE-00000002TMc-1KS4;
	Wed, 18 Nov 2026 00:03:08 -0700
From: Dean Sellers <dean@sellers.id.au>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dean Sellers <dean@sellers.id.au>
Subject: [PATCH 1/2] pinctrl: sx150x: don't clobber the oscillator source when driving OSCIO
Date: Wed, 18 Nov 2026 18:02:58 +1100
Message-ID: <20261118070259.2557570-2-dean@sellers.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118070259.2557570-1-dean@sellers.id.au>
References: <20261118070259.2557570-1-dean@sellers.id.au>
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - just2044.justhost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sellers.id.au
X-BWhitelist: no
X-Source-IP: 110.32.20.158
X-Source-L: No
X-Exim-ID: 1xTZhE-00000002TMc-1KS4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: n110-32-20-158.rdl21.qld.optusnet.com.au (localhost.localdomain) [110.32.20.158]:46974
X-Source-Auth: dean@sellers.id.au
X-Email-Count: 4
X-Org: HG=bhshared_jh;ORG=bluehost;
X-Source-Cap: cmVhbHN0cjE7cmVhbHN0cjE7anVzdDIwNDQuanVzdGhvc3QuY29t
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNgSEzB7mEtRAhXILxaxdDBu3IAJVRurp31bWJOADYN5bTSgPyUH9P0eAnvU34tZGcti9cSijF5gkBz7F+Wevo3wJLb/eaZtGHrRUcAHPGebV/Mko91C
 laiT7+O21TYm8iz5TirN1vRqf0eXoQkLPn33BlGCqVXd+yYNh523UsSYB79BsZuBYkJ24Sv8ew4QZBS7iSKTbK0jXD69g23ShKQ=

On the 789 models, sx150x_gpio_oscio_set() drives the OSCIO pin as a
static output by writing the whole of RegClock. Only bits [4:0] belong
to OSCIO: bit 4 selects output, and [3:0] select the OSCOUT frequency,
where 0xf is a static high and 0x0 a static low. Bits [6:5] select the
fOSC source, and writing them as 00 turns the oscillator off.

fOSC clocks the input debouncer, the keypad scanner and the LED driver.
The driver does not configure any of those today, but anything that
does, whether firmware or a later driver change, is silently switched
off the first time a consumer drives OSCIO.

Update only bits [4:0].

Fixes: 9e80f9064e73 ("pinctrl: Add SX150X GPIO Extender Pinctrl Driver")
Signed-off-by: Dean Sellers <dean@sellers.id.au>
---
 drivers/pinctrl/pinctrl-sx150x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 04a0e6269e5b..c97e9bc3a33f 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -427,9 +427,14 @@ static int __sx150x_gpio_set(struct sx150x_pinctrl *pctl, unsigned int offset,
 static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
 				 int value)
 {
-	return regmap_write(pctl->regmap,
-			    pctl->data->pri.x789.reg_clock,
-			    (value ? 0x1f : 0x10));
+	/*
+	 * RegClock[4] makes OSCIO an output and [3:0] set OSCOUT, where
+	 * 0xf is a static high and 0x0 a static low. Leave the oscillator
+	 * source in [6:5] alone.
+	 */
+	return regmap_write_bits(pctl->regmap,
+				 pctl->data->pri.x789.reg_clock, 0x1f,
+				 value ? 0x1f : 0x10);
 }
 
 static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.43.0


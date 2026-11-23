Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435772;
	b=kBi46dUW3KhX74Ds9tqPAoVzEj+Khw/SfNdvlfClVhokE4sX5eiX/O4fKfmE4veXyLAx
	 qqBrKDsgcQhfwVelQVoOsOwQz9hs09JRyzDO236JSvpguuuyCQDLZGVv5sDDFmHOgLe4K
	 E1Y+vqbDWvfAsf7PeB1ckQcDiusYRpn8e2piQs47OnyLKfR2EN4cC9bx4wNyaIIlHHrri
	 jrBJX51HYO/ixFPSB82v9HtX4F4bAB92kuK+BIWTLbQgd7RV1iJDJC7INVZ5eUr6hQfJ7
	 HorBGJzt4hHkS2PEDgcKfNCVJhkK9BdCTRAq5QcJHECB2+3cEJmJzl2B3/wxvGcDG+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=MOSUyRgfPJO47oTq4VBkWpT+RLTK5kL/NVumirQl9G8=;
	b=hgtA+HkkTNrcGfa0f23xLv/GEPaVjtxwgxYZfKMkMXodbkaZrNnc/fJwCQb1cNKQC/bG
	 zcR5btHPN0t+54A4Aw1vPT0XMGZ2k9NdA18VggB860g55Sn9scKMYcEq1khiLCYQSt1Ak
	 uwyBr33JOIAXkeXmHXS2B7sV3C51yEDh8Nk2KV0EL5+lalvBrUOceV4Y7ZnbLW015Vxe3
	 Zd9aq0DmZW57+hJQZ5GoO8RfA/dmMC2aMF7gpcV1DIyQ2yK+o6JC/YT7ZITAX0tuA/5rh
	 rD5SYN/pQLu2TdgaDhj8ps9qhZulzFSJsLdiejyPLz1RDHOUhnW5kifX5nrmrPdVBFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fO6MZDZO;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D267606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D267606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fO6MZDZO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2662478f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795435769; x=1796040569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOSUyRgfPJO47oTq4VBkWpT+RLTK5kL/NVumirQl9G8=;
        b=fO6MZDZOb2UGccheqr7ZC7v5mNXg7UJBUFO0CUokvX2o1o9EhtlD3bUcYHOBm8zm6l
         KRb4VsMpDofuEGjNQxQSRRaSIVf8UZYPFbTBRHqeiA5RTZLgjV1MDiTbeZVlMom8jjgo
         yXLPWPsh/6NCOcAMJNIGesIAGdPtf0Qn0cJPjSE4gdzvBEO3J8hq6drMKA2lRcl3GHWX
         I9I8Sz2Mo+ffhApvIOoghhU9JmVtm04KURIcVC/RD1KJhtie1ImYQE8o0+e1qQkNPl6Q
         cazCXqN97ZFmDM/w7AIG+H9l773cpdiWDxgS+K6sSMTzyj5DjgUeLwbJ678lmBqsOhe4
         TvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435769; x=1796040569;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MOSUyRgfPJO47oTq4VBkWpT+RLTK5kL/NVumirQl9G8=;
        b=y2zLKiYi8fkmT58m+vvvvEsVjX230WArZ9MUj5oOJ+x6j/mvteJ6/kQ0IgGWIW188T
         C7fN6tPiLVwH00jspXa2uPyPIKYwJPi7V22bhu4reV7KhhGD6KBaKQK9d2HDDRo6FK+n
         yQVfWth8bP3KU+zHsu2xmZGNLSghpMtO9PA7gKXeCetkNGAHVx91x/F82AOkBxOBV9x1
         5xCThdZ23v0M6ILKZdDiEjUhEUhALnbygPFlSdAi+mg4+GRK+8iD2wSz1ng10+YdMV2H
         Z19wvLVg2mS2M/Id5GT8AIxYGozdzcV8E3jI89VKph+Vg1GFPgbBTXP0F+3WdDXShrp7
         6pAQ==
X-Forwarded-Encrypted: i=1; AL+hErF9ciJO70elpj1TgK07G8LtZrxsHDBlbaAuOv48yioTb4OwZE1HuIZzXEv9R6n91GL6Y9hdJ6LUiBDixeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/foPtM/+qzJ7tDnKz2wA9eFjO2GMb7+IHP7+/y12RAHm95h0z3
	pkM+ojTmsXo29UmxiMILEJkt6fJS8GqEmc5dpUEUkA/di3PgilxTkixgNMSIE/d72+0=
X-Gm-Gg: AZFdTZcF2ItGztTjewAvYz1LposfQ/nasZ+7hRDsMgsZFQk3paVTA00DuJUkgPMNsyx
	7Nfj5xCAvngCcxUxxwTXJ/w7uH/SvUoy/X/0mwycqElvIQa+D7EI1CPoCf+lXPc4IeigwjgwHAG
	spPVFL6jqUHLI0UuJdo6Q7AHY0TDzTG8MxEHDi4VWtcY5dxVwUSJkFJhqhCvhrs76YKAWbOALaH
	1q41XpNqW27LSTmB3vFvSu9BYPr4vQ4nYMsj++OLYB+efn/ufcjmTV3Wtu9aJGdY+WtrHEwHUyl
	j1Ts2KpG2gzE9Pe2z1EDmELd7sdRRV47QJwP+oQj+B+o+Oc674INDaUFTn/ziBMZMfVse3ahtiD
	VzA9bu7jAq97d/YHIobnJO+IRdpX+cW1COZBOvoTfh2fJjRnTR576ANBdNJvvt/jCvkrTlygszx
	7jUWemTwLz5QxvxJn4ThF4yHsa4JgLBGkakQp1ka3SnpFwU8CckD0oHfAcX/eK55ADVZbiqYf3B
	uu7i6P1jFP7EwgdXQ8qJ+HrbkWhWtlTOAQ8/LGWGseFCNM66/7UNerglSlcd3QX3ya00ByOsiQf
	pUec8/LaiNq/x6nwcdw9w6NR8I9Nc/RlnDtn/wpP8V2SmjOC9BVCBhR8yc7fDJH5DIOq7mcIu7D
	gvXA8pNMCQY80vaQn
X-Received: by 2002:a5d:64c8:0:b0:4a6:c5f4:cdf7 with SMTP id ffacd0b85a97d-4abaa976b7fmr20283637f8f.5.1795435769345;
        Mon, 23 Nov 2026 04:09:29 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2d55sm22103392f8f.5.2026.11.23.04.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:09:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v1 RESEND] pnp: Documentation improvements
Date: Mon, 23 Nov 2026 13:09:19 +0100
Message-ID: <20261123120920.2569882-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=RWvctio2iC5bvxeB0uVnbkQOnoWZqDlCKT2BtO2MqaE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmwWnQ8Gipub/ZPLMz+VypWJKv/h049RYi5ov5vmY/6dh 5Xx+4FORmMWBkYuBlkxRRb7xjWZVlVykZ1r/12GGcTKBDKFgYtTACbS6sbBsJpX80du0+wI2fM8 dzt/LN16qpO1YEpEw/ofwnxajBf4z+fmruqek6di/irqUeIlr1zeRdVLq3/XOd55KJL//K5ayKl fO9WTb9vbLNL8zr+Zp0fHecsSli/sZ2X2nPpyaNVf7iv88gbNcc1rnSYaeLZnaGgvkIrUl4xceD Pbk904YbedsmU1p8qsA64bp7AEc14uuTzXcHdua51MOMu55sv3L3LbHDZd8ehZbcpkbdebPW8Wh TQYLCthiBG6E5pU8NP99dfqP5UF3Ku7d9b7rbrcYi3ws14oZrUK17aOrQI6mxZm7D4U75phF225 wyuwKu4u45wd9y6+9/wnonaR53alCu+SabfkDbtSF+kAAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

 - Consistently use named initializers and simplify sentinel
 - Skip assignment to .driver_data if all are 0
 - Use consistent spacing to match Linux coding style
 - Fix prototype of probe function
 - s/pnp_id/pnp_device_id/
 - Drop non-existing .card_id_table

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch was already send before[1], Rafael replied "I'll pick it up,
but please send it to linux-acpi@vger.kernel.org for easier processing."
which I failed to do until now.

This is a clean rebase to next-20261120, the file didn't change in 2026
yet, so it's essentially the same patch.

Best regards
Uwe

[1] https://lore.kernel.org/20260609145117.1355753-2-u.kleine-koenig@baylibre.com

 Documentation/admin-guide/pnp.rst | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/pnp.rst b/Documentation/admin-guide/pnp.rst
index 24d80e3eb309..14a0bf400d2d 100644
--- a/Documentation/admin-guide/pnp.rst
+++ b/Documentation/admin-guide/pnp.rst
@@ -203,12 +203,12 @@ The New Way
 
    ex::
 
-	static const struct pnp_id pnp_dev_table[] = {
+	static const struct pnp_device_id pnp_dev_table[] = {
 		/* Standard LPT Printer Port */
-		{.id = "PNP0400", .driver_data = 0},
+		{ .id = "PNP0400" },
 		/* ECP Printer Port */
-		{.id = "PNP0401", .driver_data = 0},
-		{.id = ""}
+		{ .id = "PNP0401" },
+		{ }
 	};
 
    Please note that the character 'X' can be used as a wild card in the function
@@ -217,14 +217,14 @@ The New Way
    ex::
 
 	/* Unknown PnP modems */
-	{	"PNPCXXX",		UNKNOWN_DEV	},
+	{ .id = "PNPCXXX", .driver_data = UNKNOWN_DEV },
 
    Supported PnP card IDs can optionally be defined.
    ex::
 
-	static const struct pnp_id pnp_card_table[] = {
-		{	"ANYDEVS",		0	},
-		{	"",			0	}
+	static const struct pnp_device_id pnp_card_table[] = {
+		{ .id = "ANYDEVS" },
+		{ }
 	};
 
 2. Optionally define probe and remove functions.  It may make sense not to
@@ -234,14 +234,13 @@ The New Way
    ex::
 
 	static int
-	serial_pnp_probe(struct pnp_dev * dev, const struct pnp_id *card_id, const
-			struct pnp_id *dev_id)
+	serial_pnp_probe(struct pnp_dev *dev, const struct pnp_device_id *dev_id)
 	{
 	. . .
 
    ex::
 
-	static void serial_pnp_remove(struct pnp_dev * dev)
+	static void serial_pnp_remove(struct pnp_dev *dev)
 	{
 	. . .
 
@@ -253,7 +252,6 @@ The New Way
 
 	static struct pnp_driver serial_pnp_driver = {
 		.name		= "serial",
-		.card_id_table	= pnp_card_table,
 		.id_table	= pnp_dev_table,
 		.probe		= serial_pnp_probe,
 		.remove		= serial_pnp_remove,

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.0.rc1


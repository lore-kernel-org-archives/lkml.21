Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075071;
	b=T7Y+/ZNYkWKMA+bDUIArec37EWYc7eOLd1LBOSlwP8LnuoHf/imClgOJra/QXb84PDbn
	 WEOD0pPNW97nsVNBDTDSJCiltY1qvkEWYiAAGaP24VgcPczkb6a1ue5lotcLrwv136/25
	 8DSJWJ65GbugavenwGnGWz2Jbp9h1Wlo+n+JU71dNLF4eY7Q1U7mvPLGlE00RchT4bJnb
	 nPo5roVwXymChbjnewZioOd/ZBIjzMYeMM0rp7/QnQuan9oi3VCqS5V40uOqd1UrEONIg
	 W2139sN9n009LZJ7adcMoRYvuXRClwmxrIv+SFXcaJHlDdYQwWwaBMIbQ4DQI6GFbFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=54XwvnTRZEcAZvG4/CsgVJ6fnI4Exs8l1O0OeDpAayY=;
	b=M4dMUqrZz/oJoS7QvxxqYW1fH01sbEnTnX/CtsXISvTivsouikStPhAfJQv2pg4iNmU7
	 QLbpbAq+3LiLFX62qoVkuMhBfACH2ZKR82XXmRyBNBQWoGL0bO+5MLyTtih0+h0XkQuGi
	 2/t/ig3KQwbWU9Xg4tZXy+5MVjXGEoysRmBVqDdgRHGVnpuLZKLobAwEA2Fb1MjSiq7t3
	 Jbv86BP0E5CcSUSNsmyRGWeme9+xEEf74NzIgwdaLF0qHIuEGifV8OsyZ4xI4dHDmrM1L
	 kiagLyULZ0kXDnxDSNSCcVOmFM/Ba7Cl0uydwqIXirfT62wvUWUnXFpr/SMUdIjfvzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bu1us5l+;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AF606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377AF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bu1us5l+
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1725038f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075068; x=1795679868; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=54XwvnTRZEcAZvG4/CsgVJ6fnI4Exs8l1O0OeDpAayY=;
        b=Bu1us5l+m9et2LjpRBEU83OjvlwVzVU/tCX1OZB8FKp1V9vmlQH9DlfXwUjA4krTbj
         brUCQq54mMSUJZVUP0qjSqEReWeAigPEvgJpmskrc57kfM3icLp5ecJRypv9mqc0mWhz
         PM7a5EVU/X+ZMZ6/H8QTcfhUaz9llKID4WLMWmr2zb+zwuLQBHgZyC5T/RMmZlzfeYa+
         3bddOkRTLlDXG2FjQ7DuKkTVHw4/k4AIbO9NncTJeB0naw42fIKzwnb9+5vP8tVcOnE8
         BwgUwGmNorfdpIVJzQai93RgCPG/3nhWspHs/zvwgy65nU7lPJlFo4SziCP8mCooVyuo
         cMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075068; x=1795679868;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=54XwvnTRZEcAZvG4/CsgVJ6fnI4Exs8l1O0OeDpAayY=;
        b=CYcbckjIv/gJFPnBy1I/sH4wr8hyKoPj9W+OXo8vBEkEiOsx5GdqbeA3HNN92yW3wG
         pA2Gmlv2A56F19fKioAebt+eilEfecA3UmoyTpCSPD1gULfRUOTxLaaZ3QLWDdfbHPqM
         tl4peHFd3oxCwaR/SxAUnt5uDw16BjM4bWoC5wfb2JEAejBfxBfcwEx9u49SpA6gIufk
         zXEe/dfn56NCKiyggMRugzownRUauFGcYrxKK47j1KguO1DGacF+RlqARUJCItcujAmI
         Mst3Zrc+Rw8Tb3RqL9PSqujOLf6MdMAChBVjDfczH5ylTlOsb1mU7rixbhNuLIsXu0qP
         UB1g==
X-Forwarded-Encrypted: i=1; AL+hErEZWgT37lmj/jGElhzA3rtBLgWJzzso6FNkovz2JGyiJxggE/DDf7TPNwSV7GHJMwjR9y5ViIYFMQqJkn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TeM1QghkyP6FKea38S7/tiVtS30W3PNu1l6U6PJLjhaRIOrcw
	5S1GKofSAnmXFXkACXUT8FAwk+NQmySnrqywfmh2dJGtp6KzMza2WVvq
X-Gm-Gg: AZFdTZcXoa9Di3tY+u+itLz7vgjWQLRrYQPBvY2wxSxOfazB6f1aAaZiohfpCFRLVUe
	yB7ghKHQJwC1YHu2nu8aMurYGVUwTVm6BXK78i17lWk0Xa/YSAkQJp8Kp+Pjigiaw304zjMWiPg
	YhiLfZhhHdb6LI50PHxmA+xbj5iW4p5pROB9XscGfgLE/lXRFZtLs9RKhqDnpFFHJ5Q+vBs0TUl
	MM86PMRTOM60epY27WzuPJAo47oYddc9GYs7OUXBVwb7CHGiT5H8iN+FQrq83FfK104824y7rta
	e2hsDvZEQT3c2T39PBfaUAsHG/hAeGX86FXKJcChawFNns679jRg1ap6rQ5nPE/dnTQ2c9tn6hQ
	OmPxgkfE6qn+BkzFbCPeDjuUXbTnDu1vVdB8Hfk5yeIVzYRENBnw7ROVHMXUppwcJxXhuZ5jeCt
	JT9VIb1YIEIU3GHzbB2haDEKwFjGnaorhkLWESNFiPynh6fYzTQl1e+a84UvHFTsfndJkHdBeOg
	o0C51GDJygcZCAzeD7z0Jgb/H7VkYsVhhioIL6b2Une3Y0UTuyfKqz1yUYN6MEIXBRYIcM68aBy
	Racyy2/h0Iu83tnjmZthNJOY4BW3jI3kYfJ3M2GJeOhttnvysgxTHgEvzg==
X-Received: by 2002:a05:6000:4555:b0:4a4:7328:21f1 with SMTP id ffacd0b85a97d-4a63ac6be9fmr7344622f8f.24.1795075068411;
        Wed, 18 Nov 2026 23:57:48 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a654a8c411sm9450116f8f.16.2026.11.18.23.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:57:47 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 19 Nov 2026 08:57:42 +0100
Subject: [PATCH v2] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
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
Message-Id: <20261119-spinand-set-req-type-in-bbm-functions-v2-1-4dc4f995dfad@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNTQ6CMBBGr0Jm7RjKr3HlPQwLWqYwiRToVCIh3
 N3KDVy+L1/e20HIMwnckx08rSw8uQjZJQEztK4n5C4yZGlWKaVqlJld6zoUCuhpwbDN8eNQ6xH
 t25kQBYJ5UdclVUYVlEJ0zZ4sf87Os4k8sITJb2d2Vb/138KqUKEtqq7Uub4Zmz/6seXX1UwjN
 MdxfAGt2xLY2gAAAA==
X-Change-ID: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Commit 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
added a 'type' member to the 'nand_page_io_req' structure and updated
the request iterators to utilize that, but the spinand_{is,mark}bad()
functions were not updated by the commit. However in both of these
functions the new member is implicitly inititalized to zero which
corresponds to NAND_PAGE_READ. This is correct for the spinand_isbad()
function since that uses a read request to get the bad block marker
bytes, but the spinand_markbad() function does a write request so it
should set the request type to NAND_PAGE_WRITE.

Change the spinand_markbad() function to set the request type to the
correct NAND_PAGE_WRITE value. For consistency, also update the
spinand_isbad() function to set the request type to NAND_PAGE_READ
explicitly.

Cc: stable@vger.kernel.org
Fixes: 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/log/192383 # See "**Investigating `req->type` in NAND Write Operations**"
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add stable tag
---
 drivers/mtd/nand/spi/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 18bba02fbd31..35bcb4a8861b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1105,6 +1105,7 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_READ,
 		.pos = *pos,
 		.ooblen = sizeof(marker),
 		.ooboffs = 0,
@@ -1148,6 +1149,7 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_WRITE,
 		.pos = *pos,
 		.ooboffs = 0,
 		.ooblen = sizeof(marker),

---
base-commit: 760d2efe91a84363d25c1051a10572242e75fe86
change-id: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


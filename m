Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024322;
	b=4WHO9Ac7K9Ln+VYBDKQWmii+KFN6rgJCNQkHNbtVmTrckhsz5fCfRhTVBngM9DvBy3+Q
	 tD1wCuJ+a6BqPA9BctBmFPPWMG+8f/k4OXVanRNZ1lPrQjT95vbWq1p6tIQl6DAHyPfHo
	 wp9EN928ZI23mYIY0CSmf5oSibtGtyPGuFwG4LL2eyfUzNqu9duRrO5yGEKt/kr6KMpZQ
	 iyLFJnSivdxd1xiCND2qNfZQLzUxNpz6/AXZMZ9r4scM0Xx/UCz+dzS2/XEHZga9bPSbZ
	 DAEOnVpOHiFpN3MIGDaHCp+zCeCq4A6e6x3+pEEqyJVsFkFYIW5c4gaUS8LifL4TQYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lrYP1FavFeNWo91iBiZFr6F+xFd7OUXt7KDpgSm32fY=;
	b=Xrz8HF+r5d4tquNdtl2sf783gmo3nN4lGS576xyJQpYaYiBSVVm+1n6g6i+ryGspS7zV
	 OFrTqbR+ntUrlKW8W8DUkHyDAosHvEMs9W+j+nz+rFSdP62Bfp0mznk1rScghCJNVwiIC
	 9RE/CdXOEv+ZBwMOID22k28oIG3w53yczXX3R24Dxg9JUHLLpYaTNS9+Q58leRJvpMUCV
	 30OhQoka+yPzYN7XiL9DNsNLSPMu2LeesQ927xscX7AEPc9o2KbXvirKqWDRqRNgfD6K3
	 2+hFKLezLyzjktXdw1l/wTcdB+3+mny7+IPBQTCe7BeVfRg4n6mkdLC+cv4m1f5GhUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wEI207PT;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63637606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63637606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wEI207PT
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f84a55e31aso829421a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024321; x=1795629121; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lrYP1FavFeNWo91iBiZFr6F+xFd7OUXt7KDpgSm32fY=;
        b=wEI207PTtU1MAzA/d9lCHXEz2O8MdAATq9Gz3VJgZNROuviqRJPmlrOZGAIvtcX+5G
         JZsoIB+euVrd/1RhzmrfmC38LB5fQNAUHbDwn0G+33LjI6qARk+x4pYMmWKcRNrlx3d8
         KvDhACYW1DGEc43emWkd4fpcjGFGt/Y6ugMYOcQqhJ56ySRyyqAkOTmHri/mc6wOKnc0
         aiIY+Y/U01E5Zwvy7linP5cqKFzwgqAFrGCphYyrhYOwIC0M3ktBQz5KB9joTvGPyKNr
         MghIj8mniWQ8TNIX3JQkvi6VBUDvqokdBjQTpmvXjFbxMfTw9LKXUKSnOC9ejXT1PnXo
         Vklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024321; x=1795629121;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lrYP1FavFeNWo91iBiZFr6F+xFd7OUXt7KDpgSm32fY=;
        b=eYlboZzfK0z4yVFrSU3IgZ8eIVHcyuyhYliWrASbRuQezhpJdGSqLmwdYcp6YGsAAe
         zirzcP9Gojn/i3BE2EUrLASCShmGl5a1ypuoKGb6tAHjyfoXJSm9y901TU2idYdQp6Be
         +bcosLKtB0YrEmlYrKtj9S6q7G2mBi5A3nsNTTOnf9msQE+ptDDjknzL8vqJnXKvHnhP
         JZwJkm4pIE9j40IdbWBZYVFOuV/xtpfKBM0sBOIE7TyAMr22PelwlZEtqBC/U2Z2FTZU
         AZlE4EhZr3rucrO10tFsCC6e4+HNDAUSKNbA+N5ujZOjN6+SgaW3rGVRCP+fKon7gWyc
         LMeQ==
X-Forwarded-Encrypted: i=1; AL+hErH54fTXuccZn9gQsbF9zJIkUcYl4H5dHbdbCkF/SE+tx/sUTd+KrTMSecNnTCYiYTkRudBT0wI6YwF+AJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9trrJkX7sh1heifn68W9Xot166k9OIOr97hf8uzYANUT4NyVtZ
	82nE8o0cuiuxIXBlRlnq30DANxcCnfhZ9/xvzuE6OjIxyLlTn4frI90w
X-Gm-Gg: AYBFou3L3L0EChRo3VkYYxhmVsA1jMUzhyTnGhg2l5cjoqXKv7xr+rRyVwA0yROJnfF
	/GMtRsVYPqNN96jWWgh9umGDasqGNHZRltKlhgL6PJHgYAgc7m5M97/RIG+I6rcUzKtA0O3ZpvN
	HkwRM/9f7b4I+d5FJdCW2P9H6860AtzfL0ZAkCmAoKByv6UcQM7iVeWn2X3RCUoz/vkPEIi+bCz
	7LXaV+xLDdrSg9O5P89BZlRHwSp2hFwrV/+4Qw5HOjwi7iHKj68u3OA2lFpi54hS7S8jHmod4sz
	dXsJPGKBwSAfBycyLPOcSPIc0BQ38D34B9XCWCwAghTEwtr6FyNp8EVUh2EPhSYxKZHPXXwXNMW
	iFbLm/9mdS01vEUmULcxdE3ZUJSn/JSIJ3ir3E62AYWU/j/wkXzPOXh/On/UoCO0jwBJD86GT7h
	k9/e7+2mdAXzQK5QLwSCks1FZDJ6ZALO+cTOvL/HGbheW4SQBGF3zZ5/kzzpCAbmPY2x40xgJNx
	LwFF9/LYLA4ZHXhYI4fruM07/YhAz9dBx53ISi+d8+b+gd+Xh4SHBKT4WEjG3mhz5Xb5orEgRlm
	5VGuyuB7nMj+zCiffA3pKFvwghCkaHQlmymVHN87hk+9WN3RndlcNcIq5QtKW30BEYHassDvA97
	vdA4DgLq0JBmf7qiuDQMscjnzqiiuz6e456cB+fs4fYexk5Jp2Tjv18zYFy2AUxE6k26A0KsMrT
	6HxkcVBfI++BhnlLLNl7qJR3KsHHamfupYfH8U4XKIRZO3rPNh8zug
X-Received: by 2002:a05:6830:2695:b0:862:c3b7:c2b0 with SMTP id 46e09a7af769-862f08ed656mr3149683a34.9.1795024321103;
        Wed, 18 Nov 2026 09:52:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d4759sm2476806a34.8.2026.11.18.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:52:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 10:51:15 -0700
Subject: [PATCH v2] mtd: rawnand: propagate non-ECC errors when reading the
 BBT
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
Message-Id: <20261118-submit-rawnand-bbt-read-error-v1-v2-1-1a3f5d121c5f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQrCMBBFr1KydiSJYNGV95AuJsmkHbGpTGpVS
 u9uWk8gzOI/+Lw/s8okTFmdq1kJTZx5SAXsrlK+w9QScCisrLZHY/QB8tP1PILgK2EK4FzJhAF
 IZBCYDBB6F4Kh+lRrVTQPocjvbeLa/Lg4buTH1bs2Os7jIJ/th8msvT/myhmwMWp0MWK0dGl75
 PveD71qlmX5Ahcd63riAAAA
X-Change-ID: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

When loading a bad block table from flash, check_create() invalidates a
copy on -EBADMSG and schedules a scrub on -EUCLEAN. It ignores other
read errors, so it can report success with an incomplete table in RAM.

Propagate those errors when reading either copy.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Explain how a failed BBT read differs from the ECC recovery cases.
- Link to v1: https://patch.msgid.link/20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com
---
 drivers/mtd/nand/raw/nand_bbt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 93f162805f31..f3a1fd31ca03 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1024,6 +1024,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res < 0 && !mtd_is_bitflip(res))
+				return res;
 		}
 		/* If they weren't versioned, read both */
 		if (rd2) {
@@ -1035,6 +1037,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res2 < 0 && !mtd_is_bitflip(res2))
+				return res2;
 		}
 
 		/* Scrub the flash table(s)? */

---
base-commit: 292f737382d3913d0d9addf220b7170fedd7a04f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


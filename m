Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093971;
	b=qkfoTknsZVl9S3lWTMCoDEYTxvOY5ICey5GkWWDlbKWXbVa0vOzo4gHYdHFnB1JgioU5
	 vRFQb8AstAQlfoT61BqbeVBFoCKm5rbGXU3vbjYAaR80nmJenxzLYgrplsJBa9/AgrA9Q
	 F+/omfrIm2GuDG5VfyIzgGppXp4ySqdMU0LebAUlXMKBs4QcOIp4N1lhOwWxehRqezfzH
	 f9UzZgpvYz94UtCV94P4TWKsoQcvNW71Jii7vmlivkazdLu3cecd7oPL1BWOQMomFk33/
	 x9DUlNBH29j/VQSSlr8V6goPauQZ5xLkg0OjUW60EIR+5aJtt6hP9YU/u8+LkDhK52w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WJXnVig7SZkwO4OAkKnuo6Hlh0mY+nkABDPAGbY4VVo=;
	b=bO2pu4jnj342zFb5PwHvJta2VHY8i44xcdWeUFcN4FcwnmXRP/qh4vYbsRAZNGIQg8VF
	 2rKukBr2KQH7emOzKyuL3UajMY7rPaRLfvNFCNyMn3L4mtHwT0csobH3E5KLYn0SpQ+3l
	 XLkEsIIHPEzXyBARODwQ2yap70lx0ogueaBdwtEDlIqJtJ/G2WK4y4gC0RF2n45f1rvrJ
	 Liy4AEAxomGhXuRxx7qoaxnWxFiB9/AShhvI7aSDpcfPI7X5N/47Qt+cWMQ1gJ5c+TK+5
	 jiL9USYugil59Bau5hDgHDSqzxnQlPcvmG+GkjfO+gyXq1Zdv3ChL3BBWwl8Cva5Iuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYR7fUNG;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D0606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 972D0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZYR7fUNG
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so10916255e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093969; x=1795698769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WJXnVig7SZkwO4OAkKnuo6Hlh0mY+nkABDPAGbY4VVo=;
        b=ZYR7fUNGQT0SZA/eul781sosigIn1oVfy3QQNOwIrOfMTs9kYJRD+Uz4c1w3VpsdY3
         gYmywsJH4oRX2EMsjTnrM8Zuas1puyMu017EAM8KINobK2JHiwWyhmL2EXMPi/0koadn
         mHoxIsrtuzjGasvtXobza+IkqIcSydTLaMTk4TCLBQTqqqQVAaXh7+TK8sk8+hUUO+DJ
         ux642+sb66A99gmQ4MS95/Dk/aCRMmRxEWF/K5kV0nB+wzZ/Q8JDoMTAiraFfqbdwwWH
         MzwGsp/npLPWMurxdiqKVVqbDBDlLZ+bcFQZwnhPjvQ8vX8RIiPzgdg39PPihMA4SaUs
         SpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093969; x=1795698769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJXnVig7SZkwO4OAkKnuo6Hlh0mY+nkABDPAGbY4VVo=;
        b=C4cfXLbzv4vEmNhgksfLe1rY2WgaIJsYd3dnsJ7R7pI7iojYM5TET0/UC4IQDPT6Jh
         pJPYLjO+PmYikUw8YQMKTO6K2qSEgdEM7IFJBPXbBDH2pDRku/gDibMj/qSZhLyoGsM4
         cezNWf2KGonJxbgjFB+ZcWNFYsyCCjKbqqVd1ygnrbViUpdwQNi/46/vy4WFBE2+iwfJ
         yNUqVr4sNY1UdGg7uAO/z1PDRC9alJvBIkxEkEQLa98QXxeXSHM5BQT3yGMD11n6IPiT
         g1skwzdvmrsxp5niJk8F+nKnyRS2HzaAfoKWk1P/pa7AEFVKQqIOI4YLCIw1uAAltHOL
         McMQ==
X-Forwarded-Encrypted: i=1; AL+hErFpiOwr0BUcer2neqUG87DNMOLQX6BGW3fxvx3tsMXuXFYMryNvop+er9dyaDL1ac612Ya5QDsdUZ+E22I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yRYzzqX5FybC26Rr1oFbBHr+HSCKwO3W430yjlv9uKe1i8FyK
	D3h4gu4YmhNv2R8D96sYeX7ZYfhaqGf5rvbPjMLul+hWirTCbG1YYui+
X-Gm-Gg: AYBFou17cZ/Gp/3YLwQJLpLYgTCBbSbKv+1UHXaM4gYfaRt+3VQZwn3TOgHVOSj1UzA
	ShueIegfxblsYk6/TL901wFQPCodNSwzifx778WllYWXoGDIMKGMl9Yr0pgqin8djiD7Ml5PSZD
	j5LxGL1SedmDhcnqYlC36p8yjt8cTynqjYDJmquVVrPqC7kbvc6KiwTm0goYSVUBWB23t83ULha
	TdLe47NhTuWrMmSmrpl2POYY6V2Pvyllu/Z1GVvSeqRSZo4GHzw7aiKpbeQPY1vyHtAnfG5cfjf
	LIaQh+nM3BD/ZOA6VRFtzjzH4mYY16MIL9z2r99Yfng/wrv/IfwTHb34RZd/Bz7n8spS2OI/nCD
	uZZoe0Dv3ozAoFY6plLjdwGuujps1g20b2fjpAx7GSxhC95N0OQIniXnukn14D5nT/xpQt2AA5A
	ljDlI6U/+GGx5BPv4plDgJLd04jq61N1s/6SNjvLmFW4Z/ySUGZ+4/OmLjJfVdwvTtrjFjzpv4A
	vpMMs+C/1TM3hZHxtd8E8Y1gC5djNKyKgtLd9Qk8lZUBmRHGfpVXLjdL3YlpowXMNUC+AVaFeZv
	d8L2kV7fmie6qlWlogNF8v75H9TAcZxEElsQGNw58J+JuyIx9J3J6Dky
X-Received: by 2002:a05:600c:6095:b0:4bb:6238:cd81 with SMTP id 5b1f17b1804b1-4bb7d9fb3e1mr109823685e9.10.1795093968695;
        Thu, 19 Nov 2026 05:12:48 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:48 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3 0/3] mtd: rawnand: vf610_nfc: fix the OOB of written pages and command timeouts
Date: Thu, 19 Nov 2026 14:12:43 +0100
Message-ID: <20261119131246.187406-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Three fixes for the vf610_nfc driver. All three were pointed out by
Sashiko, on the large-OOB series [1] and on v1 of this one [2].

1/3: the ECC page write transfers the spare area out of the controller
SRAM but nothing ever puts chip->oob_poi there, so every written page
gets whatever the previous transfer left behind as its OOB.

2/3: a command that timed out can still finish later, and then the next
command returns before the controller is done.

3/3: a timeout is only logged, the callers report success.

Tested on a Colibri VF50 (MX30LF1G18AC) with v7.4-rc2, PROVE_LOCKING and
DEBUG_ATOMIC_SLEEP. A debug patch skipped the wait of one command, so
that the command finished after the status flags had been cleared, and
counted the commands that returned while the controller was still busy:

  unpatched:                       250 after 100 forced timeouts
  completion reinitialized (v1):    41 after 100 forced timeouts
  this series:                       0 after 200 forced timeouts

With the series each forced timeout came back as a read error and the
reads after it returned the right data. An 8 MiB UBIFS write read back
identical after dropping the caches, with no ECC corrections or
failures and no lockdep or atomic sleep report.

For the v3 change the debug patch forced the timeout in the raw re-read
of an erased page, 50 times. With v2 each read of that page from
/dev/mtd succeeded and ecc_failures went up by one, with v3 each read
failed with ETIMEDOUT and ecc_failures stayed 0.

Changes in v3:
- 3/3: a timeout in the raw re-read of vf610_nfc_correct_data() was
  counted as an ECC failure by vf610_nfc_read_page(). It is returned
  now (Sashiko)
- 1/3, 2/3: no change

Changes in v2:
- rebased on v7.4-rc2. The large-OOB fix that patch 1 builds on
  (vf610_nfc_spare_size()) is merged, which was the build failure
  Sashiko reported on v1 1/2
- 1/3: comment dropped, commit message shortened, no code change
- 2/3: rewritten. Sashiko was right that reinitializing the completion
  is not enough, see the numbers above. The idle interrupt is now
  disabled on a timeout and the status flags are cleared before a
  command starts
- 3/3: new

[1] https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-mtd/20260828085340.3916239-1-mehmet.fide@gmail.com/

v2: https://lore.kernel.org/linux-mtd/20261114192031.959376-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
  mtd: rawnand: vf610_nfc: keep a timed-out command from completing the
    next one
  mtd: rawnand: vf610_nfc: return an error when a command times out

 drivers/mtd/nand/raw/vf610_nfc.c | 43 ++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 11 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0


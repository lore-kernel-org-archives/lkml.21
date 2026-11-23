Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413028;
	b=HGadWg3DWPMJlo5dFuzXJEXz3JFTL5uRAND6f1ruYHNuDZry1JiWQxZ0yHlSImsIPYol
	 m4tpqZyB+UelIj0GpyppZ95qhJLMh2doeWozecXMTyY6otddNwqgCIib310GSNUJACG8B
	 lRTMnKu7Xf0DYiE6O2cnGBKK+CYg6gPAbDER1tJrPujWDLfsaRC6AWR5X59jVU1xf2dsl
	 Wq9PZ3g6WAmsupxsmRwlW1WFK+IQF0Yz/MBb2PAODwbgr0aHiXukIKs1L1QUFbj1stUN8
	 2wWIyyUuSuMI0DXhQT4vwCc+n/A4Xkw71/hUwJfl8NFjJZyupUbtNqjPMCGTRKMx6+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
	b=PY4IF5Uu8+jc8vEc9fQi8a7mpunZZmff7zugwxJtBtekOKIN9CVKWpuyhusC2zGoTB9g
	 IP9wheFsd/en/gqdDAVX9e5y1+JY6g5f9d5sCA+ZR1um8O6FZr/7bO65gfK4l4+/Wc5AW
	 xHwfi7zb0LDN5pJ+vo8XHBBcVxpPDbqUtXLUEUNO6zrJrKIeXMsr4gryV2rieHSbkdBd8
	 pCo+225ekQFmOJN+ciKXiISBfIml8bu/qeBBw/BCkjuclMdyiMOfFUYhytn3wS1x2ZGPY
	 KCuaVRrq9dXcIugmMYuZJ6ayhKGyfvqE3vO35ENOaZhy4veC8FbU2Mz5UbnrdjqB8UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bN/TbqcI";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD779606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD779606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bN/TbqcI
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f03920c477so25239525ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413027; x=1796017827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=bN/TbqcIS7czI0ws3mxV8Rcp2ZuaUfB1saZzM2pDpGs1HNCATrVzLvCHPFBxS686wq
         YBZjJppWJGfmA1lihAxvKaavl2iSfmI84Hzx3QTsPR2VxNWG/rhO1oq8N/ui6MrbCDEr
         X1xnw++5APo/MzQzunuzhhU3SL+oLlhGtua3BCOdnc1aF5vlBc33ndFx2fM1Y14OaahV
         6xPpHuQqohj267QHYLS0Bxl8dQI2g+MDIznfvBvdp2r06V5c/U6WFx+xKVugDO6RyM8E
         TuQfwu1cd8Exc0SqwulKw3h0EauMdy4944JlU1Lhle1qscTaLDu0Rx5FtPYTFP3LK56R
         sYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413027; x=1796017827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=sFupy1/6Ei5gYlqjFiayKhBo6ndmjXl0cU9ELXsK1rwSjtWgw9vFrvdFJ+E++sRy0B
         jVjv+orDaAqLORXNi/7hn14dZ8ACZFpgVrVzYqY0P/Z9AV2nw3oO/kdCMseDn0pkAQ1+
         c5RkFAA/ZmgdfWBkmcw5fufvmFA/LXXi/Vwl14RoNp+gTnucxEV1reQRoG/kN7IbnjbM
         IBZyD/7MkzGau9lkk/WS9k3+c9sJ4DUk4/WqcU2KRN8r9XslWD9usRAjPqNElgdjNvOq
         dNtMlVEz4ZAcGNUYJEeruKa2X3pziWZZlQmn27g7BmnFZRTLvqKN4jK7vv1zEXG1FknU
         +zKg==
X-Forwarded-Encrypted: i=1; AL+hErFrL4FKOm3N7zmDOy/iovVdi1t1bHz2siQMwlOCTuVgZnj22uYpTypx4X0lZvmWKBYRfEo8J0GzM9wyKJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IvGjvn27aRVOE3cNrFr54FS8jYIS+jr4Akzv2SzxziJpEsgZ7
	MTOAKu7gIgcAjoPDgTzYQCO2lzw7Ta1dIG5Uw5zfXZtPtiY5nORN5Fg7hc3Jc6Oy
X-Gm-Gg: AZFdTZeFBnheWgM5AlL/VI3B4SHgfCryHX1KWdLiYW3daSsR7yxESwdrlQXO5f26xXc
	aKG4DLFc9q5mjOS1TjhxmjEMfK/FxsvKndhLOgokXd/pqbTo7PcATJ1M7BtzHriyUm4hSCrNL/E
	aPFpkgJ7c7MgAy8xFVObfRM34dO81Ul5rYnArNRGAkX6my8nMEjG82D9qL1hhWYOmersFG47saL
	coSCxvWd6kM88ic7/2/aTVFTp5phcrVsEthMrJ1NqvuUSD6biIcadznAoOLI3f4xl12mnF8XdVK
	pocYFCGSPlqbnaB3C0Iv2zMw4SpgdQdKkkQTReP4wXBFKD0x22aERxgrekG/uAgia0tvtHtIuaF
	oa5oZ3GDM1cKP0dkUJk5chVJxZnMlVit7NoMYN1BBVkR2iORcGxxLPIB3X0YEbGASk1QfGfEjuk
	C0YZGdxf/4oyww9vrp4jl1sI0WqyRbU4rlivnzkfGUThcPt0FLlAbkDbWE1g39i/c0AHdBvTOY2
	iLy1fJOLptSRCeDOheub/HPccgE15J1vxW8dLtlWJpnliI6OKES6vBJNQBLWvgjvBdJQy8T6eO6
	YgBTkF1VtL7WqvIC0yGvsxdbGMc+Lw==
X-Received: by 2002:a17:902:f547:b0:2f0:60c4:9d1b with SMTP id d9443c01a7336-2f060c4a58dmr72115095ad.62.1795413027126;
        Sun, 22 Nov 2026 21:50:27 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:26 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Mon, 23 Nov 2026 13:50:17 +0800
Message-Id: <20261123055020.1995251-1-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
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

From: Ping Li <leeonion.muyu@gmail.com>

While discussing a proposal to also allocate the mtdchar read/write
bounce buffers with kvmalloc() [1], an audit showed that three raw
NAND controllers DMA the buffers handed by the NAND core without
declaring NAND_USES_DMA, so nand_base never bounces non-linear-map
buffers for them (see the use_bounce_buf logic in
nand_do_read_ops()/nand_do_write_ops()).

The exposure predates that proposal: since the MEMREAD/MEMWRITE
ioctls were converted to kvmalloc() (83208e106a8e8), a heavily
fragmented system can already feed a vmalloc'd buffer into their
dma_map_single() calls, which is not a valid input for
non-linear-map addresses.

fsmc and intel have no protection at all; declaring
NAND_USES_DMA lets nand_base bounce through chip->data_buf as
the other DMA-capable controllers (arasan, denali, meson, mtk,
nuvoton...) already do.  r852 has an internal bounce buffer but
only checks alignment; a virt_addr_valid() check extends it to
cover non-linear-map buffers too.

These fixes are independent of the direction taken in [1].

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/

Ping Li (3):
  mtd: rawnand: fsmc: declare NAND_USES_DMA
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: r852: bounce non-linear-map buffers

 drivers/mtd/nand/raw/fsmc_nand.c             | 2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 +
 drivers/mtd/nand/raw/r852.c                  | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--
2.34.1


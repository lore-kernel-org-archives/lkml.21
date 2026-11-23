Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412982;
	b=Pf5PMDORCnFMif95Le8sgz2CDd/KP8pa09EsknaRlhYF/0eusy+nKvcQ4mlVZk0wJASY
	 NImjgT1DrC2TabfhacbsZVc2E/9wG+rBE1a3QMyCmCRLF620xx8O2qswM5tlA8j9Wt3zu
	 ax5dGiuLEl05IFqBqBCTFT0RonUvSItVcVnVHrv8QIjemEBoqITrRoZBk6EqjGEUlwCOO
	 ry2upYUsyytvly0Cucwx9vKgekKyBg4x1WF2lFqXKLEBwE66E3xQ2iD9CjWokoGPX1Ifn
	 qFoqTVbMCXyzD/45T6Fan+aWUouEtOM9QMfPJLR57Askj3jlAUbjJyrGPEcgasQTYzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
	b=EynEXbExEhEWPDHKOI1SBluGoZltygC2mGEwCv0EjulGKKJpmoe9X5SVeeEIm+2mBGL1
	 M5KHk0d7Encww70nE048H8aliV/uqHZU6xZi7wzazUp0bVXC3V2LHEPuCqHuxm0ahPfQo
	 VaH6YutqwmKW46Vx/dlihIFZZH84y5CGO5mVNXHkpNOYkCIU6IpPVc1aPOwvKbPZ4IkE2
	 dVx8oHC/DSqREJt7tTwzwGy6Jo+g/DJBsK5+HgowFfgHb4CooYA2ecNuF/xZSfQAY9Ooh
	 b5vgJ5oZBNJiympz5VqJPhGnu/8CAZN1+4isErR4AKfl6PS/sdmfNrzCRcsVMY4VdwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uht3d4UC;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424B9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uht3d4UC
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so1414682a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412981; x=1796017781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=Uht3d4UCnpa2hPWdxRnGOJjlYCyx2LUkcZWajSKYj9zYRylcC/PxjFAL4mZIa86C4G
         dRtUVsmC0Mq54mMQM6ITlWlbJjDad3teXZOD7v9M+dprORBiKoHwQ/eqHTFEaWdFbOGV
         2RQhWY/gFL5/0JYqr2nWzsVFoL/q8w/x5njvUgli/OuP11L0weneizwmYOzZMSMW1og2
         DzRPN1xygupIBAwsVlfSqVzTXowD8Jpstk6yd7epKFbJdaoZU+cIkBOHMPg5A2Gesy/E
         epZmHqM4t8i/NnF1hHdxYjudmJcDIIgJsjQfAcRtmrR5nCLbrppUWLBtQH5thGUcH+qX
         XGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412981; x=1796017781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=eIcyZidqo9/rzbKm0cDhzueAutglbXERfZyy/PICPgF6eZJrJo9je6tAdMBpLWhUku
         x/SEckHq/T1M+hen+yeCD1VYpOAryBRFdyOJi8CQBTJY+0cUSNjRKifW0Xfh6c+XLja8
         D1ugYl+4zk78njXpziWA5FIUc5QJ7rvvocWHbaEw+Wyh14mdrhxzKr117cKB+UMsldeu
         N3PM2oZubRpgywX8wlvnn1Vwqye6Lm8rjlXIkGMTr5pQg9IRB+qmnQbktMCj6IwjuaH4
         3rN/XXagxFHLofjX2jsRWDtVmIFlfu9XA/mVPxvGbFWlRHnoz4OewMOMHZ19L3ZH8xVR
         UhAg==
X-Forwarded-Encrypted: i=1; AL+hErGdlIpvsNdWrlh+hZ+eHq7EJ57VZKVzq6m3IvomS9ZlnvkRlBHzNNL8SE8+mbWqc8DAiisFbshyue5G37g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sCt9/xida5sZoiwJSbRv1fg60n6vGnsdG2ec1DyVacF/Vyu/8
	5b9WPuevNuuSVbJOCGDAZb74Aj71VJjOzgyhZfm11/L35B6DqWA54JIL
X-Gm-Gg: AZFdTZd3NCejgaZ5nVhU7kLBLhzK+v4+vLKkoDsLOr0FhAhnhdXt6hC4Llv9MxLkmcN
	YF0Nxniwg3dtScn8aq0cr+Gx64897JyqU37OoRz6Gh3gwvN2WZehbrZACq5Bd6w0a2T/BeJeq8a
	Ywxq/7eA2aaguvAToFgJuPVk1XUQqCKbv6mdtY+VlLi/a8QSuwe/gCPXooNaBSZAtgn377GoTTe
	XToBmYNUxx64lxDMRnSA5O3D+zw600+fPBL6/b17Q611ULedIgZZ5agkM+LoG0y3IwDLEZKgxvY
	Pk/RiAI4Wp3rxWN1W6IC1I6fhcc+X9hRdht/mSWSi7hKtnoCQWDjlTeKSukeAjhxIU9Kw+nQWb4
	BYt4f2/7wL9Xp2TGA6GpGXd+Vj+OIPSDYuKjCjpBgYzhi6/dTFP2RgPC5BvXL2Ah+j4ORJqSzP+
	BuINm4KF3npj0WcbFMrr5hFiPJei4qJv1+fXRMfWMCGCGIiUMK650CcBm0pR3HkzOwTV0vWBmDM
	VUPMc5kwA7CfFg52HTqZCjk24S1tGRIuFO7OHFVKehGlH2b3o2VgehtkLxuh5MCb409YDPiNn1J
	1EqLd8mNFktL57nWYj+7Ayd5Ol/HDlM=
X-Received: by 2002:a17:90b:5287:b0:3b4:97f:8fc7 with SMTP id 98e67ed59e1d1-3b41c8fe219mr8662901a91.12.1795412981558;
        Sun, 22 Nov 2026 21:49:41 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm5974143a91.3.2026.11.22.21.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:49:41 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Mon, 23 Nov 2026 13:49:32 +0800
Message-Id: <20261123054935.1925807-1-ping.li@horizon.auto>
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


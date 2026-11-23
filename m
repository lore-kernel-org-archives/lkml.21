Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417499;
	b=c5Bd7xnZ9Yf9s7/XKnDR+xMIOb3jQcvcwnJgGqdAlUY3cbXFCU6I/zXM4gqTiXbYLPyx
	 kGM7Oo/jDxd6H8YXubW70ZgD6Aj/iEAgGQTb0dlH9nQseGVITPa5N52C2x5040y9GRNM3
	 JYtiJSr11Pu0olZsQxv1P4y+b3u5H4Vxu19XTXAu0CqxVywYCfbALlBeRvXqF1cGMZYJv
	 ir+1lwCRFsopuNiqym8ZFDobGTnX3IDjFmH6u6Hhw8doza7CpQiOUcTtXnfT1586HJwXq
	 8Ec5e89/fR0/vALOwyZrk5vIecIry8zY1KgePqWSpkmFxBWnYsBDUFY28D0wl2lQb1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sea1MXgJI7hJpgBjDyS4CUv6JKegSSSi91eydOCrWN8=;
	b=itfyt0ekdYXpjeMHK9cQCUZqiJQgszfzK1+gQ94bd2R6/66wgIuV2eQc8LT/hPST5uWC
	 ZkS3UMYgBa8BMr1sk7+ixJa0Niz6P64MseQNB6/+35fPx96UFGieaBR21Hmed924Ke2ic
	 j3L+6oAVlxTnXqRnTIU9VNdx1gm5w+8mnJueCltBSzMqlcNZudtui6bpOcrFm+5g6qRJk
	 ikTEBetgAufRkNV5QXonlM/W/tPriSri+gB1mpsAqnrYbjFPyec4jU+SUehX82UpY7+cI
	 d9SoGTkd3uqUX3LAWluTDU7woM6nv2M8Bq4IhFyKc93xzIhVmps+Qxq37HD/GW4ByYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zqa5Ot2m;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08FD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zqa5Ot2m
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso1130575a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417498; x=1796022298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sea1MXgJI7hJpgBjDyS4CUv6JKegSSSi91eydOCrWN8=;
        b=Zqa5Ot2mMrFDO3SShW+pcQUQeFUXU06jc28FxAcQIK5IwD358A2n0K7dcMa8R5kRyO
         BPbprC42hRNXriPmOy4xMFko0AhbfP3qM2vUNoJwPv4m2X71AGrObzIKU97RJK6OiYez
         5shtQtffuU9Y/vi0PoGQG9Gbwph6KKEwV7X4rDuuZ0E9jI0aQEyQpbjXiYEXH8ce5ep0
         LeyxkN5QsDwZ/muF9XRtr/vLffqAKWxurJWDXk/zytFNfJjy43d3eNtokdNrXuiSRxtN
         2hk1vJL3iJsj/vG4mzagdq2sNFnek/INW3/HEMhxdS6FQpa/au0jry92wIYDU8IscUNk
         /FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417498; x=1796022298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sea1MXgJI7hJpgBjDyS4CUv6JKegSSSi91eydOCrWN8=;
        b=Ua6Yee2zqdMB4b4ivnNhHWGfyS0HNL/X2Nj6HOinscE7lHwzCQ42IvIYpiJF7ouBam
         O+l9RbMU9g5x0cRQmWqj6eYTdZ4TbV1JbUxaa8trAit0pllnDU/omJ06CzoqhTyRgWyV
         2BLC8f3JX1ZqYPk+xuCxRgUqE7LVUi4v5P4zpnedZxIZzyAVPAzBWYJubkzJTGAClQe0
         yigyMJIsHGRWhzfGQfReKieIQFpDJqaIawm35oH+/4uDUHKEdtgNeYkqqmqRRdWnUBHX
         At8H7y5ukWaSvPBg2Bi8WLGTPfiAUoMBVvrSmR7O8XiiaXlIm85q3AkPM5M8cmL0TShz
         8qzQ==
X-Forwarded-Encrypted: i=1; AL+hErHcZCWu2PhupVmPR03qYu+9/9JuRiHeL4moU/69PCrNv0v6evgSGI7e3EDYTbHYlv9IMPIr+I7RRWzkDU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y8o5pqZyLjBu6R9BwkcL6VFIzcGTXrOpOkS9u8dCjw2nCkXqh
	QrYFX/V9pWdMJ+YhhnBeuwbrQiikEfk5spcCdXH7fKL2uGoxGO9tT/h2/Xye5d+1
X-Gm-Gg: AZFdTZf3kEGVSUQU8/Lk7MMRxq5tSI2Rr7vWsasKk+JoQ8gyz8rMEzbl2aArQLWTc/o
	N9BB2Sc0js08wNW8EmvkmWgLNAdC3tFjlFbPgbhY80mtEO6wn2JyqI0+FB/1IDNgUXnL9g+1/Z1
	2QMZCutNUhGfUIkselGCQLpo8aTCEYAqB1VFC/d1Dy4XUly6XOSZBXoS/OzHX8HfYsxPMxZgjJA
	hd5UQ7PAWE1VVPdJ47sF2vuk+Bdm27uhjZbOpjJ6D4mdm+utuWP6PhP2Cg29anTtftk1Ol46VS+
	jY/wi4gg8GxH0wS7EfdbgPOUKTbRn7t0jTc0ppnIJLUUqRvxddC+VufMTgGjDvr5+/sMBViAmem
	Ad+Nedu0hKmsK6m4DZXFtl821o/QrxN4qKUIEAjX/g71lzcP4OsTwmksj8yB7Hery8jhP00nc5d
	ZyDIk4bU//CgXW9mzGppHnctilOtbu8BQ4xzeBJCPEuC7s2AY1EaQmpg4w2An3dLnBW9TucVWBS
	1jGFMEPMYdbSASCbNWjV8UYs2WJ7KeMGcSLd29uv89qsErpcEOCJOYvn38vxtH81okpZfdXXsuX
	NOpdJlCp85BigPJc346jYFqkZbLe1bgCWw==
X-Received: by 2002:a17:90b:388d:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3b41cb235d6mr9547694a91.56.1795417498055;
        Sun, 22 Nov 2026 23:04:58 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:57 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Mon, 23 Nov 2026 15:04:39 +0800
Message-Id: <20261123070440.3060882-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
 <20261123070440.3060882-1-leeonion.muyu@gmail.com>
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

ebu_dma_start() maps the data buffer for every page transfer but
only unmaps it on the error path.  Successful transfers thus leak
the mapping, which accumulates IOVA space on IOMMU systems and
skips any cache maintenance the unmap would perform on
non-coherent platforms.  The error path has two more problems:
when the mapping itself fails it jumps to the unmap with an
invalid dma address, and the unmap is performed with
ebu_host->dev instead of the dma_dev device the buffer was
mapped with.

Return directly when the mapping fails, and unmap with dma_dev on
both the success and the error paths.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 1f493fb426d6..094cf554a7ca 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -312,8 +312,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	buf_dma = dma_map_single(dma_dev, (void *)buf, len, dir);
 	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
-		ret = -EIO;
-		goto err_unmap;
+		return -EIO;
 	}
 
 	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
@@ -346,10 +345,10 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		goto err_unmap;
 	}
 
-	return 0;
+	ret = 0;
 
 err_unmap:
-	dma_unmap_single(ebu_host->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return ret;
 }
-- 
2.34.1


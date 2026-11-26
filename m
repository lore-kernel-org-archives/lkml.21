Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695910;
	b=w87UQuPmAI4EXZqrNbc6Mwa9xyqU3fzPLCnv5RsdfxV1ot6LhH6JOmIBlRi6NHyQAo6e
	 JFrotctXK1Arw5ziEI+qFHj/I6UTHgAAFNR64ZKqckDUtoeo7OXRwaZjQJNEv8M1XCRBY
	 IhckXZb8afJurEL0w0GeN+PIYqoJT4wmd5x3xJHtFCKBtDtXOsvF39MomPrUT6ad7weMY
	 P222hs6yzlH9uiNy03IxzOmcGdM3F0gpZYsDx+BKwep1tAoaF1/X8jYJjwddOmgwgPqHF
	 DUQ43ucI5guO+Wc8ru+itb51kAekvf49Rll+n/HmDYJkT6GGrk/vbIon2GjyDREivuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9S1/CScnjIL++4L924qR25v2xm0ZTSbwlBzEN5E6/RA=;
	b=Txgw6dXY3RrcnIo+7/Ra3rXjv9NUiIpNStl3F6X+3NtsI+EE8S4mGC8y4MmoIj6v/b8B
	 WWytaiQvhUu9i8MAP09AphMNdVlWIOSItGjtHKHrV34iZmO6v1n9Dp+19lvr+kPpKJxtm
	 Rvuu6+e8IhwGWDey7EmJeVNL/pJ3h03IgUFUR/tSIBG/rLF2fj63YA8HOdXZ5MypNc/Cc
	 RVDmzMFZZKnemr7amcHGfEWwfXxI+/RvKuW03VVYIZGTOUxZArWH0n0AwJrMK84loBnMy
	 ri4sGp+8i1EgcEG4Dk/PNexZWDN+aNDcFbY0UmXUZgVoEnvmAU4LDPa1AOxkKbSbjyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cohd1LrT;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCAA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cohd1LrT
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso2932577a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695909; x=1796300709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9S1/CScnjIL++4L924qR25v2xm0ZTSbwlBzEN5E6/RA=;
        b=Cohd1LrTjGJmNCG2WnozJvCZUYVKnbopykoT3jvWYTAtuo3eqcgTbMvhCqpC2UobSQ
         sHWnupmrN6QT2StCJGmCpWqpaQO3bqOnsQeKfTp6LwmwHH8jBRn9y7lUM1m71Rd15UzA
         83wkXRbo0catR9jiSOBt00QTeRE2i0kxpT9A56hk9XL9io8nfvdB+wFleLDebfswhS0a
         jjR31pURUuO1GiJp+u0v/kwaeSXQx7PPrlxkUj1ST4gBup1qbfs/U7Jxi4Gfzbg2eojf
         1QUNe6syueUxffcBBFaih4L961OuFIz+z+c2KtMKMdk8XgH6M23yZN48TrQrdJ/b2D2P
         oMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695909; x=1796300709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9S1/CScnjIL++4L924qR25v2xm0ZTSbwlBzEN5E6/RA=;
        b=ep3pJfsmEvfpHTPyM7DZJdN1TOmhTAUItC2O6p+1Giqrp9DUuyuesLUEy/OyOujRVP
         ySt3h5nciqcRcfIvAReV/xmHAtVGszNam2f+H1izwqFuI7abtxQcXTYDPkwfVIARoFoW
         ZSNcE+qHnchwEvTcKjCxlDq+AnTv2t46SYCz61e+bxCYM8tJep4VqBoUm4i7rT6tVQ0q
         JltahCfysfu95ZepfQ4EihDAqarkpwmFCSCDF7itZj19BPGbVyyMcsmNQY/t45ZpDtRT
         H6dd6rNKaBd422lFRhtxduGjQe18FPLNICfY/glxAGlYbLLRv927Gf8ZnfhNpJwIjpwY
         h3Tw==
X-Forwarded-Encrypted: i=1; AL+hErGpOhOmasUzJPYRu8gRBFbPEJKhOFE3qPd6L6KyjwU0nhyX2qOGpSRpjWwGmDA0uAl6JWxAjW8hdc+yH4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K6lSX15FBccF2M2DzEQd/Js9GeRf1gStXxyCScN9J1ukBzc/j
	B3okulO3Met4lkpBa9b/V3GExRPztIuFCWbGmUpqZttNr0gg/O3AWqo=
X-Gm-Gg: AZFdTZc8RyF9J+vjwhsaur8/Q8RX3zw+vj4hhvmfiAEEC78UkMb2rYqSKOkZka//Tpv
	JclWoy+mCJtxSxBD1xLezYP2tnUqtjPpPIcKGqMuArd85Aq3PdoIbgLRXI8lP8bMdC4I9qXKzE+
	RBLsoQdEuWH6/K7tYRavpvrL0XFTM0F8gPPqTwsfhFvh7YfLDrJLZ+FrGCMu2C5rVVCyPeFHM+g
	qIfGUssm3FD0uf3LAkIqGx5TKymjBRBEqgTaTBBNsTJL0m4aBe3aPqX7YUglLxY8ZITI0nhv4GB
	O85OKz4PAku3qVAasysIJTFDaS0Gzb5Wpvckpr8EdoObe8hi+cmhCmLOt55M7JeUbNOTfEcUBVM
	ci+HBmTGAvST5MnV9rCFKFELYopUqojKU0bRgMpSE6iUaZATWNyo08KKl+d5ULu39IcGR251LrP
	569OJpyqQBO23gs3mlY/VLowx+WeqM/OvgC5G0/a2ERV9/eGHoRtbLzWzyLXqH/aXNYFJwhCkV2
	xO8WNmLIYMJZ8SB8feu/g0blNEq6awJWU0e4SQnyoHm6A+Uu37kgW/0cmAnp0x9fRHkyypHYG91
	wojjdbsTlEmjuWU7MKv1GkSVdXOBbvdGnL+CUvX26PkhjnuVHcCZ+E5LioRKD9LeCHA=
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18516740a91.60.1795695909040;
        Thu, 26 Nov 2026 04:25:09 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm15564188a91.2.2026.11.26.04.25.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 04:25:08 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Madalin Bucur <madalin.bucur@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] fsl/fman: Fix device reference leak in fman_bind() and fman_port_bind()
Date: Thu, 26 Nov 2026 20:25:02 +0800
Message-ID: <rc-b1-20261110-vc-176-5127b53b8eab@gmail.com>
X-Mailer: git-send-email 2.50.1
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

fman_bind() and fman_port_bind() call get_device() and return the
device's driver data. They keep the reference even when the driver
data is NULL, which happens when mac_probe() runs before the FMan or
FMan port driver has set it. mac_probe() then fails and drops only the
reference from its own of_find_device_by_node() call, so the reference
taken by the bind helper is leaked on each such probe.

The FMan and port devices are created from the device tree and are not
normally removed, so the leak has no visible effect in practice. The
NULL return on the FMan side was pointed out as a probe ordering
problem in a Sashiko review that Simon Horman forwarded to netdev in
July 2026. The reference leak was not mentioned there.

Drop the reference in both helpers when they return NULL. mac_probe()
is their only caller, and its success path is unchanged.

Fixes: 3933961682a3 ("fsl/fman: Add FMan MAC driver")
Link: https://lore.kernel.org/r/20260703074324.907294-1-zhaojinming@uniontech.com
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_FSL_FMAN=y, CONFIG_FSL_DPAA=y, CONFIG_COMPILE_TEST=y; baseline and patched fman.o and fman_port.o, no new warnings.
No hardware or runtime test was performed.

The path needs mac_probe() to run before the FMan or FMan port device
has its driver data set (probe ordering or module load order).

 drivers/net/ethernet/freescale/fman/fman.c      | 7 ++++++-
 drivers/net/ethernet/freescale/fman/fman_port.c | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman.c b/drivers/net/ethernet/freescale/fman/fman.c
index 46cc28895e56..35a8e25ba993 100644
--- a/drivers/net/ethernet/freescale/fman/fman.c
+++ b/drivers/net/ethernet/freescale/fman/fman.c
@@ -2493,7 +2493,12 @@ EXPORT_SYMBOL(fman_get_rx_extra_headroom);
  */
 struct fman *fman_bind(struct device *fm_dev)
 {
-	return (struct fman *)(dev_get_drvdata(get_device(fm_dev)));
+	struct fman *fman = dev_get_drvdata(get_device(fm_dev));
+
+	if (!fman)
+		put_device(fm_dev);
+
+	return fman;
 }
 EXPORT_SYMBOL(fman_bind);
 
diff --git a/drivers/net/ethernet/freescale/fman/fman_port.c b/drivers/net/ethernet/freescale/fman/fman_port.c
index 1b8fef69114e..5d96521066a5 100644
--- a/drivers/net/ethernet/freescale/fman/fman_port.c
+++ b/drivers/net/ethernet/freescale/fman/fman_port.c
@@ -1684,7 +1684,12 @@ EXPORT_SYMBOL(fman_port_enable);
  */
 struct fman_port *fman_port_bind(struct device *dev)
 {
-	return (struct fman_port *)(dev_get_drvdata(get_device(dev)));
+	struct fman_port *port = dev_get_drvdata(get_device(dev));
+
+	if (!port)
+		put_device(dev);
+
+	return port;
 }
 EXPORT_SYMBOL(fman_port_bind);
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.50.1 (Apple Git-155)


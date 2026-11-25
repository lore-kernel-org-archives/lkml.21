Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567355;
	b=jflt28oMj+JjOivjc90JgqFG4aW6hAnE6vBpsJRwp2bdSjZOUY3T0gIJSG+zVigy0GQ/
	 wbB08YKShhlvnuCLqFNZBbgYOJmlpSWTao2cT7IsZlDVq0KjnqWeyBBjDssUaFKx4gXS8
	 3yd535hZiKrC/ERQu5cnjyxP5lLqGuUPPcJjbFC5KgNep6UBTxuSRDdphhW/LCbwXYwi6
	 pq+RmpkKPgBY6VH6i0KxBXQ6iFrm1yCsJaY+nOrMqhZGVUuyCnfwnh4NPIcY2QPWiPDM8
	 cEEW2zhFLwza+9BLBOTyV0xOVvPDnTfsHEWPpgUU3m3hv6lRMbxCAskJQvgA+BSbopw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
	b=lhkFq/UuhyS3wQ1OJaOpx4i41EBISgMBdRupopm4FsrMfkgNR/0xQ9pxVca2TdXg57de
	 AF4dc/nzW9y6NwZL5HYp6Gz5TBzMoBFpfBLq6655IPaDPwx/6dJKjWmltglKfKh7rzI/7
	 QNg1xRdrHE8uu0TqiBGkvjBRfNYJPeUdVtcXMblMTTB2WfRxc+8LfMUrIScum8n1wkrWE
	 Sh0cyI/+133VPPp+wS2Rv+ZpPP2+H2SksqjaaGETf7WhCbqdTkMDgUbJFaQKNvvWLsONb
	 QuLiPHtbRakeBR3Nsk7uQQoZuyoWXkVO4A4z86MxA2Vq/PZm/VsQA5ciyXbl0ZLPHNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktNZPZXw;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C83606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C83606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktNZPZXw
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5666046eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567354; x=1796172154; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
        b=ktNZPZXwFDciOvnoFSvd4ESNP8MXfUn0OPiq0u7CCmDDlGkLRqqPW0lU50+7vnhOSR
         DZ5hJGudEuJNSWE8EdzoEgc09LlJ4GFY549tm08+KLC5FOTBbUtdgSbLzoaNqbS/d1Gl
         vO2coXwtDOqy0plrg8129dWP8aB02ivAFjivJXkrblN8RcAXt1d4P5AiDpOCxZ6RXRnU
         v/3Tgmn2sOgpTmVCwG6c90vE3v+8gtQt2ypAO70QLdHvIMppnBtTBfPQjlBStcop9tfe
         xC6jNCjmG4EO28vdoExDbv8DkvJgiUQJqB2XsoLx8C6jKIPNTNIRHraSTKYk6/yZrx/5
         PEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567354; x=1796172154;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
        b=KGJVMU2rkHNsW+iYsAZNLuMXoWsSzy1XYr/VQyX3Xz3eI2e9Sq9SvvAD5FMWDeJ0oW
         FKWrC/70WqWsL/OBTMjYIepnimBWHfxaQYBYNjnL6T2ZbE1i8KNTucH3EN6bb7xP8Bnp
         g3K5cu2kllM3xL8MRkzRju3owJX3z8zX2ecsJzIdFlx0sBq63e9Y791Se/sN9+SSuVtS
         wxuvbBvFFhoF97fqSxrOEHpr4WmH1bh2xBlN3RQlsUieHfbtCg6b8DqyXBM8RO2BEqa7
         71Rv0u6q8EKtGyL/4iuNtt0ZO9CbhmZdWny6vntYl8RDyHjqUdO3irQpxcZ7QrHSy3DF
         dDDw==
X-Forwarded-Encrypted: i=1; AL+hErFCBSkWSJfEzLaLJmy6nJf9yheu3/ltGaMaAoAcD1lKz/csaB1nzzN9I9Y57BYTM1WJZAUZ6+XQmSEHSDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XQlS7fDqhIpn4/mZrsJJMxAlPG6FdCt/ezDRn357Ued6HMBb7
	f5Jmf6uzFtg1BOITok8UfILkgmSfm5ggceF2tkuIBIedlKa4UvHaGjDZYDU4VO7CDdEkQZx3Ovo
	i1r9aGIPXRw==
X-Received: from dybmf45.prod.google.com ([2002:a05:7301:92d:b0:386:c9b4:86cd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6192:10b0:386:a7f2:88e2
 with SMTP id 5a478bee46e88-386a7f28967mr9694191eec.23.1795567354105; Tue, 24
 Nov 2026 16:42:34 -0800 (PST)
Date: Tue, 24 Nov 2026 16:42:31 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004231.1007868-1-irogers@google.com>
Subject: [PATCH net-next v3] tg3: Avoid writing uninitialized MII_CTRL1000 in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In tg3_phy_reset_5703_4_5(), if MDIO reads fail across all 10 iterations
of the retry loop before MII_CTRL1000 is read, phy9_orig is never
populated before being written back to MII_CTRL1000 during post-loop
cleanup.

Track whether MII_CTRL1000 was successfully read with a phy9_orig_set
flag and only restore MII_CTRL1000 when phy9_orig_set is true, while
keeping the existing post-loop DSP and MII_TG3_EXT_CTRL cleanup intact
when tg3_phy_write_and_check_testpat() exhausts its retries. Also
zero-initialize phy9_orig because Clang's value-insensitive
-Wconditional-uninitialized check does not correlate phy9_orig_set with
phy9_orig.

Discovered via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build with AI coding assistant help. Verified by building
drivers/net/ethernet/broadcom/tg3.o with LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on BCM5703/5704/5705
hardware.

Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v3:
      - Keep the post-loop DSP/MII_TG3_EXT_CTRL restore sequence intact when
        test-pattern retries are exhausted instead of returning early with the
        PHY transmitter disabled and DSP 0x8005 blocked, and drop the
        inaccurate tg3_phy_probe() claim from the commit message (Sashiko AI
        review).
      - Guard the MII_CTRL1000 writeback with phy9_orig_set.
    v2: https://lore.kernel.org/r/20261122045326.19641-1-irogers@google.com
      - Target net-next, drop the Fixes tag (Andrew Lunn), and zero-initialize
        phy9_orig.
    v1: https://lore.kernel.org/r/20261119171021.1535172-1-irogers@google.com

 drivers/net/ethernet/broadcom/tg3.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..21d21fb2b016 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2544,8 +2544,9 @@ static int tg3_phy_reset_chanpat(struct tg3 *tp)
 
 static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 {
-	u32 reg32, phy9_orig;
 	int retries, do_phy_reset, err;
+	bool phy9_orig_set = false;
+	u32 reg32, phy9_orig = 0;
 
 	retries = 10;
 	do_phy_reset = 1;
@@ -2571,6 +2572,7 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 		/* Set to master mode.  */
 		if (tg3_readphy(tp, MII_CTRL1000, &phy9_orig))
 			continue;
+		phy9_orig_set = true;
 
 		tg3_writephy(tp, MII_CTRL1000,
 			     CTL1000_AS_MASTER | CTL1000_ENABLE_MASTER);
@@ -2598,7 +2600,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 
 	tg3_phy_toggle_auxctl_smdsp(tp, false);
 
-	tg3_writephy(tp, MII_CTRL1000, phy9_orig);
+	if (phy9_orig_set)
+		tg3_writephy(tp, MII_CTRL1000, phy9_orig);
 
 	err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
 	if (err)
-- 
2.56.1.831.g720f3f5937-goog


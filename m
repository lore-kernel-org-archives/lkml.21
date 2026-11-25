Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606407;
	b=kU6Xu38x+kQQsr4g5DfgQ7OOuWPNyBzfe5mNlHtrTPc4hx5Inh6bIgERcaLSYMKByFpK
	 neP+xCf+DVctsqhzOO74FH/uVZJ8afSmbRVOZagmjrpUuHVnCXuko68PKw4zTHKBtrX0N
	 S0rUBl6Ts5oiOcnnCGyToGTsL6bKZa1AklNA/2lIsbApgHY47qXoll3abWEK67MOus0P+
	 T2Zq9vEYHxdK9WZSsTJ+UKEL7IFUSSLfah7azB8Ia7V8LBzOL6Uirwl/xwaJSLRNTuHmm
	 bN97yQ/ssLB5F8cmkjlRL3ksy6hDUdoaJqpLbE+FIGe3C1XeuP4/hHkgV71OgYlGLbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Sq/kCHFcu0QVMXyhVOAe1FmkyI+j91FPYoBCiqQjVQY=;
	b=cWnf2J46iBzZuwv+CqvCVyORq/B3M7gewigPcGHq/D3OLfqdPlewdPU2IoU9Notmupf7
	 cQgJM48BhZS3Akjsa0RMRRjIaEVPGBOYv9y6ycrv2JmxWJbmXws2NpazKUMyGMB2OPvw8
	 NAeYYt9rPZv45DCeyxz+D2wSIn9a1i1idJ3btuaRg1gfAq6oAyK/3BUqdFfeQ9+ke69n9
	 DWeu2g7VIBcc16DXcrjnNzq0iy29/pSuwMg6909ic6rEH9+7wOQ8gbnajI1uN1L5cliRn
	 UoN2yX7Cxxn3CqIMj3GpQ9+XUFa7eIzTi8+qUgM/9r55V1rkvbZTJbyaKv2TxP203vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztYIrqhS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CF606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5CF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztYIrqhS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so28042525e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606405; x=1796211205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq/kCHFcu0QVMXyhVOAe1FmkyI+j91FPYoBCiqQjVQY=;
        b=ztYIrqhS6SOv8FdpU3XaL3RIXhD65GUluXEdMrHws7gk+BS/3foVv46pQmvjUGCZs1
         AO05RU946V+9gGxNvLrYSzEQtyFeF8DQt0BOkZi2pHV9Yuyj+QZAL1Uw0oXuREbVLS7U
         H1D9E3MxYIQsHgy7oAZ59a6NZ02EkFa9zo4mzQ7V1QXkTJbOARGXC133wD9uU5KXBgBx
         hZJKx7t8Lx29uGbTkFVxDs+RXJY5lcld/8Aieb/cRPKe257at4xHL7LrHWuDClR/iekK
         ONruwTzQRf0s4h83nTXOLlEzJhy/93kF+hN0oD3diE8GEZAkYKbJA2PccABQgx1GmGCy
         jDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606405; x=1796211205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sq/kCHFcu0QVMXyhVOAe1FmkyI+j91FPYoBCiqQjVQY=;
        b=S5Ru34/SWXg0jepR/fdCWQFD00nLZxh4/S9Bsxtwrxj+FaUgUzm2BE2ycilsMFv66H
         m7rKx46TI0TKspIJGgDSYLdT+h4TXsAQQlUeZBDtPhMLb52zegDDYcACfNONVyJrG9wl
         VxLcj++5Q4lIP6yATcxG97QLaxQo68R9REFMN64HIGaenJwwDwQu3ptnn3WPHsWM+17/
         6ZE8SOc13WoVE8m0THmNdNqBO3Jr/JVnzlbsNtzM1uvO1FWrzlv7VcaWgbOcvtX6JvSj
         05uucV8kaw1Fd/KFcxwT5xjZ91oRich1iEk/zbRGAWWsatgJclsqTv+0vE9HeptNbNeg
         GqNw==
X-Forwarded-Encrypted: i=1; AL+hErF4JX79ww0LzvS1MT4QJnvmQNiMXVQ0DKh9MA/jauYuPBLmApyuioU26bPQlKcQZscA4FwPVCGgwsUZ8+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ioul1K1qqkQ9SjIunc8oJKRkawSzDG7xosi/0irNW1wE9YWDY
	JbnlBwoywgRTp8Wut5nPxl39YrFvnpIrnVIghxon3pBGmWG+v8w3UPZS
X-Gm-Gg: AZFdTZe3AVi1N55ne/Kao9ilCP3NvMlAAp5vv3WEreQOT1uKS2CWxNOO1QqUmHP/OkB
	NCQzq3yu63tRM6L5wx2CwDUgKIkdk8+82ISweq6ZhOboCiqZlUyJG9RIXmcH77XGVQYckWvdJax
	6ZfwQrjd8qBFA2zbFV4RlYLRhMqrhjFOrP/t9i4WB1Px6n5xlX7reaUoVH5KD1KsoQKHVK2bjmp
	3YE09dANuqEbzPH2iYzKwM1TY4S+fzv8m9ktq0o1SgHCcSyLcqRNKnmGKcd4L0W4hgN9FEPTmWD
	vZUsemD4Y2hd7gAQmtXDGclGEXCCtuOMqqIYCWF/UARCerdwrB6mCtA2sxgrsDB/Athtrtnqmop
	9XnV4j5WJcvxYd5rJ40Fbk2KFKTgSKW46aTOTcEC1qOXMrjzQHqUJveXodrxKfXVS0ToA0U5bCa
	xQgsgoJ29f6FH8nhwzgf0DrEqe2coEszbokwMAd1nad9QKWpYobPDZZuyQ+jmurl/YESloHySNk
	/itaMMCfFsrJeGG3fTfHMCjdRWkbgRY0eQjVpPhCYsXj+85ljESDbt/pzgjiVyZOTSl4QwfrqRv
	6b3xeE0uhe/NsOkDuChR4c4Q5pfv3yXYAorAe3HTUJW4Jxuw24m+X1mpwsi1ZZX4Ooh4AkblXCQ
	itAOSxreQHA61ZgdJFvjmEu66LDxDMz6wyiXrSz+islwTky6+WsRxQl87a92hBNJDdSZIzZI=
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr337953705e9.18.1795606405132;
        Wed, 25 Nov 2026 03:33:25 -0800 (PST)
Received: from fedora-portable.home (2a01cb0082e4ed0003fef01df0cf8b0e.ipv6.abo.wanadoo.fr. [2a01:cb00:82e4:ed00:3fe:f01d:f0cf:8b0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm479579725e9.8.2026.11.25.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:33:24 -0800 (PST)
From: Ilan Bonneau-Zamon <yolezz.secret@gmail.com>
X-Google-Original-From: Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
Subject: [PATCH v7] x86/amd_node: Continue initialization even if SMN reservation fails
Date: Wed, 25 Nov 2026 12:33:22 +0100
Message-ID: <20261125113322.53103-1-ilan.bonneauzamon@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124162337.GD2156781@yaz-khff2.amd.com>
References: <20261124162337.GD2156781@yaz-khff2.amd.com>
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

Currently, if reserving PCI config regions fails for a node, amd_smn_init()
exits early. However, keeping successfully reserved regions active helps
prevent userspace from accessing those registers even if one node fails.

Change amd_smn_init() to attempt reserving regions for all nodes
unconditionally, logging a warning on failure instead of exiting.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
---
Changes in v7:
- Keep the diff minimal and focused only on changing the failure handling
  from error/abort to a warning when reserving PCI config space.
- Drop unrelated comment, whitespace, and variable initialization changes.
---
 arch/x86/kernel/amd_node.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..4ddfbddbdbea 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -250,8 +250,8 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
 
 static int __init amd_smn_init(void)
 {
-	u16 count, num_roots, roots_per_node, node, num_nodes;
-	struct pci_dev *root __free(pci_dev_put) = NULL;
+	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
+	struct pci_dev *root = NULL;
 
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
@@ -261,7 +261,6 @@ static int __init amd_smn_init(void)
 	if (amd_roots)
 		return 0;
 
-	num_roots = 0;
 	while ((root = get_next_root(root))) {
 		pci_dbg(root, "Reserving PCI config space\n");
 
@@ -271,10 +270,8 @@ static int __init amd_smn_init(void)
 		 * entire PCI config space for simplicity rather than covering
 		 * specific registers piecemeal.
 		 */
-		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
-			pci_err(root, "Failed to reserve config space\n");
-			return -EEXIST;
-		}
+		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL))
+			pci_warn(root, "Failed to reserve config space\n");
 
 		num_roots++;
 	}
-- 
2.56.1


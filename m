Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068004;
	b=Zx1hA3NgXDbVqiqpAaobcFmW35bInUiG7IHaxi/o7J+FO2OBsog21khAVuaVdlyhio7g
	 ibG93qBSDqX/zk5g3KkXAICTmxxSwDDnoeoJQ2s5RYocWodjWKzPbFCPjIG+jwff9V7lV
	 Ccben9Ma02I8qQ9BfCSzSd3AQJAhZfMYhja2tivXAXS3/PI6FMgoO567esZPd3L96X1aS
	 C32doKpweW+yIe5e7i5YwB1MffebN+emWqs1u3fQKIDhj++fyTHrtYBUcoAqX9+ybeUlY
	 M0QX61jQZDn2IRQcMS7LxNsWyvGDauYSzIaP6A6tXZ56uFAspwNvpQMngz7uT4T763w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068004;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kuhk+mB3UN8TnKb2oXuI2U8lqT5dSWUKA9kFr3P8Umc=;
	b=3G802kfOIbzV3G+LHPQS0egb9XaVayqT5mEDRlfrz6ASdMEXYNWmZZrPkbuaxLLscMDJ
	 hpx5v6eudJVoU4QICb2tq4oYrr4O6Ft5KAaAIl48PWdV4bduMFWVtyXQhNCMbqB4FLUv4
	 MNNbtlP67h3a91d5T0xGYAPfMFGdDu1PuNWwUG2ckzrE7OD/7U7RAJtdM95PAFtVhOJ9S
	 2eIW3jE3P2CCuQippHv7eNXlsOW4Zkzbwo1OMk7aQYyfZXh6gUC74mF+6FIbrMWb3zN7A
	 vKP1xu6XJkME3Aw6T3t4kKUQIBKijp5Ub+MEo5xL/wOEbRWNq4qc7q1bxcgXOaMU1Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWv3kH2W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2E460A2606
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWv3kH2W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5601F000CA;
	Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068004;
	bh=kuhk+mB3UN8TnKb2oXuI2U8lqT5dSWUKA9kFr3P8Umc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hWv3kH2W4TVguDWJ7xj57brSEj8AVcfF/sQttbqifokFZJLK5ZoUBSMe83j7eB0L7
	 JiNEVVnTS3mRnPtpB++dRiPLDDJzI+87ol58IpRDobkxQWKSykl49WxFrdIDqWGNle
	 Kmbi5kWcgkLX4RwoP3g/uBR0DgVsOj7pMIv+EBTG8Zue4xPYbS8T+xthZHvesKSPH4
	 kHGteTtNiiFmsRsc0bxWXHoFPNCPZrN9yYDLnJbTujP3YgF5VJ0zVxnT3zfMzLHTFX
	 GRa2AU6T7ZzAvlgwqofBazQU0uEIepRhKo5IQ8ttzIOeHMG0iX4Uuxxd2kl9faV2Vz
	 8drrzo1KD1cQA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 3/4] Revert "ARC: Strip libgcc debug information when generating BTF"
Date: Wed, 18 Nov 2026 21:59:57 -0800
Message-ID: <20261119055958.1621709-4-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
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

This reverts commit ca201ad6e92a1924138e83ff966f7a091e3bbe6e.

This is in preparation of libgcc dependency removal.
And its better then deleteing those bits anyways.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Makefile     | 9 +--------
 arch/arc/lib/Makefile | 8 --------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 4ea705a331c7..868805ffcfea 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -86,14 +86,7 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
 
-libs-y		+= arch/arc/lib/
-
-ifdef CONFIG_DEBUG_INFO_BTF
-export LIBGCC := $(LIBGCC)
-libs-y		+= arch/arc/lib/libgcc.a
-else
-libs-y		+= $(LIBGCC)
-endif
+libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
diff --git a/arch/arc/lib/Makefile b/arch/arc/lib/Makefile
index 2807ee24f27e..30158ae69fd4 100644
--- a/arch/arc/lib/Makefile
+++ b/arch/arc/lib/Makefile
@@ -13,11 +13,3 @@ lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs-unaligned.o
 else
 lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs.o
 endif
-
-# libgcc can contain complex floating-point debug types unsupported by BTF.
-# Strip only the debug information from a local copy of the selected archive.
-always-$(CONFIG_DEBUG_INFO_BTF) += libgcc.a
-OBJCOPYFLAGS_libgcc.a := --strip-debug
-
-$(obj)/libgcc.a: $(LIBGCC) FORCE
-	$(call if_changed,objcopy)
-- 
2.53.0


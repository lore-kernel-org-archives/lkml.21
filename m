Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068005;
	b=iN1T9CJIbqyQj9dKVe4waBqAtrTMKt6yaFgG/m/RJCFb5BW8gWPmTkEaaUnTE6iWDwmW
	 La6fmp6yIauigG0ij9degZw3FrF+6J6rV9N4see2Ev5F2ewB58GDx0YGY9UWdA0lms2f2
	 t7M7tIgj384cUI/by8N/SDqLklUcWiXiv2hsuonQ9XJ85/3QjaNW1XBy9d/JMrBHz8rde
	 MQYwavOVRF3xmBq1qnxNqKHutxrpd0nhZbbgjz5qF8QtjJI5/UR0pwaANKdWQjCrsAYel
	 H+jRdLF954IU65PSvWqXoanoMQCSVxvOoggrbzA8uHGX0Xzv1ERRM0mBenjiI2/A3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068005;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uhvIZHMzMR8LEDCjN4KMVMcwIuHWxcvFz3+gSq5p+wo=;
	b=EFZNV5yWwIZSWRQljSv4YlrWMwAI+9usNf3dxRrWHjJw7B5mvIshU/IOcY0S7uTK/3uF
	 V37lckgpE8V5zS2YZZ9U1fpnLsNP3rVxZWt6KsMiV/Vhul5e035PXvPScdCWTlDhAKa+3
	 3WhIvde8fX/x8+/DEKhqZIvyMeMNJM6glZhLWG0d4e2gkNmEdY2rDPgDf1arQOP+nmq49
	 ZKuZkjl0a1OLGncjeMVnh7ALyTsCPE5R6IBIL3c5gQ46OwXXLx61Qp5zTMhOQN4N/eCTU
	 a91K2BE0VS9ZjQUQJvMTQ6ma+xgjMZS0OG9MhTTv9FMVCn7lcEBPO5GNNgS7X0hfucw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I0HI//mr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8160A2610
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0HI//mr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C4A1F000C8;
	Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068004;
	bh=uhvIZHMzMR8LEDCjN4KMVMcwIuHWxcvFz3+gSq5p+wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I0HI//mrpL69nBp7nOs0fZaqfwbAmU0OR7V0z4bIeviLSGYAK4m9pExNi7YHJ+YIe
	 0bsoCFSCfFuGdZUox+7HAjWN9L1C6kMJCfirjvUrz0p4YiaRQRN1TSLZjrvKpOnubU
	 IJ7aeDRLrP/p5//+Ncyfhj8TE4X2LfHrhlHtztTZ+AvPSQLt29RZA15GZKA6CbbMHO
	 LN6rhpa6l9CwhTJ21XOC1MMbWQMBvpj16XpElAj05km17QdVpI9lQkIqxpvNsGbiIu
	 pvMJ3B/itCBrQqYnmvdQ7ojdmzuPV/5k2SkYa2CURh+xrDYRHfzLKR7EV7ayGjuGgh
	 7EiGgy70pRgmA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 4/4] ARC: stop linking libgcc
Date: Wed, 18 Nov 2026 21:59:58 -0800
Message-ID: <20261119055958.1621709-5-vgupta@kernel.org>
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

With the generic lib/ versions of the shift/multiply/compare helpers,
the 32-bit divide routines (only needed without hardware div/rem) and
clz/ctz all provided by the kernel, and the 64/64 divide and floating
point routines gone, nothing in the kernel or modules resolves against
libgcc any more.

Drop it from the link so that any new dependency on it (e.g. a raw
64-bit division instead of div_u64()) shows up as a build failure
rather than silently pulling in libgcc code.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 868805ffcfea..9f34198d74a3 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -71,8 +71,6 @@ cflags-$(disable_small_data)		+= -mno-sdata
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -mbig-endian
 ldflags-$(CONFIG_CPU_BIG_ENDIAN)	+= -EB
 
-LIBGCC	= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
-
 # Modules with short calls might break for calls into builtin-kernel
 KBUILD_CFLAGS_MODULE	+= -mlong-calls -mno-millicode
 
@@ -86,7 +84,7 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
 
-libs-y		+= arch/arc/lib/ $(LIBGCC)
+libs-y		+= arch/arc/lib/
 
 boot		:= arch/arc/boot
 
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392409;
	b=LhhWCeeoG7/9JXWLrrsWSJ5wpyUeth6WvX9qwycvRaTFsp7WCVNrnEQtR7d4Xn+xclbS
	 7n5Zm534KGqF1mrXZyAKDuyUnU702nhhjOtpge7MpvyKaZM/53ujnlZjuip8nTEFentm9
	 9R6nAd/TDn37kxPpm9dIhRKgZIPYge5/q9XKQ+XL2InlSIt3wsHkPWaMbMD4LuGrM+urv
	 uX2BBD0AxNCvsThYXpk9Knx/g3NzvScLdY8s9sYeaRwJ75VfUaOKBmPYzHY3zH2Dh1TNc
	 940uBJXdGkboZXhsM8/G1Husqp0IpbWAkX+p2DVT4p2UCmfJRfqRZNuA0DxnjBaBSfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392409;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j396iNs6n8mwHjvnju6Q3Rqztxsxxxg9N6gX1fPcUyI=;
	b=MQ/+IosoMsxIT4NM1oean/BtHMUfnfq4ncGOYhgHtAE2oShcGoJy7qjqJxvJH+qo4qR+
	 +M6fHRmJ4GdAst0kKsn6e+jNVro8sJLxAPQkLnNIVrjAc0dQyGG7tFcBNQzYJsEi4fK7z
	 m9UqPVxja+39eZAO/EoG4N9AgXzSBFopx2Odqo6RYfHfFHxNtZ+rIoJPBwUg+xkqOYyle
	 rdqwiq02ODgjCWCuNyUIWtiehlqFEfMsAHIVtxmHT0OlDAgmR9jW1xuFOJka2ZCdkP7TD
	 iDbuVAN+duYZXekQ2jaRrO/wJbAUvTka9UdLCNpxj1Gk9Nvt7pa1dKvbCupw/x/SLig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HTa7Ez/O";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B2D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTa7Ez/O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956871F000CA;
	Mon, 23 Nov 2026 00:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795392408;
	bh=j396iNs6n8mwHjvnju6Q3Rqztxsxxxg9N6gX1fPcUyI=;
	h=From:To:Cc:Subject:Date;
	b=HTa7Ez/O2ANZR1CPlIxy3tn13dUBUhraoG3thr+GFkL8p1uS2hcFE1xO9siRBumVt
	 KFS38JqL+LdVavVBXQ8DJKBrH2Ydqa2BOcJ2mSzWHB9Qoy5eyfLYRMJh2Uet8BW0NB
	 G9T4h1pSCZ6+ThqHWi5+5Ttq7beOH/6hDqMW6jjt3bf/eUZtdd52WzdkliBHru/j63
	 Ceq67NEcsDzTonEUvpJjs1x7wv6VqnrjJFoxSXkNOmP8xeeht4psIoVq03NFjt9KFY
	 XGnWwcbenDLHXPwkMTEYTVmqKrtnCsHc9n50dCJ6y8HyhZRxmnG44UnBtymOhzCbcg
	 DjsuI2eKHj76w==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2] ARC: stop linking libgcc
Date: Sun, 22 Nov 2026 16:06:45 -0800
Message-ID: <20261123000645.2097033-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
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

libgcc elision can break -Os builds as older gcc generate millicode
thunks: disable them with -mno-millicode.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 868805ffcfea..d8633354a47a 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -71,10 +71,12 @@ cflags-$(disable_small_data)		+= -mno-sdata
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -mbig-endian
 ldflags-$(CONFIG_CPU_BIG_ENDIAN)	+= -EB
 
-LIBGCC	= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
+# Millicode thunks for prologue/epilogue (e.g. at -Os) live in libgcc,
+# which neither the kernel nor modules link against
+cflags-y				+= -mno-millicode
 
 # Modules with short calls might break for calls into builtin-kernel
-KBUILD_CFLAGS_MODULE	+= -mlong-calls -mno-millicode
+KBUILD_CFLAGS_MODULE	+= -mlong-calls
 
 # Finally dump eveything into kernel build system
 KBUILD_CFLAGS	+= $(cflags-y)
@@ -86,7 +88,7 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
 
-libs-y		+= arch/arc/lib/ $(LIBGCC)
+libs-y		+= arch/arc/lib/
 
 boot		:= arch/arc/boot
 
-- 
2.53.0


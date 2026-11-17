Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959315;
	b=wi7MJnnq3DSWgjY3y1CeK3PiFcC98Mf1eIPlLSXOOJZFgat3GDUJpoM1oBhDN4y9KztQ
	 abK770f8pOHVlHQGFOo9MwJQkF2yx9SuUwoth83C3zmXRQGvTlBg3ufBtzmzKtn75gwgd
	 VjBf7+vO+QEpjDifaOGs1N7EN5h9pcmzRHBR3vpKZ/1Gk1IzG6lQ2g+1GoPanbl9zQVGv
	 fLntaR9/wn6Dh93D2SQHXtD4Da0dF1jIytH6bHsszlGs/3iS+89WZr9LY4JjJZVCNzP2h
	 ppoJ2VSA5JqVaaGToX+KXa1Aw2t+fAppy/nC3gR8RJ/ZcOn3Ce+mtV5IwrOzVIfb2jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959315;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=lJt+imu7OnUM9KOjR6UO8Rb2IM2m81Jt2K/dC613st4=;
	b=j0NOXDEdAf6AljcBJI8ECrNGvOZXWOn5eZ23gM2EjNRh8wO9Yt+GZ8zVEyH+mmTAGCi0
	 09AtgSUz0Z8HEGZlLj10xqFjiOWFR39ONGhBENT9gfnJjjchV9Fdf11F1T3WSP02njWw5
	 pQUQXjhLtq4hI1McMs0ows/s2U9bl0dEQs2he0IMFIbpkK3az9XAZWDH1eN8uTbzsRWtp
	 DQgw7bVgXGRQMxsYye7Vi02cR7zafSzPYd/tSXxe7gReTeLWJU4fT/1xlGzhu4nB+5pOR
	 Pr4owSNmvm1+jk83AdioaL+zKLYk3Dj8LrEWSu1iOkrK/Rr0bBockUtn9tqILGkVY/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPwTL2cw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D78606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPwTL2cw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF0F1F000C4;
	Tue, 17 Nov 2026 23:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959315;
	bh=lJt+imu7OnUM9KOjR6UO8Rb2IM2m81Jt2K/dC613st4=;
	h=From:To:Cc:Subject:Date;
	b=XPwTL2cwdFetwWkGa9lJMZoSYXpZUf4Owpq4vZaBsa2UMyWEAv3b5AHQa/YkI9sMY
	 tW9xZtYnW8530pPV46hKFPjtcGQHp77oHOuz8PC8oRtJofB3j4CzAq8lJDnZTVE7JN
	 YEs3tDNQEF0MBic1p8nqQgb00hWkUohcsvVafhabVU6iBUfz7216NzMg/KPeyWoYFP
	 kMCMmKQYtJYBmRIMdT/zkoWyPIXusr+m+RNEazLbxU5CQArTMTh8IK4Bgz1CMFVC1m
	 7Qk6VbfZWaiKl3gRhpll8U7RBeAwW8YrUOREmZuIHhGErQX3FYUeYnXVGCKH0h2OKt
	 waTcbMGnqBwTQ==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Thorsten Blum <blum@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] init: Use scnprintf() to simplify setup_command_line()
Date: Wed, 18 Nov 2026 00:48:04 +0100
Message-ID: <20261117234805.551734-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3756; i=blum@kernel.org; h=from:subject; bh=bRbu3Mlk7JzEpODupzT5I2g0MWIU0m5HTYeGpcgvzGA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/nm+VD1yso3huZt3eLuHNk8qjLW927riqZxV0y2SaX 3tHnpFVRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEwklYOR4dDNKbw345r9+tzW Vd5X86wQW7jbQ70llfuk6cpXFfvPPGVk2HFuDzfH11fM5wTz1G+8uuMROiOv6F/fMteWT0UBCuu OMQMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows.

Use scnprintf() to format the saved and static command lines while
taking their buffer sizes into account. Use scnprintf()'s return value
to keep track of saved_command_line_len and avoid extra strlen() calls.

No functional change.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 54 +++++++++++++++++++++++------------------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/init/main.c b/init/main.c
index 8a6c3b4f1d5e..0c3bc7efe0f4 100644
--- a/init/main.c
+++ b/init/main.c
@@ -669,36 +669,31 @@ static inline void smp_prepare_cpus(unsigned int maxcpus) { }
  */
 static void __init setup_command_line(char *command_line)
 {
-	size_t len, xlen = 0, ilen = 0;
+	size_t xlen = 0, ilen = 0;
+	size_t saved_cmdline_size;
+	size_t static_cmdline_size;
 
 	if (extra_command_line)
 		xlen = strlen(extra_command_line);
 	if (extra_init_args) {
-		extra_init_args = strim(extra_init_args); /* remove trailing space */
-		ilen = strlen(extra_init_args) + 4; /* for " -- " */
+		extra_init_args = strim(extra_init_args);
+		ilen = strlen(extra_init_args) + strlen(" -- ");
 	}
 
-	len = xlen + strlen(boot_command_line) + ilen + 1;
+	/* Keep bootconfig kernel parameters before any "--" separator. */
+	saved_cmdline_size = xlen + strlen(boot_command_line) + ilen + 1;
+	saved_command_line = memblock_alloc_or_panic(saved_cmdline_size, SMP_CACHE_BYTES);
+	saved_command_line_len = scnprintf(saved_command_line, saved_cmdline_size, "%s%s",
+					   extra_command_line ?: "", boot_command_line);
 
-	saved_command_line = memblock_alloc_or_panic(len, SMP_CACHE_BYTES);
-
-	len = xlen + strlen(command_line) + 1;
-
-	static_command_line = memblock_alloc_or_panic(len, SMP_CACHE_BYTES);
-
-	if (xlen) {
-		/*
-		 * We have to put extra_command_line before boot command
-		 * lines because there could be dashes (separator of init
-		 * command line) in the command lines.
-		 */
-		strcpy(saved_command_line, extra_command_line);
-		strcpy(static_command_line, extra_command_line);
-	}
-	strcpy(saved_command_line + xlen, boot_command_line);
-	strcpy(static_command_line + xlen, command_line);
+	static_cmdline_size = xlen + strlen(command_line) + 1;
+	static_command_line = memblock_alloc_or_panic(static_cmdline_size, SMP_CACHE_BYTES);
+	scnprintf(static_command_line, static_cmdline_size, "%s%s",
+		  extra_command_line ?: "", command_line);
 
 	if (ilen) {
+		size_t len;
+
 		/*
 		 * Append supplemental init boot args to saved_command_line
 		 * so that user can check what command line options passed
@@ -708,19 +703,16 @@ static void __init setup_command_line(char *command_line)
 		 */
 		if (initargs_offs) {
 			len = xlen + initargs_offs;
-			strcpy(saved_command_line + len, extra_init_args);
-			len += ilen - 4;	/* strlen(extra_init_args) */
-			strcpy(saved_command_line + len,
-				boot_command_line + initargs_offs - 1);
+			len += scnprintf(saved_command_line + len, saved_cmdline_size - len, "%s%s",
+					 extra_init_args, boot_command_line + initargs_offs - 1);
 		} else {
-			len = strlen(saved_command_line);
-			strcpy(saved_command_line + len, " -- ");
-			len += 4;
-			strcpy(saved_command_line + len, extra_init_args);
+			len = saved_command_line_len;
+			len += scnprintf(saved_command_line + len, saved_cmdline_size - len,
+					 " -- %s", extra_init_args);
 		}
-	}
 
-	saved_command_line_len = strlen(saved_command_line);
+		saved_command_line_len = len;
+	}
 }
 
 /*

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960077;
	b=4z2gQislGd4q1hFaFjQawFu5ptDE0TU9PO7dRIkMDnvUbIHjYmE9nOZuXUUkabBXzpCC
	 WS+IPwT2UL9zewx0vJc9SrfK4qhUTAsROux6it6imjl73izPlDYLimaW+Uutj8X2lI8W0
	 hOUwBxZ8ZJDm+eNShuSbmZ7MsVR7zQE580fNfDFT/2djLJYUGgDW/PK8vvq2uLrQT3ltU
	 3cMmVZyoIGbbkLZkNvPxWVepcgC7yuWkox3x4WVJ8mtAwGdgyuQAEtYY2BiVd3L9fDUxe
	 97UCTP7jOu7CjIrKS9orVkbp5XcwFy4nRRpnSDTtcG1bIrk7zogUUAFqPu64HeA6U1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960077;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=C5IVEgivpLIjQLL8Y0aBi9Sm1XnQqI6/FTgtJP70mkk=;
	b=vUzKAqtQXi6ENlTEeeNfAK4g2lO4RfZwSRS7LH9dG73esWmreXPLcwwMQ9Bmr3Nvulg9
	 srK4moJSkUZjqQ3fmtpQZFyRz1/ffpZw7/K9/EOLb8f3iUW+aLGy9qigEQzFZZdnUlCnH
	 mUAGLfszbJENLyusCa1IiMDX95LtKS59cCUWlWjfUjLGPRaNwFrtux8dhbB23wl9VFbAL
	 Iis7U2+ILiYYPiYgb9jpPLC3auX75nHoYIeGJK8Ful4Y+KKzxINFzkn9u49ehZ2N9zUpj
	 w+edns3v8zsQwwvyzOvMcPl8+GWKha8/hhaL2wuqUTex+fJ/yx4q0eylm2TZVrPN4Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=liUlh6Mr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E273C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=liUlh6Mr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9318B1F000C4;
	Wed, 18 Nov 2026 00:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794960076;
	bh=C5IVEgivpLIjQLL8Y0aBi9Sm1XnQqI6/FTgtJP70mkk=;
	h=From:To:Cc:Subject:Date;
	b=liUlh6MrM0iQdj6CXADAfeq9CUfzm2/EMmDbsj2TGTtyhLN1K6h49ZdAfzq9iTcUt
	 S4TOr5QXKHHp+dWthSOIGQpBlXz1oT3tPnlu+NSwX4NxKq8QtyxY4TIgOsaQvt6Nw/
	 GqDTnyAzFVfnoElEPz7ixYGRaNf/B4I0U1nOaXpGW2bKXACgqo68Hq9o2xnSCyYKwl
	 uJ5Rpp6fQB/e7toAbKUfDg4+Y+1CkrFSS/ud+MHSteQ7cLp+VDadpKSLvNHR8OWjVu
	 Jsrbgb3RywSSdXK3nLRTa4Pz3jG1a0TlPSF9ISqYX8QdnQxpVQZlLsmizvA4z2kpIn
	 fNE3J7j6y2BlQ==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Thorsten Blum <blum@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Wilson Felipe Pereira <wfelipe@google.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] init: Use ARRAY_SIZE() in unknown_bootoption()
Date: Wed, 18 Nov 2026 01:00:36 +0100
Message-ID: <20261118000037.552633-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=blum@kernel.org; h=from:subject; bh=iF7qB8sYhyZ70MszL/QigOKfNPaZo64NdKmvJd139EY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/Xi1lvuEsell23Vw9s8KzQdIKIo9tIjjPpEjErGxmK VvPrLuzo5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACaixcXIMOcFj+vJLfPNJofY f2FtfNAWL6gS+muP0KV5Dzuv720SZmJk+Kno9F/t5bn50wRVxEr5VVN1Zzoyfzx11W6HrM5s9rQ VXAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Remove the NULL terminator from the bootloader array, make its entries
const, and use ARRAY_SIZE() as the loop bound. Also reuse the for loop
index i instead of redeclaring it multiple times.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index 2011e09439de..5543576c9c29 100644
--- a/init/main.c
+++ b/init/main.c
@@ -576,7 +576,8 @@ static int __init unknown_bootoption(char *param, char *val,
 	 * 1. LILO/Grub pass "BOOT_IMAGE=...";
 	 * 2. kexec/kdump (kexec-tools) pass "kexec".
 	 */
-	const char *bootloader[] = { "BOOT_IMAGE=", "kexec", NULL };
+	const char * const bootloader[] = { "BOOT_IMAGE=", "kexec" };
+	unsigned int i;
 
 	/* Handle params aliased to sysctls */
 	if (sysctl_is_alias(param))
@@ -585,7 +586,7 @@ static int __init unknown_bootoption(char *param, char *val,
 	repair_env_string(param, val);
 
 	/* Handle bootloader identifier */
-	for (int i = 0; bootloader[i]; i++) {
+	for (i = 0; i < ARRAY_SIZE(bootloader); i++) {
 		if (strstarts(param, bootloader[i]))
 			return 0;
 	}
@@ -603,7 +604,6 @@ static int __init unknown_bootoption(char *param, char *val,
 
 	if (val) {
 		/* Environment option */
-		unsigned int i;
 		for (i = 0; envp_init[i]; i++) {
 			if (!strncmp(param, envp_init[i], len+1))
 				break;
@@ -615,7 +615,6 @@ static int __init unknown_bootoption(char *param, char *val,
 		envp_init[i] = param;
 	} else {
 		/* Command line option */
-		unsigned int i;
 		for (i = 0; argv_init[i]; i++) {
 			if (i == MAX_INIT_ARGS) {
 				panic_later = "init";

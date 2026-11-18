Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002062;
	b=b3tqbfF3NuF6/6YL3d7iRv85ktVL45bb/A+uYA/FMF21HRqCAjeMZaHf8B6/2hU+HwOz
	 /xc7syy+ouoYa0Ey8wYpoAYHzAgX2Kadsfy3zvMYf3NiLi61avoW7Tq1RI11FP3Ljml1O
	 cYiil7sGVrO02VSL950Q8O/ugD8XIdLH7Db6FqTtz3nPxQzOhPAMlntYUzyij+ihB6Gut
	 48eIxQWksQs2MQP6h64kmTV/T/L+d3zTEA2v1XUkN4+c3HPIVYPQ9ZS2/hU69rJMksJA2
	 eVZz8vSiY/qZgEngDxvQ7ufB2LXVcsO2fPEU4nra/rezdwShQYukbgEQu0EB2sreOFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002062;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4SpIr9eSHSqKTRdXEQDEfz1xdJx9QXGPe7rVU07TV+s=;
	b=HrdM4mMvOMRbupwROb83VQRxR+60iw5jhYZcw4nzQ50QZT7tt8iT1y24I9s57bxgRm8e
	 sim1aGSLmtH8TtR0wU7LL9AKeI4b8jdsjifG80emoTY7I8Z6Xgh0JOaqRTgtzAkDL8DIb
	 yhW3fzYF0Jdg+LPNSdRGhGTwtn//AXNnuRz67rCaXnsYrvNfG1uhIfVRDypmTvylCLAak
	 V5iYHvGAwHsWNXehBb3oj87U6hpODrAXb6XgGrUSL0kQ0KjPLXnpmGHtmq7cNthVmPTgR
	 3Y1oz8TURMUY8ji9bGMIHTerkY1VELEm+68D2YsNzaNEE0rzS4kQys1LSNaE3XxjzCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ap2f/zEw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ap2f/zEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C178B1F000C4;
	Wed, 18 Nov 2026 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795002061;
	bh=4SpIr9eSHSqKTRdXEQDEfz1xdJx9QXGPe7rVU07TV+s=;
	h=From:To:Cc:Subject:Date;
	b=Ap2f/zEwdTVipRGNNUmRnVY4VULDm13VVoFfVp19jrXituH2/F+CfMek1tl/KaVKI
	 NWQaw86vatB7Yz8ssQnClQeqTgIDYqHgzCU9Xed7G6xC1h53AGKbZ58KyJ7XB6EjRi
	 wtv+t9XvUcz1MgHYH0EYCD7LgIx4PVKCnPZPYI4//kBFc60BjibO4k2DLQVeouJlPs
	 CuQRyO8zxTwW4bfcvPLfqD26Z+LDV3eR3WmlkzNz5Sc8QRR0fIbvCOYmbcBmpkITZ/
	 NxJhOk+xbA6oYlkOKksEPaxR/oTOBsjVgz7Bq3IjHsGz+bbgFxeqxclDdPHAxvH1Kz
	 YEStbEiiHklxQ==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Thorsten Blum <blum@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] init: Use ARRAY_SIZE() in unknown_bootoption()
Date: Wed, 18 Nov 2026 12:40:32 +0100
Message-ID: <20261118114034.623145-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; i=blum@kernel.org; h=from:subject; bh=wQqLvk7jx//ewbDLp7C69ofxu0zbVA0EaQrsy2dEbo8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/+zYpfF98borfqT88cwsqsxp2zll759y9/2mnzh+7v +r+/R2N7zpKWRjEuBhkxRRZHsz6McO3tKZyk0nETpg5rEwgQxi4OAVgIvLRjAwdXH0N+7TYbRdF 9+y6lVq4eddcPc21m/bL33Kxry9yd5dhZPilYvVxgfVru2UzM228ux9cmWmyLyx54u/w4N7DdyK UHvIDAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Remove the NULL terminator from the bootloader array, make its entries
const, and use ARRAY_SIZE() as the loop bound. Make the array itself
static and mark it __initconst, since it is only used during
initialization.

Also reuse the loop index i instead of redeclaring it multiple times.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Make bootloader[] static and mark it __initconst (Andrew)
- v1: https://lore.kernel.org/r/20261118000037.552633-2-blum@kernel.org/

 init/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index 7b0c8c34e6a9..185a62277028 100644
--- a/init/main.c
+++ b/init/main.c
@@ -576,7 +576,8 @@ static int __init unknown_bootoption(char *param, char *val,
 	 * 1. LILO/Grub pass "BOOT_IMAGE=...";
 	 * 2. kexec/kdump (kexec-tools) pass "kexec".
 	 */
-	const char *bootloader[] = { "BOOT_IMAGE=", "kexec", NULL };
+	static const char * const bootloader[] __initconst = { "BOOT_IMAGE=", "kexec" };
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

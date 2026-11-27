Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755784;
	b=KEsGcOY62fkVYf/k35Wi8MnW0nwzvaO2/XCDOtb9SD+HXk5ZRYIbNC2EgiqoPT7Kh27G
	 h7G0WkVm5oWAY7/uie8BAtdvHt0EqR9y3BfSrIEtbz9qZTvfHvuFggGrRsreEWWw/JJmc
	 t6KhUD51mzuqOlJE1E+aC9pQOTP+aWgzbVjFM8G+7nvuK4F/saigfn0syf75Vn0y0p+lu
	 svs2V9n+8myxDzidzFkJSLLNEEID/FmLJssJpPAQe3eLXU/I2wcfPMJwG/j76BQ8JEapR
	 9z8Nzi/kN9vV9CSTPSMdTf2EIAM4UfhuCLGuUGnLLoTkCHyxUYGC20iNyWeUb8X/P9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=a+c+j9Jfk0kuBAX1UCDJb9a3EQrHXPCSakbH3m0yoRM=;
	b=i+AXOByq0kGErokwGJd308fQ3KheBGpGrq6hYJDy0lCWpUzod1rZCM0n6Z5aFnQjznPq
	 +3NOWVW1u6LlZBsXejGLfJiGTzdJNgOc+65jypfBTCaTRwWc1noXhfEoqWEi8CrMXsss5
	 aHQrrSVFTAY69hfK5GlM8SrgQFFugqiMTrQ5yoDF/Vm9kECCBcF25NGwFtVyEIsdz4j9u
	 +sMSEo6xhfkABc9EZfBtENg7IgfVeUrAOYRl/1ATsTqPImggIpIvz6w+3Si9gWeWSVprw
	 dENPiG0d0zYPB90MjYRZAfcPPR8miKIQ+De02nt524abvG6mB+zZ1tqQPbXrQSRiBeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJgaKpIv;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6A606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB6A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJgaKpIv
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b32daac9d7so41608877b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795755783; x=1796360583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+c+j9Jfk0kuBAX1UCDJb9a3EQrHXPCSakbH3m0yoRM=;
        b=vJgaKpIvECANSshFkilVZbQAfYRAzCrFF/sa6eg2wOlP/BAIAvPBvw/sKmmtqqd9Yp
         Y98yZcbyp0Jkdtqz3+wx3+1ZQaoxoHOGAW+TiD6nL/1eYVpCbwl2lqUT5rNBQZ/VmOB0
         Edw8PUC/oSO9EzHlcaBwsomgxXMdHrAYwkIqwjTyHA2mpH/uJwD5RANq0rShYCYmFY1j
         InQRyk8fueCQzo57/nHl6mbLj+N/hh0VcbTMzQWFUVJkEXB7ZG7WKnYTMpLq2V1ZnF6s
         Mn2uwdodjM7QDnQcPWgpI8eATqFcja57SKVzKj+cTJ2Wf259dEib3FjatKwEcCP0rb9j
         sgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755783; x=1796360583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+c+j9Jfk0kuBAX1UCDJb9a3EQrHXPCSakbH3m0yoRM=;
        b=mWmXMesoP8WxjdhfbmGJjqer0KVFLOea29SOAWM/zhhH+tAdXdpnYr4uoBqgqpbLqL
         aLo3PqwHSPsfhhTgwlN9CIEyEk1LIekVmWkzreFpO/WOZ27OB9FRMN85Gy3rxJ5F2EwR
         Izhy59oaM9ose/tN2+JgOPzDEPhABe+WwmoUfIwe3tAjequosN+vXp3QnDqFhUEATI2I
         aLb0wTGwDRD1ccPeUvePlbPxLWscOXSl55zQvaDetZV1noMOFMHS0CXFMjz3oM1moYab
         ANGfRuV3kPbDDR8S+mI5eSmPM8LMxn8IlCHUqXobV5khNlLXe3dMBPgU5R2wYSNuc4ZU
         sTog==
X-Forwarded-Encrypted: i=1; AL+hErFFxHxuF2DARfFONlCcWZWB8oqBdZUUTNhuAbazJuz1zT9LeYPL59FgdBmg4CQ8KpIcIdiVg7KuN5sBAa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K37o+GSjGhgfq9zV4MoXgtEvX7BH9PgOx4XwPISdYsTuMJba5
	l34ZbHvLDKBVVnQ3GRStoq90tEB5lVIrc/Ew3UAIVPvPrdunzIZzjHnqqlI/8/wGroA=
X-Gm-Gg: AZFdTZdoNh4FYitlFf6647fjjta/yinV+Z1M4/0nQT4ZeHfIWMdY2uXnS4G9FAyNF4B
	9pkVI4JaYFTWaJpEDBrPuxZ0NlujSsCqz2F0k/sIZQjnStgDYu4ggtGfLn9ZpwWO6/P56UrPLlL
	EeuW6V+wpX/UG9YjgEGeN5eejWeuchbKmmBhzX1i3o4QaK2wcPeNf57KXGwm1ErsUz1SZZr+QnS
	pi8hyhEvmTpATX2/4wQs5UVD01ZV6xR/jsTLcvABI4l4JzYrvId9+ngZ6diz7OAHXyAEv89+5S8
	/U/82br4QtSESb9qqfEih1eP+hezC/NQOq51lJdIS7E0DOhcsOqdtw7kk+pKglRm0ewwvifMSv1
	k26KCfzcrTsQK1yKf5KdGPMph9eifSAr4tcdhw4TJKgGnQChz0MCi9L1pI6y/anB9g610h9240+
	RTXcqWgwBQRKHq+Hfp1Rmk7LoQQ6NGSO1pwKIUbBJdjvvlTjAHqhYJABkWKahr4f/kweJ+5muf0
	SVPr/xhGEM813t9rl7ngFqi8I/6vdHI9KTDMSZt5uEXBX0wLG7HeH3kVciwfdAIlUAxoadNQtJx
	LTZjbuniH/mGAXSkQ6TRwNOJ/9VTc1j5rpny7546W+0gKm+UsPFvC2esvLK+c3fSO3XmET9zkJY
	pRRMsi9NJN5Le+Eakwl+dh8jRHTZjyRPWNwPmvPiTlA==
X-Received: by 2002:a05:690c:998a:b0:8b2:26d5:7878 with SMTP id 00721157ae682-8b5204db367mr88825427b3.25.1795755783258;
        Thu, 26 Nov 2026 21:03:03 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520309d3esm92048747b3.30.2026.11.26.21.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:03:01 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 27 Nov 2026 00:02:55 -0500
Subject: [PATCH 2/7] parisc: perf: add an RDR table for PCX-W2 (PA-8700)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-parisc-perf-pa8800-v1-2-4f3f077010ce@gmail.com>
References: <20261127-parisc-perf-pa8800-v1-0-4f3f077010ce@gmail.com>
In-Reply-To: <20261127-parisc-perf-pa8800-v1-0-4f3f077010ce@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3876; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=9a5rD6aSbd643KSiqabjGeKvXQKDFwZhmekcKjKATGY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5+f7tPsbweo73wm0royw/r5kz001CjbeyeY2WyYTp0
 pZyClfbOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaB48YGVq4PzwX7m
 f4yZVzWGkrb+bvJ/eW+rfHztZK2eF6fGHoh0cM/32/WkadXLtl9ZXZvb9cf7JFvIi+fOjBDonM9
 tvnX+WvFmEBAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

PCX-W2 uses the PCX-W RDR table, but several of its RDRs have different
widths. The C3650/C3700/C3750/J6700/J6750 PDC firmware (from HP-UX
11.11 patch PHSS_29342) describes RDR11, RDR27 and RDR30 as 32 bits,
RDR12 and RDR13 as 704 bits, and RDR22 and RDR23 as 210 bits.

The RDR22 and RDR23 widths matter: perf_write_image() writes both, and
perf_rdr_read_ubuf() realigns what it shifts out by the RDR width, so
with 194 bits the data comes back misaligned. perf_bitmasks_piranha
already describes RDR22 and RDR23 as 210 bits.

Add perf_rdr_tbl_piranha with the firmware's widths and use it on
PCX-W2.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/perf.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index 8f9ae67270bd..2494f16bb8fd 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -139,6 +139,45 @@ static const struct rdr_tbl_ent perf_rdr_tbl_W[] = {
 	{ 16,	1,	0 },              /* RDR 31 */
 };
 
+/*
+ * RDR register descriptions for PCX-W2 (PA-8700). RDR11, RDR12, RDR13,
+ * RDR22, RDR23, RDR27 and RDR30 differ from PCX-W.
+ */
+static const struct rdr_tbl_ent perf_rdr_tbl_piranha[] = {
+	{ 19,	1,	8 },              /* RDR 0 */
+	{ 32,	1,	16 },             /* RDR 1 */
+	{ 20,	1,	0 },              /* RDR 2 */
+	{ 0,	0,	0 },              /* RDR 3 */
+	{ 344,	6,	0 },              /* RDR 4 */
+	{ 176,	3,	0 },              /* RDR 5 */
+	{ 336,	6,	0 },              /* RDR 6 */
+	{ 0,	0,	0 },              /* RDR 7 */
+	{ 0,	0,	0 },              /* RDR 8 */
+	{ 0,	0,	0 },              /* RDR 9 */
+	{ 28,	1,	0 },              /* RDR 10 */
+	{ 32,	1,	0 },              /* RDR 11 */
+	{ 704,	11,	0 },              /* RDR 12 */
+	{ 704,	11,	0 },              /* RDR 13 */
+	{ 32,	1,	0 },              /* RDR 14 */
+	{ 128,	2,	0 },              /* RDR 15 */
+	{ 1494,	24,	0 },              /* RDR 16 */
+	{ 18,	1,	0 },              /* RDR 17 */
+	{ 4,	1,	0 },              /* RDR 18 */
+	{ 0,	0,	0 },              /* RDR 19 */
+	{ 158,	3,	24 },             /* RDR 20 */
+	{ 158,	3,	24 },             /* RDR 21 */
+	{ 210,	4,	48 },             /* RDR 22 */
+	{ 210,	4,	48 },             /* RDR 23 */
+	{ 71,	2,	0 },              /* RDR 24 */
+	{ 71,	2,	0 },              /* RDR 25 */
+	{ 28,	1,	0 },              /* RDR 26 */
+	{ 32,	1,	0 },              /* RDR 27 */
+	{ 88,	2,	0 },              /* RDR 28 */
+	{ 32,	1,	0 },              /* RDR 29 */
+	{ 32,	1,	0 },              /* RDR 30 */
+	{ 16,	1,	0 },              /* RDR 31 */
+};
+
 /*
  * A non-zero write_control in the above tables is a byte offset into
  * this array.
@@ -174,6 +213,7 @@ static const uint64_t perf_bitmasks_piranha[] = {
 };
 
 static const uint64_t *bitmask_array;   /* array of bitmasks to use */
+static const struct rdr_tbl_ent *perf_rdr_tbl_cuda __ro_after_init;
 
 /******************************************************************************
  * Function Prototypes
@@ -499,6 +539,9 @@ static int __init perf_init(void)
 		 boot_cpu_data.cpu_type == mako ||
 		 boot_cpu_data.cpu_type == mako2) {
 		perf_processor_interface = CUDA_INTF;
+		perf_rdr_tbl_cuda = perf_rdr_tbl_W;
+		if (boot_cpu_data.cpu_type == pcxw2)
+			perf_rdr_tbl_cuda = perf_rdr_tbl_piranha;
 		if (boot_cpu_data.cpu_type == pcxw2 ||
 		    boot_cpu_data.cpu_type == mako ||
 		    boot_cpu_data.cpu_type == mako2)
@@ -643,7 +686,7 @@ static const struct rdr_tbl_ent * perf_rdr_get_entry(uint32_t rdr_num)
 	if (perf_processor_interface == ONYX_INTF) {
 		return &perf_rdr_tbl_U[rdr_num];
 	} else {
-		return &perf_rdr_tbl_W[rdr_num];
+		return &perf_rdr_tbl_cuda[rdr_num];
 	}
 }
 

-- 
2.56.1


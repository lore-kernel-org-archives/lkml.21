Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520248;
	b=w4B5cWXdrFuVtftKG4I6QGFbwjt+hm2MwygxXV2ml8nfa4PCcZVvYavPEDq2SCF6RS9h
	 7NeJMt3DB/xcxnuzT0xfFdzyZk0e71Pug1P6K4c/qWSpiAjZhDFIHBFQ22eRO1FEGIxLA
	 fpXhqqzFpOuUS1LdCbp1Do6Kk1oNSRIweuk4KANezFLImwx57SE+4v+kWrQ7X+p5Ko4gp
	 Wiool4wzVPxI5lqcbOsW8/+I617WcQ8xoAxS1RE39hu+ofGZ2x3AxalcJsFU4Ae5523N2
	 iwC5Psqx5Ua7tBhcOueNgjMI0uV3Dt7SP0ZewHuQ4xRZmghBcGVSRn8KkRuJCaD8bVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VQGclKgAQnib41pezV4NU0Ap/XBFbTepIY8+BriRXdE=;
	b=e/20i/1OuLPlLgqdGWk8/4eszGA9BmRKMoKYxiFe5FM7TzNT0VsG4eFBbvOBDOTbVvkq
	 fdylOVn/bK7c4J7Qibx4NGEMnm6hyS/EeeUAjQwNDTihTihOgAdYyd+DVG6ZJmF/K6MAY
	 Z/Gb26lRHoq1YyEX3H4HPpnLwRyA+vknYOTT962gsUrYp/AWymgDrH4XuQGJm+zBPNVbT
	 fz9+NSR1Sf0RPSG8tv7cxPBqBEfNkxLWIlv5Ple1K8iDyxXuOE/tLO+zk9Fp65da0Qbvd
	 A8CnGKqRnyYx+T7uzrIGpnc1xWZmDf4MGxYiZZbGGvEXvPoRmHGNodXsdgVBQHVyHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IWzg/v//";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EE4606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59EE4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWzg/v//
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so3738463f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795520247; x=1796125047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQGclKgAQnib41pezV4NU0Ap/XBFbTepIY8+BriRXdE=;
        b=IWzg/v//d/etPgDgdmukjX1yxEjPbSPqtiGrWWDoJuxLEFNbqBa1jM7vsQo9RBZ+tr
         YbnTYElZfesLeHBye5yfZm4OpKoI029ZvuEsb5Er5df2Dr47NNyon02VIGdYKNXnnig+
         tuaMkHTHrH7QB0mCN8V/Glna72tcizgHfvomDJ2TT8u9r5aw/UGXc1bbjgiLYaUd6cc7
         XCBdGUZ16aAAN48+oE+kvW4p8+vTzA/pa6QmdFm08MUmAjbM9TaINwzggXyQaZmFGMiv
         gmXvL0IVcWC24nz35AKXo05oo8+mTl8y0d3VgOs15xtWCOIUqKQXOuIxkAIODanq7ZJk
         sz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520247; x=1796125047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQGclKgAQnib41pezV4NU0Ap/XBFbTepIY8+BriRXdE=;
        b=nfn7F5L0azdLsdIhxWnjBjQdVc/tpWShtp1Xo+6fAhi6j79PIrtmtcm0jLczWRB/e+
         Zx489Ce1lyyLKOC3ILLsxnrYQEgwr6pX3y7LPvIKIdsE5hcRLHwiIEvSukffXjejr4I8
         ArH2OcUaUoCXhojRK/w/WtrVGx/0AoQvogES3l8zt0OdYPtVQndw0NaAPAPmU8ZvFHkF
         G0bYN6Goxez9yi13n18K7KOgAMSgKTEI98KrDDFxdNFLsuUF3CeTVvGmZ/1H/TOg24pz
         FC1mdx8AOePO9qRtAzxeOkOzt1evfx1ijV/fA0AJ/d29ZLH+IdyB2jvfKff2XPXIyt/M
         VSCQ==
X-Forwarded-Encrypted: i=1; AL+hErGfGXb5uLZYmvsMJ6xszohb4bmnp7y00k2ijiveKSyxNBIUodcIQEnI7FmTm0pYv58c9NKQwlARomBttRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rzxpBGCPT4cl0/OLpI4nYErWHDcxKhQneNRFPMwo6Nt9oCWmb
	Rwt+UE3owmHif/uG/Mch43WkPs/C/DVnNdJTZZyiQRLOZSuh/QNDBIkl
X-Gm-Gg: AZFdTZcv6M7jPs+LUrVUuRIAZWXPVXjDN6o/dL/+O/0L85zqxOVJzJrgwmbit7e7FB0
	sNSuvHqRJ+lf0qJMJYEgu2GZqAtAao5+QVLzJ6r0CgiW09GQR0g1j9EtOW/uOYQACuQBwONk38a
	zFt3zfsELEvP6F4Sbzj1KV/LPM6LFbBwP/ssAlcGl0vJlfeRrjqlOpEuezAIpISnHEHLRabZ0nn
	8yKI6kVixmk6GWRCPtSABLkA5/2II+D77xXn0aJQHhaZcRaKsqxu/1s0rzqB6qL9T6vfPRZeMbe
	hkoL82yxwaeziZUHJ6UqWB0D6ji2ZHnwJwEhO2Ne7jsiHmY4pqFcmM2cCpEWqN61Hb91K+E24GJ
	uwG9I+qssH1q6d7YtQPi+r1CtfImsJn8CatjEMcM5WqcIa1mOKeXj/QHwBI5Y3Jgefz1J9fuO5k
	qRjKrOl9XpkGVdJ2deO/67vV8y1WAYfrJBw6FjmQ+ZKDSrTr9jZpkDy5unmqz6Paa46K1iIpPag
	3321Xi3qAodbWseB/sDCYXRrWMgCsD5BZ3v2fMPYAGiC+MWeOQ8QYQCUu72IwdRA4rlCm2DS/fA
	CA6TEPs3GIdL7tloQPw/hGQ=
X-Received: by 2002:a05:600c:4e0e:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb88938dc9mr303753705e9.31.1795520246518;
        Tue, 24 Nov 2026 03:37:26 -0800 (PST)
Received: from thinkpad ([92.36.54.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm415634765e9.10.2026.11.24.03.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:37:25 -0800 (PST)
From: Andrey Zakharov <dedemorow@gmail.com>
To: simont@opensource.cirrus.com,
	ckeepax@opensource.cirrus.com,
	rf@opensource.cirrus.com
Cc: broonie@kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: cs_dsp: Replace strlcat() with seq_buf in KUnit tests
Date: Tue, 24 Nov 2026 14:36:55 +0300
Message-ID: <20261124113655.610791-1-dedemorow@gmail.com>
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
Content-Transfer-Encoding: 8bit

strlcat() is being removed from the kernel. It runs an unbounded
strlen() on the destination, and its size argument is not tied to
the real buffer, see the issue below.

The bin and wmfw tests fill a 512 byte buffer with a repeated string
by calling strlcat() in a loop, and use the return value to detect
that the buffer is full. Use seq_buf_init() and seq_buf_puts() and
stop when seq_buf_has_overflowed() is true. kunit_kzalloc() returns
a zeroed buffer, so seq_buf_init() is enough here.

Tested: built with gcc 16.2.1 and ran the cs_dsp KUnit suites under
QEMU (x86_64, kunit.py, REGMAP_BUILD): 5829 of 5829 tests pass, the
same as without the patch. The tests do not look at the contents of
the buffer, so I also checked it with a temporary assertion after the
loop: strlen(infobuf) is 511 with the old strlcat() loop and with the
new code, and the assertion fails if 510 is expected.

Not tested: other architectures and any real hardware.

Link: https://github.com/KSPP/linux/issues/370
Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>
---
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c  | 7 +++++--
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 63416838f865..2f44b7a6e637 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -17,6 +17,7 @@
 #include <linux/math.h>
 #include <linux/random.h>
 #include <linux/regmap.h>
+#include <linux/seq_buf.h>
 
 #include "../cs_dsp.h"
 
@@ -2109,6 +2110,7 @@ static void bin_patch_name_and_info(struct kunit *test)
 	unsigned int reg_inc_per_word = cs_dsp_mock_reg_addr_inc_per_unpacked_word(priv);
 	u32 reg_val, payload_data;
 	char *infobuf;
+	struct seq_buf sb;
 	unsigned int alg_base_words, reg_addr;
 	struct firmware *fw;
 
@@ -2126,8 +2128,9 @@ static void bin_patch_name_and_info(struct kunit *test)
 	infobuf = kunit_kzalloc(test, 512, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, infobuf);
 
-	for (; strlcat(infobuf, "Waffle{Blah}\n", 512) < 512; )
-		;
+	seq_buf_init(&sb, infobuf, 512);
+	while (!seq_buf_has_overflowed(&sb))
+		seq_buf_puts(&sb, "Waffle{Blah}\n");
 
 	cs_dsp_mock_bin_add_info(priv->local->bin_builder, infobuf);
 
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
index 1de70e81a868..464a0cc79415 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
@@ -16,6 +16,7 @@
 #include <linux/firmware/cirrus/wmfw.h>
 #include <linux/random.h>
 #include <linux/regmap.h>
+#include <linux/seq_buf.h>
 #include <linux/string.h>
 #include <linux/vmalloc.h>
 
@@ -1722,6 +1723,7 @@ static void wmfw_load_with_info(struct kunit *test)
 	unsigned int reg_addr;
 	u8 *payload_data, *readback;
 	char *infobuf;
+	struct seq_buf sb;
 	const unsigned int payload_size_bytes = 48;
 	int ret;
 
@@ -1745,8 +1747,9 @@ static void wmfw_load_with_info(struct kunit *test)
 	infobuf = kunit_kzalloc(test, 512, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, infobuf);
 
-	for (; strlcat(infobuf, "Waffle{Blah}\n", 512) < 512;)
-		;
+	seq_buf_init(&sb, infobuf, 512);
+	while (!seq_buf_has_overflowed(&sb))
+		seq_buf_puts(&sb, "Waffle{Blah}\n");
 
 	cs_dsp_mock_wmfw_add_info(local->wmfw_builder, infobuf);
 	cs_dsp_mock_wmfw_add_info(local->wmfw_builder, "Another block of info");
-- 
2.56.1


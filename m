Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019395;
	b=JNrleir/GgJ/2igO79kaeaxbe0AXswWuHCt4lepJPFT59KyJo10ZKb78u/fxBM7M+Ypm
	 VxvrmDN+OizqNr5usRrn0bsJrLSeyzJjHrkXwH8yjHy+sA3czlVFJaysrIIVm238jnDW2
	 R3dkmBrXQVnYg8CNmOFR7ynORIINezu+JXUY/fr/a/rOO5fcFXZda6RWrX8dQKTrC1gDR
	 F8B7PlpvZpftx/XXtmy/0op3Pz5R4cyha7/sIlWfeewQbOsFN2nA6uQUGTahmKxkWf2bb
	 oA8AiId0OdTgVoJxjnNAfWP+eQmTEH0vsVaHxNmkwwWrDNyCpckacV6kgOlG++zocUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dNQDu45hRxK42vQ4yOX5cPIZBkSnKSKiQldYYSn1aqI=;
	b=a6ompU1P6a/m4lBomvqYpBB9FpCt+UUFf2KpJaqa52Hjet83yj5bR10zkZ5KXh2CWdbF
	 YTIvdbpppmm75SRJ3dqff+hX6FFrbAH4ZHrgtTlH2xeYCgYmXvYu9J+7aPLwcXiw4La3R
	 uicUB+6RbFEYpGKaMmjz71rZ5fqWxFimQUpLD4nw6IJuEGK4onrG5vtRMmPDa1Q265TW5
	 bVGSoOloUWsm0nF4gCTev5mxMfz6gfKiPZbtTNdMGo1KHyj1rLghKMiDRDgbX6lBmucmy
	 mMqm1RtE3pgqejkUOxjqW5WXg7twO4LoSCDEDSd718TMKyoLYcCeDUXl781tw629Zog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="NCGkXi/x";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629F606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B629F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NCGkXi/x
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f0a1b685so840409f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019391; x=1795624191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNQDu45hRxK42vQ4yOX5cPIZBkSnKSKiQldYYSn1aqI=;
        b=NCGkXi/xCkcuWkAZ9LI8BuN4UITaOcFU6h28fD10kdoHG9hCmV+5dhSM9sYvZwRJWU
         OkDerYPjdvwU80Vgjyn1GWDCLnbAaH7Q3Rmu+83qWMRx8gZ4O95sQCMsIPbEfm75YMcy
         xbFtTQ3OQzCT11hVR2ycFLmis2oYOrpdm0Jj5mcfHf332fnGP2fY/jTNCypw65V1MLDH
         Q7w/FHgFv9glk8VW09GiYHkHAVhZcJw+wzDLD253UjmM3TR5XBrf4wpYVxR5nyScDtLz
         WXxuBXl8UomwtevywWTWB/T22O7M8zOnu9Vuz8fbVeWbmmE6sk4DEYpbLPYBdoudBZRv
         GHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019391; x=1795624191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNQDu45hRxK42vQ4yOX5cPIZBkSnKSKiQldYYSn1aqI=;
        b=jdWN8BZtjn4yZvYt5UQpHA0yGpTBxxMBEiZUgsQbgz1MTPtXtFeeqLP9VWZK+d/9+5
         y5jo9Eh3bE8WwXEHolCCT55WB4Yu83iGVMCzLlpmOuLpGoqIopigXGdL33BcLXObdJ+N
         smz4vGqcthxpRKDhhxrXvkEYEMwvsGAHr7TnvMk3aZGx2V3TnYGBLJEy8g4GRbDlLp8/
         +di4xzByYy2ZHD5yCJpIvUk0hqaVazj2//SlDk0nuJJrOMPAnV6OeNFJ+gl0FuBEN3HB
         u8smzxoV42CDECCgH2HHYg3iBnML6d9klHkDMDgBPa/1V00Uequ3lCxiL8/s7zAqQggC
         znBA==
X-Forwarded-Encrypted: i=1; AL+hErHS5ERVu58bbauLj9FYVmZZk21cBZKAFixyXjuoJplR6Q2xuP1b3fr+kNsZiK7YFqWcDFirAzWHGzqmo6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dQ1cO7/49/FsFVWUwO7BUN1x4FPuQfxiNGAKiPQP69nW3aA4m
	cxJkYnoB+KDUxWWq0C2terjuMWIrg7m0CoRH6jNuuJooTcmk8ra8BJt8OfkvQoNZgIg=
X-Gm-Gg: AZFdTZdQuTi9QsDHnAsQrYu74gMoO2Clh7kHYMwl7rmfOAituMXSK2e27gfb4yLakSp
	aZulaAK83vmdr9ZL8m6q6Vc/JF2mIUtJnNHv71kvjse5Djw7clydzx5zLwU6aXapx/56EFYuH/O
	KY+LjCjjXmy7WY915SFu0Pm69CCTgYGEbF6Z51WDtc8idNV5IL6KkGN6Knt8jDGdSftSeFIBNAa
	8aCj8GB8sPFwmphMWQAAxRfE595waPwgkBHSPTiqBgzFNWdIBXuFrytaxBh1gaqQ+IMXiLv92RY
	DKqsm4fR4wG3Ex2TuP1wTWLJKkjs66mNbnODgzi+z0xSKRf8vHBwwvjQWoOdY9y0NvXscvPp/6M
	lnZPZohw/RcLkVHcBKabt5unHZ0bHlB0Zutpo7sXL2XRxmYbILcSCFXO2mC/4ZQNXTUG6JALhX5
	qyPrVaan+ztsphNe2JnnydFfHblK1GkVfgOe0Jyjrkyl+xsRPyLKmQb7JJAZfcHilO4OrLVxB8D
	UdNmAqslVJY7DeKZ1yEdP0nl7p6ILBRYocplthKtHiv0T0BLYCRPKNlHV4un1BDTW08WMUpu00y
	rMXE9NWGxfgkydYi1c6RiH55rZ9ezuVFscAKCe5VPqY/lK+yI/E0GQ==
X-Received: by 2002:a05:6000:4312:b0:4a6:4ac6:d952 with SMTP id ffacd0b85a97d-4a64ac6dad3mr6914932f8f.31.1795019391032;
        Wed, 18 Nov 2026 08:29:51 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:25 +0000
Subject: [PATCH 03/34] perf jit: Add address ranges to DWARF compilation
 units
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
Message-Id: <20261118-james-coresight-jit-v1-3-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

The JIT ELF writer emits a line table and a compilation unit containing
only DW_AT_stmt_list. LLVM locates the CU by address before looking up a
source line, but the CU address range isn't written into the DWARF.
Therefore it can't resolve these files even though GNU addr2line could
by reading the line table directly. This means that JIT src line lookups
when LLVM is used.

Pass the generated code size to the debug information writer and emit
DW_AT_low_pc and DW_AT_high_pc address ranges. Also mark the compilation
unit as childless to match its contents.

Add a test which writes JIT debug information at a nonzero runtime load
address and resolves an ELF-relative address through LLVM.

Fixes: c3f8644c21df ("perf report: Support LLVM for addr2line()")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/genelf.c      | 70 +++++++++++++++++++++++++++++++++++++++++-
 tools/perf/util/genelf.c       |  2 +-
 tools/perf/util/genelf.h       |  3 +-
 tools/perf/util/genelf_debug.c | 22 +++++++++----
 4 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/tools/perf/tests/genelf.c b/tools/perf/tests/genelf.c
index 95f3be1b683a..4d23778c1979 100644
--- a/tools/perf/tests/genelf.c
+++ b/tools/perf/tests/genelf.c
@@ -5,6 +5,8 @@
 #include <string.h>
 #include <unistd.h>
 #include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <linux/unaligned.h>
 
 #include "debug.h"
 #include "tests.h"
@@ -12,6 +14,8 @@
 #ifdef HAVE_JITDUMP
 #include <libelf.h>
 #include "../util/genelf.h"
+#include "../util/jitdump.h"
+#include "../util/llvm.h"
 #endif
 
 #define TEMPL "/tmp/perf-test-XXXXXX"
@@ -50,4 +54,68 @@ static int test__jit_write_elf(struct test_suite *test __maybe_unused,
 #endif
 }
 
-DEFINE_SUITE("Test jit_write_elf", jit_write_elf);
+static int test__jit_write_elf_dwarf(struct test_suite *test __maybe_unused,
+				     int subtest __maybe_unused)
+{
+#if defined(HAVE_JITDUMP) && defined(HAVE_LIBDW_SUPPORT) && defined(HAVE_LIBLLVM_SUPPORT)
+	const uint64_t load_addr = 0x12340000;
+	static const char filename[] = "jit.c";
+	unsigned char code[16] = { 0 };
+	unsigned char debug[2 * (sizeof(struct debug_entry) + sizeof(filename))];
+	struct debug_entry *entry = (struct debug_entry *)debug;
+	char path[] = TEMPL;
+	char *file = NULL;
+	unsigned int line = 0;
+	int fd, ret = TEST_FAIL;
+
+	/* The second row terminates the first row's source-line range. */
+	for (int i = 0; i < 2; i++) {
+		put_unaligned(load_addr + i * 8, &entry->addr);
+		put_unaligned(42 + i, &entry->lineno);
+		put_unaligned(0, &entry->discrim);
+		memcpy(entry + 1, filename, sizeof(filename));
+		entry = debug_entry_next(entry);
+	}
+
+	fd = mkstemp(path);
+	if (fd < 0) {
+		perror("mkstemp failed");
+		return TEST_FAIL;
+	}
+
+	if (jit_write_elf(fd, load_addr, "main", code, sizeof(code),
+			  debug, 2, NULL, 0, 0))
+		goto out;
+
+	/* LLVM must find the CU from the ELF address before reading its lines. */
+	if (llvm__addr2line(path, GEN_ELF_TEXT_OFFSET + 4, &file, &line,
+			    NULL, false, NULL, NULL) <= 0) {
+		pr_debug("LLVM could not resolve the JIT source line\n");
+		goto out;
+	}
+	if (!file || strcmp(file, filename) || line != 42) {
+		pr_debug("Unexpected JIT source line: %s:%u\n", file ?: "??", line);
+		goto out;
+	}
+	ret = TEST_OK;
+out:
+	free(file);
+	close(fd);
+	unlink(path);
+	return ret;
+#else
+	return TEST_SKIP;
+#endif
+}
+
+static struct test_case tests__jit_write_elf[] = {
+	TEST_CASE("Write JIT ELF", jit_write_elf),
+	TEST_CASE_REASON("Resolve JIT ELF source line with LLVM", jit_write_elf_dwarf,
+			 "requires JIT dump, libdw and LLVM support"),
+	{ .name = NULL, }
+};
+
+struct test_suite suite__jit_write_elf = {
+	.desc = "Test jit_write_elf",
+	.test_cases = tests__jit_write_elf,
+};
diff --git a/tools/perf/util/genelf.c b/tools/perf/util/genelf.c
index 14882def9704..fc145f9401d2 100644
--- a/tools/perf/util/genelf.c
+++ b/tools/perf/util/genelf.c
@@ -449,7 +449,7 @@ jit_write_elf(int fd, uint64_t load_addr __maybe_unused, const char *sym,
 
 #ifdef HAVE_LIBDW_SUPPORT
 	if (debug && nr_debug_entries) {
-		retval = jit_add_debug_info(e, load_addr, debug, nr_debug_entries);
+		retval = jit_add_debug_info(e, load_addr, csize, debug, nr_debug_entries);
 		if (retval)
 			goto error;
 	} else
diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
index 9f0b875d6548..67309794239a 100644
--- a/tools/perf/util/genelf.h
+++ b/tools/perf/util/genelf.h
@@ -10,7 +10,8 @@ int jit_write_elf(int fd, uint64_t code_addr, const char *sym,
 		  void *unwinding, uint64_t unwinding_header_size, uint64_t unwinding_size);
 #ifdef HAVE_LIBDW_SUPPORT
 /* genelf_debug.c */
-int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_entries);
+int jit_add_debug_info(Elf *e, uint64_t code_addr, int code_size,
+		       void *debug, int nr_debug_entries);
 #endif
 
 #if   defined(__arm__)
diff --git a/tools/perf/util/genelf_debug.c b/tools/perf/util/genelf_debug.c
index 7d9ef43aa6ac..a124ab40f36b 100644
--- a/tools/perf/util/genelf_debug.c
+++ b/tools/perf/util/genelf_debug.c
@@ -449,9 +449,13 @@ add_debug_abbrev(struct buffer_ext *be)
 {
         emit_unsigned_LEB128(be, 1);
         emit_unsigned_LEB128(be, DW_TAG_compile_unit);
-        emit_unsigned_LEB128(be, DW_CHILDREN_yes);
+	emit_unsigned_LEB128(be, DW_CHILDREN_no);
         emit_unsigned_LEB128(be, DW_AT_stmt_list);
         emit_unsigned_LEB128(be, DW_FORM_data4);
+	emit_unsigned_LEB128(be, DW_AT_low_pc);
+	emit_unsigned_LEB128(be, DW_FORM_addr);
+	emit_unsigned_LEB128(be, DW_AT_high_pc);
+	emit_unsigned_LEB128(be, DW_FORM_addr);
         emit_unsigned_LEB128(be, 0);
         emit_unsigned_LEB128(be, 0);
         emit_unsigned_LEB128(be, 0);
@@ -459,9 +463,11 @@ add_debug_abbrev(struct buffer_ext *be)
 
 static void
 add_compilation_unit(struct buffer_ext *be,
-		     size_t offset_debug_line)
+		     size_t offset_debug_line, int code_size)
 {
 	struct compilation_unit_header *comp_unit_header;
+	uintptr_t low_pc = GEN_ELF_TEXT_OFFSET;
+	uintptr_t high_pc = low_pc + code_size;
 	size_t old_size = buffer_ext_size(be);
 
 	buffer_ext_add(be, &default_comp_unit_header,
@@ -469,6 +475,9 @@ add_compilation_unit(struct buffer_ext *be,
 
 	emit_unsigned_LEB128(be, 1);
 	emit_uword(be, offset_debug_line);
+	/* DW_FORM_addr uses the address size declared in the CU header. */
+	buffer_ext_add(be, &low_pc, sizeof(low_pc));
+	buffer_ext_add(be, &high_pc, sizeof(high_pc));
 
 	comp_unit_header = buffer_ext_addr(be) + old_size;
 	comp_unit_header->total_length = (buffer_ext_size(be) - old_size) -
@@ -476,7 +485,7 @@ add_compilation_unit(struct buffer_ext *be,
 }
 
 static int
-jit_process_debug_info(uint64_t code_addr,
+jit_process_debug_info(uint64_t code_addr, int code_size,
 		       void *debug, int nr_debug_entries,
 		       struct buffer_ext *dl,
 		       struct buffer_ext *da,
@@ -489,7 +498,7 @@ jit_process_debug_info(uint64_t code_addr,
 		put_unaligned(get_unaligned(&ent->addr) - code_addr, &ent->addr);
 		ent = debug_entry_next(ent);
 	}
-	add_compilation_unit(di, buffer_ext_size(dl));
+	add_compilation_unit(di, buffer_ext_size(dl), code_size);
 	add_debug_line(dl, debug, nr_debug_entries, GEN_ELF_TEXT_OFFSET);
 	add_debug_abbrev(da);
 	if (0) buffer_ext_dump(da, "abbrev");
@@ -498,7 +507,8 @@ jit_process_debug_info(uint64_t code_addr,
 }
 
 int
-jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_entries)
+jit_add_debug_info(Elf *e, uint64_t code_addr, int code_size,
+		   void *debug, int nr_debug_entries)
 {
 	Elf_Data *d;
 	Elf_Scn *scn;
@@ -510,7 +520,7 @@ jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_entries
 	buffer_ext_init(&di);
 	buffer_ext_init(&da);
 
-	if (jit_process_debug_info(code_addr, debug, nr_debug_entries, &dl, &da, &di))
+	if (jit_process_debug_info(code_addr, code_size, debug, nr_debug_entries, &dl, &da, &di))
 		goto out;
 
 	/*

-- 
2.43.0


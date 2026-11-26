Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655556;
	b=gT9W5+nJSdnN5iUTNkKvFOJ4OVlU1oGP5v1RHF1uwxyxqLhcBrqk7cw/Qw9kqpJp6gF7
	 utIP7f7hN0/PqSXrzuCSZFW+HdVHaG5u0yjLauX0bLz0yNdDRyeW32SwBu0PG+ez0jP99
	 Ihj9JpHQqUsNaKdP0TEtsER2CTTYfJQsP82yLj/wkI5+ZejyPAXoj9BZVAsdB/F4GDdij
	 UStYVtQP3nNs2V8JIEzazuFfjULksZ7demf1fJiDQ8pVn9uV/0f3eX7H8bPr4Via+tSb4
	 oQlgJmK3gEqoXPpPbpKTXzvM5xWVSOwjPWHJ2SsOmTAUtgPb8SZh3fuiNu0ze8xlOXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
	b=coBBWjcKt0oq8FtrHwW0+dBp180CguLOYg/3nDQ9O82eeoN6Z0BaFvKKhOhFg+zY0YPs
	 FL4J4dwkVhNf+H9n0JI9swOm2Ki1FvIVgChMZv9QG8nig2VkaAQCm5QOE9tXMBDGnXL0p
	 WRwputzzF8jHyJNQ5mVWJuy5+zmWW1wIC7c1zZ1i+mtokJQCezohg+aNSoFM3LVOPyRZM
	 g3Dp1HDVUCAZ91Hl1aqJrTRpJd+SHZQqAGDjn/eWrrLdnja1VExYlBk2/4GmOZDeIqifO
	 2ALkfUymwNJaqRO9mfmzmFnh9T7IucC+q9fhkbXlUNf7rRN4cb9qiJ96gFWHe8TR4Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N85n/KuQ";
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77494606A6AD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77494606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N85n/KuQ
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso5048908eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655555; x=1796260355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=N85n/KuQnifDRI2YkEYLejB87Z6k0qrWRhF4Qz7XgmIhZmvTmF807YZe1yov5bGwX6
         oIuulHIcrWCbGQ6/eyb/Vzt/nwfyp3oUydZ7PicwMkebJ6fZ/NgjsT6o834ErBvgOLKw
         c3uBQ5LXY6wCtzI7tt8holDAgEgJnb1Ym51nQJSjVvE6PLd05GkVF6HEANYtob3adR0y
         j/pP3R2BXI3qaq20JTLFs/hnLz34BLgyS9FO+QrvK2HQxunyh2fL/lDkBfSjtXCCPfkf
         PaIg5qX29ViD1s12M2im5pamIDXPqgfju4bagGTlb6ugkUUwojOOokOECcnxhnkOeN3h
         4SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655555; x=1796260355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=WSslkL34hT1yIZFCK4eAbPLCD9sbK7HarFhvAzlx4yZSQpZwkpPCx/Oe4pa6nb8+8I
         IwEM3+3s/YKVwPdbEGR5zDwjDHDQSUX4eDUbgVucfmoBUmdxn7xIgEGxTAIBz7P2OLz4
         1enuISTt+U/BZb3IGh9pV5riBuF6kyuslOxjp3q2jq4yBfDzTK6czAsxpxVSLuxiZnEY
         E/QPLHH09e54/a93JyTtMLA/zzh2/NV0gkdWrelO7+6IClnAj7G969QsMrf6WLg+Jub0
         m4Gl9qKx1Jk9TY6BA6vNiVy/Y2H13Mp+gsBVwltolfMo8nuCeigBSWu9MlHhoItCvkEJ
         6HBw==
X-Forwarded-Encrypted: i=1; AL+hErFni17kcBH5eixC63bvlIz903I74sAI8S9M6LxbMBUZK9Ep86d1Vbf/Clwvw7xS5F14EzcxAhydCZ4DrsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sMHDWHG7He+Q3/KKnxj+JxgocMWlKtoB0AcEhHx7ze8W9R7kF
	10r/ErFf+QfmC4b29yOxRyMFcLurqPeErrwX1aCwDQLprNOdNHHq4Hrf
X-Gm-Gg: AZFdTZeJQoNocHyLlWjwCQ/g/82E4GHvxgc44ZUnnPQmIYsU6T9eKiXah0hRayFTs0P
	squ4V3JWgEb5KDkofnlqprY9+1hsciUCwvwemfG6kd5+5FIajCdVSLP5nqLzOaUONNxJi/Hsddi
	MX0RO0H4qun3BH2R2VqpKK86uEfbeDWUbQ4eUn8WdAk6yzrq05sf3CHP/YWrrYcDU1UW6Fqf4t8
	jYC+AUbcTSf/wd2bbNw4YLMVaAFmE5+JpM27WOWga3QOBFxEIYxzPJattPkXwRMxeq6VieExVAa
	C/L19Fd2SGVIBmzC49gfp0xx7CiCiZLF/V9kyo38HJ7UtXX6CEQCyWqZJkwHkpr/Pg9f7Gi4vrY
	9p2eCNJF6ukIq1LBTQEi00rZq2XxyRViux0jJnFP8mofLGi7W6thQ4iP46Oy5/eoA7vClpb+EMi
	8GRcoXqzLG4j8upWG5X7AnfdZefmVs5cN+kXiQJcQSjx1CZlS9vFbCf9xxZs0PDOmOrsxAUhFhl
	UP3lMP2u/AlPXb6wORfa33GmQUDdw7lBiWtnNt26ma/tXQDT/jy4bPL53ZEmwsU1d4WyZS+ysMn
	5v4oeEJQdIuUM5kYJPD9jZoOyQS/oR2g6DfjoWiA5Jm450f5Q+88le0ahZI05ZrELaFm0tDcWbM
	40CgbydOqCdlvfmvP7JKoJnjp1jxwIkAg8mFtyZAkpWVXrVATDIDeVzWYFS+Xlw==
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr17277852eec.20.1795655554634;
        Wed, 25 Nov 2026 17:12:34 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm55717751eec.15.2026.11.25.17.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:12:34 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v4 3/3] selftests/bpf: Dump unaligned enums and a zeroed fs_context
Date: Thu, 26 Nov 2026 01:12:22 +0000
Message-ID: <20261126011222.92180-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126011222.92180-1-dennylin0707@gmail.com>
References: <20261126011222.92180-1-dennylin0707@gmail.com>
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

Dump the signed enum value from an unaligned address in the enum data
test. Also dump a zeroed struct fs_context without emit_zeroes in the
struct data test, which covers phase, an enum bitfield 3 bytes before
the end of the struct.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index b5c90f729339..d6fd9933ff25 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -945,7 +945,7 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				    char *str)
 {
 	__u32 high = 0x80000000;
-	__s32 neg = -1;
+	__s32 neg[2] = { -1, -1 };
 
 	/* enum where enum value does (and does not) exist */
 	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
@@ -994,6 +994,8 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
 	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
 				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, (void *)neg + 1, 4, str,
+				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump unaligned enum");
 	btf_dump__free(d);
 }
 
@@ -1182,6 +1184,12 @@ static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
 		type_sz = btf__resolve_size(btf, type_id);
 		str[0] = '\0';
 
+		/* 'phase' is an enum bitfield 3 bytes before the end */
+		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
+		ASSERT_EQ(ret, type_sz,
+			  "unexpected return value dumping zeroed fs_context");
+
+		str[0] = '\0';
 		opts.emit_zeroes = true;
 		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
 		ASSERT_EQ(ret, type_sz,
-- 
2.43.0


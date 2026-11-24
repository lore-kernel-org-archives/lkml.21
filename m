Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525432;
	b=bN8ocdL4mRJMAxTMhpy1S7xxJ6+gaI9b6G7qlBSLzGDBcFkTETTpCep79cnjivQMEu23
	 RiUbYrzXncFk2hQv2bfnGjzAZLBrcq45dPKLhB7g/Y69t/hWo3n5Mv4P0P7CaJKONBLC+
	 u1yK0UlEHBL1IXcMdTZZTZdmvaXxIo+TmaeRX1BpybkLtMqzMIKjkMqFk5c9XqX60EKkh
	 IYlQUA1VGzGu9rsZ6H4vVvBB4sHVSbul3gQN21Y3BRFlb5spKQiARZz17H5bP2bm95DVa
	 NiCcihpH5O2t6uVU3VAQfeWnFLhH2NeWQKzJPFGmX+vIhlxxYseJXtWhS0qQnayqCAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525432;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qz1cer2CJEb2XBcnOBD2BJhG3oNesoDxDbfi66TknAQ=;
	b=iJQN9dJMIVEfDrhNaxobjmXjZa6vcFa/0o4o5jlbC+vn30xOcJO2xEY+PoYj70crnKD5
	 gsS1QYgS2wt7HKsHsCT9wtJTCr/JCFMITjKGfLNM1nSLhb5A72SXJertiIdE8DA62tVv3
	 j/83vR01gQSXSYt5p+pndhmWog1sK79RPdpwECfxNNG06nrKxR0JtNAleWnMJrus+KMIe
	 IS0bekov6pcmPyPZ+C0/Gxt6t/H2lqxwV+RsIRw+CEpw7RJgSh8CgfjJ4Am1+XGKXdRNw
	 hqBJFNra2K314xRfPn0y0OVzVOCqzfuLbyMwcEmWO4SE8xv8SF7U+OaIiF9CoDl09BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="D/NkwOzv";
	arc=none smtp.remote-ip=91.218.175.7
Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E83606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E83606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D/NkwOzv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qae+lMQv4Cu2p12O38Ifwn0KaftWxrqv0xG2C05X8Ew=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795525430; v=1; x=1796130230;
 b=D/NkwOzvGOlIk7c+sENeibj5gDGOIB7mNF4W60a7KIXVwip3EXYdGi4t6u8rE+Oayy5z91f8
 v0m1JWA/XtRvH611ig6/FDu7O5G+Gj4EesgE10IwB2fdjrZfblVbiVvUV9BuQPf9dI2MINshyPL
 rLW5z6dIoCYyP7e5+NtMyAf4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1b470517dc8187ea;
	Tue, 24 Nov 2026 13:03:50 +0000
X-Mizu-Trace-ID: 1b470517dc8187ea
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	david@kernel.org,
	donettom@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: [PATCH v4 3/3] selftests/mm: verify ksm_zero_pages is not inherited on fork
Date: Tue, 24 Nov 2026 21:03:43 +0800
Message-Id: <20261124130343.131760-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124130143.128411-1-xu.xin@linux.dev>
References: <20261124130143.128411-1-xu.xin@linux.dev>
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

Extend test_fork_ksm_merging_page_count() to enable use_zero_pages and
merge zero pages alongside non-zero pages before fork(), verifying that
neither ksm_merging_pages nor ksm_zero_pages is inherited by the child.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
Changes in v4:
- Rename test_fork_ksm_statistic_count() to test_fork_ksm_counters() (David)
- Unify cleanup into a single label and munmap before ksm_stop() (David)
- Fix phrasing in log messages ("Reading KSM counters failed", etc.)

 .../selftests/mm/ksm_functional_tests.c       | 44 +++++++++++++++----
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index b871d5656688..7aadce09e6c7 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -655,27 +655,51 @@ static void test_prot_none(void)
 	munmap(map, size);
 }
 
-static void test_fork_ksm_merging_page_count(void)
+static void test_fork_ksm_counters(void)
 {
+	char *zero_map = MAP_FAILED, *map = MAP_FAILED;
 	const unsigned int size = 2 * MiB;
-	char *map;
+	long merging_pages, zero_pages;
 	pid_t child_pid;
 	int status;
 
 	ksft_print_msg("[RUN] %s\n", __func__);
 
+	if (ksm_use_zero_pages() < 0) {
+		ksft_test_result_skip("Enabling use_zero_pages failed\n");
+		return;
+	}
+
 	map = mmap_and_merge_range(0xcf, size, PROT_READ | PROT_WRITE, KSM_MERGE_MADVISE);
 	if (map == MAP_FAILED)
 		return;
 
+	zero_map = mmap_and_merge_range(0x00, size, PROT_READ | PROT_WRITE, KSM_MERGE_MADVISE);
+	if (zero_map == MAP_FAILED)
+		goto unmap;
+
+	merging_pages = ksm_get_self_merging_pages();
+	zero_pages = ksm_get_self_zero_pages();
+	if (merging_pages < 0 || zero_pages < 0) {
+		ksft_test_result_skip("Reading KSM counters failed\n");
+		goto unmap;
+	}
+
+	if (!merging_pages || !zero_pages) {
+		ksft_test_result_fail("KSM failed to merge pages before fork\n");
+		goto unmap;
+	}
+
 	if (ksm_pause() < 0) {
-		ksft_test_result_fail("Stop ksmd from running failed\n");
+		ksft_test_result_fail("Stopping ksmd from running failed\n");
 		goto unmap;
 	}
 
 	child_pid = fork();
 	if (!child_pid) {
-		exit(!!ksm_get_self_merging_pages());
+		merging_pages = ksm_get_self_merging_pages();
+		zero_pages = ksm_get_self_zero_pages();
+		exit(merging_pages != 0 || zero_pages != 0);
 	} else if (child_pid < 0) {
 		ksft_test_result_fail("fork() failed\n");
 		goto unmap;
@@ -688,15 +712,17 @@ static void test_fork_ksm_merging_page_count(void)
 
 	status = WEXITSTATUS(status);
 	if (status) {
-		ksft_test_result_fail("ksm_merging_page in child: %d\n", status);
+		ksft_test_result_fail("KSM counters are not zero in child\n");
 		goto unmap;
 	}
 
-	ksft_test_result_pass("ksm_merging_pages is not inherited after fork\n");
-
+	ksft_test_result_pass("ksm_merging_pages and ksm_zero_pages are reset after fork\n");
 unmap:
+	if (zero_map != MAP_FAILED)
+		munmap(zero_map, size);
+	if (map != MAP_FAILED)
+		munmap(map, size);
 	ksm_stop();
-	munmap(map, size);
 }
 
 static void test_merge_aged_pairs(void)
@@ -842,7 +868,7 @@ int main(int argc, char **argv)
 	test_prctl_fork();
 	test_prctl_fork_exec();
 	test_prctl_unmerge();
-	test_fork_ksm_merging_page_count();
+	test_fork_ksm_counters();
 	test_merge_aged_pairs();
 
 	err = ksft_get_fail_cnt();
-- 
2.34.1


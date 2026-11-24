Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525419;
	b=DaKAdtUwHNA3ruqn+wmIp3+mO1I2mtjwvZUdrCGGPBg3nxaRftVCwCs78j+Jrc0JgPyU
	 GpDGLBlAqoXUGtu/ku10MhvbxDVFck1ebnwzUrE7380MWjPGrURYhfFhqfUyts21XNr3q
	 d0i+gcYgUq6yuMbQAiEQhmFedhcHcuHddM4NT1kMZ9JE7NSTokJsBoDtLcJnv/bXCVseu
	 OCnNJfQvznndxK1vA3pwAdNKuoOPPPUAEGJu8hcRTC5bXM1wvO6oKwjNCvWI1lo136JDb
	 1ROaiKf0K0TYVbXGRqOvlPoR9N2rJcCsUJnhgPYdg1f/rgCwtOBgVxUo2KgKPlQAbOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525419;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RzaOSH6wDU86KLn8UnvDUyV5JshCNmIFXfq+s5ulUe8=;
	b=U0z7418u4NCTcg/QED08hviWbgja8AkDr/KjUd3bipK5Waf0DOlEmDvndTnklhm+woEZ
	 Ohg7IdbTMAxlMyD9uYAZZHdswdlTjHLS3yz8a4e83LDvIp3Xg2IilLWVeiNuBkwsWrvFv
	 1PnT2uXUQfSfnKT3LEASdSV8FEQ9YXjAnONVQd4OtfBhl0cU8ifhyWswCUv2KT2Ojerjq
	 utTSu/4uBSwqAfxwzngepJoDDWfQ4r+vPNjZIio9JnBBfDwEtnxCYt6173usH0LZ8Lw6h
	 dkriamXwcYdEzT3F/l1215A79OcIWmwCxLoafDIDHd0I+7ygmfbUlMWNHTuZi25H80A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OTL6oIKM;
	arc=none smtp.remote-ip=91.218.175.5
Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FF606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OTL6oIKM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JmTzUrRmL1kCP/GnAND4zD3C4FlayfF4aT4rwA6Hr/c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795525416; v=1; x=1796130216;
 b=OTL6oIKMuYw8CPCylKclk36Gxwv0ZZ407gdrXvZquLFl9tntlPyQeRhvw7sCtQZ8LSjZw6Qt
 xNPJZENHh9dAcBXnk/zHyqyrk8FrzCgxzphPcOIMrjAagp+yHoUyrK9EPLdVZPgWVsfKjHjWdSm
 YdUoAwHGrWtzfWRYI9LZFFKE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3fed72913207e595;
	Tue, 24 Nov 2026 13:03:36 +0000
X-Mizu-Trace-ID: 3fed72913207e595
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
Subject: [PATCH v4 2/3] selftests/mm: fix false-positive and racy KSM fork test
Date: Tue, 24 Nov 2026 21:03:27 +0800
Message-Id: <20261124130327.131410-1-xu.xin@linux.dev>
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

Currently, test_fork_ksm_merging_page_count() passes wrongly even if
fork() fails to reset mm->ksm_merging_pages, because the child process
calls init_global_file_handles() -> ksm_stop(), which unmerges all KSM
pages across the system before reading its counters.

Fix three issues in test_fork_ksm_merging_page_count():

- Drop init_global_file_handles() in the child process so it does not
  call ksm_stop() and mutate global KSM sysfs state (unmerging all KSM
  pages across the system) before reading its counters.

- Use '!!' in exit(!!ksm_get_self_merging_pages()) to avoid 8-bit exit
  status truncation (e.g., 512 pages on 4 KiB systems truncating to 0).

- Introduce ksm_pause() to pause ksmd (write "0" to /sys/kernel/mm/ksm/run)
  before fork(), preventing ksmd from scanning the child and incrementing
  its counter before it is read.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 .../testing/selftests/mm/ksm_functional_tests.c  |  8 ++++++--
 tools/testing/selftests/mm/vm_util.c             | 16 ++++++++++++++++
 tools/testing/selftests/mm/vm_util.h             |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 135191f99962..b871d5656688 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -668,10 +668,14 @@ static void test_fork_ksm_merging_page_count(void)
 	if (map == MAP_FAILED)
 		return;
 
+	if (ksm_pause() < 0) {
+		ksft_test_result_fail("Stop ksmd from running failed\n");
+		goto unmap;
+	}
+
 	child_pid = fork();
 	if (!child_pid) {
-		init_global_file_handles();
-		exit(ksm_get_self_merging_pages());
+		exit(!!ksm_get_self_merging_pages());
 	} else if (child_pid < 0) {
 		ksft_test_result_fail("fork() failed\n");
 		goto unmap;
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index f26f9e4bfdbe..e638475543e6 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -1080,6 +1080,22 @@ int ksm_stop(void)
 	return ret == 1 ? 0 : -EIO;
 }
 
+int ksm_pause(void)
+{
+	int ksm_fd;
+	ssize_t ret;
+
+	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
+	if (ksm_fd < 0)
+		return -errno;
+
+	ret = write(ksm_fd, "0", 1);
+	close(ksm_fd);
+	if (ret < 0)
+		return -errno;
+	return ret == 1 ? 0 : -EIO;
+}
+
 int get_hardware_corrupted_size(unsigned long *val)
 {
 	unsigned long size;
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index ab1325dc6580..df16973d108a 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -168,6 +168,7 @@ int ksm_set_smart_scan(bool enable);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);
+int ksm_pause(void);
 int get_hardware_corrupted_size(unsigned long *val);
 int unpoison_memory(unsigned long pfn);
 
-- 
2.34.1


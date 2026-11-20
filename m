Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160698;
	b=QXw+ym3OxbjXmjECy2u2fdUfO+utAU8VGyimS7bMGSKZK63+C+WFodBjzKxTeSpCaqwA
	 kLvSlMUQl8C3ekhcT+zCQwKbDW3vOMBNYhxbLNWJr3YB67KgHpxFdpKyFzPw42yw3KFGR
	 0kMJtnCWDWaYZ8iXZidt62wrpP0xiW8yJHMvCICnHETsi890JLhchIZSaWHd8i9goq/Tq
	 2x7MdBQMYA7px+d19cuLUvDZAzbVKUWSMeF3pl8m8cY7SmvMTdSD4U2PnhUPMGLdavma4
	 UOifz6qceKMGw5xNFKN2F1z05GgaM8b0EyJ9Z0Vjx5rwas5m5FcAoX8XZCQcvzhngGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160698;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lxi6unjVQ4QMAgeTvpwgXSWHJFUdnkiAu2/vuTAVwOc=;
	b=3mXOmYXonRkefQEvEu6cdeK1f2HoaeXzrOTRD9JYW5MJoABfXv4ntKtNYeGmrXVXJLVH
	 rfIdOIpYpoSukiga3tipz57k24Q09XVxHsvWNOzXV+iQXf+y/R36TuAAdeqRIss+DRlBz
	 Zf4xg+UIF+ZkTygnqtw6x/I4YiGsp1ZR3va3MRFiYpg16L/qvCnC/9AJghkP34z6j1Rs6
	 zLyEMYINFsnxnfHOMJJf7qK/B9l+VNI27/b0b8QwdLpAH/fFVW/rH7c7mHPe6pCNrMdZv
	 F+ZvDNEWb+hkm4f3EQcfQsnQbmQwHYYx6etMKqrjXbFkBWtgxuNQitiFg3Wyqjp5Ulw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rIr1t80t;
	arc=none smtp.remote-ip=91.218.175.230
Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF27606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF27606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rIr1t80t
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lB7kRH1Y6c45DRzOiYxWXvEym+deCOdTIknp2BnEVAM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795160696; v=1; x=1795765496;
 b=rIr1t80tmltB+JcBtrDnIX+74N1Ia1PLfMhBevXJagxvm6AAdWGnvC0fBlJ9srxtn9Zdm4w7
 efcOzUMBCDEYHpPmrzEUJd7yDaoDu32JPJ8rsL3Ks9Vl1oGeW5oJV+M+d5a1USVsjt1Fmaw1o7s
 zGYYPvD9GCuMdLtbNAUgdkCo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 9b268e6d28a98aa1;
	Fri, 20 Nov 2026 07:44:55 +0000
X-Mizu-Trace-ID: 9b268e6d28a98aa1
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
Subject: [PATCH v2 2/3] selftests/mm: fix false-positive KSM fork test by dropping init_global_file_handles()
Date: Fri, 20 Nov 2026 15:44:45 +0800
Message-Id: <20261120074445.41446-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120074230.40269-1-xu.xin@linux.dev>
References: <20261120074230.40269-1-xu.xin@linux.dev>
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

In test_fork_ksm_merging_page_count(), the child process currently calls
init_global_file_handles() before reading ksm_get_self_merging_pages().
However, init_global_file_handles() calls ksm_stop(), which writes 2
(KSM_RUN_UNMERGE) to /sys/kernel/mm/ksm/run, unmerging all KSM pages
across the system and resetting the counters to 0. As a result, the test
always passes regardless of whether fork() properly resets the counter.

Remove the redundant init_global_file_handles().

Fixes: 08ff89b5659d ("selftests/mm: add fork inheritance test for ksm_merging_pages counter")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 135191f99962..c20982b0aff0 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -670,7 +670,6 @@ static void test_fork_ksm_merging_page_count(void)
 
 	child_pid = fork();
 	if (!child_pid) {
-		init_global_file_handles();
 		exit(ksm_get_self_merging_pages());
 	} else if (child_pid < 0) {
 		ksft_test_result_fail("fork() failed\n");
-- 
2.34.1


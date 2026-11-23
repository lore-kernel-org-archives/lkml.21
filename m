Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405320;
	b=C25NFY0IMTjYxzhCSAi1PDjmraobqUk0R66koi1f5r1UKR9cquRLWRvThsGJgTBNmB2w
	 ihld5lYJoPB8BTDpg3pgSpw0A5bepZv2zXCb6fW7hMvtIL7cTBqdM0/Sl3S5VkiPB110y
	 aA2Q3OkhKuYWfas+7V1UQxwNXvv0aLJHNk4Bvv5Ni5Ds3UuCH3iXDBA+K+3YuTokrv5yV
	 w9kxpB6AKktic2Al+OZyPtOoB7xJjfpZ2NmP6VQ1FJyVdjbYpNu1l93r2JeV3cXFP3tCf
	 A0+R8M2YTdpGXvfGxCJR4/RsfCagEU993M/GcHxnTrUmPm720gYDtwYnQ9LXW9/003A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405320;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Dh1feaCWNPCzI3ZTC+VWOZAtNmxgTq2L6B7MJWElwiw=;
	b=qrfRSSISrGgmRcV74TwiX3fI1cMoe+h4Taet6+rsj47i+5iDQOxhbBlqysOOKDKJ62QC
	 ZkhE9radmsYoBC1UHX76ehqRhojQ59B57ok/w/8XuEYuRwS8XZu23EZ8i7QJH7p02/WVm
	 UfAU58hFdt5GIslnjLGvGA4Q1cLWsYQ30nvzb1fdAJGIEtjVE4/EZABr6KJayui7nilzc
	 irrjJ3ajHY02f2SdcZLSBBaxVE7vpEXN7yAikYE6VO4wmMnzTyvHa/QlBVTtgfM2Ek1Bq
	 tTi2tKG/oOXM3TmyHH+5lPAVCbPsB5OBxwwiGwSVjY0eljQKjDvLf2RWGAvtIU5HgKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PAENAZh1;
	arc=none smtp.remote-ip=95.215.58.186
Received: from mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EC7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PAENAZh1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LbvXmZsFJJ0KApBfSklAegm2ypvSM8utExD74OIXo2Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795405318; v=1; x=1796010118;
 b=PAENAZh1oW50MKFjN2afLxN09iQJ7rfA2bIMFqhREF3fF8KSiXX/OfGuKQIjs2xecS7btDS+
 A2acdpl/nw+5cQ25spfRBpTjobxCjsXKmaHhPSfXID9iBbw5wqF236pX2gd/QJ0n7662FdmgCLI
 AGIYlkdb5LCjlbtpuLDcAWNE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8d10001b3924a972;
	Mon, 23 Nov 2026 03:41:57 +0000
X-Mizu-Trace-ID: 8d10001b3924a972
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: David Hildenbrand <david@kernel.org>
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	linux-mm@kvack.org,
	stable@vger.kernel.org,
	xu.xin@linux.dev,
	linux-kernel@vger.kernel.org,
	donettom@linux.ibm.com
Subject: [PATCH v3 0/3] mm/ksm: fix ksm_zero_pages accounting on fork
Date: Mon, 23 Nov 2026 11:41:36 +0800
Message-Id: <20261123034136.209410-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
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

Currently, fork() wrongly inherits the parent's ksm_zero_pages counter
and keeps the KSM dirty-bit marker on zero-page PTEs, inflating both the
child's per-mm counter and the global ksm_zero_pages counter.

Patch 1 fixes this by resetting the child's mm->ksm_zero_pages to 0 in
ksm_fork() and clearing the KSM zero-page marker when copying present
PTEs, and documents the behavior.

Patch 2 fixes false-positive and racy bugs in the existing KSM fork
selftest by dropping init_global_file_handles() in the child, avoiding
8-bit exit status truncation, and pausing ksmd before fork().

Patch 3 extends the selftest to verify that neither ksm_merging_pages
nor ksm_zero_pages is inherited across fork().

---
Changes in v3:
- Rename might_clear_ksm_zero_pte() to ksm_fork_pte() and refactor the
  PTE marker check and comments (David Hildenbrand).

- Add Tested-by tag from Karl Mehltretter to patch 1/3.

- Refine exit status handling and add ksm_pause() in patch 2/3 and patch
  3/3 to prevent races and 8-bit truncation (Sashiko AI).

Changes in v2:
- Encapsulate zero-page PTE marker clearing into a dedicated helper and document ksm_zero_pages fork behavior (David).
- Fix compilation error for !CONFIG_KSM and address initial KSM fork selftest bug fixes.

Xu Xin (vivo) (3):
  mm/ksm: do not inherit ksm_zero_pages counter or PTE markers on fork
  selftests/mm: fix false-positive and racy KSM fork test
  selftests/mm: verify ksm_zero_pages is not inherited on fork

 Documentation/admin-guide/mm/ksm.rst          |  7 ++-
 include/linux/ksm.h                           | 22 +++++++--
 mm/memory.c                                   |  5 +-
 .../selftests/mm/ksm_functional_tests.c       | 48 +++++++++++++++----
 tools/testing/selftests/mm/vm_util.c          | 16 +++++++
 tools/testing/selftests/mm/vm_util.h          |  1 +
 6 files changed, 85 insertions(+), 14 deletions(-)

-- 
2.34.1


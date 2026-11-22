Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373121;
	b=1u/DLUMfd+Atz7VPGih2ZX1EDdtLuifVSOEn9oULz0ExMciUlBtuNs6WEtF74IaAZZlV
	 VwkPHOqpnDS5Dbl/xanLs3n9EYPgfr35RAGdcNPHeZHAx4Ci035UGnhF9jwaL1MSg1hvq
	 GHvIV2rxzqLY26+TvAjocvTaUakeQO9+NziCc4SIZjwA1XHQ7zMQwn0V1sx+Vyg4LYTmY
	 jV+DjpWVM4vdHPA85JY10XpEmLaAhmxXBBlsncEcQuun3fOP+yPY4lQ85DbHZ/5x6ke/i
	 KAiu/BTYvQ0K2qyOmrphrJYM/va1vjkSbnzZ8IuONZ1IVIgriT+cZfne5vd3FfOwbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CO+pK6yVZkso6hm9r9Bht7g79ypAkq9rsogUtAB1SJQ=;
	b=Pz0CTHNmw+hfQOL/zhw57upC2k7dH2fmwiGU2WlF4GOw9oMuqPIRM6Bbp4EETadoB5ol
	 HAskt0NaHjMK+HAOHnwB1Dp70xPZtr8PfpqTXaEzGKYt/fqEIgsECb16AsamrMrUYVQlN
	 6s0+igmX37HtvJtJTfrtCeZZ4GjfLPTjTE63fOHxc1D8LSHRxg+gMTr4xXECH9o5UUiCt
	 jJW7oGjxtL47ooYFohoFchJnKNYQ2W0EgG5R/g+CtReOQGrfx55kx2UPb4fwyhYY8pci1
	 1PWYF+JukOzrww3dHkOkIqmN/kYwxnRhVr3TRTl1QDMzI/tGTfHwxnHUXptexI4Fxgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eeiu7EJ3;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995FA60A2617
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995FA60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eeiu7EJ3
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f040c6e0ceso25117235ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373120; x=1795977920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO+pK6yVZkso6hm9r9Bht7g79ypAkq9rsogUtAB1SJQ=;
        b=eeiu7EJ3Mgtf+j7V8oo3hH23jRRvTt02krro5/bmbwDMgk6O2SbEGbPhfsQWzgvQZX
         QK+2XEfih1zZgtXCVekX8ob4PudLm7ez1KaLrQBccd4p/IiVRDrc/aHwFPA6Kh4qDEW2
         +AwROZwndPHZjOLk1euC4OGCqu6U5atV8zD7wD/+z2UCwUimVRr5M/pnc/wu2mHO9sRQ
         vcXwnXREPFI83Vw754Kg7okD11/4QPZhLooRVY8ivyw6Fcbh+BRfqdWTilMczcMHMz8T
         qxd2llc3GUfY3JEFC9wrA4XoLcHGhMHuJsCfW4Gygn66HqdY0lqstQChqmwQRRPVIBVV
         Rh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373120; x=1795977920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CO+pK6yVZkso6hm9r9Bht7g79ypAkq9rsogUtAB1SJQ=;
        b=RTjnz9K6NCt/HLTpPUpGezsEJjjXzFlgmcMYJilhRTlG9alvNuZqQBbhVse3yokAy7
         GYgFZPdkD92pPfviN5p65J/jwydsvLsuEDCzfzs79TKe9WsniD8+pPWDZdEWculUy7Ec
         rXLAXBk0UZKQT/HaSgy2r9M/+UOW+T8U/9UqdHXpG+ZoQgnwEFJcUgeHiVFSaMfsg98h
         OTCOA7RYd8U2Bdax5JV+uT0A3l5DP1Ts/C03u34I8ot5XQebYpofPIwYviZptHl9Lt2Z
         AVWqm+1BOVJNNH+BfHUE7I4VLR6pa7bpK8hJqKHYoJA3NR5XFE9nxmk7GpbD5WH0rFSK
         hSNQ==
X-Forwarded-Encrypted: i=1; AL+hErFA3Pdot9tSmMYmnIeMwsBSZAtOXorBmSWH0kdOva8JN47Q8FDbTtLGOvdo4CgPW1OOK+FuvrE+EcAJ9o8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m/zQ5aR1H96kzhT0/y+8SEeki2hsaZaWJv6a6277wNN/0sMR4
	AXWOxA4ub8M0CieBuMpW+UD6tYEmhWBDqbwULKc8Bl2ieqCH9hdRxs8xiNPbQdoHy7wkkvihaOh
	3f6uCyOhkqRYod8bZtovjqg==
X-Received: from plwp12.prod.google.com ([2002:a17:903:248c:b0:2ed:8eec:6a11])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:db06:b0:2ef:efaa:17ae with SMTP id d9443c01a7336-2f03f1bacacmr79207885ad.71.1795373119804;
 Sun, 22 Nov 2026 10:45:19 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:53 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-20-jthoughton@google.com>
Subject: [PATCH v3 19/19 DO-NOT-MERGE] selftests/mm: Add HVO pmd-split fault
 injection tests
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Run the stress test with PMD splitting failure injection enabled (if
supported). Keep in mind that vmemmap PMDs are only ever split, never
collapsed back to PMDs, so run this step first, before the main stress
test.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
index b64fdb3ed761..d570df02a28d 100755
--- a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
+++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
@@ -4,13 +4,16 @@
 # Stress test for HugeTLB vmemmap optimization (HVO).
 #
 # Phases:
-#   1. accounting: allocate N hugepages, check that nr_memmap_pages +
+#   1. pmd-inject: churn the pool with fail_hugetlb_vmemmap_pmd enabled.
+#      Runs first because vmemmap PMDs are only split once, so later phases
+#      would leave few PMD splits to fail.
+#   2. accounting: allocate N hugepages, check that nr_memmap_pages +
 #      nr_memmap_boot_pages drops by exactly N * (vmemmap pages per folio - 1),
 #      then free them and check it returns to the baseline.
-#   2. stress: churn the pool (optimize/restore) while concurrently reading
+#   3. stress: churn the pool (optimize/restore) while concurrently reading
 #      struct pages (/proc/kpageflags, /proc/kpagecount), compacting memory,
 #      and optionally reading page_owner and offlining/onlining memory.
-#   3. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
+#   4. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
 #      both the optimize rollback and the restore (partial HVO) paths.
 #
 # After each phase the pool is drained back to its original size, memmap
@@ -284,7 +287,7 @@ cleanup() {
 	local blk t
 
 	stop_workers
-	for t in fail_hugetlb_vmemmap_pte; do
+	for t in fail_hugetlb_vmemmap_pte fail_hugetlb_vmemmap_pmd; do
 		[ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
 	done
 	if [ -f "$tmpdir/hotplug" ]; then
@@ -366,6 +369,7 @@ accounting_phase() {
 
 echo "$marker" > /dev/kmsg
 
+stress_phase pmd-inject fail_hugetlb_vmemmap_pmd
 accounting_phase
 stress_phase stress ""
 stress_phase pte-inject fail_hugetlb_vmemmap_pte
-- 
2.56.1.809.ga0b61035b5-goog


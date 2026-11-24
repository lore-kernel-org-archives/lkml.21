Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552207;
	b=2AlmuW2SG3I0UP3Knh5W30EQkb/4JnLpyvpuOvTeiMnqKVU/ObCGe2GIG25MdZg6wfJx
	 gV3Qr3CP3YbZraUiJ4IqqWLKBq7j6T8qDrUR4lflAlg5vApCxyvUrl2Z4eGhUr2yE2GDI
	 lcymlTonZachyKkbrcUq2sqqxuIN1RW05Q0YZcBKZMLm+BahMF6BMKXgJAwIo2IbzOjj5
	 ugFQCgTRjB1eW1S+vZfjMBZKTlFrf8ZgAUrzoWUZQ+QeIjpoUrhkgXB/wPpa/hCfuvsib
	 AAqGrrQmIIaSYYZJAWB5VS3q5ndHg+wEK2b4zYlhij9WAPRCZ4HGLPGisj0Uu8og/fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552207;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xnyGmrj10J5RwBUAZceA435lNcAGn9y5CnMDripWj1Y=;
	b=0OUMqz46ztuZhP5IQi3YxFbVyFCbhUegUvSWVfY03d+PxGkfnPM0MYtU1xMzSRlozxm3
	 enOqYw4h99JkowOik6rco8KTWYOrROzVdvUL2oIB+ogvky3zXMSDk3FlrXUGgB/O3XB6L
	 0RnmotoMy4p4FxoxMvE5e+90yD/vikkkW8BDSBTcJJ4B5yoOT3RIf0J13QdyRe8hz1qSh
	 hfMOsW/EdZTIhuc+f4nojBKsqFja7WSicUOiYCAxC/8ujWvoKvNLjg3F6n22OBj+jsYDP
	 6Qg73AFXDmLUldRcRFxE7UGpJFXeTQk3vAggE/LJ2phlnymK8+R+Ga64ZvByEvmPcMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzDkf1fO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24622606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzDkf1fO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DA11F000C6;
	Tue, 24 Nov 2026 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795552206;
	bh=xnyGmrj10J5RwBUAZceA435lNcAGn9y5CnMDripWj1Y=;
	h=From:Date:Subject:To:Cc;
	b=SzDkf1fOX+vDOKMcqHW9L3tvttsu1t8y3fiYRmJ+P/ebCuKXSRk+OvhssnbiieMo/
	 XKyjFV69ejz99n0GjOb6sJRYnLU5DIttUaTa5rw2f89dqm1H8ElARXo15HOCYcvy2n
	 KrP0sGg+PTvEtVz38/98Gj1y7+WHZz9mEiInCqGvj+ubG/k6QI/SlBt8YhJiUVuTMm
	 MBH6Qvd6bi1XBCe4DCLV9SmCOngdfKCLv7Vrap0Q0W2RHpqCSiwznPv8Vl7MAJGVhF
	 zSZkcSGkvye4G5kxFgpH8WnrwkLq/VU9TdYbGcr4daG+Bqxg4gADEP7CTkbYPt23F+
	 Dh6DaT2iqxJVQ==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 24 Nov 2026 21:29:47 +0100
Subject: [PATCH] acct: don't take the mmap lock to get the size of the mm
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
Message-Id: <20261124-work-acct-mmap_lock-v1-1-e054cc1ac082@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z3M3QrCMAyG4VsZOTbFFKfDW5EhbcxcnWtHO39g7
 N5tFTx8w5dngSTRSYJjtUCUp0su+By0qYB746+C7pIb9FbvifQOXyEOaJhnHEczne+BBySua9s
 dqCHTQP6conTu/VVP7a/Tw96E50KVhTVJ0EbjuS+ngqqCqj+qygTW9QOLlSrVogAAAA==
X-Change-ID: 20261124-work-acct-mmap_lock-1c55bf7181a8
To: linux-mm@kvack.org, David Hildenbrand <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-04696
X-Developer-Signature: v=1; a=openpgp-sha256; l=3174; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Y8qOCFZPncHQCacMit2UrGvUoJ8IyiyW5prp746fCkM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSzfj41VzNze31j5g6p3lssrfzPGRLeWPEsi1/6ZaGKk
 oDYlXNvOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACai8oPhv/91v1Nii+a65Eze
 o3B4G/vMRydeHJIqsiiJifedoVnfps3IcGya/a7s2hX2/DLZb3J4K14H7Nu8Q3Dbnz0rzXg9z0V
 +ZgEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

acct_collect() takes the mmap lock of the mm for the last thread of a
process and walks all of its vmas to add up their sizes. It does that
for every process that exits on a kernel with CONFIG_BSD_PROCESS_ACCT
whether anyone accounts or not.

The mmap lock is taken with mmap_read_lock(). So a task that exits waits
unkillably (violatin all kinds of grammar here probably) for a writer of
its mm in acct_collect().

I'm decluttering the exec path and moving all kinds of crap that people
do under exec_update_lock out of it and shrinking it's very annoying
existence.

Note that ac_mem can now be off by a mapping if the mm is shared with
another process that maps or unmaps something right then.

Luckily, acct() is deprecated and the mm keeps the sum of the sizes of
its vmas in mm->total_vm. That's what /proc/<pid>/stat reports as the
size of the mm and it doesn't take the mmap lock for it. So use it.

And fsck acct() and nommu, degrade it and use mm->total_vm there as
well. The total_vm is never lowered when a mapping goes away but who the
fsck uses acct() on nommu. And if they do, again, this is a deprecated
api.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
The quest to reduce the amount of unnecessary stalling that happens to
the exec codepath continues. Next victim, acct(). It has no maintainers
and b4 gives me zilch when to Cc so I'll just take the patch.

This makes acct_collect() get the size of the mm without taking the mmap
lock. A task that exits waits for that lock on every kernel with
CONFIG_BSD_PROCESS_ACCT whether anyone accounts or not and it can't be
killed there.

This degrades acct() but it's deprecated so let's do it.
---
 kernel/acct.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/kernel/acct.c b/kernel/acct.c
index c440d43479ca5..9b99313bcb619 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -549,6 +549,12 @@ static void do_acct_process(struct bsd_acct_struct *acct)
 	current->signal->rlim[RLIMIT_FSIZE].rlim_cur = flim;
 }
 
+/* The size of the mm in kB. */
+static unsigned long acct_vsize(struct mm_struct *mm)
+{
+	return READ_ONCE(mm->total_vm) << (PAGE_SHIFT - 10);
+}
+
 /**
  * acct_collect - collect accounting information into pacct_struct
  * @exitcode: task exit code
@@ -560,20 +566,12 @@ void acct_collect(long exitcode, int group_dead)
 	u64 utime, stime;
 	unsigned long vsize = 0;
 
-	if (group_dead && current->mm) {
-		struct mm_struct *mm = current->mm;
-		VMA_ITERATOR(vmi, mm, 0);
-		struct vm_area_struct *vma;
-
-		mmap_read_lock(mm);
-		for_each_vma(vmi, vma)
-			vsize += vma->vm_end - vma->vm_start;
-		mmap_read_unlock(mm);
-	}
+	if (group_dead && current->mm)
+		vsize = acct_vsize(current->mm);
 
 	spin_lock_irq(&current->sighand->siglock);
 	if (group_dead)
-		pacct->ac_mem = vsize / 1024;
+		pacct->ac_mem = vsize;
 	if (thread_group_leader(current)) {
 		pacct->ac_exitcode = exitcode;
 		if (current->flags & PF_FORKNOEXEC)

---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261124-work-acct-mmap_lock-1c55bf7181a8


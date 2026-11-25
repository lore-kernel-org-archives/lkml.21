Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627936;
	b=KAxB8LwuMZPV4FINsGtir4uqDWVVmcBh4AOKl8aP5xGRVcDawebCCrBcvv+UBy9ILMl7
	 lZTuLovdMnSWDL94ohQ+qMzPeI1vBQJq9N0yPZxk5PT569r0P0gBVRw2r7afPPo0yxdiX
	 skMwvjw7PYKpb2Vxsa7rw71pz1KBWUVT33CKd/mxQaHk0YUv/rIOpOC+ChOgVaP/LwFRU
	 1fMVbo3EvUU65GUT4Ti838wPTiu5UQwBbaMvlydTlWgr9+aMcoA14M3070RO1KeYVvIUf
	 6Y3Ta6x/MNUQOk+lNMaJoK0FJFjBIOfH/0zFrGWJiGxZYXe4f/LXlbRxgF/7NtN3XnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0HkGUAt0TkownVkXwCMu1x41EkVyymRWNHmR1Em1gck=;
	b=eK4uK7M8YaCylcmMvGqVhav+0B7TH0wDbGy3DwZGKS7EPBqI8P8FiSSNP/tV6yBFHq6T
	 qWuoq77qZlkGUMYF6IOw+kexHkJLjrm9ur+Iz4RFZDm4bYD5fAQXl9Lef9cPfPuLW6R+7
	 CsCKweWN5tyPpATL5ZrCQvF6RkiA157HXD2SLY8T9PAofq5N7o6ECGeYTJj9CRHVqLj5Z
	 fRy67aTQqRbXQYCqSCOTR/kX0RNdFfs/4sbapLb7/E2b5R5uNVDGCKEK8HUIncHYVBjMX
	 DJspC7yAuhiDBCFAY7bZ9aEQBEqpgXGo1MUYQFSHiKw2qZS3qHiR+EQqCCPUr5Q6AUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b="U165c6/a";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE2B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=U165c6/a
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4d543b6b6so35345947b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795627935; x=1796232735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HkGUAt0TkownVkXwCMu1x41EkVyymRWNHmR1Em1gck=;
        b=U165c6/aZO6PCaTP1gi0+DzvxzmItJj0Ii1VSWCGVKRW8JNwSeZHA1wUZ9q/eGLeYH
         yNjnw8VgP7iWrGEf4UAupDv4MdO1cE1AgLJrsy0/pXVU2mCQw6DF0kA5lJK+Ar5JfGMI
         B02AayfnZIkW8hp+6r07ZbH3pzuICVhRxBb0gULHaJNtSccZRZtyUqJk5Zl+AIH6h2JA
         u6mncC1Ay8v4ZmbBf3gXCHXviCIU27J2iUp0qN1P9oz+MOrDWY09qEGQcQp2XItCagzt
         i0A+zKJ/MCxXTqR0mpPbAPlYcP8v0Qg0PQ1jGG9tQqzCZsekk/Z7HTDvelaXgwbm3WC/
         DwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627935; x=1796232735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HkGUAt0TkownVkXwCMu1x41EkVyymRWNHmR1Em1gck=;
        b=YbSrjrjiSx6cvnBTQm58xgjCnkd/KvVU5S28L1Wlwrt++pd/D8cZy/Zos2pWCy2v0c
         7+4bM95jiPQ6A4Wvi904RVVPQHbp4Nz/LNUqR5DiQo3DrtdyrgZEvjMET5B4PVLkgQHN
         UJVc4D/qZuD/7Lm+Unr4BRnTCruuiEeUln1cpzu5PiRonYFxc0CToqXyrXTu/IEump7R
         fr2ryJCI0p3wkqVLrQQNS1jN8CqWG4UmjLEzOgsZkefr9cjW4mq/8WAgfKnO2cHx+UlD
         bxhGH9MfDfpuCkB9sWWuDovVIcU2WUuOsc0/5gvDoS5C0n+ClpxrJFrGCKIekWLo3K4e
         8sAg==
X-Forwarded-Encrypted: i=1; AL+hErHz0MYqzQ4ORZ9A9OFGNWlBGnccCX+TTM8n+J+eq/C9/jIobO7kdRHcc8px3tRLotMf0z0p3UbXUXMF78k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dTlAxXgPk7MJvmzHBoMVCW4zj7HCVW2oj18y2xK9GQdYJkuZW
	4z1DVhtF/JR266f5iyus+ogEijVJeJnMFYi49lG8ypwtQwKcztamWcM4FnClkPxOfg==
X-Gm-Gg: AZFdTZdn5N7P81ypUaADwWi+xDamIdRTJ+04zCMxsWGt4zXHcCiO+uk465ewhhYjUC4
	y4gXvo6e5FHhAK0fFmUO/TCbAUGi8GlC92hlORzQNRryCKMuIPHdaYTp6NJQlGNQ2uQrERbhdoy
	CNY6VhmiWX0CnFak07AMmLhLsFS5JRX2sTyM0JomwQUaN9iM6Adhjq3WGOttodApE1t8zrZ9Ugm
	JQliIdd577cm7ngAVuWBVkfC0aNdU8phUtNQLXQzSYqG5PiaqOQGNV/xAitqQ4LO86rmwjScTHD
	uJKrMrIFF4dMf2MU8eY5ewBsTya4ezFlGjhdanzsoI+Jq1NxL+w/yRRJtMOtSSmvt2RUp9GLmIT
	AJif3cKpSh3rzpvjult+jbBB2rojmDBI/VErhe+Z8sjn/1KfZptYmG6yzaRBWD/RD4Fmpe+ESXQ
	aKvZ+7qyD8PDoFJNGETh38eCLu8uWJq9B/5X3VQ03RQ2sEDfVvaIbe3jvAcW+B497SCEGYwTtuf
	kK9I+tRmYUy3hpO1Mv8NR5Kit1yzaYgABeBygqLzFRBBSUakE5be/O7F1j7RtDoteBiY6SP+Kt5
	q0A/VksNd3RNi/Q4kPYtZ2DT+FC2YSjvbD+JvwkOKkMNfI2ToODD
X-Received: by 2002:a05:690c:6988:b0:8b1:70be:d4d0 with SMTP id 00721157ae682-8b52047d511mr73732187b3.48.1795627934796;
        Wed, 25 Nov 2026 09:32:14 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030d5c3sm75406057b3.32.2026.11.25.09.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:32:14 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baoquan He <baoquan.he@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mm/gup: fault in ranges that start at address 0
Date: Wed, 25 Nov 2026 12:32:02 -0500
Message-ID: <20261125173202.3636133-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit a7797e74bd39 ("mm/gup: clean up codes in fault_in_xxx()
functions") made the loops of fault_in_readable(), fault_in_writeable()
and fault_in_safe_writeable() stop when the current address is 0, to
detect an overflow.

However, the loops then do not run at all for a range that starts at
address 0, and the functions report that nothing was faulted in. As of
now, a write() from a buffer at address 0 fails with EFAULT when the
page is mapped but not present yet.

The issue can be reproduced with this program, run as root:

    #include <fcntl.h>
    #include <stdio.h>
    #include <sys/mman.h>
    #include <unistd.h>

    int main(void)
    {
            int fd = open("file", O_WRONLY | O_CREAT, 0644);

            mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                 MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
            printf("%zd\n", write(fd, NULL, 7));
            return 0;
    }

Before commit a7797e74bd39 ("mm/gup: clean up codes in fault_in_xxx()
functions"), the result is:

    7

After that commit, the result is:

    -1

With this patch, the result is the same as before that commit.

This patch will stop the loops when the current address is below the
start address instead, which is only the case after an overflow.

Fixes: a7797e74bd39 ("mm/gup: clean up codes in fault_in_xxx() functions")
Cc: stable@vger.kernel.org # v6.16
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

Tested on v7.4-rc3 with KASAN and lockdep: with the buffer at address 0
and at 0x10000, on ext4, tmpfs and xfs, write(), pwritev() and O_DIRECT
reads and writes give the same results as before commit a7797e74bd39.

 mm/gup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 2b405cce2ca5..a174e93327e9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2074,7 +2074,7 @@ size_t fault_in_writeable(char __user *uaddr, size_t size)
 		return size;
 
 	/* Stop once we overflow to 0. */
-	for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
+	for (cur = start; cur >= start && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
 		unsafe_put_user(0, (char __user *)cur, out);
 out:
 	user_write_access_end();
@@ -2144,7 +2144,7 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
 
 	mmap_read_lock(mm);
 	/* Stop once we overflow to 0. */
-	for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
+	for (cur = start; cur >= start && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
 		if (fixup_user_fault(mm, cur, FAULT_FLAG_WRITE, &unlocked))
 			break;
 	mmap_read_unlock(mm);
@@ -2176,7 +2176,7 @@ size_t fault_in_readable(const char __user *uaddr, size_t size)
 		return size;
 
 	/* Stop once we overflow to 0. */
-	for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
+	for (cur = start; cur >= start && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
 		unsafe_get_user(c, (const char __user *)cur, out);
 out:
 	user_read_access_end();

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949469;
	b=D+ce3+G9hWdVxrt6QHThh22t/3QYu4j7cSoySQcssHCyW70XqOCG52Z/dnGcl4GeW7OG
	 a1Hllmxa15fh4yRPxFTodL5QfeCQbeNfyf02acsEbROV0m32F3S9axCsVj6/446QHudw5
	 Q5zY39iRGrIpSenfUoYDlZFB3bd6cjDk6Ll1bUwK6igAt4GwuO3SOKe1uzveSqwTynsDy
	 RjMgGsWN08DQs3kyiOyDYG07bDX9BTJXI+k/p1076uJ6vv2l629MXvq8I38s2BujEn23h
	 CJpNUMnWLmMtdAxynR/lpASV5Xz35g3LNaX37mfxOXScyoztmEfKKfxFMa0J7Vek9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DClN/PQCUc+e7hhJbYiQYreXFIiImxiZvex/Oaj/4wo=;
	b=29gSG7yrM7+oyM0McufPwKtIMRXwCJbX6QRDLHVL6iaUezhsqtugB/u6PYAkA2TImuS9
	 OTbqR/3mkYGsz7nKD+3md8p1J9+tG6jpoCQDjlKFy8oxT6ebnLYyUnOf1WDzrXQqh5tLF
	 9gSOCH3sY2q+iihkpBqBMK94Mwv0aGRWc4yVep+hWYVbBUQHz2C+TFT9fhfRCpe6wqGNf
	 1JhcN0JBECnNtHPI9jO3bXuK8zFCqVDuikwV72N5oKWa+I/GYTif1+Pn1YyQKHXcaPeX1
	 C6eZCbwXAIgsH5uuun/fwqZc6Y/rL0GR8k7wEPOuYDk6ERKLBV8n6GGNUYZJUrk0Z0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdlF3F6h;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CB8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdlF3F6h
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so3173865e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949467; x=1795554267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DClN/PQCUc+e7hhJbYiQYreXFIiImxiZvex/Oaj/4wo=;
        b=hdlF3F6hlfaTBcKaXU98op7XPtSwO/hzqXy092m1pZkq+0XvRDWhrsMvWpEJ4h/5yT
         +4DPeis7eUTjKpfu6XnnpWYxw6fWV4WI1W9R5jaOq7pNcTtxYSBBV+7BjWL9f0HPDTsW
         ebFdOdO9dAqqhJ+s/AQOalJI01E7xMmRzihIhJoWtPMK4s5bCPUqfKraGDNltcUD8tQ0
         ByNbxT8se7e+55rxgLw/Q4MNztinCCyW7jqaDChLLn8Mm6ETqKd/rlajfHLcNswO5G0B
         hTFThcE28oaGqjcdgMJAQbhPJNO+ylrIW43whoD104Ki7EIZd6gzu5h7/qiJ7qLyrDzB
         VVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949467; x=1795554267;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DClN/PQCUc+e7hhJbYiQYreXFIiImxiZvex/Oaj/4wo=;
        b=xDuBxNE1WfOCfkSxjTy9gMCGqgPMNfSjIwpkbnapZci+SG7eNDPkBcR5/xPm2lb08C
         lGrfzBhi9OB+ZMkYcfqqDiARh8J4d4ElBQY+bW6ntVHg7tnIXL5tlQapt3COjnj8pu2h
         uOPjBsIHsvsr85wLAVCuFeShwrn3TZWA+VbXiDmP6D+S0JBMDZHxnA1ozrYVdfpOH/mp
         KWD4ldWDc9emI7OGVmDAQESzIlITA4jfTTiFhz0uCxNjcc8Olo9lL3MeTMZoqZ1WMthJ
         ZCtXMVdqzY5Y3JZNBm26DcZQm8gCUHOcRcWnSD4mNHbiY1uIW6y/RToKJzFQu0/Z1yp+
         fyMQ==
X-Forwarded-Encrypted: i=1; AL+hErEVEsGp2VdkVSKRNn3DFX4G7R7GrxkJz0VJ+gGBhJ8IWR49ANEt7ksCR8cXG+qnkYH3MzTRJ9yO51Xk2aY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hMW8+yN/bu5MhT/vFNQ++DAWm5Dr8cBYqp2C3I029W9eVmVHp
	DMJrAvwHEvNko8WIHYimZZ7vA3UTqonI63aBl4ZE+qRA8VUVOmJ7TCCC
X-Gm-Gg: AYBFou1nNbLBjDNGdhJL+oAOe1fkteW/Q7kr7KzpfpTX8bvxZ4MRq8OG7ntTMhbZUNT
	F+rIW4uVd5hhcUTEqY9SH/0aKkI5mrDPCQRHnfV1LGPrpjEFXRh9/EojUZsYxnvBhacaUmMj/zc
	iPMEmlhAB86g2DnDt1EPxspJz2qOFrdcdxf5kDSDR9Q0cgiST3ht0AbHuTKNK6sVPhcA+Hk9IRg
	uxJ3m1LAwRAS9bwv4aboL8CoXYhOMLINw0uQHtAWokthWJZN+Z+XoAZrsGpHMls/4ovxTV7fuyB
	xHXH8tcI9r9Q3HP3hZPNqNzFMntb28zJoo2iAtsdKeRnrhdZKO3y1jQoHq3YedicQRo35tbbc/y
	I/W59ulMBKlgRUD63hEldRZM0JV4C63JfvkvlSQOOa/q21GD9WR5ermmtTUFBwxwEoruJQ9Ld3m
	L/UqbzXKy6gt3vRC+SxSLkCmOp88Cl39oaJ+pRygMHSRZrFhSOrrOugulg+SajG9WPuKp/k02ul
	tm6JHsfizlggD+O6cUkzsm3BOg415lvqPwLi0JUNOtFQHC2LxpO0t3Wd+VGzqOqsHUWchVrDP63
	uHO4gWXuD4TSh+uNhD40Xa5RSclrGI/nzD8=
X-Received: by 2002:a05:600c:6208:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb7da46178mr7111145e9.31.1794949467262;
        Tue, 17 Nov 2026 13:04:27 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ddd4614sm3902895e9.6.2026.11.17.13.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:04:26 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Peter Xu <peterx@redhat.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	Tal Zussman <tz2294@columbia.edu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3] Documentation/userfaultfd: document RWP behavior when the PTE is dropped
Date: Tue, 17 Nov 2026 22:04:10 +0100
Message-ID: <20261117210423.11598-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Scope of protection" lists only the PTE drops requested by the user and
says the range has to be re-armed afterwards. On shmem the kernel can drop
the PTE at any time (page reclaim and collapse are examples), and RWP has
no marker by design: the next access is a minor or a missing fault, and
the user is expected to register for those. Document this, together with
the modes that sync and async tracking need.

The VMM example registers guest_mem with RWP and MISSING only, so a vCPU
write to an offset that is not mapped there can be lost during eviction.
Add MINOR to the registration, describe how the handler treats faults on
offsets that are being evicted, and fix the step 1 comment, since minor
faults block even in async mode.

Link: https://lore.kernel.org/linux-mm/856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org/
Link: https://lore.kernel.org/linux-mm/avWnaR7VVEGa7yNp@thinkstation/
Suggested-by: Tal Zussman <tz2294@columbia.edu>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v3:
- registration is not fixed. MINOR can be added before switching to
  sync and dropped after switching back

Changes in v2:
- keep the migration sentence out of the anonymous-only paragraph, it
  applies to shmem and hugetlbfs too, and say "uffd bit", not "marker"
- state the rule instead of listing the operations that drop the PTE
- say that a context switching to sync with UFFDIO_SET_MODE needs the
  sync registration, and fix the step 1 comment, since minor faults
  block in async mode
- add {} around the comment-only if body in the example
- make RWP and minor faults on any offset this pass will evict wait
  until that offset is punched

v2: https://lore.kernel.org/20261116101004.15322-1-azpijr@gmail.com
v1: https://lore.kernel.org/20261113112806.109578-1-azpijr@gmail.com

 Documentation/admin-guide/mm/userfaultfd.rst | 89 ++++++++++++++++----
 1 file changed, 71 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
index 97daea83b7f1..cdc92b40aa65 100644
--- a/Documentation/admin-guide/mm/userfaultfd.rst
+++ b/Documentation/admin-guide/mm/userfaultfd.rst
@@ -384,17 +384,54 @@ normal missing path (``do_anonymous_page()``, ``do_swap_page()``,
 the population itself, co-register the range with
 ``UFFDIO_REGISTER_MODE_MISSING``.

-Protection is preserved across page reclaim: a page swapped out while
-RWP-protected carries the marker on its swap entry, and swap-in restores
-the PROT_NONE state so the first access after swap-in still faults. The
-same applies to pages temporarily replaced by migration entries.
-
-Operations that drop the PTE entirely — ``MADV_DONTNEED`` on anonymous
-memory, hole-punch on shmem, truncation of a file mapping — also drop the
-RWP marker: the next access re-populates the range without protection.
+Protection is preserved while a page is temporarily replaced by a
+migration entry: the migration entry keeps the uffd bit, and the PROT_NONE
+state is restored when migration completes. This holds for anonymous,
+shmem and hugetlbfs memory alike.
+
+Protection of anonymous memory is also preserved across page reclaim: a
+page swapped out while RWP-protected keeps the uffd bit on its swap entry,
+and swap-in restores the PROT_NONE state so the first access after swap-in
+still faults.
+
+Any operation that drops the PTE also drops the RWP protection. On shmem
+the kernel can drop the PTE at any time while the page stays in the page
+cache or in swap; page reclaim and collapse into a huge page are examples.
 Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``), there is no
-persistent RWP marker today. The user needs to re-arm the range with
-``UFFDIO_RWPROTECT`` after any operation that explicitly frees PTEs.
+persistent RWP marker, and this is intentional: once the PTE is gone, the
+next access takes a page fault that userfaultfd can deliver, and that fault
+is the notification. Which fault it is depends on what happened to the
+page:
+
+- The page is still in the page cache or in swap: the access is a minor
+  fault, delivered if the range is co-registered with
+  ``UFFDIO_REGISTER_MODE_MINOR``.
+
+- The page is gone: the access is a missing fault, delivered if the range
+  is co-registered with ``UFFDIO_REGISTER_MODE_MISSING``.
+
+WP cannot use the same scheme — a minor fault would trap reads as well as
+writes — which is why it needs a marker.
+
+Without the matching mode the page is mapped back silently and without
+protection, so what to co-register depends on the tracking mode:
+
+- Sync mode: the access would be lost. Co-register shmem and hugetlbfs
+  ranges with ``UFFDIO_REGISTER_MODE_MINOR`` (and
+  ``UFFDIO_REGISTER_MODE_MISSING`` if the file can have holes), and
+  anonymous ranges, where minor faults are not available, with
+  ``UFFDIO_REGISTER_MODE_MISSING``.
+
+- Async mode: neither is needed. A page faulted back in is mapped without
+  the uffd bit, so ``PAGEMAP_SCAN`` reports it as accessed.
+
+The registration does not follow the tracking mode: a context that
+switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below
+does, needs ``UFFDIO_REGISTER_MODE_MINOR`` while it is in sync mode.
+Minor faults are always synchronous, so keeping it registered makes
+them block in async mode as well. Re-registering the range to add
+``UFFDIO_REGISTER_MODE_MINOR`` before switching to sync, and to drop
+it after switching back, avoids that.

 **Fault Handling:**

@@ -484,17 +521,24 @@ never traps on its own ::
         .features = UFFD_FEATURE_RWP | UFFD_FEATURE_RWP_ASYNC,
     };
     ioctl(uffd, UFFDIO_API, &api);
-    if (!(api.features & UFFD_FEATURE_RWP))
+    if (!(api.features & UFFD_FEATURE_RWP)) {
         /* RWP unavailable on this kernel/arch -- fall back. */
+    }
+    /*
+     * MINOR: an offset in the page cache but not mapped in guest_mem
+     * would be mapped back without a fault, and a vCPU write between
+     * the pwrite() and the hole punch in step 4 would be lost.
+     */
     ioctl(uffd, UFFDIO_REGISTER, &(struct uffdio_register){
         .range = { guest_mem, guest_size },
         .mode = UFFDIO_REGISTER_MODE_RWP |
-                UFFDIO_REGISTER_MODE_MISSING,
+                UFFDIO_REGISTER_MODE_MISSING |
+                UFFDIO_REGISTER_MODE_MINOR,
     });

     /* Tracking loop */
     while (vm_running) {
-        /* 1. Detection phase (async -- no vCPU stalls) */
+        /* 1. Detection phase (RWP faults async, minor faults still block) */
         ioctl(uffd, UFFDIO_RWPROTECT, &(struct uffdio_rwprotect){
             .range = full_range,
             .mode = UFFDIO_RWPROTECT_MODE_RWP });
@@ -544,11 +588,20 @@ never traps on its own ::
                   .enable = UFFD_FEATURE_RWP_ASYNC });
     }

-During step 4, a vCPU that accesses a ``guest_mem`` offset being evicted
-blocks with a ``UFFD_PAGEFAULT_FLAG_RWP`` fault while the eviction is in
-progress. After ``fallocate()`` punches the page out and ``UFFDIO_WAKE``
-fires, the vCPU retries the access, faults as ``MISSING``, and the
-handler resolves it with ``UFFDIO_COPY`` from storage.
+During step 4, a vCPU that accesses an offset this pass will evict blocks
+with a ``UFFD_PAGEFAULT_FLAG_RWP`` fault, or with a
+``UFFD_PAGEFAULT_FLAG_MINOR`` fault if the offset is not mapped in
+``guest_mem``. The handler leaves the fault pending until that offset has
+been punched out, even if step 4 has not reached it yet: resolving it
+earlier would let a vCPU write land between the ``pwrite()`` and the hole
+punch, and the write would be lost. After ``fallocate()`` punches the page
+out and ``UFFDIO_WAKE`` fires, the vCPU retries the access, faults as
+``MISSING``, and the handler resolves it with ``UFFDIO_COPY`` from storage.
+
+Faults on any other offset are resolved right away: RWP faults with
+``UFFDIO_RWPROTECT``, minor faults with ``UFFDIO_CONTINUE``. A page mapped
+by ``UFFDIO_CONTINUE`` does not carry the uffd bit, so the next scan reports
+it as accessed.

 This workflow targets shmem and hugetlbfs (both support a private
 ``io_mem`` mapping over the same fd). Anonymous-memory backings need a
--
2.56.0


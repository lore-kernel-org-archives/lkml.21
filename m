Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692253;
	b=bqpEXiifP4iO0wCL+emojTBe9iQCyVBM3zdfvTUO3/sQWbywv6yV0zmZtmqEkb2HW9ki
	 2Mk9Ij4jt0hDJK2Uan27z2+WA8iA122upQd4MXd/V3TSgPSDV5/oD2B2NSHbUlF+KCUTj
	 7CLxS7W7S25DUuZsv6A2DMSU0VQodypNpOjPERFs7tD942CBeubhBrR0PP7v/wqOAVwRa
	 QJaQ5/nuvXJ+rTKTENX/y8I4n0eBbRxvR9cKppuYyUXLf4qa0s34pxaQjppfHkiBBpvg4
	 NwsgfiHcBF5YeLUaGuXTkLp0mRTCD7WgfWz9c0iMfXD8H6i+0ndNv+nNpWOy1JbHGTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4pybaJWOYATzjxGLb9cErHkeo8s2H2qhxpYP8imBTS0=;
	b=nj58nFaPWELOhChShK7hsrmUccVPJQzq+AK6DDG2EbombrHsYPtEcIPOIysypUDQS+Ia
	 H1v13sliszx67Sn5h5vxhPDh7agMkW+GrcvljWhIh5fSyvhmKjDHtHx1MXUF4OGllH+DP
	 negco56q8M2dJIPJ5wvffgbEcnDt2gUXZqJP/iOz6Ge3Q5cQfulsh4D9ZNiCfJI46zbKa
	 hMQdYaXrCNpEpaYyTBb6nj+G9Xw/DCumomGNxtDggGwDcAQov0BAfa/4v5+Qdl2hVIAQY
	 hUyoQb5r5pyJcBJrc9lX2+JP5yeU7uwsjx4mR9ktFh/zXwcpQnFVeXy78T/3i7xN/PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u1w1Brv/";
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5703606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5703606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1w1Brv/
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso5605102c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795692252; x=1796297052; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4pybaJWOYATzjxGLb9cErHkeo8s2H2qhxpYP8imBTS0=;
        b=u1w1Brv/LxN7sw6ba7ihHev4i+3x17Er1ovBTUGWKwN2RA/R8aDnJRwsygmgUPn9kr
         tO6arAqmA8EydQov6rSFXE/VvuDkJivjI9CvX1FNCd6CUGsqQHVzGhD9laTH2UTyod+B
         7SjapzB4IAckdfYglrUrRB3d9PT+doEMkcirG+q7+jouBrEGkXAUotvgMBeCk+B3JLji
         P3caTYaVkDigyv4zBhFoGN/9kS/W8u0AwsctbV0SotPdFeLAG58xWlFp8Y7hTn2ueF13
         zUuCpGM6s+OXVUTCG54yUpBC1G04moXZZZftsscm7WhFj2d5Q0kZuENWkIr/+zxWHVky
         YBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692252; x=1796297052;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4pybaJWOYATzjxGLb9cErHkeo8s2H2qhxpYP8imBTS0=;
        b=d8MmYKOXBS6V2yZ889C2TXLHzhO6E8Z8ldgIrNjVguWfM8irqeW9z7YdyxJ8BnWbQE
         C+g1Ke9T/iuWzu0U5Fogs2UHs2hbVW6ZURxgUJDLOF8SNdf/3AhI0lffOGVgRIHKA7cc
         g8O3PVcA2q7VB+SG0/GVjeSY1HMvpP1cfXmhtiF/B8NmSR8zYKSa9FZWWc43hGbYTc1D
         R5F8EuB5Vwv3xw/Uq+W9wMXNq7/bg9hL7dp7y7DoMLFxpHhPFaSIZMPtKJujVLXE3NfM
         yLtn2+bzVYdbYSlWzWOoDG1hqooOcoRPzbgp0XKaHuMnVBA8rUPaLEVF452nn7bGGWZ/
         HUsA==
X-Forwarded-Encrypted: i=1; AL+hErGQo2XlnHtUkWNEXDLPCSvtp/wkmfT3JDA2FjLDl0ibsw4D8ODeKJOtu4ymCnrtP1DlERIyS4AM9DCT1JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z90WwEfJ7Ig6duAyG09EHxrmSQ2QOIOpNm48XUQtkK1mjOmz8MV
	lXWhjJlIT7SLZWpCyoFReOZ2cnOJ8M/nJSpziPrltHiJa5ynhBgvcyz9
X-Gm-Gg: AZFdTZfaajBeNwMEpDToiOk5Pd6iTzxI6nfmqZc4pTfax14nKrbSTQ8cTjvGyP7Seb6
	RC/rBbrwZPUcNQNiCcZJwTqWuR+7w1lijYxqGzFW28jo4m931AaBx3i2i399sO3z0CKJAR09cmf
	720iuesL6FB2xdBapzwI9k9FbMYyOtCSuF77Pa4WyfvA4WDHQ9TvcQQZbMb7XqpRuQ9c6KkLH9y
	ViirOpzb3r8V8zEUXdIOnYtS9oNnsIPIDBRWVZOfpxFaIU9MgcFcXihKmkxkHQJSCP6hiCdoHzh
	ec2L6IwXMnAZ3EMF1Rf3JRFLGloBG7O8IZuyc9xXwamHQTV1GOs+OJGlNuujJ5QvtKGfw2rkKIn
	hkN9nWY4BSOhKctj3Rqw0vdWEfJIVBUJvx5qYAYAGlMfCXqNWNhEQ3SnYeEUABUzXQv+AQxtpMw
	gLunGLGMS6rjSvd+z7Qw2bVHPEVq5gOrdRj53lLzA12kvROJz1vlV/FQHL1pMJXu7MfDJ4EBaUW
	MH1hUzWevPK/s56QgqGX8DwRoIon6j3dgYkFYGnczbu9TuMHz967IsDWqsH57YEG86ti/WjqqvF
	XjrP1ggZJ25PyJx1jPbrqyPWFCRUroSrqqhU3VCvItGK0puPgFtXYnNC4bnNt3eULTuSmpYSQuj
	hD3sM3euxbW9/Yg+qep2+bT7iP9Rv2RZX8SsmWoPihsZAguGL0+rXwncro8YvfRoeIqfXRTo=
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr24115654c88.12.1795692251699;
        Thu, 26 Nov 2026 03:24:11 -0800 (PST)
Received: from [10.131.38.181] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm57757266c88.7.2026.11.26.03.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:24:11 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 26 Nov 2026 22:21:59 +1100
Subject: [PATCH] tools/mm: add a drgn script to show HugeTLB reservations
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
Message-Id: <20261126-hugetlb-resv-drgn-v1-1-345a6ee7c08c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WMywrCMBBFf6XM2kETJCn+irjIY/IQiTJpS6H03
 01UcHku554NKnGmCpdhA6Yl1/wsDcRhAJdMiYTZNwZ5kkoIqTDNkaaHRaa6oOdY0GmldVBhHM8
 e2u/FFPL6aV5vX66zvZObeqgb1lRCy6a41Kdf8vhPdgH2/Q3KJf1sngAAAA==
X-Change-ID: 20261126-hugetlb-resv-drgn-c7677f6f884d
To: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
 Karl Mehltretter <kmehltretter@gmail.com>, 
 Ackerley Tng <ackerleytng@google.com>, Zhao Li <enderaoelyther@gmail.com>, 
 Jinmeng Zhou <zhoujinmeng@bytedance.com>, linux-mm@kvack.org, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 linux-kernel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>
X-Mailer: b4 0.16.0

Add a drgn script, show_hugetlb_resv.py, to show where HugeTLB
reservations are held in a live kernel or vmcore.

HugePages_Rsvd in /proc/meminfo only reports the global reservation
count for the default huge page size. It cannot show which files,
private mappings or hugetlbfs mounts hold those reservations, or whether
a subpool is below its minimum.

The script walks those objects per huge page size, compares their
reservations with resv_huge_pages, and checks subpool minima separately.
It reads internal hugetlb and hugetlbfs structures, so keeping it in
tools/mm/ lets it be updated alongside them.

Usage:

  drgn -c vmcore -s vmlinux tools/mm/show_hugetlb_resv.py [--json]
  drgn -k tools/mm/show_hugetlb_resv.py [--json]

Output from a vmcore taken before commit e4949a80f3b0 ("mm/hugetlb: fix
subpool minimum reservation rollback"). All three reserved pages are
attributed, but the mount is one page below its four-page minimum:

  source=dump status=mismatch (counts in huge pages)

  2048 KiB: nr_huge_pages=4 free_huge_pages=4 resv_huge_pages=3
    inode_resv=3 private_resv=0 mounted_resv=0
    attributed=3 unattributed=+0 resv_floor=4 floor_shortfall=1
    sb=0xff11000004000000 path='/huge' min_hpages=4 rsv_hpages=0
      min_shortfall=1 used_hpages=3
      ino=191 name='a' resv_map_pages=3 instantiated=0 outstanding=3

With the fix applied, the same test leaves rsv_hpages=1 and no
min_shortfall.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
I wasn't sure where a script like this belongs, so I followed
tools/mm/show_page_info.py for the placement and MAINTAINERS entry.
Any feedback is welcome :)

I also used this while debugging the subpool rollback race below, where
min_shortfall caught a two-page deficit even though the global and
attributed counts agreed:

https://lore.kernel.org/linux-mm/20261126-hugetlb-subpool-pending-v1-1-e1831a48f19c@gmail.com/

Tested with drgn 0.3.0 on x86_64 QEMU vmcores (7.3-rc5 and
7.4-rc3-based mm-unstable) and live (-k) on a 7.4-rc3-based guest.
---
 MAINTAINERS                   |   5 +
 tools/mm/show_hugetlb_resv.py | 423 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 428 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c06967640fd..ca997da3210c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12353,6 +12353,11 @@ F:	drivers/power/supply/huawei-gaokun-battery.c
 F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
 F:	include/linux/platform_data/huawei-gaokun-ec.h
 
+HUGETLB RESERVATION DEBUG SCRIPT
+M:	Aveline Noir <jm5905938@gmail.com>
+S:	Maintained
+F:	tools/mm/show_hugetlb_resv.py
+
 HUGETLB SUBSYSTEM
 M:	Muchun Song <muchun.song@linux.dev>
 M:	Oscar Salvador <osalvador@suse.de>
diff --git a/tools/mm/show_hugetlb_resv.py b/tools/mm/show_hugetlb_resv.py
new file mode 100755
index 000000000000..c7af158a3965
--- /dev/null
+++ b/tools/mm/show_hugetlb_resv.py
@@ -0,0 +1,423 @@
+#!/usr/bin/env drgn
+# SPDX-License-Identifier: GPL-2.0-only
+"""Show where HugeTLB reservations are held, per huge page size.
+
+For each huge page size, compares resv_huge_pages against hugetlbfs
+inodes, private owner VMAs and unused subpool reserves, and flags
+subpools below their minimum.
+
+Exit status: 0 ok, 1 mismatch, 2 incomplete scan.
+"""
+
+import argparse
+from collections import defaultdict
+from contextlib import contextmanager
+import json
+import stat
+import sys
+
+from drgn import Object, ProgramFlags, cast, container_of
+from drgn.helpers.linux.fs import mount_dst, super_block_for_each_mount
+from drgn.helpers.linux.hugetlb import for_each_hstate, huge_page_size
+from drgn.helpers.linux.list import (
+    hlist_for_each_entry,
+    validate_list_for_each_entry,
+)
+from drgn.helpers.linux.mm import for_each_vma
+from drgn.helpers.linux.pid import for_each_task
+
+# Preprocessor macros in mm/hugetlb.c.
+HPAGE_RESV_OWNER = 1
+HPAGE_RESV_MASK = 3
+
+
+def error_text(err):
+    return f"{type(err).__name__}: {err}"
+
+
+@contextmanager
+def record_errors(issues, what):
+    try:
+        yield
+    except Exception as err:
+        issues.append(f"{what}: {error_text(err)}")
+
+
+def file_regions(resv_map):
+    if resv_map.adds_in_progress:
+        raise ValueError("resv_map update in progress")
+    head = resv_map.regions.address_of_()
+    for entry in validate_list_for_each_entry("struct file_region", head,
+                                              "link"):
+        rg = entry[0].read_()
+        yield int(rg.member_("from")), int(rg.to)
+
+
+def read_inode(inode, hpage_size):
+    info = container_of(inode, "struct hugetlbfs_inode_info", "vfs_inode")
+    resv_map_pages = sum(
+        to_idx - from_idx
+        for from_idx, to_idx in file_regions(info.resv_map.read_())
+    )
+    instantiated = int(inode.i_blocks) * 512 // hpage_size
+    # Internal SysV shm and memfd inodes still carry a dentry name here.
+    name = None
+    try:
+        alias = inode.i_dentry.first.read_()
+        if alias:
+            dentry = container_of(alias, "struct dentry", "d_alias")
+            raw = dentry.d_name.name.string_()
+            name = raw.decode("utf-8", "backslashreplace")
+    except Exception:
+        pass
+    res = {
+        "inode": int(inode),
+        "ino": int(inode.i_ino),
+        "name": name,
+        "resv_map_pages": resv_map_pages,
+        "instantiated": instantiated,
+        "outstanding": resv_map_pages - instantiated,
+    }
+    if instantiated > resv_map_pages:
+        res["outstanding"] = None
+        res["excess"] = instantiated - resv_map_pages
+    return res
+
+
+def subpool_limits(spool):
+    min_hpages = rsv_hpages = 0
+    max_hpages = used_hpages = min_shortfall = None
+    if spool is not None:
+        if spool.min_hpages != -1:
+            min_hpages = int(spool.min_hpages)
+            rsv_hpages = int(spool.rsv_hpages)
+        if spool.max_hpages != -1:
+            max_hpages = int(spool.max_hpages)
+            used_hpages = int(spool.used_hpages)
+            min_shortfall = max(0, min_hpages - used_hpages - rsv_hpages)
+    return {
+        "min_hpages": min_hpages,
+        "rsv_hpages": rsv_hpages,
+        "max_hpages": max_hpages,
+        "used_hpages": used_hpages,
+        "min_shortfall": min_shortfall,
+    }
+
+
+def init_ns_mount_path(sb):
+    try:
+        init_ns = sb.prog_["init_task"].nsproxy.mnt_ns.read_()
+        for mnt in super_block_for_each_mount(sb):
+            if mnt.mnt_ns == init_ns:
+                return mount_dst(mnt).decode("utf-8", "backslashreplace")
+    except Exception as err:
+        print(f"warning: mount path for sb {int(sb):#x}: {error_text(err)}",
+              file=sys.stderr)
+    return None
+
+
+def collect_superblock(sb, sbi, mounted_spools, issues):
+    spool_ptr = sbi.spool.read_()
+    mounted_spools.add(int(spool_ptr))
+    limits = subpool_limits(spool_ptr[0].read_() if spool_ptr else None)
+    h = sbi.hstate.read_()
+    hpage_size = int(huge_page_size(h))
+    # The list walker can yield an inode twice before it detects a cycle.
+    inodes = {}
+    with record_errors(issues, f"sb {int(sb):#x} inode list"):
+        head = sb.s_inodes.address_of_()
+        for inode in validate_list_for_each_entry("struct inode", head,
+                                                  "i_sb_list"):
+            try:
+                if stat.S_ISREG(int(inode.i_mode)):
+                    inodes[int(inode)] = read_inode(inode, hpage_size)
+            except Exception as err:
+                issues.append(f"inode {int(inode):#x}: {error_text(err)}")
+    return int(h), {
+        "sb": int(sb),
+        "path": init_ns_mount_path(sb),
+        **limits,
+        "inodes": list(inodes.values()),
+    }
+
+
+def hugetlbfs_superblocks(prog, mounted_spools, issues):
+    by_hstate = defaultdict(list)
+    with record_errors(issues, "hugetlbfs superblocks"):
+        head = prog["hugetlbfs_fs_type"].fs_supers.address_of_()
+        for sb in hlist_for_each_entry("struct super_block", head,
+                                       "s_instances"):
+            with record_errors(issues, f"sb {int(sb):#x}"):
+                sbi = cast("struct hugetlbfs_sb_info *", sb.s_fs_info.read_())
+                if not sbi:
+                    continue
+                hstate_addr, sb_info = collect_superblock(sb, sbi,
+                                                          mounted_spools,
+                                                          issues)
+                by_hstate[hstate_addr].append(sb_info)
+    return by_hstate
+
+
+def owner_vmas(task, mm, vm_hugetlb, vm_mayshare, base_page_size):
+    tgid = int(task.tgid)
+    comm = task.comm.string_().decode(errors="replace")
+    for vma in for_each_vma(mm):
+        flags = int(vma.vm_flags)
+        if not flags & vm_hugetlb or flags & vm_mayshare:
+            continue
+        # Fork clears the child's copy of the pointer; the parent stays owner.
+        tagged = int(vma.vm_private_data)
+        if not tagged & HPAGE_RESV_OWNER:
+            continue
+        resv_map_addr = tagged & ~HPAGE_RESV_MASK
+        inode = vma.vm_file.f_inode.read_()
+        sb = inode.i_sb.read_()
+        h = cast("struct hugetlbfs_sb_info *", sb.s_fs_info).hstate.read_()
+        order = int(h.order)
+        vm_start, vm_end = int(vma.vm_start), int(vma.vm_end)
+        # Half-open [from_index, to_index) in huge-page offsets.
+        from_index = int(vma.vm_pgoff) >> order
+        vma_pages = (vm_end - vm_start) // (base_page_size << order)
+        yield int(h), {
+            "tgid": tgid,
+            "comm": comm,
+            "mm": int(mm),
+            "vm_start": vm_start,
+            "vm_end": vm_end,
+            "inode": int(inode),
+            "sb": int(sb),
+            "resv_map": resv_map_addr,
+            "from_index": from_index,
+            "to_index": from_index + vma_pages,
+            "vma_pages": vma_pages,
+        }
+
+
+def private_mappings(prog, issues):
+    by_resv_map, vmas_by_hstate = defaultdict(list), defaultdict(list)
+    seen_mms = set()
+    with record_errors(issues, "private tasks"):
+        vm_hugetlb = 1 << int(prog.constant("VMA_HUGETLB_BIT"))
+        vm_mayshare = 1 << int(prog.constant("VMA_MAYSHARE_BIT"))
+        base_page_size = int(prog["PAGE_SIZE"])
+        for task in for_each_task(prog):
+            try:
+                mm = task.mm.read_()
+                mm_addr = int(mm)
+                if not mm_addr or mm_addr in seen_mms:
+                    continue
+                seen_mms.add(mm_addr)
+                for hstate_addr, vma in list(owner_vmas(task, mm, vm_hugetlb,
+                                                        vm_mayshare,
+                                                        base_page_size)):
+                    by_resv_map[vma["resv_map"]].append((hstate_addr, vma))
+            except Exception as err:
+                issues.append(f"task {int(task):#x}: {error_text(err)}")
+    # Split VMAs can share a resv_map. Count only the entries in each VMA.
+    for resv_map_addr, entries in by_resv_map.items():
+        with record_errors(issues, f"private resv_map {resv_map_addr:#x}"):
+            resv_map = Object(prog, "struct resv_map *", value=resv_map_addr)
+            ranges = list(file_regions(resv_map))
+            for hstate_addr, vma in entries:
+                from_idx, to_idx = vma["from_index"], vma["to_index"]
+                consumed = sum(
+                    max(0, min(to_idx, end_idx) - max(from_idx, start_idx))
+                    for start_idx, end_idx in ranges
+                )
+                vma["consumed"] = consumed
+                vma["outstanding"] = vma["vma_pages"] - consumed
+                vmas_by_hstate[hstate_addr].append(vma)
+    return vmas_by_hstate
+
+
+def detached_subpools(prog, hstate_addr, mounted_spools, issues):
+    found = []
+    seen = mounted_spools | {0}
+    with record_errors(issues, f"hstate {hstate_addr:#x} active folios"):
+        h = Object(prog, "struct hstate *", value=hstate_addr)
+        head = h.hugepage_activelist.address_of_()
+        for folio in validate_list_for_each_entry("struct folio", head, "lru"):
+            try:
+                spool_ptr = int(folio._hugetlb_subpool)
+                if spool_ptr in seen:
+                    continue
+                seen.add(spool_ptr)
+                spool = Object(prog, "struct hugepage_subpool *",
+                               value=spool_ptr)[0].read_()
+                if spool.count == 0 and spool.min_hpages != -1:
+                    found.append({
+                        "subpool": spool_ptr,
+                        "folio": int(folio),
+                        **subpool_limits(spool),
+                    })
+            except Exception as err:
+                issues.append(f"folio {int(folio):#x}: {error_text(err)}")
+    return found
+
+
+def read_hstate_counters(prog):
+    counters = {}
+    for h in for_each_hstate(prog):
+        counters[int(h)] = {
+            "hstate": int(h),
+            "size_kib": int(huge_page_size(h)) // 1024,
+            "nr_huge_pages": int(h.nr_huge_pages),
+            "free_huge_pages": int(h.free_huge_pages),
+            "resv_huge_pages": int(h.resv_huge_pages),
+        }
+    return counters
+
+
+def reconcile_hstate(prog, hstate_addr, counters, superblocks, mappings,
+                     mounted_spools, issues):
+    inodes = [inode for sb in superblocks for inode in sb["inodes"]]
+    inode_resv = sum(inode["outstanding"] or 0 for inode in inodes)
+    private_resv = sum(vma["outstanding"] for vma in mappings)
+    mounted_resv = sum(sb["rsv_hpages"] for sb in superblocks)
+
+    active = counters["nr_huge_pages"] - counters["free_huge_pages"]
+    detached = []
+    # Pinned folios can keep a subpool alive after unmount.
+    if active > 0:
+        detached = detached_subpools(prog, hstate_addr, mounted_spools, issues)
+    detached_resv = sum(sp["rsv_hpages"] for sp in detached)
+    attributed = inode_resv + private_resv + mounted_resv + detached_resv
+    unattributed = counters["resv_huge_pages"] - attributed
+
+    subpools = superblocks + detached
+    # Lower bound: assume every in-use page counts toward a subpool minimum.
+    resv_floor = max(0, sum(sp["min_hpages"] for sp in subpools) - active)
+    floor_shortfall = max(0, resv_floor - counters["resv_huge_pages"])
+
+    result = {
+        **counters,
+        "inode_resv": inode_resv,
+        "private_resv": private_resv,
+        "mounted_resv": mounted_resv,
+    }
+    if detached:
+        result["detached_resv"] = detached_resv
+    result.update({
+        "attributed": attributed,
+        "unattributed": unattributed,
+        "resv_floor": resv_floor,
+        "floor_shortfall": floor_shortfall,
+        "superblocks": superblocks,
+        "private_mappings": mappings,
+    })
+    if detached:
+        result["detached_subpools"] = detached
+
+    mismatch = (unattributed != 0 or floor_shortfall > 0
+                or any(sp["min_shortfall"] for sp in subpools)
+                or any("excess" in inode for inode in inodes))
+    return result, mismatch
+
+
+def collect(prog):
+    live = bool(prog.flags & ProgramFlags.IS_LIVE)
+    issues, results = [], []
+    counters = {}
+    with record_errors(issues, "hstates"):
+        counters = read_hstate_counters(prog)
+    mounted_spools = set()
+    mismatch = False
+    if counters:
+        superblocks = hugetlbfs_superblocks(prog, mounted_spools, issues)
+        private = private_mappings(prog, issues)
+        for hstate_addr, state in sorted(counters.items(),
+                                         key=lambda item: item[1]["size_kib"]):
+            result, has_diff = reconcile_hstate(prog, hstate_addr, state,
+                                                superblocks[hstate_addr],
+                                                private[hstate_addr],
+                                                mounted_spools, issues)
+            results.append(result)
+            mismatch |= has_diff
+        if live:
+            with record_errors(issues, "hstates recheck"):
+                if counters != read_hstate_counters(prog):
+                    issues.append("pool counters changed during scan")
+    elif not issues:
+        issues.append("no hstates (CONFIG_HUGETLBFS / debuginfo?)")
+    status = "mismatch" if mismatch else "ok"
+    return {
+        "source": "live" if live else "dump",
+        "status": "incomplete" if issues else status,
+        "issues": issues,
+        "hstates": results,
+    }
+
+
+def print_report(report):
+    note = ", non-atomic" if report["source"] == "live" else ""
+    print("source={source} status={status} "
+          "(counts in huge pages{note})".format(note=note, **report))
+    for hstate in report["hstates"]:
+        print("\n{size_kib} KiB: nr_huge_pages={nr_huge_pages} "
+              "free_huge_pages={free_huge_pages} "
+              "resv_huge_pages={resv_huge_pages}".format(**hstate))
+        extra = (" detached_resv={detached_resv}".format(**hstate)
+                 if "detached_resv" in hstate else "")
+        print("  inode_resv={inode_resv} private_resv={private_resv} "
+              "mounted_resv={mounted_resv}{extra}".format(extra=extra,
+                                                          **hstate))
+        print("  attributed={attributed} unattributed={unattributed:+d} "
+              "resv_floor={resv_floor} "
+              "floor_shortfall={floor_shortfall}".format(**hstate))
+        for sb in hstate["superblocks"]:
+            inodes = [inode for inode in sb["inodes"]
+                      if inode["outstanding"] != 0]
+            if not (inodes or sb["min_hpages"] or sb["rsv_hpages"]
+                    or sb["min_shortfall"]):
+                continue
+            path_str = (" path={!r}".format(sb["path"])
+                        if sb["path"] is not None else "")
+            print("  sb={sb:#x}{path_str} min_hpages={min_hpages} "
+                  "rsv_hpages={rsv_hpages}".format(path_str=path_str, **sb))
+            if sb["min_shortfall"]:
+                print("    min_shortfall={min_shortfall} "
+                      "used_hpages={used_hpages}".format(**sb))
+            for inode in inodes:
+                tail = ("excess={excess}".format(**inode)
+                        if "excess" in inode
+                        else "outstanding={outstanding}".format(**inode))
+                print("    ino={ino} name={name!r} "
+                      "resv_map_pages={resv_map_pages} "
+                      "instantiated={instantiated} "
+                      "{tail}".format(tail=tail, **inode))
+        for vma in hstate["private_mappings"]:
+            if vma["outstanding"]:
+                print("  tgid={tgid} comm={comm!r} "
+                      "vma={vm_start:#x}-{vm_end:#x} consumed={consumed} "
+                      "outstanding={outstanding}".format(**vma))
+        for sp in hstate.get("detached_subpools", ()):
+            print("  detached subpool={subpool:#x} min_hpages={min_hpages} "
+                  "rsv_hpages={rsv_hpages}".format(**sp))
+            short = (" min_shortfall={min_shortfall} "
+                     "used_hpages={used_hpages}".format(**sp)
+                     if sp["min_shortfall"] else "")
+            print("    folio={folio:#x}{short}".format(short=short, **sp))
+    for issue in report["issues"]:
+        print("  incomplete: {}".format(issue))
+
+
+def main():
+    parser = argparse.ArgumentParser(
+        usage="drgn -k %(prog)s [--json]\n"
+              "       drgn -c vmcore -s vmlinux %(prog)s [--json]",
+        description=__doc__,
+        formatter_class=argparse.RawDescriptionHelpFormatter,
+    )
+    parser.add_argument("--json", action="store_true",
+                        help="print the full report as JSON")
+    args = parser.parse_args()
+    report = collect(prog)
+    if args.json:
+        print(json.dumps(report, indent=2))
+    else:
+        print_report(report)
+    return {"ok": 0, "mismatch": 1, "incomplete": 2}[report["status"]]
+
+
+if __name__ == "__main__":
+    sys.exit(main())

---
base-commit: c8117bff684306f5c1f959d055cc2b24dd67b1eb
change-id: 20261126-hugetlb-resv-drgn-c7677f6f884d


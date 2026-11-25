Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608311;
	b=iZ00MUjvX2tND/KFTZ3aRBG0OH5wvrt73Wr6vms5Yewi+vM2MwnA52YUexPFj0aKa3Tp
	 AfxvBMKdP2nMxDW0rT9euRtJpgNynzsEzL3V0WVQ4w/y+oc6LvCCxDnDfQ3fUt8kJPiqu
	 tqBOcsSOXAVCYR91M0sRpm4Aws5/H5vWPgsLp+/n6HQiUKYLTnvH3yTQKBCNYLAHdq+D/
	 OutzQo5c2uX87CIuAv2qhEyaXttdZbUc4t72yzvCPdisBoY8ljRWIL+JJ4ZtKDJ05p9vB
	 kOJLvXLwdYU3GB/tPKesZwtj1YC/2ls3bwZAK6G/YqTwC8ICcyU25KpszZsVJsJ/7qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608311;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bRtwzXqcSV1TuKaXvHiJxGxKDfP8s4FL1d0JSQpV1eY=;
	b=Odf6oVa2jN6LSNx91qBScWADv+9NjV47SWJMYjKJeZXm1wIxTBuUC4Gd6dWpDd+oeEMu
	 hDQMHLMU3V2CI2eJ3BzmCgwfF0qo0+j63RkuT4FBCNtVQQAALKmGsYNV2GTv2VHhAYsJW
	 l8wB2jhW65D0YLHHKP9mY8K9mmb3zR7KyA1tZvR37xtcLHWPVlf3BlO0YPmafYztnS4UM
	 mDm1ZX9/9KOQ9sYNFzQmnu7WgkA2bKSEtBDQ1uMKRnndykJ9UOryOv0YjzkUD0semeaCM
	 w4cdO6RJBcI1jsaSKA2UbKW748SjMnEaEGzJepk768rgT7zKXCd3RCSoClGNDCi2CDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="deleXcg/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deleXcg/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E3C1F000D0;
	Wed, 25 Nov 2026 12:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608310;
	bh=bRtwzXqcSV1TuKaXvHiJxGxKDfP8s4FL1d0JSQpV1eY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=deleXcg/z3yjbhx2qskKveI5EMjdhrnjPCV8Ds6kWAP5j91gQbZ+nxtlC5pVpI4wf
	 3queBcZzx6gc4wknDJuQRIcNQ7332aceSLQHQQlW7mi6y0laiw0ASKQsyz4Rqw3ivw
	 NatsxkuRb1+BoCr/DXtLxarUozedBDMbtkjrj8hNhnFPNK9K+eAFja3nRsdyEn/wIR
	 psQphhx3ZCbZK97uSkE1ZCGSHH46cvSxYx8EWYu0+qBcA1Cwil7z6/Va2lx1sBFhQ2
	 WYlR05O6Z2zMzmnPiF72UYjeP35dX3+zfs29WN04W88YRc3ypLvcphCxhc8TxPII4z
	 +rjB7/S2htsWA==
Message-ID: <3b7d2d65-be96-4b63-9de6-7303d2de641b@kernel.org>
Date: Wed, 25 Nov 2026 13:05:04 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/hugetlb: a min_size-only hugetlbfs subpool is kfree()d before
 its last pinned page is released, so free_huge_folio() takes a spinlock on
 freed memory (UAF)
To: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>, muchun.song@linux.dev,
 osalvador@suse.de, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ackerley Tng <ackerleytng@google.com>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <566ddeb4.2ad04.1a202302fe1.Coremail.xuhx@hust.edu.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <566ddeb4.2ad04.1a202302fe1.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ackerley,

does your series [1] actually fix this? What's the status of that?

[1]
https://lore.kernel.org/linux-mm/20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com/

On 11/22/26 08:37, 徐晗翔 wrote:
> A hugetlbfs mount that sets only min_size= (no size=) leaves
> hugepage_subpool::used_hpages unmaintained and clamps ::rsv_hpages to
> min_hpages, so subpool_is_free() can report "free" while folios that
> still carry the subpool pointer are in flight.  The destroy decision is
> taken under spool->lock but the field reads, hugetlb_acct_memory() and
> kfree() happen after the unlock, and only superblock handles are counted
> (spool->count), not folios.  A page that a user pinned with vmsplice()
> outlives evict_inodes() and put_super(); when the pin is finally released,
> free_huge_folio() calls hugepage_subpool_put_pages() on the freed object:
> it spin_lock_irqsave()s the freed slab and dereferences spool->hstate /
> spool->min_hpages.  KASAN reports slab-use-after-free at the lock
> acquisition; on a kernel without KASAN/quarantine the same path reaches a
> second kfree(spool) and hugetlb_acct_memory(h, -min_hpages), i.e. a
> double free plus an unsigned underflow of hstate.resv_huge_pages.  The
> whole PoC-A sequence is single-threaded and deterministic - no race
> window needs to be widened - and three variants reproduce on 7.3.
> 
> The detailed description:
> 
> * Test environment / affected version
> 
>   Linux version 7.3.0 #6 SMP PREEMPT_DYNAMIC (gcc 13.3.0), built from the
>   unmodified release tree used for the audit:
>   mm/hugetlb.c md5 cea0533ab009942534c1da41717ec926,
>   fs/hugetlbfs/inode.c md5 c63e24ddfa05e6d43ef89dfcb91da251.
>   Config: CONFIG_KASAN=y, CONFIG_KASAN_GENERIC=y, CONFIG_KASAN_OUTLINE=y,
>   CONFIG_KASAN_STACK=y, CONFIG_HUGETLBFS=y, CONFIG_HUGETLB_PAGE=y.
>   QEMU/KVM x86_64 guest, 4 vCPU / 4 GiB, booted with
>   "hugepages=8 default_hugepagesz=2M" (8 x 2 MiB pages available).
>   All line numbers below are from that tree.
> 
> * Mechanism
> 
>   Three layers combine; each one alone would be survivable.
> 
>   1) In a min-only subpool the accounting is no longer tied to folios.
>      hugepage_subpool_get_pages() only maintains used_hpages inside the
>      "if (spool->max_hpages != -1)" branch (mm/hugetlb.c:213-219), and its
>      min branch only runs "if (spool->min_hpages != -1 && spool->rsv_hpages)"
>      (:222-231); with rsv_hpages == 0 it returns the initial ret = delta
>      and records nothing.  hugepage_subpool_put_pages() therefore sees
>      used_hpages == 0 forever, executes the min branch on every put
>      (:265-276), adds delta back to rsv_hpages and clamps it to min_hpages
>      (:268-269).  Consequently subpool_is_free() (:129-139) degenerates to
>      "rsv_hpages == min_hpages" and keeps returning true after the first
>      put.  The comment at :270-273 explicitly acknowledges that put_super
>      may not be able to free the spool because pages are still out, and
>      defers the free to the page path - i.e. pages outliving the
>      superblock is a designed-for situation, but the code only counts
>      superblock handles, not the pages.
> 
>   2) The folio keeps a raw pointer, and count tracks only superblock
>      handles.  spool->count is set to 1 in hugepage_new_subpool() (:169)
>      and decremented only in hugepage_put_subpool() (:192); its only
>      callers are hugetlbfs_put_super() (fs/hugetlbfs/inode.c:1131, in the
>      code next to :1132) and the fill_super error path (fs/hugetlbfs/inode.c:1421).
>      Meanwhile alloc_hugetlb_folio() unconditionally stores the bare
>      pointer with hugetlb_set_folio_subpool(folio, spool)
>      (mm/hugetlb.c:3043), and free_huge_folio() copies it into a local
>      before clearing the folio field (mm/hugetlb.c:1681, :1688, :1710), so
>      clearing the field cannot save the later user.
> 
>   3) The destroy decision and the destroy action are not one atomic step.
>      unlock_or_release_subpool() (mm/hugetlb.c:141-157):
> 
>          bool free_subpool = subpool_is_free(spool);      /* :144, lock held */
>          spin_unlock_irqrestore(&spool->lock, irq_flags); /* :149 */
>          if (free_subpool) {
>                  if (spool->min_hpages != -1)             /* :152 */
>                          hugetlb_acct_memory(spool->hstate, /* :153 */
>                                              -spool->min_hpages);
>                  kfree(spool);                            /* :155 */
>          }
> 
>      There is no "dying" flag and no ownership claim, so a second entrant
>      that computed free_subpool == true before the first kfree() (or any
>      later entrant that runs after it) reads spool->hstate and
>      spool->min_hpages from freed memory and kfree()s the same object
>      again.  hugetlb_acct_memory() itself drops and retakes
>      hugetlb_lock inside return_unused_surplus_pages()
>      (mm/hugetlb.c:2347-2388, with update_and_free_pages_bulk() in the
>      middle), which makes the post-unlock window schedulable.
> 
>   The page-cache reference accounting is the reason a page can be the
>   last user: insertion in hugetlb_add_to_page_cache() clears
>   restore_reserve (mm/hugetlb.c:5715), so the folio's free path always
>   takes the hugepage_subpool_put_pages() branch (:1703-1712); the page
>   cache itself holds folio_nr_pages() references
>   (mm/filemap.c:848-950, folio_ref_add(folio, 512) for a 2 MiB page) and
>   removal drops exactly that many (mm/filemap.c:230-240); the faulting
>   PTE reference is returned by the zap path, whose mmu-gather entry puts
>   one reference (mm/mmu_gather.c:214-217, mm/folio.c:91-108,
>   mm/filemap.c:1052-1078).  With an extra vmsplice() pin
>   (fs/splice.c:1447-1495, lib/iov_iter.c:1063-1128, released by
>   fs/splice.c:108-113 -> put_page()), evict_inodes()
>   (fs/super.c:737) removes the page-cache reference but the folio
>   survives, put_super() (fs/super.c:750-751 -> fs/hugetlbfs/inode.c:1125-1136)
>   frees the spool, and the later unpin reaches free_huge_folio() with a
>   dangling spool.
> 
>   Concrete PoC-A sequence (all as root, single thread):
>     1. mount -t hugetlbfs -o min_size=0 none /mnt/huge
>        (min_size=0 is accepted: fs/hugetlbfs/inode.c:1270-1345 parses it,
>        :1245-1265 turns it into min_hpages = 0, :1345-1370 only rejects
>        min > max when max was given; the spool is created at
>        fs/hugetlbfs/inode.c:1396-1402)
>     2. ftruncate(fd, 2M); mmap(..., MAP_SHARED); fault page 0 (allocates a
>        folio, stores the subpool pointer, adds it to the page cache)
>     3. vmsplice(pipe[1], {addr, 4096}, 1, 0)     - pin one 4 KiB subpage
>     4. munmap(); close(fd)                       - zap returns the PTE ref,
>        evict_inode removes the page-cache refs and calls
>        hugetlb_unreserve_pages() (fs/hugetlbfs/inode.c:552-591); the folio
>        still has the pin
>     5. umount                                      - evict_inodes() finds
>        nothing to evict, hugetlbfs_put_super() drops the last handle,
>        subpool_is_free() is true (rsv_hpages == min_hpages == 0),
>        hugetlb_acct_memory(h, 0) is a no-op and kfree(spool) runs
>     6. read(pipe[0], ...)                          - put_page() drops the
>        last reference -> free_huge_folio() -> hugepage_subpool_put_pages()
>        spins on and reads the freed object
> 
>   PoC-B is the same with min_size=2M: mmap 4M, fault+pin page 0 only,
>   ftruncate(fd, 2M) puts rsv_hpages back to min_hpages through
>   hugetlb_unreserve_pages() -> hugepage_subpool_put_pages()
>   (mm/hugetlb.c:6861-6900), then the same close/umount/unpin sequence.
>   Because min_hpages == 1, the second destroy also calls
>   hugetlb_acct_memory(h, -1), and struct hstate::resv_huge_pages is an
>   unsigned long (include/linux/hugetlb.h:667), so it underflows to
>   2^64-1.
> 
> 
> * Reproducer (attached: hugsp1.c) and results on 7.3
> 
>   hugsp1.c is a self-contained static userspace program; no kernel
>   modification and no module needed.  It mounts hugetlbfs itself and has
>   four modes: poca (min_size=0), pocb (min_size=2M + ftruncate),
>   poca2 (two pinned pages) and ctl (negative control that unpins before
>   umount).
> 
>     # build
>     gcc -O2 -static -o hugsp1 hugsp1.c
>     # boot the KASAN kernel with: hugepages=8 default_hugepagesz=2M
>     # run (as root, in the guest)
>     ./hugsp1 ctl        # expect: "ctl done", no KASAN report
>     ./hugsp1 poca       # expect: slab-use-after-free after umount
>     ./hugsp1 pocb       # same, plus acct(-min) -> resv_huge_pages underflow
>     ./hugsp1 poca2      # two delayed frees
> 
>   Observed on the 7.3.0 KASAN guest (single-shot run, panic on first
>   report; KASAN multi_shot=1 runs show the same report repeatedly):
> 
>     - poca : 1 report at 15.583 s, "BUG: KASAN: slab-use-after-free in
>              _raw_spin_lock_irqsave+0x77/0xe0", "Write of size 4" - the
>              queued_spin_lock() inside hugepage_subpool_put_pages();
>              allocation stack: hugepage_new_subpool+0x37/0xd0 <-
>              hugetlbfs_fill_super+0x16b/0x390 <- path_mount <- __x64_sys_mount;
>              free stack: kfree <- hugetlbfs_put_super+0x3e/0x50 <-
>              generic_shutdown_super <- kill_anon_super <- cleanup_mnt;
>              use stack: hugepage_subpool_put_pages.part.0+0x19/0x1c0 <-
>              free_huge_folio+0x13e/0x2f0 <- __folio_put+0x13b/0x150 <-
>              page_cache_pipe_buf_release+0x7d/0xa0 <- anon_pipe_read+
>              0x290/0x630 (the "kfree <- hugetlbfs_put_super+0x3e" shape is
>              the tail call jmp from hugepage_put_subpool()).
>     - pocb : same report at 13.929 s.
>     - poca2: same report at 14.400 s.
>     - ctl  : 0 KASAN reports (the pin is released while count == 1, so
>              subpool_is_free() is false and nothing is freed).
>     - a 70 s multi_shot run produced 51 reports plus a spin-loop hang
>              (8452 printk messages dropped, VM killed by the harness
>              timeout): the freed object is re-used by KASAN's quarantine
>              metadata, which overwrites spool->lock and leaves the lock
>              slot non-zero, so the second-entrant path spins forever
>              instead of reaching the second kfree().
> 
>   With CONFIG_KASAN=n the same unpin path is expected to reach the second
>   kfree(spool) (and, for min_size>0, hugetlb_acct_memory(h, -1) which
>   subtracts from an unsigned long).  The audit report includes a
>   line-by-line model of that path and a self-check list (it is not
>   claimed as dynamically observed here).
> 
> 
> 
> * Suggested direction 
> 
>   The fix needs both layers, otherwise each half leaves the other open:
> 
>   (a) make the destroy decision account for folios, not just superblock
>       handles.  Either maintain used_hpages for every folio regardless of
>       max_hpages (and let subpool_is_free() require used_hpages == 0), or
>       add an active_folios counter incremented in
>       hugetlb_set_folio_subpool()/alloc_hugetlb_folio() and decremented in
>       free_huge_folio(); in min-only mode subpool_is_free() must not
>       become true while any folio still references the spool.
> 
>   (b) make destroy ownership atomic.  Take a "dying" bit under spool->lock
>       in unlock_or_release_subpool(), and let only the context that
>       transitions from live to dying read min_hpages/hstate, call
>       hugetlb_acct_memory() and kfree(); every other entrant must return
>       without touching the object after the unlock.  The current shape
>       (decide under lock, act after unlock, no claim) is a UAF even
>       without the accounting bug.
> 
>   (c) preferably do not store a bare spool pointer in a folio at all
>       (reference-count the subpool per folio, or make the unmap/put path
>       drain before the superblock goes away); as defense in depth,
>       WARN_ONCE when a folio still carries a subpool pointer at put_super()
>       time would have made this visible in testing.
> 
>   Happy to test any proposal; the reproducer and the KASAN logs are small
>   and repeatable.
> 
> 
>   Please keep me in Cc; I am not subscribed to the lists.
> 
> Regards,
> Hanxiang Xu
> xuhx@hust.edu.cn


-- 
Cheers,

David

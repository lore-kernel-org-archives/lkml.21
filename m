Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032960;
	b=0MYqKUYSdT34/JcCLiRSxhFm31wKG+noDQTJpFkdnmW+m70yK2+0IGuS0ZtYZa8G8Gez
	 vcRh4GGyOP8k3Sp59rD+L2TBp+yOJ3XwyeeVSIWg2qUAN/EdAaywVNqUIO/dQ/MaWLCF5
	 VLrrRj+y9RDggmqolwWtinG+Tx46eunI4XKSPW4Q0eR9C72JI+1iJQAosyZ+v9YnygHji
	 TC6j3lvYxNx20ZJEVjDCq8ZnQQIqHGlQbvfXNSbpDwE1ciCYLSIJv6SYGr4puI4VzJ8He
	 bzribjz17HzX/kJwg4dOo/0Fm4dyXlTk25PUx2rUvmosVMJUhyrxvVB15O7v9KfgjcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032960;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=t46oCZlEPTr5mTMcBQO1+iAphJVAGxOpg+yCTJY7ELc=;
	b=QDCM0pzZayOo8vWb6Fl0F9uorxlxLYQQKVh9hEMg0bVf0qoQ3Qq+vvdr5OnXe8HNyLJF
	 VBx8T2E6pBJ4JgAPqDm6YZe0UXckxq+qa+xymmyFU9b0du/Z7sqoFPR5vaaTef1FULwdm
	 gouogaBDDEPc9Z9RwdLPk9RFsn/F3yBifaopjYgJA1sxTxlZsPCDr22Ddb4ym3nxyxiVL
	 loEnzkkii01EkDehnUOuszxX2fK064NRbJ/Ap4kGvecJc9WpAOFttiWR1p6IeGoqPFOp7
	 V2kJTh61uzg/UZKy2aX3BytLz0AJVlm/FfcgKUNER89kYgo0rTtn23wSWmyr4+zcziw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WGeymg4H;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E8606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 695E8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WGeymg4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t46oCZlEPTr5mTMcBQO1+iAphJVAGxOpg+yCTJY7ELc=; b=WGeymg4HyfLLCD02rVRbeH66gh
	DlppyLse3qppMUZ1SNctkolV/9THkuLRy37LfplwZetrsGg80vw2WWpE/6HyAj5CttbrBwfdF6Uqw
	+j3w8CgjznkmAhDrhpDtJZMItwlUy9ok/2P3l9IaEPPQNdmyrvPN1U7IFpAbmYNFF+FUTzRh4t9/h
	h6iaT+m/DI18b8kKJ0keCcE6B8WzSzB+dOwOZFtjuOK7CQEpRM+0Ze1Sav/nRxQ28Kg2vQszlsFTL
	NuI8bPgus//uPJHb23MFC6D30xMSAkW1gmNCG0MgBNpyKwIF7YWbFbTzluEYy8qS0ezEjB5Nc5seL
	LMqCrkew==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTm4M-0000000ACGb-38U7;
	Wed, 18 Nov 2026 20:15:51 +0000
Date: Wed, 18 Nov 2026 15:15:47 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Pedro Falcato <pfalcato@suse.de>, Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: consolidate the memory mapping entries into
 a VMA entry
Message-ID: <pczhkwshm2stepxznvaxynkp5svfuc5kdzmwenyrxjp2tm32p6@bdbuvvak7vow>
References: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>

On 26/11/18 06:22PM, Lorenzo Stoakes (ARM) wrote:
> Memory mapping entries were kept in three different sections in order that
> those maintaining/reviewing each distinct part would be made responsible
> for/cc'd on only those parts.
> 
> However this creates confusion as to what files belong to which component,
> so simplify things by consolidating them into one.
> 
> Expand Suren's maintainership to the entire component, as he is a trusted
> and valued member of the VMA kernel team and very much deserving of the
> position.
> 
> Additionally, drop Suren's core and misc reviewerships in order to focus
> upon VMA.
> 
> As David is receiving pull requests directly, make him a reviewer, purely
> as an administrative change.
> 
> Also specify the new tree location in preparation for the tree being
> established for next cycle, and remove the link to the not so regularly
> updated linux-mm website.
> 
> Given that, from next cycle, the tree will sit outside of Andrew's current
> process, remove his entry, also purely as an administrative change.
> 
> With that said, I'd like to take the opportunity to express gratitude for
> Andrew's huge contribution to mm, and for his being both generous and
> gracious throughout this period of change in the subsystem.
> 
> Co-developed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
>  MAINTAINERS | 51 +++++++++++++--------------------------------------
>  1 file changed, 13 insertions(+), 38 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..59496dd1d11e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17509,7 +17509,6 @@ R:	Lorenzo Stoakes <ljs@kernel.org>
>  R:	Liam R. Howlett <liam@infradead.org>
>  R:	Vlastimil Babka <vbabka@kernel.org>
>  R:	Mike Rapoport <rppt@kernel.org>
> -R:	Suren Baghdasaryan <surenb@google.com>
>  R:	Michal Hocko <mhocko@suse.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> @@ -17680,7 +17679,6 @@ R:	Lorenzo Stoakes <ljs@kernel.org>
>  R:	Liam R. Howlett <liam@infradead.org>
>  R:	Vlastimil Babka <vbabka@kernel.org>
>  R:	Mike Rapoport <rppt@kernel.org>
> -R:	Suren Baghdasaryan <surenb@google.com>
>  R:	Michal Hocko <mhocko@suse.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> @@ -17974,30 +17972,37 @@ F:	rust/kernel/mm.rs
>  F:	rust/kernel/mm/
>  F:	rust/kernel/page.rs
>  
> -MEMORY MAPPING
> -M:	Andrew Morton <akpm@linux-foundation.org>
> -M:	Liam R. Howlett <liam@infradead.org>
> +MEMORY MANAGEMENT - VMA
>  M:	Lorenzo Stoakes <ljs@kernel.org>
> +M:	Liam R. Howlett <liam@infradead.org>
> +M:	Suren Baghdasaryan <surenb@google.com>
>  R:	Vlastimil Babka <vbabka@kernel.org>
> -R:	Jann Horn <jannh@google.com>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
>  R:	Pedro Falcato <pfalcato@suse.de>
> +R:	David Hildenbrand <david@kernel.org>
> +R:	Jann Horn <jannh@google.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/vma.git for-next
>  F:	Documentation/core-api/protection-keys.rst
>  F:	Documentation/filesystems/mmap_prepare.rst
> +F:	Documentation/mm/process_addrs.rst
>  F:	Documentation/userspace-api/mseal.rst
>  F:	fs/proc/task_mmu.c
>  F:	fs/proc/task_nommu.c
>  F:	include/linux/mman.h
> +F:	include/linux/mmap_lock.h
>  F:	include/linux/pkeys.h
>  F:	include/trace/events/mmap.h
> +F:	include/trace/events/mmap_lock.h
> +F:	include/uapi/asm-generic/mman-common.h
>  F:	include/uapi/linux/mman.h
>  F:	mm/char-mem.c
> +F:	mm/madvise.c
>  F:	mm/mincore.c
>  F:	mm/mlock.c
>  F:	mm/mmap.c
> +F:	mm/mmap_lock.c
>  F:	mm/mprotect.c
>  F:	mm/mremap.c
>  F:	mm/mseal.c
> @@ -18011,36 +18016,6 @@ F:	mm/vma_internal.h
>  F:	tools/testing/selftests/mm/merge.c
>  F:	tools/testing/vma/
>  
> -MEMORY MAPPING - LOCKING
> -M:	Andrew Morton <akpm@linux-foundation.org>
> -M:	Suren Baghdasaryan <surenb@google.com>
> -M:	Liam R. Howlett <liam@infradead.org>
> -M:	Lorenzo Stoakes <ljs@kernel.org>
> -R:	Vlastimil Babka <vbabka@kernel.org>
> -R:	Shakeel Butt <shakeel.butt@linux.dev>
> -L:	linux-mm@kvack.org
> -S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> -F:	Documentation/mm/process_addrs.rst
> -F:	include/linux/mmap_lock.h
> -F:	include/trace/events/mmap_lock.h
> -F:	mm/mmap_lock.c
> -
> -MEMORY MAPPING - MADVISE (MEMORY ADVICE)
> -M:	Andrew Morton <akpm@linux-foundation.org>
> -M:	Liam R. Howlett <liam@infradead.org>
> -M:	Lorenzo Stoakes <ljs@kernel.org>
> -M:	David Hildenbrand <david@kernel.org>
> -R:	Vlastimil Babka <vbabka@kernel.org>
> -R:	Jann Horn <jannh@google.com>
> -L:	linux-mm@kvack.org
> -S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> -F:	include/uapi/asm-generic/mman-common.h
> -F:	mm/madvise.c
> -
>  MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	Miquel Raynal <miquel.raynal@bootlin.com>
>  M:	Richard Weinberger <richard@nod.at>
> 
> ---
> base-commit: 0c524518413094607a6178c53a65815762bc9c45
> change-id: 20261118-maintainers-consolidate-vma-entry-ff6a360ab069
> 
> Cheers,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 

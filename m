Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529511;
	b=LP6y+ZRZhud796kn+dhEEgfEfH2SDc4v+KEnSlccAXTTW9/K1LCCzYeJr81UNXMPHr3B
	 diNjbgaYS01cMaz3x/ISHaM31bBfddJinJBSmBV8GzNto5HOIWplcG5lF1wvoWbz8mf1j
	 vnx2JV9WbYq44uQIvA+LOD+z5t89R1Lsu/HDVPffbO78Xug75GxKToMQ+KnD2UDf28Qat
	 i8YMPNla0LBdllLS9EYx1LKX252smdTQTg8T8XJxichZXte4E9IM45TbWgVvwJcFxfKNK
	 DiPISMpHuBT+XJis/EVZWBQApsUZiZ7cu1JXIuXx41lLrv4MkuZ3TCTYNxYH4XCvRrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529511;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rdhE7rZLDvGkNusxDbiDfsrpFeB7AZZOY+HkmAjee4I=;
	b=UCWdFT+GYvLlJZyzUk0LxVdREkCrHAC2HDs1nfjxbwGgfN4dHCz4OodTlV1NPNQteAX2
	 e1c82cHJnVATGSgL6qrHLdi4DUkEaTvIcA4LxidmP6oGtADdI1a6rgsdqwfS0Ow5rBXAp
	 ag0XznHSqDNggsMVPgXDJ5AXDyC7F+Tx0FL1iTLl30U+pOU0A+qGsG596S4YRgohtpiei
	 fLgVU+FayFLmSNBr9eCTAmjSeDOmCPJcjXrzsmTPPO5KhOolDmhYQz4vRE2JiS/n96KLF
	 o1Y1+gx5yk8F7ka9h4rG9yAsNbGLfLadacHBvkipMTMU9mavlM+XhIYspIDbldCoiFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="t9WnOT/l";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t9WnOT/l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59C61F000D4;
	Tue, 24 Nov 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795529510;
	bh=rdhE7rZLDvGkNusxDbiDfsrpFeB7AZZOY+HkmAjee4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t9WnOT/lpp3Ut2M0J1XMz9tDKU9Z4D7OycyFFXgwDMy+IwRJq29FXuH4yLomyNA4o
	 HANE+JYrQrzclYZiEbZHGTyx2wGFk3tl5cpNcXEYXA9aybIPID426k8dXdsC0tXoXW
	 4zWD6cpHbUWiiv/WDFVzJt+vpyXilPRECrLEFz9M=
Date: Tue, 24 Nov 2026 15:12:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] uio: implement huge_fault support for physical
 mappings
Message-ID: <2026112459-oversold-suitor-c527@gregkh>
References: <20261124131510.38745-1-farbere@amazon.com>
 <20261124131510.38745-6-farbere@amazon.com>
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
In-Reply-To: <20261124131510.38745-6-farbere@amazon.com>

On Tue, Nov 24, 2026 at 01:15:10PM +0000, Eliav Farber wrote:
> uio_mmap_physical() maps UIO_MEM_PHYS and UIO_MEM_IOVA regions at mmap()
> time with 4KiB PTEs, however large and aligned they are. Populate on
> fault instead, as vfio-pci does since commit f9e54c3a2f5b ("vfio/pci:
> implement huge_fault support"): call track_pfn_range() rather than
> remap_pfn_range(), and add ->fault and ->huge_fault handlers using
> vmf_insert_pfn_order(). A large enough aligned region is then mapped with
> PMD or PUD entries.
> 
> Like uio_vma_fault(), both handlers take idev->info_lock and fail with
> SIGBUS once the device is gone. COW mappings keep the eager remap.
> 
> The fault handler needs the base pfn, so vm_pgoff now holds that instead
> of the map index, as remap_pfn_range() does for COW mappings.
> /proc/pid/maps reports it as the offset of these mappings.
> 
> Once the device is unregistered, an untouched page gets SIGBUS. The
> eager remap used to keep it mapped. A remote read through ptrace or
> /proc/pid/mem of a mapping with no VM_READ now fails too, where the
> eager remap used to leave a present pte.

Why in the world are you using UIO for this?  Why not do the right thing
and put your driver in the kernel in the kernel itself if it needs to
access large mappings like this instead of hacking around the
"limitations" of /dev/mem and uio?

Do it right please.

thanks,

greg k-h

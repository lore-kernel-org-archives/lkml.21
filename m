Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052892;
	b=diRkn7tWOlKtpPiCezXbXvKRqND+2D79ZG8hBmYoJu+p0yz8qZ1F7kwSh2vUzwoLWl56
	 QhT3izLkZIvtwSFFmo6pQnl422uj9LML+r8pBctKtk6W3L92dMvzJlTTJZ1fV+NadhwvI
	 2+RJgY3IzxNUPgh/CXJC2yXOqXgv4VpevR531cqa9kWb6XnP2F3GMCDbEkA6oc24hXku/
	 2RhdlYs+14S0G4eR+CFyzr8tUc1eBbYVPH4ptqaVzt+C5VAFpbQJaynpErXiPRYoYm3vX
	 Z0E4zsfTOW6l2ouwLoGa2o79Wf0lTj5yHZvVulHq7rS8LXgD+0okZuyuNG8JPjzPRgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052892;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EUrkXU3ytmku/9Gi8LQ4STzg3Y2OdkeFJfEpM5AGNUY=;
	b=OBvv6tY7EonJXBEv+pMZwN3Ddrzv4wZ3WJFd6ucOs0eDwsX0PH3B1XH2RPdP3ur9nFSy
	 Z65Auj6cYU/gftgbVsmdQyNUGxHijPLT6x9rmdZTE81Zq04bkc6KEWvffHltfPnQEplTI
	 BHq7YFyn3c2h86smEIC620XEPD24Gvyb3NYgAWLGMaiCEr0nbS763llNJQnaGJ0ON1M+R
	 KuNgIs5PwgZd4VdlDDHam/qWmzPtkNKec0pSxFOjw9yyOMFupigyAmKBOz1WCuSvMKlDO
	 kKdAQZYPU8UnYiJmk+a98nKJfN/dxFY2vMZGElWzWOkZonpmBWkEM9Ou0saba4ruDsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+p7dwYq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F8606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+p7dwYq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF051F000C4;
	Thu, 19 Nov 2026 01:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795052891;
	bh=EUrkXU3ytmku/9Gi8LQ4STzg3Y2OdkeFJfEpM5AGNUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J+p7dwYq2fqkBr6VZkAK+bNXuoQ4GhZRi/2VJ4zoGvcH3iBWa8sdK5xvAR9xWx0hb
	 b5CYiDazSMkhFBgQmhI/yPOwKWi51qEQV8JuGxKMh+IsMb7jT3Gqlj+a2viQ/kYgyU
	 wCToyXytCwp5E6f2pRQtuMuk1bCE6lnA+6TFqsLvcVlm1j7CeQxSuqZhdIsMH1QSYU
	 m9JsOiQneS1RLsN/EJNMtdhnOOqPfxFZ9KcB3CL0aH72LHMdECH1/gcVxDGnqJ5B6I
	 5chM4cA5umR/x65XsR0/nFnGncWaRqdl1CKma2TbJt7mMiS9momT4AZFsn0T5qg5G9
	 GOyJYom5MDR0A==
From: SJ Park <sj@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Pedro Falcato <pfalcato@suse.de>,
	Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: consolidate the memory mapping entries into a VMA entry
Date: Wed, 18 Nov 2026 17:48:03 -0800
Message-ID: <20261119014804.120123-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>
References: 
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

On Wed, 18 Nov 2026 18:22:10 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

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

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]

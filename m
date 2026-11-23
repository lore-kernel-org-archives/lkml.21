Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426293;
	b=h136vepGkqj827sfGjoWxiu/wkAZjrCGsQKIgT3ZVvqMI6REv3TVlHO9R+Fm/VgMAj7j
	 8cOi+YmlIEq/7pvBr2N5c96q7Aq+36psRyWjh/AieCk/ifhXOf1s/0IWSBb3Yfo3RgfiE
	 ciABNU0jX0Ttp37jt/P93kWbkht7m6ZQ2dJicO5rmFhJqmdWsEhJXeAxU5G9O3MR1qioi
	 TH2dGVoCCpyCv4Ex0koqfoC00z67oYZ/i7rd9idN0feNwvtjwKUX6cjtcwGQbtfpEEiC0
	 2UIB2WF9ovCn5Y5Xj6h2JYR0grpgv9mDckIoAC5iRS5pJBzq4zRPkYqLl19d/KKodww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426293;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LEZQPbX7zIrfyumi30Iuldtbz8hOyWeoj1cQmTHb/4c=;
	b=UlJRDRiECBrEuDBNV6EkPpvQ9XJsTkLjs+qVHhXNUci8B8f6RfHD/7n4TyrSGugnEVBr
	 04/r66nCtXVRxNklvGTMf3rJt4I2oqK+X+uv1Yo97eCz2c9PoKbWO8UuWk+HBe/npS2Ci
	 ozLREL02WL8qjFEEZCnf4+qLUsHYNesLL6pDACbUgQX/W5YiiP28jXmtTRrHEBQHbj16C
	 6yvVG2wsF7QVnnFfWMaf4VoSJT3hN6OxggBWdGZbh7ASsc5Tjm3VXidMo61MABwdSoXD9
	 Sn61ER5r3jm080g/+c15Dl8wNEhDYiwizNgugM3n6T0xA9wcuqHA0FRZt3vrGaH+fJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYbQqOrh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYbQqOrh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC0E1F000C4;
	Mon, 23 Nov 2026 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426293;
	bh=LEZQPbX7zIrfyumi30Iuldtbz8hOyWeoj1cQmTHb/4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NYbQqOrhzX2/icuZaJsZyU3TkKk9NJM791Bmy6zOLVKfGocWltOuytH3cgylFY7Mb
	 5Ixrx865urTwyPPEF9dgo6bU7esfYBSqkSVS/vrh+IqAZSBlyEN/wI3ihPQbCavVo3
	 Msj3yTqgMDe0VbwJpS3sAtCU0PXUI+sCOrlfqA6uNPvHrnIx2QepvrL/7zFfAg/WbR
	 AwAJdBJXlwnl0COoVh8tfxyvtj7tGaFNr8c9FREDmzYSfwVvPpSbjtp48sYQhk7cC2
	 auYy6LCrLGJZixGstmvRHkie8DL0K8sujRegIfMjkqAVv0sEYCEh14uG8n9bffadmU
	 hP5qDSdcqFyTw==
Date: Mon, 23 Nov 2026 10:31:25 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>, Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/11] mm/hugetlb: drop boot-time HVO handling for
 gigantic folios
Message-ID: <awQH7ZAWKC2Zrhy8@localhost.localdomain>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-6-songmuchun@bytedance.com>
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
In-Reply-To: <20261120100856.16929-6-songmuchun@bytedance.com>

On Fri, Nov 20, 2026 at 06:08:50PM +0800, Muchun Song wrote:
> HugeTLB HVO is currently supported on x86-64, riscv64, and LoongArch.
> On x86-64 and riscv64, gigantic HugeTLB pages are larger than the
> section size, so the existing section-based vmemmap optimization
> infrastructure is already sufficient to cover the whole folio.  On
> LoongArch, HugeTLB HVO is supported without gigantic HugeTLB pages.
> 
> Therefore, boot-time HugeTLB HVO folios can rely on the section-based
> vmemmap optimization infrastructure directly, without the extra bulk
> optimization and fallback handling.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362342;
	b=dCZNQ56keNInQ0YtMQLNYnk84LBYQjwzmTNPRId4nl6KoJqqSbXcFkbW0tBgk98jqXCS
	 tZlE3GK35MaG2QVZ/6IBTtYA83UXWkEmuxw2I8yKZAsKR20ITNVTWwankDjmP/2W2KvKv
	 bepAGl+PuYo+UFt7UFrRRw6kgbVfxQ408WuK8UBzW7djY/PmHQ3YqnhiAvc4veFQEZ8er
	 YFI+eq0hQUbz+RLEveqxwjs1EC/91ZiYOE/OMJtlRW581xM/3Fx7tiOjLnArztfKwoqeZ
	 662wpGMDHO7/At1d8gmXGLcAZomaYQ/JcRlZ39VVgm4MfRh/i3uZAJouTL+o2zn+LSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362342;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=qP2i0fv4WE8/ipxTLPLincxefCJhx+1CzzN1jBqfoUY=;
	b=Y8G223OY8Eh2Hbn/z0cgA/9VoBnrGWD4j3T49/JJvVv9JAxdSNM/XOvA62kuywU457fl
	 WFv2F5thIstPAIrxqzS0/ebsnduGPV2ClghMr0oKmV3RAyletm+5KqdFkZ1yPLeiIyAHH
	 RTiakl0VfZDn4utscqFG14S20a/sQNlyGN9Y2Dl79TSWHMtz+RZaTLV4fX/zltcZHvz2z
	 FakEMQTLGphcYP8t0PSE+BH0ujMCDYwqkMa2O+g1QzfnIu3OfwuMxHi9L4JJn6Hx+rkkb
	 4ZKu+DT11HGI2cb/osR+zP7FxUzzuWl2o5xYFpcIzqlNSb1ub1WBKPrkrxkxQNK7l6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dymmx6qI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF4C606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dymmx6qI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6E91F000E6;
	Sun, 22 Nov 2026 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362341;
	bh=qP2i0fv4WE8/ipxTLPLincxefCJhx+1CzzN1jBqfoUY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dymmx6qIIpA3rlijmZ/+JB+sfVuETUqDVF91cVYW3+atJAQgn9IWkFqJWFIDoPAcw
	 lnDt1wq+OtDCkmNG6BT1XPW3EBXuxEosPxQhfsGgZkagI/71TVNv+OHoKreroCp+qV
	 iP71Zn/rjZzsKOK+5Qj5FXk36hKRXr2dzjXlVzNbWlG5kE86baxHH4UERvEJNtWGds
	 30JK790FV8zUyTGMCKghisnBysakrG2jOlY9FcF1p72mPe7GrJNcr7itE11Gc6PUQV
	 A2eS4pwlrmdEXtcSN8JLsZfyeYr4ekr1AuobWKdAIaMg2U0GsXyNE+xeXTz/Qirt0u
	 uR3xsLcloIBtg==
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
Subject: Re: [PATCH v3 08/11] mm/mm_init: make __init_single_page() static
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Mike Rapoport <rppt@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <muchun.song@linux.dev>, Li Zhe <lizhe.67@bytedance.com>, 
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120100856.16929-9-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-9-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230138.3933282.3756742305375299607.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Fri, 20 Nov 2026 18:08:53 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> __init_single_page() is only used within mm/mm_init.c, so make it
> static.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


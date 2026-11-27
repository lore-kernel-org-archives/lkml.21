Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772909;
	b=SwisNIq3eEzPOXNc0T9Ojve/sfpdu6gpsYpa9kK6BfPUkBOHf1FhPZQ4Ff2+lsgAE3v4
	 S+xlf6b6+U0r0BifwituMThafb/h0HWfNaofJ0j82AEomVyfAMm+T+Mre/y+fjOFQLdY+
	 GACn0yZe6irrUdm/C/AKfOWrF7s8FywNkUAIeU8DM8kinNMiX0b9ddR3kOb2FHB7rKboB
	 4imoLwvUSa5fsy0tP0lo5yBvQ0LATTexms8HLkGzkZFST+mDJg780BZrtcwxst0fyjtUI
	 uT+3qsMVPRaV4K/1XYXEIiJyyxhmtUpjd8tOCj6aetxmFSFX1FLFiHs3sQgvnyJ8wMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772909;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=epkIPtG5+c+GHl+3f6ueC1zpCmkM49EEu5iyL2i6hAY=;
	b=XRB03pPq5JeHKcl//igjnXA3Bfac9HwpQCX9Bx5inJDg33se8ENJvja8W33soZ3HwehL
	 d7X6TF0gtcbAF5jwoe+uD76x1AH5kW7fqnYU06XJKdPj99r6o4mXPKD1HXZu9R/nnHL89
	 5bfnkhNxohPeT1VKBI15j+T9iawBx0pl5Ne1+IEARnMaki+jYe6LLggeJAuSIEOZgrYTA
	 b4xCHqp19Rs4Nf7qp6Kun8XcoquDGzJFsspiTyiMxCgNUXTu6Beo8X/pVz2ZJMwz2G5x2
	 8N0mvEhz/82W8jDconmS5vWJmHg05V7BsjvS1yEvD4Jtc7av2bUY2RABGBH056wiSEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePJWuSs7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C8606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePJWuSs7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D1F1F008A0;
	Fri, 27 Nov 2026 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772908;
	bh=epkIPtG5+c+GHl+3f6ueC1zpCmkM49EEu5iyL2i6hAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ePJWuSs76WjdR0Ierq65rsoFcKNDoyKM+5HVkHMoaUEtkhIV+yo/rQLjycxEJ4s84
	 VaoG7m+nDYcLbmPtyUciBrHU4KwQ7kPFceE3jb3RdE1fFrT+083+67B+/qokXZg6df
	 KjmW1Qx1F+3g4ICOr/CvB14HuMTdHVK8k9rKyjXuTo0f4XlhBOHXa96ggHAdsauRId
	 2wwG15OQZqrCZdPkJcKpgkPcIZ+yIPF0/efxW9OIPjJnvtkDz83pAinj+6Kf54wRtf
	 8/caKHQrpZ1Fx8uSd/F7qlnJ99gUVF/0WaqukPTbWOMhQXeBaHeEROFmJR0uJzf0+9
	 fG96MPMwSkPeA==
Date: Fri, 27 Nov 2026 09:48:22 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Maxim Muzafarov <maxmuzaf@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Yu Zhao <yuzhao@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] mm/mglru: MADV_RANDOM page cache never ages and
 thrashes the oldest generation
Message-ID: <awlRx2rh_7N4fT3g@gremlin>
References: <20261101160427.85701-1-maxmuzaf@gmail.com>
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
In-Reply-To: <20261101160427.85701-1-maxmuzaf@gmail.com>

Hi,

Small nit on process - please send single patches without a cover letter.

The easiest way of accomplishing this (+ our preference) is to use
b4 [0], otherwise format patches like this:

$ git format-patch HEAD~1

[0]: https://b4.docs.kernel.org/en/latest/contributor/send.html

--
Cheers, Lorenzo

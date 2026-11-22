Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362347;
	b=PzknKnA5Mta7+g3vsE6HnI5T0lxqToGfSpriWTcmksYnj/hNnrXpBcHeT281vtArZuZ0
	 3iWw1sBK6JD/8rhZGLiJfpcOr5lLFMYwXSDcyEHXPKhIgs2k6O5gBjcgj4P6ks6pvoc7l
	 uAfugSL1egpD8j4Tz6LufUmsmH/Li3YfmOdYKPDIbwruqaMuyLN8cZTEZ5bR9szojrm/1
	 IS9f+alrZ8nEpIdJV10JywJRQ285eejq75U1Y0wUWucXWBatOnh5/nIjCYRdcPZ0jqBTR
	 F/sp9S6CUMSpm1UQXJrTAcQrckUzwdn1ahbuPmJyIMg/1GjwIwtot2AGd6D8GEYsMIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362347;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=R06u0i6qVr/ExIhOD9ayL8/TTOc1DfJVloR61DvdyBE=;
	b=vg8jP3w9ArRhJgjIraVjERZiTfYp3rs+qIb2aUri+0iDrbXg0Z6M1yrp/MUzOV5QTh8l
	 /Daj4bhY5Bn0ljJ2NfOVKPNC+JQsYHlruXIe/Umu7CEY5/PJ2fyXXNz7NsRVQSTllh92d
	 jDYtqfqE28yavoFvzUK3PA9Lw+PyyDrVVxIHN3QXaa2bbA2tAtdRKPrqV5M3LFA92rBmR
	 OZtOA3QEM7z3XgTbOI6pKAHT9jt3KU11cqgoalFYOTL9sM6rcCWqg9mcPSsCXt9gaPwQq
	 iXwi6O1fepnkVJTgPkxlTVLSk///nWY8pWzed3bhSa8qF9GUw1bNUOwQcuKxCmz8z8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5JKrpeR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC76606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5JKrpeR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C111F000D1;
	Sun, 22 Nov 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362346;
	bh=R06u0i6qVr/ExIhOD9ayL8/TTOc1DfJVloR61DvdyBE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=J5JKrpeRbv3KoXb/fFkbQiJT8oCObVmV5YI2MMz1JdmXiwwwcf+/s+uTQ1zrBptSK
	 P9grABDegn8ECnf4qHT3ppteLub+cZLns+sZRMnkn1GVRRR6M0ZjguTQRLj0qiOZ0s
	 l/57wwWJ3IutPARuYrKlEDJmsdLGhHJ4O/Nqae2TTw18CppXkhChCaU7vnPnz/OtO4
	 4FH3M5g499Alom3DtZ7KnbEMnjWkoRdLlGgLPfG1Ixpgap0O4yYaCS0uFVAO/Ou9tF
	 8m0e5XWPpQXrBNJkR++PNgBdVIdrcHul/KLJXCxw1E8iSX/Nk8jqsib3TegYWzoBh+
	 ee4lyl7ihv+zA==
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
Subject: Re: [PATCH v3 09/11] mm/cma: centralize CMA pageblock
 initialization
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
In-Reply-To: <20261120100856.16929-10-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-10-songmuchun@bytedance.com>
Date: Sun, 22 Nov 2026 17:45:01 +0200
Message-Id: <179536230138.3933282.17513671725421744205.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> Early CMA reservations currently require callers to maintain CMA state.
> This exposes internal bookkeeping requirements and splits responsibility
> for the same area between CMA and its users.
> 
> Make CMA fully responsible for the state of early reservations. Pages
> already handed to a caller remain owned by that caller if activation
> fails, so keep their managed-page accounting intact regardless of whether
> CMA retains the rest of the area.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


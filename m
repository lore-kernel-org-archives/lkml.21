Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004762;
	b=XgWRC5F6cgPzRMKLJX7ZpSHY0vVjHs+5ZP0XDXL+3e4FEAZemu0dzlIkGmCIUuMW/nxr
	 Qxq7M/Q7hmkV1wWPOmYcCYYVOAm6AoTXpITtJSplFba9i7Z6f4iSknrqQpJOvu2+W7OY3
	 5ws3vGC7/u+j6PzlKbv0NAYhnpX8yKNJNUzEGFr9dWgrXCb71sJMarVewVhfsuwBn9HEy
	 MHJYo6fepJxH6cTx1AculSJd7r0P+CbzEOA3vP19cQyP3bsf41+V675JwSgtM3mrlYhxR
	 /fKDgYRH5FDNBPnIIAtTEfxt8jPH/g0RfH/jLLvM5YhrH5VFrraieIaZVoi1vLpVCng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004762;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1AqeN0M33Tu74PsxiXUzK3ZXWPpnVIcOQcPutPsP0EE=;
	b=U9sKfJkVVQZbM8mT1e4dRt/tu/hD42+omAfM+Fpuk0R6BkLJLGFaAiga+DkZ58iwaOqe
	 L9ykoSr/lK9ZggkKQMnaJG6SXDaGWe+HWGsfzHmX2VXlOoc9sL4ghUZOQ6nRpCIH5yand
	 qeFXaCPdWpD/Ag3EAXz/M4gr5Vn9wUGcp4n1WT5jBs1ORYmGCLfBN7OwzzG247qFCs2ek
	 FUOVvw6gdLj0HU6NILFzbAGmMD1wAK1li+hIRPq/skNbPTa6Kp8WqTcmizJlqhEaXWEfz
	 D7rJT9OdqsTqOvANGG2fQ2f9WmJaRBiaZEMazwShzUxwxtSJI8vvuPr2u8/puxCVfmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGEJjeoH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99926606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGEJjeoH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4801F000C4;
	Wed, 18 Nov 2026 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004762;
	bh=1AqeN0M33Tu74PsxiXUzK3ZXWPpnVIcOQcPutPsP0EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fGEJjeoH7ThK5cRxOIXKZPJJmrnFKqGHTZyuP5od2uJ32grmkYyfwDJ8tI7YhVHEQ
	 savzOKmvPii9oiAiSFb5doU6fXs651q+NEfkgALqX6Gu+fcxDCllrJjTaSKI+FLRmf
	 4XFXitmIycldLs67nQcaC8VlC3TlKva/TUnSE76uDqeZ0ncCCLNcoXmP19BQGULBVT
	 nebQIfTy5Ey0CV8WG4vj+YANaZ+Ot3HuP116ixcZOnYNF4ciA/qqu37pPBED8KfGyc
	 TM8zRkHTnBMIz+KZr/17L0BPjGAGdKATajcAsmlKFJDmLA1MQBhbiY/PL8347blUs0
	 fYIj44xqtCW/A==
Date: Wed, 18 Nov 2026 12:25:55 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	akpm@linux-foundation.org, riel@surriel.com, liam@infradead.org, vbabka@kernel.org, 
	harry@kernel.org, jannh@google.com, lance.yang@linux.dev, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: use memory barriers for non PMD-sized folios to
 sync
Message-ID: <av2Y7v-PQ0vVZLSP@gremlin>
References: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>
 <c254a38b-d5e5-40d0-8d70-c6baa850cf2a@kernel.org>
 <430c6b67-76a2-4f67-abb6-e28d07a84bd4@linux.alibaba.com>
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
In-Reply-To: <430c6b67-76a2-4f67-abb6-e28d07a84bd4@linux.alibaba.com>

On Wed, Nov 18, 2026 at 02:19:56PM +0800, Baolin Wang wrote:
> > Do we have any way to measure the benefit of this? I think we'll need that to
> > convince reviewers (like Lorenzo :) )
>
> As I replied to Lorenzo, I will try, though it is hard to measure the
> performance for this uncommon race case.

I mean it's not a race unless you stop taking the PMD lock (I think the commit
message has to be a lot clearer about that), and I'm not really happy to move
from easy-to-reason-about PMD lock to hard-to-reason-about and fragile memory
barriers unless we have a _really_ good reason.

I'd say given what you've said that we don't have a really good reason :)

--
Cheers, Lorenzo

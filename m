Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824650;
	b=SWWr+k+u23kjPs3wJvV+QdYN4vt/T0vVtP97u5xXJkUa+sDVos8fORhS91ULoUiFny2d
	 DNfbftmwUVyvemf89pTR1WMZG1CubYroKNjAjosCQssISLDMZHaOeRsSE/kCvVa9Icvbc
	 qQNUXd0ZiGHBYRP+uEXIZuchAyC/HIKH0fKnOxN697YGtUCVgDyV9Lk1uptdIiyPwnMTd
	 TWAcrcddHy7U612AIXltHdyxhM2e2u5L96dXs3k8v76xd/q0mBxwFFFdW7MK5lP0h/r3G
	 /6mXMjW0Q2Y+vhb3/l5w9W5B8UQs3fzdJfO5Z64OK1FDF4Fjq+5XSNwHFdAErn8jRXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824650;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1BvyT47FdIKjERUDRzZ5b+QRgsVWY90UprMU9CgmekA=;
	b=WKTjYc0DU8KyftySO3I32OWvVzBjHfqUKogBgsqXOGBEQwYrGWv2Ay9eYOdgMd2PH5r2
	 bMaVC33JsEMYxdAtBzskAIsDREIMXkURYkifdnY+4F67iUGFYJAvGP4kjXbhYPWg72g2D
	 ryckEOZ5awNW4ZgNQYZf8/JAZo9IQrn7UHWrJT0AOPRscHCmu5grLrAlv+pTQX6Ob+eAt
	 X9DB6L06vvm3LmUfOFoX5EhS1Z/vJ5d4Ee03X1nUxDm7KWmkAg6tlCG2nj7Wz7Syeg5uM
	 WHpH6dbxdpHdtNWs3qNjortlGLcbVkqE8t5wdsIaJwEFIpklpjuBLY7IhFlg1nAlXCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=F14o7V9N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A3606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=F14o7V9N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4551F00893;
	Sat, 28 Nov 2026 00:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795824649;
	bh=1BvyT47FdIKjERUDRzZ5b+QRgsVWY90UprMU9CgmekA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F14o7V9Nw6o7HYM1FszfHwlRlHBtV2pppcFVBHzE4956/TBu5xhX0iFpuf7n5xIyO
	 zPgeTOOE8frCjqkNoJrgaWyAfldXk9gW13yrvEZ4jb0m7F7Tx66MqTpqkL+Ve8dr46
	 GuHWn4emN7tvgbe7LybIs8LjNZeYV/iYeENFaTyg=
Date: Fri, 27 Nov 2026 16:10:49 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Yifan Feng <evanfengff@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Greg Thelen
 <gthelen@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tmpfs: reset the memory policy on remount with
 mpol=default
Message-Id: <20261127161049.aa45a628196a82f90021b0f0@linux-foundation.org>
In-Reply-To: <20261127230015.30733-1-evanfengff@gmail.com>
References: <20261127230015.30733-1-evanfengff@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Nov 2026 15:00:15 -0800 Yifan Feng <evanfengff@gmail.com> wrote:

> mpol_parse_str() returns a NULL policy for "default", and
> shmem_reconfigure() takes a NULL ctx->mpol to mean that no mpol option
> was given.  So a remount with mpol=default succeeds but keeps the old
> policy:
> 
>   # mount -t tmpfs -o mpol=bind:1 none /mnt
>   # mount -o remount,mpol=default /mnt
>   # grep /mnt /proc/mounts
>   none /mnt tmpfs rw,relatime,mpol=bind:1 0 0
> 
> Record that an mpol option was parsed, and replace the policy whenever
> one was.

Oh.

So aiui, remounting with mpol=default "succeeds", but new file
policies still get the old mempolicy instead of using the "process
allocation policy"?

hp2:/usr/src/mm> egrep -r "mempolicy|mpol" tools/testing/selftests/mm
tools/testing/selftests/mm/mkdirty.c:#include <linux/mempolicy.h>
hp2:/usr/src/mm> 

Oh.

> Fixes: 5f00110f7273 ("tmpfs: fix use-after-free of mempolicy object")

+cc:stable.  Thanks.

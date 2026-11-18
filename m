Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998374;
	b=5eegaCkdHxhFnST1csGmbfD34bTAUF/2jyR2A+eZKxAacTmlH/w0lI3OfT99R5ArJrMH
	 7XIF0AqFcshLYWmP1LpRH0bzxVA8toZjAk65SVAuQ0eMoeRgTrKn+8sKX/YpLbkD4Ox3g
	 2GaFqKp6eCSM5/UCubT+1UYkM6q5Wdw4tORjRzty5WUkH8mKZVRvrnNYqP/PdYjTE4voZ
	 PxlCvqhjhxAn8XLsfrMTQCJJrkZg7PsuRkXwTHfONODFku3krSbwDAmcsl+bmDPUsPD6e
	 Qy7aykDCWdK0OYaJ7mV0C49UGfbMi1RrZ/f9Q05wDjExVcxp8E68n7BkmfPeOOzS6nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998374;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=cJRTdguElXmssobv0TOrC+vaUaZVEoXzykiJehbKQIw=;
	b=pKQ7nKZndKuwErJDb833fHK/jHbrY+l+MAL7abjliWygBx/MMNsUZ9oaOmaHaqKLmFCB
	 RNmV6kXm9mf+uZwYO6uka1C9NTZXxQ/U6DLswUqFX4vr89ZadfuP8qAcXZndR4gTvHJ8j
	 FrUIYqvULmv3/5WvN+4fkQE+yuFE7NDzr+DxDCc7J3gzHEO7fxIgk9g1LSfefZky7jcd4
	 b/axajGuTFkqf50tKyHU/tL8UyIVGfmiYmDgFC5oVaC6gQHyP7pIcQj5HkXzInUmrSBDa
	 IO2faZDE54tfB00wii9sx0p0vhJZjGDOZG1PL0+f2lMZq4b2hzw0DvCrgmBope1V9Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jY8tp64O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B5606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jY8tp64O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF331F000C5;
	Wed, 18 Nov 2026 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998373;
	bh=cJRTdguElXmssobv0TOrC+vaUaZVEoXzykiJehbKQIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jY8tp64OXbgLEBnbVdFjcaoF+43vtl+BqJoqBlnI9pAgGz3zGtHvTQjxkc9uCZUkQ
	 sDeob9S5j2PG6O9HoQ0tcJY8M24yz+CrtOk9kXBCrGVr5vY+7WoMCZTMVhvejFNED8
	 iZlORyWbmqdkpfYXSD3e1vHTsiq5liI5yY7jmCoalgiysP1Eu1YukOZYoOdLREb+3p
	 kVYqfCpfVN6Hn0eaSeh8Gl/2v3K2eimXhrbE7dOw2czndjO7BD2JzRuJqrEqB6rTQ+
	 qJAESJxOmxpEMlIXxMQj1MaTmaLE9erT6XwM1qrSrFYH4LQKIS1yLiEOyeCnHXGaxX
	 /MeOtSIO5w1iw==
From: Christian Brauner <brauner@kernel.org>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Jann Horn <jannh@google.com>, 
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103002157.219277-1-christian.aurichzm@gmail.com>
References: <20261103002157.219277-1-christian.aurichzm@gmail.com>
Subject: Re: [PATCH] fork: Don't let copy_exec_state() fail before
 rt_mutex_init_task()
Message-Id: <20261118-ketchup-normen-klatschen-d155bd8baeb7@brauner>
Date: Wed, 18 Nov 2026 11:39:29 +0100
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
X-Mailer: b4 0.17-dev-04696

On Mon, 02 Nov 2026 21:21:57 -0300, Christian Aurich Zanettini Martins wrote:
> Since commit 6b1c66c9cca9 ("exec_state: relocate dumpable information"),
> copy_exec_state() can fail before rt_mutex_init_task() has reset the PI
> state that dup_task_struct() copied from the parent. If the allocation
> fails while the parent owns an rt_mutex with waiters, such as a
> contended PI futex, free_task() finds the parent's waiters in the child
> and warns with CONFIG_DEBUG_RT_MUTEXES=y:
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] fork: Don't let copy_exec_state() fail before rt_mutex_init_task()
      https://git.kernel.org/vfs/vfs/c/b7cf4cd1f76d


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990415;
	b=a9vbWt5+5n7EwbSAY5pque5loDlWk3cz22LM/49ukHlS7FRapzIji5yLUWRDlfCk6imn
	 zt7mdI+WDV5RA1Jd9QHui6I3XSwjLqfDdky9nB2u5EykWazBUUjfsZMOY7Zma3+QQj4RA
	 W23Wp3ykSMl2HpvHMQnOKNS3IpeGBwcYktS3zkggSwkWXVEzK7M9OKyS2q8LQN8GFc0S7
	 bFjYTB0jise07XlvcqJEfDVX4ALvUO/Se0P1q5389ZnPi6UOK9zxHw1B4Sjg8kCCN5pen
	 gOWDblH86Dk5FxUkVP0DyzpSD8QB1svg5i7VRVvktT9Z8vGuylP6LNg58kqJXs2VgTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990415;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=r/VlPs6VNksU8Hyjvppt/65i66imtzhs5iZhO7qX/oM=;
	b=yBm94JQ4FBpTV0as4MW9z6NE4OVxfoVYkARak2XbkmvYK1OWYVFxx3TmPQhfnrhPNy2O
	 I0YDPLKQ7jkyt4dskDwN+8+m9kEBiBA8hV20VgSaWP1wXczLU6UbRsfgXNlQw0HZJUBUv
	 BAK3Y/IUXB6cTV28xr8QUSjQoD01CGCqoTbxfR2Lpc5S2NaQh9D++flRu5WkUEpJLyX+G
	 bEbSGzz6NBuTUHH6uMM0hRMOgIeXzE0kqp85RHG0WYXzxYFiyCnVXuU9OkJ/a86K1w6OC
	 SHKn6//xhNq5615hmisN53o7NeCfSr6Z8/6SChzOuY25jN0cp5Pt1qRHwqHhYh4fTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rco1sEDO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rco1sEDO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F6A1F000C4;
	Wed, 18 Nov 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990414;
	bh=r/VlPs6VNksU8Hyjvppt/65i66imtzhs5iZhO7qX/oM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rco1sEDO8RTXetZXYYFhDM2gmgpabkEW342ZRHKnvku0EzmkFu64gfO/fFH/T3YKa
	 JiqTQM7l0+zzShSQQX9jPxrEcUI7RHxBb/AtZpNpYszQOg+Qa6BdVUhy+T3lYDtgV5
	 as70zBEbS8liex/IG+61eklABa7QBrdFAgCX/xNhIG4NXbaU9SJjxM3LkojIWLfFtM
	 QVkcDclIENoe0l7mEVVsNr2EHOwnTQjIj9eOljLZ5C/8m8otCrm0z6vmLMAqumn20T
	 Hhfwc2RDqAgZGTdNdmsKX2/U+2gxUH5yn8lgWIO56oEtpZ+kSNeKJjqdAIVxtNjg/X
	 DCRYBtCEQObcQ==
From: Christian Brauner <brauner@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
In-Reply-To: <auXxUSMHCh4vA3yV@redhat.com>
References: <auXxUSMHCh4vA3yV@redhat.com>
Subject: Re: [PATCH] signal: fix lockup in complete_signal() racing with mt
 exec
Message-Id: <20261118-unkraut-plagt-virtuell-59a64b9c3a89@brauner>
Date: Wed, 18 Nov 2026 09:26:50 +0100
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

On Sat, 31 Oct 2026 14:46:57 +0100, Oleg Nesterov wrote:
> Nickolai Zeldovich says:
> 
>     kill(2) of a process while a non-leader thread of it is in execve()
>     can lock up the machine: complete_signal() loops forever with siglock
>     held and interrupts off, and de_thread() then spins on siglock in
>     release_task() with tasklist_lock held.
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

[1/1] signal: fix lockup in complete_signal() racing with mt exec
      https://git.kernel.org/vfs/vfs/c/94ca49563acb


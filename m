Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939064;
	b=dCEzw4Acw9SrKhL8BNNb7pGZxjbpQrx8zGF4rBstCa/L9PRH9eXAHjTvSkBGIwhGmF4K
	 qLbYLCDf9pF8E9R0HNGP0vgwJzgHdZFQMoBqcUknbWfalQwjGMkIGP0A+fV3dzGkZE9qY
	 vhGG49GAXXybLyKDX5ZjA7YLw1YBoO6t0xrJvDFjhntdU5+LCvgiXUg/mhI+eFRmj1XSS
	 utcYPuzyRWRcTT6EyLNcpv+4HO4O/SbUSzskbi2JG94iUPFJa4cbxQaHUFh36SLXqkbs6
	 wWihHKR/XoWY63qJtW2JTAgS1UZf5h6UwDPqbE41BYF+KIR2paRMw2oyRDOpy1/quFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939064;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=wou023xo6HuD+o/1Nqn/3NE6jQfuMxKHfvSxSNa7FgI=;
	b=EtriKnRjeI1DVHF4yWfyKn/4Jh9w5nQgsV9lNDN/KUPoeZmMyNnpT7vhbcua8wXNLfIQ
	 e314vzggyDtoaSYgW/m+fkNfMWt29yV2HdppfyuVmNMRSQNEAN9/EjFk47KHRptEbcV0O
	 Z5EEQqYLEoo0u/78pwjhxszNep9gXbhvzyKMRaVnUFz8MpKjz9HMik9KTzB8vyEwyXPG1
	 9wfpzz0N5iDAE6jYHee1tx5fghipKiGgso7fF9jol/cYT9P1c7IwbcMGjlcMIfqx7ASnJ
	 y9BmSlIvBTjP0I76mWlNR8IN6BM9eJkQ1VtI0dKHVYiYl8z9V/xIAf3aLlRZX7seIEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNPvbPjQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AFF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNPvbPjQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23721F000C5;
	Tue, 17 Nov 2026 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939064;
	bh=wou023xo6HuD+o/1Nqn/3NE6jQfuMxKHfvSxSNa7FgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LNPvbPjQXT48619P7Pwp6j77+NT0YhCSIhqLA0K+AIwR73pxjr28jJLArSSEG5VCK
	 bBS8WDg7efMJe2q4i3yJYBXIggmGcLTDaUjlNNfiBjfITkt9UuQjCjtXDTxZfxWiiN
	 5ianJekY8++CQw6Rig2HUw2DlTlvdtyzaY7JFLB7yf0UHC7Je2W36XSHFOPd/MaJme
	 wA+Gi5nqZvTJTSB27MJ/KNIMgqPx+3U6pn+dm8CnKTrIn5BItmtxWpAX+q6QddxMkD
	 FKZxbjg2OC86An8lthtZ8Ul/x3ckscMHOvLAhZ7hyaVIcibUxZFPRyprJtkQhmStzj
	 oiXUswDTwb3Kw==
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Mani Tofigh <mt4022@columbia.edu>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu
In-Reply-To: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
References: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
Subject: Re: [PATCH] exit: use READ_ONCE() to read mm->owner
Message-Id: <20261117-kauffreudig-lebzeiten-kopfhaar-e89b7492e507@brauner>
Date: Tue, 17 Nov 2026 19:11:00 +0100
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

On Tue, 27 Oct 2026 16:09:23 -0400, Mani Tofigh wrote:
> mm->owner is written with WRITE_ONCE() when ownership moves to another
> task, but mm_update_next_owner() reads it with a plain load.  The race
> is expected, so read it with READ_ONCE() to match the writer.
> 
>   [   14.915975] BUG: KCSAN: data-race in mm_update_next_owner / try_to_set_owner
> 
>   [   14.916154] write (marked) to 0xff11000004471b80 of 8 bytes by task 71 on cpu 0:
>   [   14.916204]  try_to_set_owner+0x100/0x140
>   [   14.916302]  mm_update_next_owner+0x177/0x300
>   ...
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

[1/1] exit: use READ_ONCE() to read mm->owner
      https://git.kernel.org/vfs/vfs/c/daa40a6bde22


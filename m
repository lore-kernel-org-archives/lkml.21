Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598746;
	b=RBh63TouH9tki+JPyOeRt7n8difQFseMlhWD1zM8Q8eLtQHwdUC+ZlwLFO79b5RaONCV
	 s1eE1MlpzsPdilBXgVo+GB6+lH5aaceGe4l7B3uu/4vNX0vDg8t8H/EocQXGNSC1UxkKS
	 TZ39KRg7LgAkx3fOY4tlMscMIP6iSfVLDI7xEKFazBHfYBSeteD1p7Xdybrugl+qArVvy
	 7yKyDQX8Dfy0BatidCxO8tTIMajHOqG3s94qQD4EW8vSmlw6vMaIRRRzLqsT6xTO0/E6X
	 G7clZIxARwqoVJpa7tDjXXHR/B6kQ9SbICKec0zUFRkXWgkEac33+W7NDKYPUUNqg5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598746;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject;
	bh=MgHfNa0RyzkMwQoxVsQL4VGt74zMcO2F1DDPV6xuHjI=;
	b=ZUcwasrTMqdYgl3OumxWxkfbE7J7QWyt2ebPRIxlydeRLJ+tAXDI9+1XHB0PQrzuJsY5
	 ZmzgNWEEZVpPCcJmj83vWbtUTq+nyWX0nhkH3DXhoT5uQpkc1Pn2lptANbjZJXgiL2Mn/
	 mXxXsLlNQd6IAHViCj6EPFxOcdEeCvqV3CCXgBVhMh/ozB80LvkcPgT/k+nCwhl+0Dp/i
	 m1Q6kQmp1XatY3t+yR/q6PKQsKuN3NNzE0xfhwJ+6Sxi1hQS3OBokg8YR4VN3btHns95A
	 QSdKCqWxPrTOm+dWIAVZRiAG7f+ym0WbK0liqMiX67lK32TKaJxbbgR7rQ1FKsRVCkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJCjHSfz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662E606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJCjHSfz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAD11F000C0;
	Wed, 25 Nov 2026 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598745;
	bh=MgHfNa0RyzkMwQoxVsQL4VGt74zMcO2F1DDPV6xuHjI=;
	h=Date:From:To:Cc:Subject;
	b=NJCjHSfz9mueeikkZtulmSh0V1N4i2/tY/zOj4ej4SpZs4OT6p65B2qsRv+Kbr9OF
	 DYGGNsIoKLh01K+mmBxvLJqcQuY6JVU0NmFwgpi0NQWSXzNu16/vDH3a410XmmPPvM
	 /k/LTKfxG9/GigSLWFiYKaHgBowRi5UyrO6BXHVJXbQm/em7wU9cQpI22l0aKS7rXB
	 2WrirzH19giXBsr5fQFFAGU27gecWMwk9ZuKVujs8lq/NzLNmh+3q+gMH59V7dYddX
	 gek0azRXRWKwrbyAT7Xa2fZRnpORgm2QHEQd2U+a108w2LReiaE2fXy+FMoEGbS3Io
	 l2pZaQML/mOSA==
Date: Tue, 24 Nov 2026 23:25:44 -1000
Message-ID: <a2e42572c7ad9f7b1fb7c0aec0e60152@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] workqueue: Fixes for v7.4-rc4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hello,

The following changes since commit d89e1d186ec9271bf78e62771779e9fc03bf0fc3:

  Merge tag 'fscrypt-for-linus' of git://git.kernel.org/pub/scm/fs/fscrypt/linux (2026-10-29 14:00:23 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.4-rc4-fixes

for you to fetch changes up to edf1066ba69c89c42c3007e4230c7b9cb13405a8:

  workqueue: Skip redundant unbound updates during CPU bringup (2026-11-24 11:53:40 -1000)

----------------------------------------------------------------
workqueue: Fixes for v7.4-rc4

- Draining a workqueue could return while a work item queued by another work
  item was still pending, making workqueue destruction warn and leak the
  workqueue. This is a simpler redo of the fix in the v7.4-rc2 pull request,
  which was not pulled.

- CPU bringup during boot repeated unbound workqueue setup that can't change
  that early, at a cost quadratic in the CPU count.

----------------------------------------------------------------
Saurabh Sengar (1):
      workqueue: Skip redundant unbound updates during CPU bringup

Tejun Heo (1):
      workqueue: Fix drain_workqueue() missing work items chained across pwqs

 kernel/workqueue.c | 60 ++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 11 deletions(-)

-- 
tejun

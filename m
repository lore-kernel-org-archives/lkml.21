Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795119135;
	b=wC7pmcZ/QH9QudJ57Uaq3UFnZR3KKjel7Wj1+PzI4nD2NY2sOksbBOSC8G3f6cFXc6e0
	 f4HkhOaBXXnmsk3UaElEcAw+lBYk4kfIyUOIcoG8jeIlYZ7legxBQersC0hn4T+/Uu1qy
	 P3lIpvXx48EwNbv4euAzIFeDl2fP/EtkIbL5lCQtx13irw0VHC8QjlLsAGDkLJftm5tmN
	 SplM5lxEr9WA2fIe7iytgZCu1iW5y0phck3oad8k2hBEhY5vqjnAWzQsLxwnCrLnbjEn5
	 bAofak90fE7P7eYeg7AujqS3B/efDYDOWSAL2kVgPlaY6WUsnwesLjVXM0qyLDQfXRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119135;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=iOwmJkQbVZknKmbWQQuT9E8Net1iwgFfafauLXWxtcw=;
	b=RTVIle4Z/DmlvQ0BSQh5jFx9015KVOSKnJjarohkgSFT5YLLbChwcIAIBXdwR7H7tVsq
	 YsJpBXWlHI2LWUfL/lEuA2LfLAzvrGX76QXshP/lF+4d7ly/OmqQkLbSEGM406joI4QKE
	 bMgqYeA/X2Fl41A4RGp3z8dyreIt+W613Rq1EnY6XescGcNY4IFRqIa3ExyZIJj4dQBwW
	 2rUVhZolrohLMLcbKkNBJZadhyi/0VKg6mEPGsIjxH7eCqoSe0cQCHOnyimoqlgXYZZgY
	 4C84FIdSi7GEDDf7ma2l112f8OEWJwZvqx1b0gvbx9bD9kjlHIbA2nDQ6rcPTPtSJfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKRmU4iz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FDA606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKRmU4iz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795119135;
	b=OWo5dqwfMx9J5wR5EvxdrrD0m0XAaXxdxjweTp2/6njtccVsZIzH196Ymifk4lHH4jUv
	 We/2k5cSLC71mJEnAGlF6d9WnhhkBPo5Z3CW+HKnO2YGtUQUHDW+Qo33d5XgOwKpHMt41
	 RPQLasUraKp3RAfhv+3oSLj356NnhpzxwFH3tNS/lOUhZJyFVf1q5ggAj0GZ1s3ek995I
	 rByDrS4big2pbgPJlZLcbDgDvkd4fsZiUFAbVCw53jcbPZimo7UFimzOWauX5EpUZhCcQ
	 920SL1pv/Pe3cV/x3Xd/1yqvJONOrh+ytlCEtOjGGYCnf0G8o/H1y9VG60gY62p+5rA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795119135;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=iOwmJkQbVZknKmbWQQuT9E8Net1iwgFfafauLXWxtcw=;
	b=MJ0eDX67o3nLq95MffCoICQGgnJt3UlwpqAQaV7vMN728hx1BQkDiSuQfX4915elulds
	 S88DNVbKa5HC/koT3A9QiT3pSooLhKS87J+kYgcTUbabwASgvuVydgc+zuVWYk7HCv5uP
	 JvKVthyeLYu6HyJ3to11F9lGTenJeXd4kt7K1XlFi7UKNSFkx26BvyIMPLFcnex3GRhYM
	 REIc6w8bX4JZarK+4jN9w71ta7B9Y2hC1bUipmWOBxhCOBJLha01QGDsca74UVdBmBocw
	 PZ1fp2rNLEIIz3zJkOUozWpsaZMSzgoPQlvHXwLgwa8yrcQewervVHHDVaHETuNA9ZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A7261F000C4;
	Thu, 19 Nov 2026 20:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119135;
	bh=iOwmJkQbVZknKmbWQQuT9E8Net1iwgFfafauLXWxtcw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=KKRmU4izJMvxAbxLd8GocycGWnH4uDCfncvZxIMmEXipj5XuTn0PT2Pacr+QZeDOF
	 +5QZRDYi54nmZOxbbByNMWGGHpXcmKCvFUBeuiteGlKpYue/jXvQney/V1bX21Nrmq
	 c/LwhNkqnwbRxt5uhNriHczzktNPCZMI6VYGpw7PHcwF5N9f47dGdviX6L0OU4wfZR
	 JHd+40eGUIi/+nj91QRpm/VDHpzUbmtEtZ9U48A5+VBh6L4QjdCNIdgWEPQThIiS7C
	 9exFI3zNuAsMDqKgulECGM7HYGAwctG2BXY0E+plHjytr35V+O+EkV5wKCsxZjeLzn
	 aznEZm+nSl2OQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD99E4B41D;
	Thu, 19 Nov 2026 20:12:13 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH 0/2] w1: Fix the lifetime of slaves and their master
Date: Thu, 19 Nov 2026 20:12:12 +0000
Message-Id: <20261119-w1-slave-release-v1-0-c2948c825d08@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABxY/2oC/yXMQQ6CQAxG4auQrmlCSRDhKobFzPCjNQTMFNGEc
 HdHWH6L9zYyRIVRm20UsarpPCVInlF4uOkO1j6ZyqK8iEjDH2Eb3QqOGOEM7NGEor861FVFKXt
 FDPo9lrfutL39E2H5f2jff6NQkf10AAAA
X-Change-ID: 20261119-w1-slave-release-be9c0d8ae755
To: krzk@kernel.org
Cc: josef@toxicpanda.com, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795119133; l=967;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=FjSxTwkL1aOlYkxVoWOgRcFWNmB3Um9Pqtg9/7bZYlM=;
 b=2tWyQWDC/zdatYVFVnSSgXg0Yq2cu9+TuC/eYHAwyIL7j84MHuAMA+x/KktUIWnCvJFjlt15J
 pEyRcgqa4+2Cx7ojzVgRBNqa9DSAKHOCDVf7Ijar3mB+FJS+ceouR4x
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

w1_unref_slave() frees a slave right after unregistering its device,
while the device's release callback still uses the slave and its
master. Since commit 9fcbbac5ded4 removing a slave no longer waits for
that callback, so a delayed release (or any late reference to the
slave device) runs on freed memory.

Patch 1 frees the slave from its release callback. Patch 2 makes the
slave hold a reference to the master until then, since the master can
otherwise be freed before the delayed release of its last slave.

Found with a static analysis tool and checked by hand. Both problems
reproduce under KASAN with CONFIG_DEBUG_KOBJECT_RELEASE and a test w1
master in QEMU; details below the --- line of each patch.

---
Suyuan Wang (2):
      w1: Free the slave from its device release callback
      w1: Keep the master alive until the slave is released

 drivers/w1/w1.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)



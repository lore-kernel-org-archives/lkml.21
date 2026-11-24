Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538712;
	b=uuW2zNVqDrex6E39uIBcnQ+RK6zUwBwTxEiwoXqGcfK3Gmcucp5haRF9NWRGXa+Lh8e8
	 wWSA6qUlkHruM3fnmgA8b4R0sQVcvit7x/KTL95kXzQCuu8Phv/55sbYp/PKx5HUSmDpy
	 YCMJqgJ3sLkAUOZ13B2dkyYJo6tcucojvCbqtzXvBqvEDXq6EBQhIL3N6XRFTzBGMwP+t
	 KL+vQaP6nV1f6wkC5OsuD9SQ4LnnWo/0toZu5cDuC1/tti9pqHWCCm6fG3CZEATPEymJQ
	 7O8nkd8efBcLBm6aoVllEpnvQFkZaCyNcditxkssKGttrhE5HB0BIykYTHt1cy2y8AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=62Nm6ymc3kilnKxc/e/Ux6w+wWKZKYa/5s811073n9k=;
	b=xUlmnX3wMhsgiWhgWHlkh/mFjFsmmBdda88TUgwo6EN2JBaUNh2XREjOgLT6OmN9Be1T
	 hlYLj4VUNFZ0LvOWBBRZBX5x5PcZuQKxejC5rwNn1GdbJd9fiaD58uP5WA5nwfFTDdBt1
	 nk+/OgJLyqR1xBYE2Ijlg+B6mREd/L9qJ/yUK6RLbMkz5VmjCghFkMfUtKygU7P3bvKdh
	 XQARwaZ/8G7OqPvm7kQXyWrQBojfQQPVN3oXEHA6IuSPlRgPwJ45mx8zMNVlHsdHzBJmW
	 397aiwG4ndu89Mfov+uOmu1Wuc0TZQR9Tc62fmJK1hu3H0Jx+cq+s8AwgkWk5x9RSeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LfsmKWTr;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0107E606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0107E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LfsmKWTr
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so29290995e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538710; x=1796143510; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=62Nm6ymc3kilnKxc/e/Ux6w+wWKZKYa/5s811073n9k=;
        b=LfsmKWTrnqr4AC74R5u4lHInrnat8wQSoHH1Qi3hLEQc5ANyixWG/vDLVvR8y6Wu/c
         g6LX0eRGBNLRZ9E9rv1kODrlfvfJHiS5EO9EtgkM47hJ471HFMVqHe8X20R8VvIVj5sk
         lQ6fBljUUNIdSejIYpQqez2W7pk9eW6XD3/Ka28uLtuaEWaAjTS2Fd4iLniOv6COIIgt
         OCSMPQI4kFyzc1Z+pTD0W02thtGGdtTPBuFlql+6f//VtoYo5b6oj1HwQHmQHFZy4zBZ
         OYtOwcy2hDKJqSp48VJF5FZa/ovA5JnPPLmMr1eyQKgjv+9fVeyyrSqxUs5PliyvpEfd
         SNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538710; x=1796143510;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62Nm6ymc3kilnKxc/e/Ux6w+wWKZKYa/5s811073n9k=;
        b=Bbq7RJNBPxA1oMPodClNgsStcxLn1lV8fDb/1x3mavSMZYwKXifXGJmPoeBNlyhmgS
         IPvRnV3+cWXMQOiczyHdNsLNtV9iQ9y9TqDrVPxTRFoLw35fz6Def+6BBpmc7x2yLQDK
         cOPQsm913SgyuIVF6qupN5bIpZZzeORLuotY9de03X0e7CJ5MMAsE4vlK6h9dVTu8Cn/
         WVWKfcASVC3xtJMizR6dbanYqAPf+XEWyc1RQlErWpOaniJbG545w9a1K3+VwTFrL9LN
         me58ny0+2r1IggV9HW8c+Q3t+8hvs1MzLGflwzW1dxCIQl5e0wLkH9L3QyKsbkVzzMQG
         I9xA==
X-Forwarded-Encrypted: i=1; AL+hErEKjvX6EugxEv5edYBNe5mz8JWibiAAGrhrdaiCX5SyekWDq1rOxgvZjzDhQKX2RDfzIo0NBctyFVkmmNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c4XeMhxuD145BiHrVYyb4ScDa+r/oe7vimTuTlz9IXA52pHEP
	uZIiXwkxjQQmRL8NpBXJb+fGCYQ2SEloIqvCxblCN6iXwFQZxzTwxgqQeTf4BjgVRkvsnRglj6m
	k49GM4/15rNARo3FpFu7kZQ==
X-Received: from wmbgz8.prod.google.com ([2002:a05:600c:8888:b0:4a1:989a:a866])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8402:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4bb88806287mr239626435e9.14.1795538710040;
 Tue, 24 Nov 2026 08:45:10 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:41 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-1-vdonnefort@google.com>
Subject: [PATCH v2 0/5] drivers/virt: pkvm: Protected VMs with PAGE_SIZE
 smaller than the hypervisor granule
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This series allows a protected VM to boot with a hypervisor whose
protection granule is larger than the guest's PAGE_SIZE (e.g. a 4K guest
on a 16K host).

This is best-effort: non-granule-aligned sharing requests are rejected.
In practice this works because only the swiotlb is shared with the host,
which is allocated early and large enough to be aligned with the
granule.

Tested with a 4K protected guest on both upstream and android17-6.18 16K
hosts (with MMIO guard auto-enrollment forced).

Changelog:

v2:
  * Fix commit description nits in PATCH4 and PATCH5. (Fuad)
  * Collect Fuad's tags.
  * Rebase on v7.4-rc4.

v1 (https://lore.kernel.org/all/20261007150255.1648849-1-vdonnefort@google.com/)

Fuad Tabba (1):
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MEM_SHARE

Vincent Donnefort (4):
  drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
  drivers/virt: pkvm: Make pkvm_granule __ro_after_init
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MMIO_GUARD
  drivers/virt: pkvm: Allow granule larger than PAGE_SIZE

 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 102 +++++++++++-------
 1 file changed, 63 insertions(+), 39 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.809.ga0b61035b5-goog


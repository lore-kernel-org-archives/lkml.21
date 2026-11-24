Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549635;
	b=UxZc6SBxYDclezlMk3AhUN0hd2uHGMtTsjXye9pqWn2FC+SMnTX8QgobkSAYNPqzDnM5
	 nxv0GphDx7ipWO60E7UMmO4eafmA62l77+ubJbrEQiYXFfRyh5at6H92xLiS/7DF7KhgE
	 /U/3wJlgpjS2sPtMiiHJXcba69G1/Vsvr0rtDYL7jV59XR8yzADSc3wWljgx9EXMyYQSp
	 +QxkHG8LwPOIUOTblgThsEwb5ftjXc1OjF1zjkfaR9gZWe0yBrmTjOoK8FYgGcpwTQYA0
	 GXVaLeT+0VQc3bWXaFjsSmPjiWFRjT9TDxh41SSY4iNo6N4LDi/7Hr9LCQvZO7b4yAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549635;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5J01ZOJdhCMA8zsKrJKkfRkGLE9elsf3RiNcT7zsnao=;
	b=pZydIBiOJbCTURipTKbXGCpleF3WozmjItajXDeIGQG5sdSJqnYU7/0LxkCnx+FepXUf
	 lWf5TfKhRFiyiuZL4SDTV80HR/a1zLrWiIyGYhJnwLqBJsSQVHzwdEJp0PkxgI1+gPq7s
	 PBFT1lkzPmoY825zzy+2e0Gmo/DNXfxyRKtzv8Ji53JMUqPhqMSWsM1ZkQGYvMJ5SU5WG
	 3QbvwYHfErtNckFI6VsAyhZBtUBaQXRlWOI16bQhCcUjB+DxN1aHZs7Cqi6zCds5e/0OJ
	 nDV0aCJ+aFlLznh8heqmie4/oDFm860BxJ0N5UKiVz/omsyya1OC2o2V4Md+5Yzt7qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gID+J2N4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA43606A333
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gID+J2N4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29DD1F000D3;
	Tue, 24 Nov 2026 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549635;
	bh=5J01ZOJdhCMA8zsKrJKkfRkGLE9elsf3RiNcT7zsnao=;
	h=From:To:Cc:Subject:Date;
	b=gID+J2N4pc96FAGoaAdH9GNoyuk7pm/dJ+Pd1dLjC5UYwrf/2XXaiSDqR5Euswhj0
	 sJMCCPYvAXOJnPSpjddWI5vircAM4cpLXkdv7zMBKq7YtZYBsXLWu2Yk+tjyMe3dDx
	 9xyzRKC5yaHN5ndp6zBFA2eGmxq/46X0asFrabrgupkiuu5/Ad4SqNuuysY15OWCJM
	 Ja/MTu/+pURvovmn6BkUeyiAxihKX7G+i69Uzw+7txSYWS12eL9RhqD//BMsAjbVih
	 hFeqCiTIYatN5sEE0bCjcu+JpmSfIUjOt58uPkIu2oQe8XoJfE7tx01fgzPeCTMb7c
	 rLyTWF0N2uqEg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4AF0E1980047;
	Tue, 24 Nov 2026 14:47:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 24 Nov 2026 14:47:11 -0500
X-ME-Sender: <xms:vekFazy-q0gutZ7ux0FCvcouxXRxAsHD34FNLCUkK1fuewqtUaqS5Q>
    <xme:vekFayNFPbrDfoDWNGpBn2pKSD_E5S8LbKakNnZYjiRXw19kBMBVyeCxLM8EdpnsX
    528oHUr8lqcvU_uwceoVN_NHgO0YO_dsaWuLI_dcdXenzg8-lnCvSIK>
X-ME-Received: <xmr:vekFayY0ZyDCUQZvCIkdB952g1vLWtuV1YXbqfih5Zldm3T5QriCgJ7f3Bo>
X-ME-Proxy-Cause: dmFkZTGUX4TdwkcU+s5tAMz9Yp1WUvFjhlftEjNS8e63BxeNN7yQom4qhi+EDz7Y31fNHS
    VqelmG4hXUQhSnQKx90mkPkGjS/Ib/iBqwLxCgM1q+hZMnhrdSgkjdm4UEMT8GOdDxt5Z2
    7Lg6Eb6MKboetZY01n/Hk7uozefc7YF5hljgdbmJ4lbazD83XBGpus63VsFuzXmhXDEeZ9
    JWdTxiLjrWHBiUq8/dP/MzCYgBCjoEn2Rtgli+x14FjTF6SI5r8vv/15/QJ2H+QpE5X9kd
    KRGhRx/BN1j26Et6RkG3SYm5hSAJA2HNDEMsr+bFOEgSNncmefC1a7U8PQb8pOch7ngxf1
    TH5RdbbWHADsYXTPBUS4gRfpDxngpqbMNQVrK10l35jqedfF0BB3QCysPDTKOO7eHI8ovf
    idn9dNdDLs7YY0EsnDjgUqIuacUiQfqhXDbUqRKeddn0k6LE0OkDP8c6CcUePcjGVVRjT/
    1Dmk2gxT42KUoHNP1lF3WlEPPJO2yyF4hmflWKq95hRtJPQKIxeQMfyuF851GWnjKdDT3g
    SbqvGWAO4miVaJC22MxZHaamB1zkVFgWEyLguUH9HRyTjYn5kFnPMv2mqcyEbUK3OcfO9u
    MgL7kHeZdsm22wy1cjhaB+lVWVcBx4HC9CC7zBZD36CdiZb8YqTljRRpgwMA
X-ME-Proxy: <xmx:vekFa0qQibBd5Yjy5EDY4qwQUHYEh8Jewoz4q7BmzAD7BnOD_BdArQ>
    <xmx:vekFa_zfywy1OGE3qkkRXlIpISdYaw86n2DSZjwWwdES5ay66R-Wkw>
    <xmx:vekFa8KdLB_QyPLQGQzZnGGV-levXzamS0cBt16XgEABqKCVqSewpQ>
    <xmx:vekFax7A3zle1yCe6-c7eXVhSt3HY3FhBsf6HN1wJIdeck5M5QzF8g>
    <xmx:vekFa6wPi6anooP1ZJHrXVg7yqmH00bZr8TksT7umWyBWjJFjNPxOnes>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 14:47:09 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liao Chang <liaochang1@huawei.com>,
	Ashok Raj <ashok.raj@oss.qualcomm.com>,
	Doug Anderson <dianders@chromium.org>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	Pengjie Zhang <zhangpengjie2@huawei.com>,
	Cong Wang <cwang@multikernel.io>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firmware: arm_sdei: Fix NMI backtrace lockups on idle CPUs
Date: Tue, 24 Nov 2026 19:47:03 +0000
Message-ID: <20261124194707.1030653-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDEI NMI backtrace signals event 0 to every other CPU, including the
ones in a power-down idle state, where the kernel has SDEI masked. TF-A
acknowledges the SGI behind event 0 on a masked PE and never ends it,
and the PE takes no Non-secure interrupt again. Jinjie hit it on a
384-CPU HIP12, where one sysrq-l locked up the machine.

Patch 1 keeps event 0 away from masked PEs. Patch 2 sends the regular
backtrace IPI to the CPUs that SDEI refused, which wakes them.

TF-A v2.13 and later refuse to signal a masked PE, but a PE that masks
right after the check still takes the SGI. The TF-A fix is under review:

  https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55414

Tested under QEMU TCG with TF-A built without that check, 4 CPUs. One
CPU masks and unmasks SDEI in a loop, through cpu_pm, the mask calls and
CPU hotplug, while another signals it; sysrq-l afterwards. Signalling
with plain SMCs, as the kernel does now, wedges the target. With the
series every run passed, lockdep included, and a panic in the middle of
it completes.

Jinjie ran an earlier version on HIP12 with the power-down state
enabled: sysrq-l got 384/384 answers every run. The handshake has
changed since; Jinjie, could you give this one a run as well?

Kiryl Shutsemau (Meta) (2):
  firmware: arm_sdei: Do not signal event 0 to a masked PE
  firmware: arm_sdei_nmi: Send the backtrace IPI to CPUs with SDEI
    masked

 arch/arm64/include/asm/nmi.h    |   7 ++
 arch/arm64/kernel/smp.c         |   2 +-
 drivers/firmware/arm_sdei.c     | 130 ++++++++++++++++++++++++++++++--
 drivers/firmware/arm_sdei_nmi.c |  30 ++++++--
 include/linux/arm_sdei.h        |   4 +-
 5 files changed, 157 insertions(+), 16 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.54.0


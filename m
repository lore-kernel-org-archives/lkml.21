Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026453;
	b=3SxOKoz/ubD7AZPOId43zZ07LHq3XDBAroZMP4AJD4G0hC88L2C2bYyhHgOSmC30umyV
	 CtptFJ895YGePZJor8rGeWzQCb8nHqkxuiTrBv0i9pFK/BHy0kEM86s259Ch6GDsAXCej
	 oYpA0JDZOKi/4QmeMFGi6OygsuYjNeMzH/0uEPW0F0aGsfsWWfW4YC9Z8Pvez/y22RUu4
	 F/VwPM03yiRB6Q0ZyGs5c/GO8bfIsuUkYgF1rTKBaq+OtLEnB1JistUTGvLw0QuJXWQJc
	 FsWmN9I5VVfvEyNnNsuG/16SUZ11Dk2VCHWuRz0qm/P/63KB7yCiowhaDFatBg0sw5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026453;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LUsD5Csh3GIptL1Tq8/cMwSlA5TqieuaWNVvXB6pwtU=;
	b=uv2qAuL/PJsosPtVFmTnCKiFnRaHQkRKVPlTx7l5DegJGQGlkABQxEQK6tZmNY6dx2+B
	 eT/P4Kwd+G1WuizcHbZkK+CxgzjepW+uNB9lnTVt5X+7j8EEoVcYTEar4VZzGxC8/bISI
	 voNaL2kSEGfVUg6kE2nyu712T6rqH4o7rObaPvIv+pyzP5tTo6zqA+6eCT8Z00Sp0AMVm
	 nX/A5O54ZaHbGkaDzrO1QozAEEYYzq2dZnUkzQBMlF5lOpOzf0UhgX+OOk99/64tBvuN2
	 oTVA2YDgqBJXh3nzKwQqtysmCqNkJNZbkOcmFb4UiJbArIGV3HNqhvTgQrVSNE9Ab3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MJ8AaDiH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49AE606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49AE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MJ8AaDiH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D5841477;
	Wed, 18 Nov 2026 10:27:29 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7B4E3F673;
	Wed, 18 Nov 2026 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026452; bh=1MS5uybl7w1NZXxUxb0cnUerlsOo/zrS81uZ7LmgQT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MJ8AaDiH6bW7WOVMGXyJxxrA5fuwJxSYqqycqW3zaHDN+7UoGX3AZnKUEQJ3y/kRB
	 ASJjs4e7xDN69fhDwWt18U+HspK9bXK6975kl3Sr6hahhJ1CBpmZvkCX1Q4Bc3sIaG
	 rGcHk/xvixRZhTKZcAwpfuLX6fYZn8qSTzWvqp98=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/6] arm64: BBML3 errata workarounds and cleanup
Date: Wed, 18 Nov 2026 18:27:08 +0000
Message-ID: <179502639862.2187887.16636130062052880342.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113145022.2592454-1-ryan.roberts@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
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
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 14:50:14 +0000, Ryan Roberts wrote:
> This series updates the BBML3 allow list following a review of Arm CPU errata
> and implementation support.
> 
> The first two patches remove Neoverse-V3/AE and Cortex-X4: their latest SDENs
> show that revisions previously treated as unaffected still suffer from
> BBM-related livelock errata. These patches are intended for stable backporting.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/6] arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
      https://git.kernel.org/arm64/c/4f9280c8db69
[2/6] arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list
      https://git.kernel.org/arm64/c/c6ba16d8157b

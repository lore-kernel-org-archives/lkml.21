Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804790;
	b=vrxDfAv4VY9OIs9nL74IHad9GXXkKjyh0dbcm0fEkWjikKh6WtvMrWC1mJejQEFVM7w+
	 GZ05Id8Vs5y+t4cyMW+Tf7jKh+u+PDFlc0V4oUkCHhdxnZlxLQYiVdZ8ZNWEocpPh+Z9R
	 FrMyydIh0msEhRgox6uUxciv+6V4m/iVb5vRwfzA3wbbu+Nx1VpTu09q08dmaNYrh1kYf
	 zAVYY5nmKbZfd4eZAbmXMhjLVY63FqNFK7bjHwrFbkpi045PT+sj00rGdepnPp/PpFFKM
	 rawmkKWbwicom6qgIEy3r7AzKzvlK7CKV4lefVw3c4oWz0kOUgSbUdvD5Vgb5w83thg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804790;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=S9jVPwgFepzrO5B1dhh6/eEaFVKQZKqWzI0TGHjI56c=;
	b=QuVKPkftHqlN9KESS6sUj29JOpWdJ01iX6GGtGe3btmiYLuO7rwtPq9ThvfndKv6oEcs
	 DoJhc5YpZmuXOpufaImZ9c41Yoer2n0AXwdmOUBLRvl+doVi3iH+8XjzIU+dYjchAcaT6
	 FT1vTex+lxn+IIdUP2qs09Uh57yekU0JQQG+xKMwbgd2+baVGr7gSye2ztgmqMbM2KZdh
	 dJ3/+AMEelulysKyY48BG+ADZ7H8GwLgfITpoRmvkoAlV/8h9tf7bb6zyqJ5wmKYyemXd
	 clZbWrFz6DFWZNutxjWyYjOJLqT5Mrin264lipbHEhZNdDdGTTpXobk1mC+gq45aHhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPkH2Y0i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78560A5BE0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPkH2Y0i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3741F02EC2;
	Fri, 27 Nov 2026 18:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804789;
	bh=S9jVPwgFepzrO5B1dhh6/eEaFVKQZKqWzI0TGHjI56c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fPkH2Y0ihg4rmhOwGPiPiT8Djr/sMYUEUqWdi0JlboxWoigSrpXpGPeSy45CfC8S6
	 qkXifzbA8Km9ye9b+wm7zTuCqR3JlcftWEnHRCp+jYpR/KbA2aA/D4SXpv3mqo8PI9
	 MruzK7otx+SCqlByzZ25/JHFgqUfVjgbFBXll2zrL1lW7gZAtgdIm1tqIBVst1gm4h
	 7X/zpAccLeOYJdBmP9X8YqCNvmEWkeCW7/YMJcfjgYLgjIlscHTUit3vLiN3+69Wfw
	 K/yOHbngcAMs5YXhdZt/bsywmYZCeySE4c8NO6CDkv4q8pess73x3n3wkLWefS16K2
	 mFOJ+kKTmuZIQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: Re: [PATCH v3 0/8] arm64: arch_timer: Improve errata handling
Date: Fri, 27 Nov 2026 18:39:16 +0000
Message-ID: <179579367840.1286378.13094933579176079407.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
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

On Sun, 02 Aug 2026 17:53:19 +0100, Marc Zyngier wrote:
> This is the third version of this series addressing a couple of
> embarrassing bugs in the prolific arm64 timer errata handling
> department. See below for the changes since v2.
> 
> Time is hard. Timers are harder. As a consequence, we have plenty of
> broken counter/timer implementations in the wild, and an
> infrastructure to deal with them.
> 
> [...]

Applied PMU fix to arm64 (for-next/perf), thanks!

[1/8] clocksource/drivers/arm_arch_timer: Add read_sched_clock_is_arch_counter() predicate
      https://git.kernel.org/arm64/c/71c11e8be95d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

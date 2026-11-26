Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662074;
	b=eOsXB+axh/3uveV6XpizV5wKniihZE52ooEMUGOpi/1LkKk+xAJybo9yHfsxeeTCWXbR
	 blieYG/bnMRtxTmH3H66gb1nUevvgrA1KU6yJJOv0YB47ued/J6/1T74KQV//xWDX8qsE
	 ShCuRnrMvI4MwQ4vvuG+mZn6T00n3OKSmy1XYGLoi1B/1qzOEKpzcpKkZz141v10wtySD
	 kBDVQz1LpeaEI2qJU0L8lRZTS9PtQzzR3Y+lAiaR2B4zRascRs+MQ6imgzELYc14UVw5V
	 HaakLvNP0XkMxdWstpwpKhD3w59gydG2gE1tUAzoqPGOoyy2KO8EwgsE2lyRCL6nlLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=;
	b=q/HgHxIUWVkUPSg74hIxGGQUvHAIQ1cb48L0RCPKEDeQ/A4kom8rVWUhmYyCETZMhBEO
	 gmdy6PJM5k2rteUMOayZZrpWaIQnu6RDnbrgfd3sYqSqhPc4bGiKfp0NC7ahqwleDyqGy
	 L8iowu/ByGOTNXvC/aeYzkRxCCfbaDCpRwNnW+eQsoxEO9GxEq/OLMYbo47i4EzTVYdTN
	 euMP1a3pXWndpnU4pJwrivJXxvI6+ayG8EOqXph8CzILzO7zk0HkYTixq6TWECrEJjGAb
	 tR1sxZAIbeQsBnPR/nRuvLTKHGnNwy/y1XBglDZr5CFvam4madKal+uPgn29utV3XFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Og+X/nE4";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE14C606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE14C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Og+X/nE4
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso45025855ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662073; x=1796266873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=;
        b=Og+X/nE4MtJKY63FpcsvRYQx7tldAUhLQA/NyefbkGxp5tFh0evXGuyKy9kf91Imgq
         Et9+LuQ0WknieuFyHK9jj7EW2v/MVB9QtF49RsS+8y/DOkdT1RjBVxc86CF9RYEJfEAD
         9ljM9GkPkGYeyDIeKuSdYfq9hzvL2uN2Gkuh3QSpm+cRJuwhe9yqQPWJIm6HClys+ZR1
         vgfsYJxrWZi2wt29bUBuHwDLxSG2tNPyhzOJPKlh35J9B1ghY9vORxZ7Os+MNvrRLgp7
         0asumaP1uoa2NNFMA3LwRDG7nDbRBJIHxzkxj9vmTNMC/RSR7TCpVa9uLB3Vf1rM87zH
         JIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662073; x=1796266873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=;
        b=sbAQ/w9yIZLZ1SCU8SS0MDGWGgVPHU8bR8iZOzBbY6YSpyodTAhi2Gy5L7+8WQh3oy
         WdRbC7YjjOcrzTQJsblwOiyNKxiGCjpO2W94RCL+GI3kM58yslkCMwc3aoREU7cMhm5M
         Mln2QXKEPEJTuTQpt10KNKX8Hrg6HGUndGsJ7P+swwIK+P+G7RJbfwG+6Dy64dc/zX2u
         X9qoQ8TupxDOCCSmEI1dxTBajgWmEue312MEp7VF/1PUApJkB2gyIrTaa55RWoS/ehCR
         yxhqBdHPkkcT4PT8Wpan4+0MvWU9+WdgdbWhYbIt9yxLNXvf/grqKE829kT1zSQUmIjR
         zU0Q==
X-Forwarded-Encrypted: i=1; AL+hErFFg2G6XwjIhJW++xp4tXOUGFJFbr9EO7iEYbZSCs7BDMj+Y+QFKyb0hulB3H/TEdxuHz7qMoDet336bTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x6FcsaUScraxagB+OIX8goFSDi1/thvmuXkNL07LCqzSeTJQ+
	Zp7alzw7ypePVdwvBa9+jWEvGo+nH1mpKFvCLS6oAtJGd5pdSUSLugO0
X-Gm-Gg: AZFdTZePkvzGroy6bXOO8dzW4x7trqkQiKjRLvNGCapGntcsH8QnjLodIzx2Xs1cLet
	CLdnJi6BGH37eaQg79BDkyfymx/OBCwm7uG/dIFyWKQyj1QqSUksoMFkio1EwFeNPnZ7TAD/iMG
	0RowLUOc18cA+hF50ezydl3JwOYt65AIhymhEkj605E+0mpf3vpL6rh9uFvwE1NH600CVEWYgM3
	TOlSpNx59CgQFwQvJjI9aTwJjzM97kARY60pZSJHAnZA53hBwAeaq+WMisFXWyTbJAZyJ9Ckzbr
	hBwnBf6MhxsTRhu4EcCUDhqwIpgbUzEewjY3h52hTYfK60VHZk5/niIoDLB40nKAF4u5k0QMdS1
	udxtvSFxA87CqXTzxSR/F7gKESBPBQrvfEaGK2SDR8qT//ZeuVBuxetloejHuaOV5wK1OoDGI9b
	YV8TNnWD+3Xkj7rAI1g10IAwq1+zKKHe52YD38DaMqsWSUiHRpbFxSfO4HltIr3YdrUc5SBkpU/
	CbTirB55NyvttgPeGziGV9wy6Vvba/XC5dDPAvxSDSygqWeEdMiPgtCu7+G8EOkjoZDLq7e7MtA
	FYfGY3M1q7BfE+fh8L6xENWJ96G05qcLmI8=
X-Received: by 2002:a17:902:ec91:b0:2f0:d40a:cc21 with SMTP id d9443c01a7336-2f0d40ad46fmr39670185ad.22.1795662073095;
        Wed, 25 Nov 2026 19:01:13 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0d537a522sm24278755ad.47.2026.11.25.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:01:12 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: cyan@meta.com
Cc: leeonion.muyu@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:01:06 +0800
Message-Id: <20261126030106.2543652-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126001920.3185323-1-cyan@meta.com>
References: <20261126001920.3185323-1-cyan@meta.com>
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

Thanks a lot for the review - and for lz4 itself!

That's a great point about independent blocks. v2 passes -BI
unconditionally on lz4 >= 1.9.0, with a build-time probe
($(LZ4) -BI -V) so hosts with older lz4 still work, exactly as
you suggested.  Verified locally that -BI produces byte-identical
output on current lz4.

v2 will follow shortly.

Thanks,
Ping

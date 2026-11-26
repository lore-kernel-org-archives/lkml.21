Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669474;
	b=5tcNhQL/hEQX+inf2s7tgCXzRH5bAdaky5cQV4Zob+tgiPD16EyPMHHJg7TsleVQ9IKc
	 aggKsk/TsDE1RpL0paC9s08Bw3L2Pc7yVP5y5tJwvXkQDOCkDYrxz9oRwggy3L/z+BXoK
	 WnhxFHiaCyrMD8jwYf+iViSmKNDxt7+XKcLQINax8UyciOcJvecOzDOO9FQdN3M6MBGhJ
	 XpDqDY4WHccGJQ5VhLLJFD5VNnFhvz5zPNpiRbuwyfKgtYmdmTV0D9BgXUxmIINGq6Mkj
	 aSD2AGJ3GiVov3pk28Itxo9sD6g0we4Np5Ds4wQZGlRZL5H/A9BBpg28LFMdmR2EoTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
	b=n7t6upleuUF5fKCrUJiglYvu/ogZUKGgAcJAVP5NugKcmIIqVGnQ5hLtz0MMBP/g4pV2
	 EZ0xZtq8+kazDI6t8lznYXxPfzNHDLpqFNXtPPZSu7R0ERZ4gMjOP90MeTnHtXIZ86MQj
	 oCyK68t7yX+Mlbq688+LY7NzRfKeGD43VNYrUMfFJpzMYfZml43lfDmMP1IqsmuppwJ/V
	 Og5SvSWnK1wrCLcmVcFB01QBqhnq72rfuHBP4aMEBnUN6z6eyfKVc+X53hfPqAfNOD6rv
	 pFIcUkGb7XA03DhsXMuxZ/XxDHqeOOYuTsiIP1rrYkSNQJfwPpEvX+D7xGJMgkjjg9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSap788I;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0628606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0628606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSap788I
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38699cf08dfso8030708eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669473; x=1796274273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
        b=SSap788IOw1yVidTGDD/J+2IJJb94ev+hCn0OpcJgWvkGWGGYHTuxmSu/1TSDBP0PB
         T4KhNiWgQ2tFEN6HRPZ/0KewqchUw817EEqwMHqwPkb9HtlMutL/9Pv6pdw0JVRaeH8Z
         arlf6dPFN4DMXrKrgqtuvlWbxoqmuYTYFoHMl+obUjhkpn+FvoV6yOnbQLf2NX0AvBvF
         9qO+MwPFR+RsxAtbSPeyUd9ednF7D+0gzosH0lYJHzmnLtCR6+VQeGWVSuJ9WpW0nOK3
         y6GnUp78612GhohYS2pn4d6HTiPrXxMk0kLFzMPtk+pK+WzB0f1sOSWFKG4rUgpOsqK+
         la3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669473; x=1796274273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
        b=FwLdCjFsug7oDGNTsT/+cuUG9Hgf0Zc9nXZdEJNjgp3vYrnYkHF+/5k57KJt1/br5i
         7YQbIwoKkV7wBIakSm73qMmvrHDegyFnC0WZZf40ltBeAVCisxwOzELO3ZDPHNihM3V/
         ZNiDzeKtMfyj7/8MXDMu4qvhzJtwHYVTzeHE3DYVFzRcKt0p9kI60E6hNsJqTeRRAa2G
         mQTzNlhfhIrhF66kaxk8Lui3PMOgMV1wlc+0DL8uOWNhw0SNPDFayThbS7JTYh1fmFJA
         IeztqAdQwsJ1tnCJwfaLXstyhaB5nT/xCDvMHmQTweSS7s22w5VvBSaTheNNQzTTzPZg
         SOFg==
X-Forwarded-Encrypted: i=1; AL+hErGA/3+u3HYrdFK06hsPySi9coKOefeGe7u5DbyZ6lJTz6XbTHI5bRGML100iv1hvEcDQo7mMqonrmXfpdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R/ceRZ3IsmYrdO4zkFS/jyIGI2GzIo2GA9cph7pXCB+MEKY4c
	58M9Jjq5pReFIxrdoj4/eLhriVKe5STBVHeO2X9kYAon9vonVOZ8VhmF
X-Gm-Gg: AZFdTZfFDsUUBoLOftLutK1oEfXM3+yvim25JJwbEkIvcr3vqkad7CnB7JydeQVu9kO
	zr9WkKRtehpDyoNZBHk27n86rONxJXig/HvHOPcMRYn7KJPoUEGbZ54aX9GMavchpyTvPrMgKo/
	CmHNR4LiJHDRpR/XyGx6IcaoR5Li/EguA+ik7u3iteG6kRxKYZz/PwtC5012VZdhHWzOV9qRrzz
	YJ46Zwb1gtSjUJlqU+ymLjJR0zWmbQd4T972Gfm6KrO8g7UxRwHvo/6u60lho3sP9W+M/TUPHKz
	60HPECe8lTi4G++vvSIj4XP4VWCIwFRx81OSJUsL7w/TlbjTPH2FFDZ+t49nxx9NM0K+4vnFnA5
	Em1uJX3gyRDHUCwnRapj8cOlAXEAQCdR7A9QHcLpN06hCld5H+xLEoRUa+l364OC/tIVhZx+qjq
	Bqk6uUPwRGZXsU7wqUPpxn91pCTkDNrgBTemeGZIflsffWVtiqgG81Uauh2YiZqwFNVzCymaglE
	ElhTZp9/N32XFnRfY+axCOyDqaawOXW8n5Xilz19Xe/gvH0aNRHHVdH4Qp0FVe4kqbqa4LTGbq2
	vbtIHwc0cM8HqGjhv8ADpllp/S52j/E0L/7ZjIFfHA==
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr20736555eec.24.1795669472707;
        Wed, 25 Nov 2026 21:04:32 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm60776540eec.28.2026.11.25.21.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:32 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: LoongArch: selftests: MAINTAINERS coverage and a VM leak
Date: Thu, 26 Nov 2026 10:33:50 +0530
Message-ID: <20261126050352.1957454-1-gokul02k@gmail.com>
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

Two small fixes to the LoongArch KVM selftests. Patch 2 frees the VM on
the PMU test's skip path. Patch 1 came out of routing it:
get_maintainer.pl did not name the LoongArch KVM maintainers for
tools/testing/selftests/kvm/loongarch/, because the MAINTAINERS entry
does not cover that directory, so this series would otherwise have
gone to Paolo, Sean and Shuah only.

Based on loongarch-kvm in linux-loongson.git.

Patch 2's hunk sits next to the one in "KVM: selftests: Convert comma
to semicolon" [1], which is not applied yet. They do not overlap and
apply in either order.

Compile-tested only. Patch 2 builds: tools/testing/selftests/kvm/loongarch/
pmu_test links for loongarch64 with a GCC 15.2.1 cross compiler, using
glibc from Debian's loong64 port as the sysroot. The binary was not run.
Patch 2 changes the PMU-not-enabled skip path, which only runs on a
LoongArch host whose VM config leaves the PMU off.

Changes in v2:
- 1/2: also drop the lib/loongarch/ line, which */loongarch/ already
  covers, so the entry matches the other arches (Zenghui Yu)
- 2/2: unchanged

v1: https://lore.kernel.org/all/20261123100701.1679376-1-gokul02k@gmail.com/

[1] https://lore.kernel.org/all/20260428053204.1018608-1-nichen@iscas.ac.cn/

Gokul K (2):
  MAINTAINERS: Add the LoongArch KVM selftests directory
  KVM: LoongArch: selftests: Free the VM when the PMU test skips

 MAINTAINERS                                      | 2 +-
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.54.0



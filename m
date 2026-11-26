Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655553;
	b=GIjbDNo1DZdVexiZuYT3vz1qKNH/2SK8FnBJq5FMb0R0ncIGGXypWhR3mpd5dPNRl0Mf
	 MM/vKtIPZOwK4R0Bfj2l9ipfSPptsY6UcAfkBOyKac0sFTqmz7V0LHhwdcUMTQn5/f+8N
	 lK29tZpC68Skgqzqg0BB1wVXeu9km07aOxNZybZ46KgZUZ+fPPaOiFgm8XgN2zwVFAi5D
	 wjJLitNJL7fVzhWM+Mpd7sqrYRIlphp+t7fE7uZTwDtRL6/oCTjjmUPZ3buU2yNWoI/2N
	 qui0Y0EElx2g618Zztvqy3UvTmAQg4tgVMJ8qCjBTGYP1H2MiCJR1C7NPC/8PS0CGUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l+BrBDucKyUhO3GbRKoc6iODblJyzQZkGIWH+QTSl3U=;
	b=p0UCiauagh0D42cC5N2h2KsQeX0iEeRtb5npwsa0bcLYx/cth/lZYjbN9h4uGwCG6HHF
	 DNw0Lx2zrOxOiJOkhHjwZ6oI2NGHaw+ZKSA3rATUpFQ5Sj1poCzAUAbbk3eSVnhL5gzET
	 NqM2GICtx1Tz6vh4l2C2G9F9wE/uXR3VMdNiwrHn/PGd8Aa3LaALtwSFTNQWA6skipieu
	 T+ZH/dQU+1Zh/ZeqqNw1wp+QcSmJGGxhhCpFnDXCybhnp9b4CBwFIRshO3112IVAheXyL
	 4ZlehfdbDbQBsSiP6fkm82tk/zJaUUleMvL4dnm8vPkwxOb9X787uStrBXNMTUs6WrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bUcEum6;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E4606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7E4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bUcEum6
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3862cc30b3aso1500217eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655551; x=1796260351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+BrBDucKyUhO3GbRKoc6iODblJyzQZkGIWH+QTSl3U=;
        b=0bUcEum6TpX91hkiHSGg50ndhRxjuDjUtmPpIKSfvsi3SUzKwwmOwch454on/IjdmI
         epdSun1sgfi8SX0NnZ8C/FdfxHDpCDemLsa4ZhEE3cducaib1BpOGIY3o32g9KkNUeqt
         RChS6OGRvE3pO9knubbeqpt6R5LBJw2zqXPma+XEsDOklukjEHYIl+vZ7PFfK2JCXS6T
         629yhNM5UWDhuUSzY2WMN5UZ+i8tb9B7FdWh0UeXC8G+7KJO4t/c7oHLjbkkFAECCr94
         b8+cF5I9uoCqJpFEEKf3jAXZuHISSlDoh6cZ35J6ojm0eWWoYu6d9dychGuspSZuxD+j
         SMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655551; x=1796260351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+BrBDucKyUhO3GbRKoc6iODblJyzQZkGIWH+QTSl3U=;
        b=zR8a/OMfCZWJoPAnIsTp94JBij0jIp3LjLMgVuoN7MUTQwYJ5mOij7m2C7lwpW5Jd1
         E1qGnAOhdjvdHo36HGHu50WDOfS59GLSbabCT0v3CeP70YYeG7EqcLuWt9kUp0I+so1G
         gRaQ7PV7XcNUt2Ttz5KoBjBBR+ZUi3aBhfrVC0SqJa2ujhmJPQ6ZBKeoN4EnvilC5djR
         7v5OOnUY/HXHUef0jU/y5K8iG3d1WtjSokQui78UAPFkbnQ6Jb9Ss5TP9k8+b+IjgpL5
         kkHAGZUUftsPTxnOcQPZEhDaaHDNZz5feRRg//T8ZeGpGph+UiWpwh8q5DKNi6LrBZvp
         bJaQ==
X-Forwarded-Encrypted: i=1; AL+hErE/vs2vQoR/Nb4sim8jtqlFwetqGY+FTeaQ9JJq5PNyw5BRnBbZ3WuUm/GTV/ZitQYQg0GzaAvkTMfK4M4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x5Vogd4sFMceEgLa2hdHDXGsJq4m2M+U+wWz73KCla8W8Ilp3
	hA2XTPESedXFBx5RtvVfx+aq3pIxCPkH59yYHLeGBjXmgwCv+zBMI1eM
X-Gm-Gg: AZFdTZfedF+rTD49Lr3L8i1XDGTa5RGadau3e60hx5CvAxbmwP1goCNLoWagBmK7AsV
	G+ZAggWsAvmvHPkQ+EUYQpUuEBclvBg8+Lacd0R8I6GT84dl+Ro0vtQocPSlv58EnMPWtIx/bT4
	9vQOmLAzNrMVB7bd2TukTRb3qafFTVjeCCvQKm7jv9RKRDQHf7rDWKcEVWhE7K1f2Myv+U41O4a
	Z0pIs3h+1EOifDAgwuk8/m+uihwsRpuVU8Ll3TPC1CKgVGgcj8fHqJD0cv1MG1fIBnFLaurXEIk
	SMYqupB5dVV7pmKyyd0lYEpNz97keWA2NrIMG06B+dXTn67/lxMr9GD56gysfzqZtnvLTLgQcgo
	XFTh7GfF4u9JJdm4J45ylSqpZ4WuCxvSlGtG11qFxEvW+4Gm8B+4xdGYmlsLlc86ftT/XXQb1Lq
	8XzBI0EfOkgQDKp+JIkbotm/AloLHO5OnklCDu62woycK2HdsxSzsIuZz0cjnxzAwDkQdt0Wtj3
	Ov7rwMfXGR0Qi4uJNxR5SCydxOYsN/AGouY35qiEfcn7tRvGF6HsfK0ttEpGCkGTBaDTokUaZSa
	rWca6Uq+fESZSoEcVZfvMO3isOPOaG3oIsn7Vn/N8Emf7muP+w2uRINGFQUoPmLjE4U+70f4/pF
	BidQmAJb5eSbgzpcVzmZmeJUvYuAaB4r+wDasilsP
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr9211440eec.34.1795655551477;
        Wed, 25 Nov 2026 17:12:31 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm55717751eec.15.2026.11.25.17.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:12:31 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v4 0/3] Fix unaligned enum values in btf_dump
Date: Thu, 26 Nov 2026 01:12:19 +0000
Message-ID: <20261126011222.92180-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size, which shifts a
__u64 by 64. Patch 1 copies unaligned enum data into an aligned buffer
instead, as btf_dump_int_data() does. Patch 2 makes the zero check of
enum bitfields read only the bytes of the bitfield, as Alexei suggested
in the v3 review. Patch 3 adds the tests Alexei posted in the v1 review.

Changes in v4:
- Add patch 2 to fix the zero check of enum bitfields (Alexei).

Changes in v3:
- Do the alignment check before the size check (David).

Changes in v2:
- Describe the undefined shift in the commit log.
- Drop the data_end check, which broke the dump of struct fs_context
  without emit_zeroes.
- Add the selftests from the v1 review.

v3: https://lore.kernel.org/bpf/20261116080151.44860-1-dennylin0707@gmail.com/
v2: https://lore.kernel.org/bpf/20261115084923.53182-1-dennylin0707@gmail.com/
v1: https://lore.kernel.org/bpf/20261113223449.97604-1-dennylin0707@gmail.com/

Hungyu Lin (3):
  libbpf: Fix sign extension of unaligned enums in
    btf_dump_get_enum_value()
  libbpf: Fix zero detection of enum bitfields in BTF dumper
  selftests/bpf: Dump unaligned enums and a zeroed fs_context

 tools/lib/bpf/btf_dump.c                      | 23 ++++++++-----------
 .../selftests/bpf/prog_tests/btf_dump.c       | 10 +++++++-
 2 files changed, 19 insertions(+), 14 deletions(-)


base-commit: 3cbbebf6819b42008e7ef85b6f0a7254c3074c19
-- 
2.43.0

